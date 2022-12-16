Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01664EAAB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68wc-0002Fu-VI; Fri, 16 Dec 2022 06:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68wa-0002EA-EB
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p68wX-0008Oz-V7
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671190317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNqgq8+y/S71KQ37T12RXSGvqKJhX6bEwe3vCtlFpPI=;
 b=SE3Zy+1Uw2smFjSNd3kg+ZhrZ+aZs4B6Zue55i6fWoabQabNpk+5eZLF4pySuI3mRC/lhj
 mILI3ceaONCNkaM0x3yK+DoiI/t2HMY34CtvFEQcPMxfDYGB9zIw2xAj9WN+u1emY22DJP
 qHSykmKVnbzBXwX14pn7A7SNLAbfNOw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-TR6qiRDyMsCsNaka_wviEg-1; Fri, 16 Dec 2022 06:31:54 -0500
X-MC-Unique: TR6qiRDyMsCsNaka_wviEg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBD7A1C07551;
 Fri, 16 Dec 2022 11:31:53 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73E0F400F58;
 Fri, 16 Dec 2022 11:31:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, Kevin Wolf <kwolf@redhat.com>,
 libvir-list@redhat.com, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/3] block: deprecate iSCSI 'password' in favour of
 'password-secret'
Date: Fri, 16 Dec 2022 06:31:51 -0500
Message-Id: <20221216113152.584460-3-berrange@redhat.com>
In-Reply-To: <20221216113152.584460-1-berrange@redhat.com>
References: <20221216113152.584460-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Support for referencing secret objects was added in

  commit b189346eb1784df95ed6fed610411dbf23d19e1f
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Thu Jan 21 14:19:21 2016 +0000

    iscsi: add support for getting CHAP password via QCryptoSecret API

The existing 'password' option is overdue for deprecation and
subsequent removal.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/iscsi.c             | 3 +++
 docs/about/deprecated.rst | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/block/iscsi.c b/block/iscsi.c
index a316d46d96..58c0623052 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1352,6 +1352,9 @@ static void apply_chap(struct iscsi_context *iscsi, QemuOpts *opts,
     } else if (!password) {
         error_setg(errp, "CHAP username specified but no password was given");
         return;
+    } else {
+        warn_report("iSCSI block driver 'password' option is deprecated, "
+                    "use 'password-secret' instead");
     }
 
     if (iscsi_set_initiator_username_pwd(iscsi, user, password)) {
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 93affe3669..daf2334040 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -333,6 +333,14 @@ The above, converted to the current supported format::
 
   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
 
+``iscsi,password=xxx`` (since 8.0)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Specifying the iSCSI password in plain text on the command line using the
+``password`` option is insecure. The ``password-secret`` option should be
+used instead, to refer to a ``--object secret...`` instance that provides
+a password via a file, or encrypted.
+
 Backwards compatibility
 -----------------------
 
-- 
2.38.1


