Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7062815DF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:57:01 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMUW-00015J-Ao
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIC-0001Vn-Dy
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIA-0004YK-8I
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kIExrGYdOqL3CBb+ELu5otjx/HFY43HUD3DIvvXdKY=;
 b=b2gVG1Sr/a7vFkqmPGmofEwymVifiSBTV/nif5fpeaPbcED9iQn0Eyw8BdkEhDnQ9mGnzm
 1z8qAIgnyFPPouNDUHIGVCGaaJkHpIJlN2ZzNbI/Q8g5HAykMdAkdvYZBLyidQmtKQNqWz
 d0g4kY0Ons2DUXPS4wa/bGtiNLez7AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-XYKwgCkmM_igdwBw-AD74w-1; Fri, 02 Oct 2020 10:44:11 -0400
X-MC-Unique: XYKwgCkmM_igdwBw-AD74w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2960D192AB62;
 Fri,  2 Oct 2020 14:44:10 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318535D9D3;
 Fri,  2 Oct 2020 14:44:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/37] nbd: Add writethrough to block-export-add
Date: Fri,  2 Oct 2020 16:43:21 +0200
Message-Id: <20201002144345.253865-14-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-nbd allows use of writethrough cache modes, which mean that write
requests made through NBD will cause a flush before they complete.
Expose the same functionality in block-export-add.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200924152717.287415-10-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json | 7 ++++++-
 blockdev-nbd.c         | 6 +++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index 8aa8a01fa6..ce66f278b2 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -170,10 +170,15 @@
 # Describes a block export, i.e. how single node should be exported on an
 # external interface.
 #
+# @writethrough: If true, caches are flushed after every write request to the
+#                export before completion is signalled. (since: 5.2;
+#                default: false)
+#
 # Since: 4.2
 ##
 { 'union': 'BlockExportOptions',
-  'base': { 'type': 'BlockExportType' },
+  'base': { 'type': 'BlockExportType',
+            '*writethrough': 'bool' },
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd'
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 41d5542987..09247a8ded 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -216,9 +216,13 @@ BlockExport *nbd_export_create(BlockExportOptions *exp_args, Error **errp)
         goto out;
     }
 
+    if (!exp_args->has_writethrough) {
+        exp_args->writethrough = false;
+    }
+
     exp = nbd_export_new(bs, arg->name, arg->description, arg->bitmap,
                          !arg->writable, !arg->writable,
-                         NULL, false, errp);
+                         NULL, exp_args->writethrough, errp);
     if (!exp) {
         goto out;
     }
-- 
2.25.4


