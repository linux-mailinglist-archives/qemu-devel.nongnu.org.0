Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B953463014
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 10:49:02 +0100 (CET)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrzkx-00045X-Vg
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 04:49:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzis-0001tv-Tt
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrzip-0002y9-V4
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 04:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638265607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGLYYQN8VeLlSHmUD/3rhKQPqXGYxqvX1A3MXMcKCtQ=;
 b=Z8kiscfmiMCzNTfwLtTCXT/wo/CSvNFm+HP+DxKIeXTVFUH2IKIOk/uQtZwAkn1kLp8VnE
 vWEzs+g9MYuvqmC7feUpzZwpWp7RB4i8jXDBvqH6nJqZ/kCgG2pTklT7qmTR1V2FESYbLU
 KeINLnaHJ7ng+rqywmYQwHhq/nfDSog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-NncoP7RyO1K_HJQRYTn2dg-1; Tue, 30 Nov 2021 04:46:44 -0500
X-MC-Unique: NncoP7RyO1K_HJQRYTn2dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CE30835E25;
 Tue, 30 Nov 2021 09:46:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 880C82B178;
 Tue, 30 Nov 2021 09:46:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/4] include/sysemu/blockdev.c: introduce block_if_name
Date: Tue, 30 Nov 2021 04:46:31 -0500
Message-Id: <20211130094633.277982-3-eesposit@redhat.com>
In-Reply-To: <20211130094633.277982-1-eesposit@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a getter function for the if_name array, so that also
outside functions can access it.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 blockdev.c                | 5 +++++
 include/sysemu/blockdev.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/blockdev.c b/blockdev.c
index b35072644e..1581f0d2f5 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -83,6 +83,11 @@ static const char *const if_name[IF_COUNT] = {
     [IF_XEN] = "xen",
 };
 
+const char *block_if_name(BlockInterfaceType iface)
+{
+    return if_name[iface];
+}
+
 static int if_max_devs[IF_COUNT] = {
     /*
      * Do not change these numbers!  They govern how drive option
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 32c2d6023c..b321286dee 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -42,6 +42,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
 DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo);
 BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
 
+const char *block_if_name(BlockInterfaceType iface);
 void override_max_devs(BlockInterfaceType type, int max_devs);
 
 DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
-- 
2.31.1


