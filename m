Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E063E41DA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:51:40 +0200 (CEST)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD10V-0006hk-Bv
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mD0zX-0005zI-LA
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:50:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mD0zV-0002kW-Tu
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:50:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m12so20330818wru.12
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkRSVEMWyVyeWQ3izgmNEJGvCK8HdwXAoJ2Btv3yX64=;
 b=ScQbze13RAZihVhZUCoeLjdxqXI5R4yP4JG3cI4raeuMiDhjh3++hfwb5J1UHEw2NE
 mUtafuvFztKwjMKy73iWsadLiR/5XL2ga0nYIj8nGWgiFNBWnLJUamhIncJWdstHKNbR
 jzCtf+q8orZyUCFRTR5SlOKNQAz3YrfVvYzaCE/GYaoReHH/+p28nj1fU36c/BjS7V8u
 WVm/SJRanfiaDsgw4peelNnZJUBwoUXA8h6rHDKurkkYmByXaOJGfMe3r0xTQ22H/Y97
 XPAocchSBrS8asQRBTbqZMpcdsF5nMgPlMSUIIGen5tj/izoayjFFMjUDioKtnFuqEGI
 sAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkRSVEMWyVyeWQ3izgmNEJGvCK8HdwXAoJ2Btv3yX64=;
 b=UBxhIeCp9IvEd0hZqboJfKxW118r00R6nGLjngx8Ho4kMg9q/EYhzStDDxCQSMhnFg
 n8vhpX5TzJddsI/WUSFEJYFDUqu5kznLCBVKGkiKS4pzDQY85IOKBEMXg98tiJfPYLqm
 EeurhLL3BjUhdSIGQz0oDAq/8qh3pxF2n3RVRyyzmVLGXIE2z6vzW9WN70sfstvt8O3p
 YT1zbhT5sIzin4GvSyMwanSUyC+kyoFXjhT99deYnnmWsCftrBXtoR9gHx4L2dss/bb9
 ziAOnMC9E1uIET57edoyhjxmcUzj9iosTW+6UtRLw8qlhOES6euENIXZWlYauE6/Migw
 aJUw==
X-Gm-Message-State: AOAM533lBMNEBB+iZQuSN3MaLAEs9ihZ3bBAvl+YBiYqsR9LhDgu1iu3
 frG0GdMGP5aZflHZzQqRShv+rV8g1nMbGg==
X-Google-Smtp-Source: ABdhPJzBHG1qmC7qf9TbDUs2W/rLAXNWkAsf1j2UADyczbuXn+bc9k0oxROM4DaIIUgjruWu0ajfzg==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr23168180wrt.383.1628499035464; 
 Mon, 09 Aug 2021 01:50:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id j14sm19256443wru.58.2021.08.09.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 01:50:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/export/fuse.c: fix musl build
Date: Mon,  9 Aug 2021 10:50:21 +0200
Message-Id: <20210809085021.783125-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following build failure on musl raised since version 6.0.0 and
https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
because musl does not define FALLOC_FL_ZERO_RANGE:

../block/export/fuse.c: In function 'fuse_fallocate':
../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
  563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
      |                       ^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 block/export/fuse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index ada9e263eb..07e31129a6 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -635,6 +635,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
+#ifdef FALLOC_FL_ZERO_RANGE
     } else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
             /* No need for zeroes, we are going to write them ourselves */
@@ -654,6 +655,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
+#endif
     } else if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
-- 
2.30.2


