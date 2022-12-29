Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F15B658E4C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAulS-0001M6-7V; Thu, 29 Dec 2022 10:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulQ-0001LT-Cv
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:24:12 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulN-0007yF-AS
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:24:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id bg10so13358267wmb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0SRe0Kx73w/5k1isHeaGbaMhDnp0SdPMUGkYoUAYuM=;
 b=EFbsYvbtxuYDzfQPU3B3TXKY7DpVt3rVXi7GjVzdOHdeeLdy//12PPfbZ8Xm5hEJNp
 Bk0wfDIOxeudErO5OMFZv3+TOVcWY1Ut2SQDROADYwAv2NVfST5/Im++jCDLICOpj6fu
 AutsECPsGtXp/0dlKK5hsnxzfVOZFlIX3OFmzgusWyOI7fPs53cAtwPCwCBMmBgTsTZF
 v+aIny1ZXP2B1nit830t+fa9ib+KOGeCsqBpHVRkNGrc3pPl0MUghj/LA03n/HUrKTup
 nbsxSwhpy8EVECB1GFI5saO+TsJEa/IKis00jjSaG8jPlsW6+oimr3eJfBDqCyuRScG5
 ksYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0SRe0Kx73w/5k1isHeaGbaMhDnp0SdPMUGkYoUAYuM=;
 b=6+ptXClB7c8GNKkyd44MmSPm1sgYqHoNnXy6LmKDMe6j007//yaai85/BDdGDVBkV8
 HMO6tEsYAumK8/dsUeyGqbVutlVrf0ozFVHcput14mY7QfFOOnXmoC3X/AvWuvsaz0b/
 U8+/bZBCbdeK79AXe0likSlYqOZnHTl+ELRYlfleh0omblVYjNGo9u9qhsInUTE4ORrI
 47iuDf6t/5mqKFk3QI2ophhjn2QREdMx356nh4IBlIyE0kmbYckl3DZlPFmLLOFdhy0j
 PWroM0PhwksP6UBRdk003P58O/i8ZBeuIbRPtoYdPzavNfOcnJmeDKr5anFERzqD2LBe
 30zg==
X-Gm-Message-State: AFqh2kooDYl84nv74vp7BqaVRzcHnKQnQsOegXD35fbs9Y0/oQLJmxmh
 vCyXAoF8hBsg/M6oU+rmntlHffJxdGL/s0Xl
X-Google-Smtp-Source: AMrXdXtsesCN7PymjrtZU/MEDBj2rff6YklhNgNLB2qpQJuwDqZLemnj4PUCERnUQX6YaN7bhNiydA==
X-Received: by 2002:a05:600c:18a1:b0:3d2:3ec4:7eed with SMTP id
 x33-20020a05600c18a100b003d23ec47eedmr23502758wmp.10.1672327447927; 
 Thu, 29 Dec 2022 07:24:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d237d60318sm27062702wmo.2.2022.12.29.07.24.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:24:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 7/9] hw/misc/aspeed_hace: Do not crash if address_space_map()
 failed
Date: Thu, 29 Dec 2022 16:23:23 +0100
Message-Id: <20221229152325.32041-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

address_space_map() can fail:

  uart:~$ hash test
  sha256_test
  tv[0]:
  Segmentation fault: 11
  Thread 3 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
  gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
      at ../hw/misc/aspeed_hace.c:171
  171         if (has_padding(s, &iov[id], *req_len, &total_msg_len, &pad_offset)) {
  (gdb) bt
  #0  gen_acc_mode_iov (req_len=0x7ffff18b7778, id=<optimized out>, iov=0x7ffff18b7780, s=0x555556ce0bd0)
      at ../hw/misc/aspeed_hace.c:171
  #1  do_hash_operation (s=s@entry=0x555556ce0bd0, algo=3, sg_mode=sg_mode@entry=true, acc_mode=acc_mode@entry=true)
      at ../hw/misc/aspeed_hace.c:224
  #2  0x00005555559bdbb8 in aspeed_hace_write (opaque=<optimized out>, addr=12, data=262488, size=<optimized out>)
      at ../hw/misc/aspeed_hace.c:358

This change doesn't fix much, but at least the guest
can't crash QEMU anymore. Instead it is still usable:

  uart:~$ hash test
  sha256_test
  tv[0]:hash_final error
  sha384_test
  tv[0]:hash_final error
  sha512_test
  tv[0]:hash_final error
  [00:00:06.278,000] <err> hace_global: HACE poll timeout
  [00:00:09.324,000] <err> hace_global: HACE poll timeout
  [00:00:12.261,000] <err> hace_global: HACE poll timeout
  uart:~$

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/aspeed_hace.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index ac21be306c..12a761f1f5 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -193,6 +193,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     size_t digest_len = 0;
     int niov = 0;
     int i;
+    void *haddr;
 
     if (sg_mode) {
         uint32_t len = 0;
@@ -217,9 +218,13 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             addr &= SG_LIST_ADDR_MASK;
 
             plen = len & SG_LIST_LEN_MASK;
-            iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
-                                                MEMTXATTRS_UNSPECIFIED);
-
+            haddr = address_space_map(&s->dram_as, addr, &plen, false,
+                                      MEMTXATTRS_UNSPECIFIED);
+            if (haddr == NULL) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+                return;
+            }
+            iov[i].iov_base = haddr;
             if (acc_mode) {
                 niov = gen_acc_mode_iov(s, iov, i, &plen);
 
@@ -230,10 +235,14 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     } else {
         hwaddr len = s->regs[R_HASH_SRC_LEN];
 
+        haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
+                                  &len, false, MEMTXATTRS_UNSPECIFIED);
+        if (haddr == NULL) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+            return;
+        }
+        iov[0].iov_base = haddr;
         iov[0].iov_len = len;
-        iov[0].iov_base = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
-                                            &len, false,
-                                            MEMTXATTRS_UNSPECIFIED);
         i = 1;
 
         if (s->iov_count) {
-- 
2.38.1


