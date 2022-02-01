Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E54A5C27
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:24:54 +0100 (CET)
Received: from localhost ([::1]:40564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEsDM-000591-0c
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:24:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJY-00056r-MQ; Tue, 01 Feb 2022 06:27:12 -0500
Received: from [2a00:1450:4864:20::330] (port=37501
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJV-0005rk-Dg; Tue, 01 Feb 2022 06:27:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso1689958wmj.2; 
 Tue, 01 Feb 2022 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAqNmwI1L4cC383R9Vkhxz++gNKYm9jXECzlFKZVXw8=;
 b=kfqqNPDBvY3rUafW8T99Dg18Nenu9xLJkfjQ/tl+1u9T+YRED9PUOGurnaakCZAguD
 AaylIqTx7UQlYooVQRd/Huv30WWHuHRipQIW9zEHA2Cq+RJoIpZikwOIxT5TC5ErpjM5
 +02mGzYrGTmv80zHSI8JXDEBKfyMjnhwfNdMfD1in1mxguTmnGE2E0bs/LKDvKwzKDL/
 azRQYajvp9LZcQy5oyMzvVsBEJ57QkHH3WMGRthcCxRvrkBCQtC+1zSe1XSDQKaC4SrZ
 qcvuDOkCqinZ9zsOPKEsxYhoWhqqrfA6ipSfNHbE615kJPHjwlvR10p7h/OAGSiwA44a
 RTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pAqNmwI1L4cC383R9Vkhxz++gNKYm9jXECzlFKZVXw8=;
 b=jYhk8o01ifDW4wyY43giQzsnqfPOZuNfuqVfEi3vevqge1luq6XT8Wc4vtndqpruCn
 vpHk/QJiCfAuEgqd9Ya2LF5XsgpwGgdw13b6222b/Xr67UZbRLlpMMJj80u/+17EbAJ5
 DxNRAXdBKlz141JZZlnePgwwTIbmOS5Egi19B4sFaeSC/kNAAGaxd/8pvC4liiikw4xk
 zxGWQxapyJRt34Ifvm7ilmVbdktkyzc6juopgZ9bNVEpWKRhAPEWwMMoKcUSh/p/YCOe
 fq4SwLfvzlreqgbdnFN0X/NrX9EsEe8v4DZ38QoAP7KE2y67bLSDo6kSu1kYx/lsGTB5
 /3pw==
X-Gm-Message-State: AOAM530lBnxJx54ytI+T2Wb5nWwZ2qAtNk7JHnWmL100Wf3uZyGX5hRX
 Cj2uENhZXncTu8BqfglUWb62UMFfkAQ=
X-Google-Smtp-Source: ABdhPJyp0ixgIFbT8FSpttLPkZNYyMvDr8tDkwM7I6RX19L2wwUs3wuzYZE1je9DCEjDfp9+yO2sjA==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr1352465wmk.10.1643714827058; 
 Tue, 01 Feb 2022 03:27:07 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 b2sm16491835wri.88.2022.02.01.03.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:27:06 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 2/2] block/export/fuse: Fix build failure on FreeBSD
Date: Tue,  1 Feb 2022 12:26:55 +0100
Message-Id: <20220201112655.344373-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201112655.344373-1-f4bug@amsat.org>
References: <20220201112655.344373-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
---
 block/export/fuse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index d25e478c0a2..fdda8e3c818 100644
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
2.34.1


