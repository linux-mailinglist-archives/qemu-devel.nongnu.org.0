Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4C3E435D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:56:07 +0200 (CEST)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD20s-0003IK-3M
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mD1wi-0003yO-1f
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:51:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fontaine.fabrice@gmail.com>)
 id 1mD1wg-00041y-9j
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:51:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c9so20535531wri.8
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OjKfteoFzzkGVlkdhfE0RFaB7xiHsIRRC5kwXpgmeQA=;
 b=OtoGHF+l0mLnyv2fVpdwP7KfdwDafsNv9d0QoEGbH8lb3ncbczmUy/YPpJZ95q4Xlp
 xUuyUs1qvzz+Otjl8QhUI+FTJYpO9H5h13G0YTFd/XL9cvDl6wKQ0dMrKso03PaiMbtN
 1k3PCWe3SfiNebGKkq7bua9Ohr6avWvCGTN7tmJgQ5tll3DL8c4ZMZhiKhPrUNxkqQG5
 hKlIibugVwAEYPRTjr2uo4FvMHzlRdc2HqVLMMItSo9SDbMRRD3dcadOD7Jo103f3iCT
 tX8+lDUv7wQOjb4aL6Nd9UlyuVVPxXCrjp0N7yOL//L0CAEGrb/LCbFz6efLlUJaVhih
 a8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OjKfteoFzzkGVlkdhfE0RFaB7xiHsIRRC5kwXpgmeQA=;
 b=FrwDLBSdidWewFY5MHCPqUZejnIF9kaZMOECuLXyoYrIko3v8Fmtc5nXGwknxHQVEs
 ZAe9nwHYgNK6lKLlzILqmcmaZPiTnVtIdt3TIOZSNxaHg+15amYpb4iegneLI1V3Tl3m
 zlEo4TNSrEpyqPwTAp2HqQaWVxj0FSQbdMfdAhB50aeysBkficJrlDFA2NG3G8RuBl4T
 MksKXNecpqAEedRQyM2izgNyRD5VJ0tB8WB3o2srSkt6UxCxZRAABVEiaQWgBZi5SWy2
 nHmZGSVbBsTiGNm7Q8MoYvEN3bkpEgiGs2vExslN8pt5SsuZZ9Z4umr1qF66iymPVLVx
 wslQ==
X-Gm-Message-State: AOAM530PD7Nd2Ap0tcU0r+oSPJaZXXxNcRPwdqkaVX1m9mROs0zFHfKV
 OhIf86oVVqbgZF/O4SGhTB7rjuguxMyzkw==
X-Google-Smtp-Source: ABdhPJzCJMRcdwnZuTpCxvTr5F+tviK/hAeboZyobCUuKklQicKcg1QUidRv5nX+fuoROPaQWTHC8Q==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr24345154wrm.25.1628502704591; 
 Mon, 09 Aug 2021 02:51:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id a11sm5326985wrq.6.2021.08.09.02.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:51:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block/export/fuse.c: fix musl build
Date: Mon,  9 Aug 2021 11:51:01 +0200
Message-Id: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=fontaine.fabrice@gmail.com; helo=mail-wr1-x42f.google.com
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
Changes v1 -> v2 (after review of Philippe Mathieu-Daudé):
 - Use CONFIG_FALLOCATE_ZERO_RANGE and make safer #ifdef'ry

 block/export/fuse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index ada9e263eb..fc7b07d2b5 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -635,7 +635,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (mode & FALLOC_FL_ZERO_RANGE) {
+    }
+#ifdef CONFIG_FALLOCATE_ZERO_RANGE
+    else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
             /* No need for zeroes, we are going to write them ourselves */
             ret = fuse_do_truncate(exp, offset + length, false,
@@ -654,7 +656,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-    } else if (!mode) {
+    }
+#endif /* CONFIG_FALLOCATE_ZERO_RANGE */
+    else if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
             fuse_reply_err(req, EOPNOTSUPP);
-- 
2.30.2


