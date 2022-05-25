Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684CA533FDB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 17:04:00 +0200 (CEST)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsYJ-0007YK-7O
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 11:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsGl-0003Ex-MC
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsD5-00066s-Jf
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653489723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3LVImncM88Cgi5k/8KLgFb4Y+UE9CZITjEiSgR1j/I=;
 b=Ujzm10jgXBO19uNXfq8q+snp+xIFUpCgCWCKk0oDEPFjpAujS9sa3DiT4acUbtAAPqYM/T
 pzLUi5cKthD1nfP1LYjmH5uuRV+QJogBm2CfpUJpMyNBEPXIxPrORHnNpdHr5+S1ffgEKe
 xnrXdaP6eifhsHuU7iJdLO5lSbVrksc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-r2B4cpl2O5WUTi7kdVLF7A-1; Wed, 25 May 2022 10:42:01 -0400
X-MC-Unique: r2B4cpl2O5WUTi7kdVLF7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6872B8001EA
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:42:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2901730C;
 Wed, 25 May 2022 14:42:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v5 13/15] qga/wixl: simplify some pre-processing
Date: Wed, 25 May 2022 16:41:38 +0200
Message-Id: <20220525144140.591926-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220525144140.591926-1-marcandre.lureau@redhat.com>
References: <20220525144140.591926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Sadly, wixl doesn't have 'elif'.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/installer/qemu-ga.wxs | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
index 651db6e51c..e5b0958e18 100644
--- a/qga/installer/qemu-ga.wxs
+++ b/qga/installer/qemu-ga.wxs
@@ -1,21 +1,15 @@
 <?xml version="1.0" encoding="UTF-8"?>
 <Wix xmlns="http://schemas.microsoft.com/wix/2006/wi">
-  <?ifndef var.Arch?>
-    <?error Define Arch to 32 or 64?>
-  <?endif?>
-
   <?if $(var.Arch) = "64"?>
     <?define ArchLib=libgcc_s_seh-1.dll?>
     <?define GaProgramFilesFolder="ProgramFiles64Folder" ?>
-  <?endif?>
-
-  <?if $(var.Arch) = "32"?>
-    <?define ArchLib=libgcc_s_dw2-1.dll?>
-    <?define GaProgramFilesFolder="ProgramFilesFolder" ?>
-  <?endif?>
-
-  <?ifndef var.ArchLib ?>
-    <?error Unexpected Arch value $(var.Arch)?>
+  <?else?>
+    <?if $(var.Arch) = "32"?>
+      <?define ArchLib=libgcc_s_dw2-1.dll?>
+      <?define GaProgramFilesFolder="ProgramFilesFolder" ?>
+    <?else?>
+      <?error Unexpected Arch value $(var.Arch)?>
+    <?endif?>
   <?endif?>
 
   <Product
-- 
2.36.1


