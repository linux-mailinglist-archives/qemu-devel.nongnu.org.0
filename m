Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1625499C05
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:06:13 +0100 (CET)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7TZ-0002Ny-0A
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:06:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Rm-0008B0-0W; Mon, 24 Jan 2022 17:04:22 -0500
Received: from [2a00:1450:4864:20::32c] (port=39644
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Rj-0002ee-Nx; Mon, 24 Jan 2022 17:04:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso292132wmh.4; 
 Mon, 24 Jan 2022 14:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5AdcXoGA0kc+PucyNi/OH/xXSRQhpqTg9YQpTC0NHdk=;
 b=ZCvmbXHcerVeFZJlTMPOcCoQ7ywbnx/kikB/K1H85cuRI947JoZw20MZ02RU0/fyGI
 ohBBBAohJPxhAd6L9AuFzM81gYq0c1onisYsFCRfnacM2qU/bIfaJZWMGJzf0NzklNDc
 qN8IMsIqd8rftzmsycQNhuiZWwb3Y8p+kmaiMGkcusB0/yAT6Yjb0T1nGauZo9bbErTR
 33S+Z6YypXRGT0iyZ0rx5yhyfK59U0b4zsWsLZlJg7y4RIUDz+wIaSkB/8+LF+qGNpyw
 VK3CzjCstg+Jt/2oj/J/HW77EFmlSg7rIdAnCiMnmdDNINcIpPaFRTFqj206YZN65DWR
 LFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5AdcXoGA0kc+PucyNi/OH/xXSRQhpqTg9YQpTC0NHdk=;
 b=zXysJoYKJH4Znt4Lae+GS8goiSVNjWeo6PLAlzBCS/zv50gxjIgYxLgD9e+f/ZecvP
 wXwQhcxr3kZGcqLwGOt0oyV6f7AkVw9d3Z/c6t6N640xXtnfrlwjX0OHsMM9HkCTOYdv
 pxBllAQpiQb/6N86j6qSNHDEI8QoXCDpb49QUpo0bg672aBRGA8upRN1J2XTYQx0DMDO
 TJ8MskY86edG/qe6zNrJSsnDyxOUyvRAZXs84GqZNc8rKkqVCYeeMKKF32qX860+3YMo
 8wk819MAEeeygYCu+kn6BwU/SNoT4WtJGZam/fLwQQA4a1z+wATVA4xrRsRt+/swe1Ch
 8MOw==
X-Gm-Message-State: AOAM532p0ei9i0fap0ARmX59O6XLhvWWm+rj84HKM+xlgVPxLH/IJaE2
 ADWb+2zzYO6vp3ZzdS6w1jKV7n73Bd0=
X-Google-Smtp-Source: ABdhPJy/BwEqc+Y6Ffn/QdJHd1kgU1zIQ2tJVqGYYs9LweNSs/I0Zz76MzxUJ8gjtcn7e6rz2iYgSw==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr296977wmi.28.1643061854779; 
 Mon, 24 Jan 2022 14:04:14 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y2sm477336wmj.13.2022.01.24.14.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:04:14 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/3] block/export/fuse: Fix build failure on FreeBSD
Date: Mon, 24 Jan 2022 23:03:57 +0100
Message-Id: <20220124220357.74017-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124220357.74017-1-f4bug@amsat.org>
References: <20220124220357.74017-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
  ../block/export/fuse.c:612:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
      if (mode & FALLOC_FL_KEEP_SIZE) {
                 ^
  ../block/export/fuse.c:616:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
      if (mode & FALLOC_FL_PUNCH_HOLE) {
                 ^
  ../block/export/fuse.c:619:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
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
 block/export/fuse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 3a158342c75..4c5d662be87 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -607,6 +607,7 @@ static bool fuse_fallocate_punch_hole(fuse_req_t req, fuse_ino_t inode,
                                       int mode, int64_t blk_len,
                                       off_t offset, off_t *length)
 {
+#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
     FuseExport *exp = fuse_req_userdata(req);
 
     if (mode & FALLOC_FL_KEEP_SIZE) {
@@ -629,6 +630,7 @@ static bool fuse_fallocate_punch_hole(fuse_req_t req, fuse_ino_t inode,
             *length -= size;
         } while (ret == 0 && *length > 0);
     }
+#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
     return true;
 }
 
-- 
2.34.1


