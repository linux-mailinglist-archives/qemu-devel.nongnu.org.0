Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED24A6197
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:49:55 +0100 (CET)
Received: from localhost ([::1]:37240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwLq-00008Y-M8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:49:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyF-0002bv-QB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyD-0003vm-MV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ViTw8i4erguFvdZCmPX25joBBbN5ll/sJJHS5FjbR9U=;
 b=YEiUM64cKLGUkV8B5BCv4WacRAPNXlobwfpWTo0FNKBA4aYclUaSrcssFv04cKpCXEYWXQ
 XWJtJrRPgNQkOf2u5p+lXaN9SiUI/5lkLJyUs3Au50aDOQy1v9rP0wTitj7fNlZNMMvGJa
 mL72Pr1UprQ1S37HOw12+zvpH3sVsp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-0qFbjPJ7OGOcFS4LscdIHA-1; Tue, 01 Feb 2022 10:21:24 -0500
X-MC-Unique: 0qFbjPJ7OGOcFS4LscdIHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF244101F000;
 Tue,  1 Feb 2022 15:21:22 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E646674E98;
 Tue,  1 Feb 2022 15:21:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/10] block/export/fuse: Fix build failure on FreeBSD
Date: Tue,  1 Feb 2022 16:21:03 +0100
Message-Id: <20220201152108.171898-6-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building on FreeBSD we get:

  [816/6851] Compiling C object libblockdev.fa.p/block_export_fuse.c.o
  ../block/export/fuse.c:628:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
      if (mode & FALLOC_FL_KEEP_SIZE) {
                 ^
  ../block/export/fuse.c:651:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
      if (mode & FALLOC_FL_PUNCH_HOLE) {
                 ^
  ../block/export/fuse.c:652:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
          if (!(mode & FALLOC_FL_KEEP_SIZE)) {
                       ^
  3 errors generated.
  FAILED: libblockdev.fa.p/block_export_fuse.c.o

Meson indeed reported FALLOC_FL_PUNCH_HOLE is not available:

  C compiler for the host machine: cc (clang 10.0.1 "FreeBSD clang version 10.0.1")
  Checking for function "fallocate" : NO
  Checking for function "posix_fallocate" : YES
  Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : NO
  Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : NO
  ...

Similarly to commit 304332039 ("block/export/fuse.c: fix musl build"),
guard the code requiring FALLOC_FL_KEEP_SIZE / FALLOC_FL_PUNCH_HOLE
definitions under CONFIG_FALLOCATE_PUNCH_HOLE #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201112655.344373-3-f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index d25e478c0a..fdda8e3c81 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -625,9 +625,11 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         return;
     }
 
+#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
     if (mode & FALLOC_FL_KEEP_SIZE) {
         length = MIN(length, blk_len - offset);
     }
+#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
 
     if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
@@ -648,6 +650,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         ret = fuse_do_truncate(exp, offset + length, true,
                                PREALLOC_MODE_FALLOC);
     }
+#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
     else if (mode & FALLOC_FL_PUNCH_HOLE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE)) {
             fuse_reply_err(req, EINVAL);
@@ -662,6 +665,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             length -= size;
         } while (ret == 0 && length > 0);
     }
+#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
 #ifdef CONFIG_FALLOCATE_ZERO_RANGE
     else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
-- 
2.31.1


