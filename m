Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749613B2528
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 04:45:47 +0200 (CEST)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwFNC-0002D6-2D
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 22:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwFMO-0001WQ-6L
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 22:44:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwFMM-0004A5-0u
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 22:44:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id b3so4821168wrm.6
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 19:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=W9mv3yBP7G4ViPeEVSOL1/+i2KgfpJcV3rEcEC38IM4=;
 b=VIh8v2z+OVLh6YzCUqIB1LuuD/Gt1AyuQjzlp8XUFdYbV4mmwwmg0NFcnvxegVdx9p
 wTrS//ePRTnYy7xr5TzjgTWRP938GPLn1ogpgbeyDmapz7V6mgbJLTUUAK2o9gaJe1BU
 0ZIn538vliFbFb1bePEsb4Ww8nqe/XJWTGFbuOY0WisjSu1rss3IAbPFMxJk3zgb0pwY
 Pb+1+EXJyulyHimYlfvPLG/j1KF+PUz2jrpNkhr5q5Tb/P5CV20pHM1S194b1NooV/zs
 tYaFTboh+6auxCw82hc6h7a62yxyrP0/p5Gshgpd1fAV/wyniLGVYT0Q82kZY2nTmfCZ
 8edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=W9mv3yBP7G4ViPeEVSOL1/+i2KgfpJcV3rEcEC38IM4=;
 b=uR58nzN+5heVkljiKiCmu4Qc1K8a8HyMYUjNw67s3P58usH/g+N+Kl1DMFOo9kuFBJ
 zddWDaM3HtGgjrd2OVcghxGyrj2pfJhrmuEteaIz7zju9blD48cZFEYtRqsARYvP1oXD
 Uy0mBv6tRkN9nDz9/WsYrQpAOrWvl0UtPNdXbrlV126I/H2B3DVZsTLKaOqFyUEo/atX
 z7WiW5rAv/3++1Sjt3qip/Cp/Q4gun1pVaRRteBEGmLyVkArKJYUauUSYdEySzyj8q1b
 OAbwlCP/5CzU8OS0Zdpy7+VCEm6OaEjWQAL7FSms1JXeaSxDHQrYuoD0ZtZUHNeR5yoo
 Edjg==
X-Gm-Message-State: AOAM531aD26t+kwj+jnCktKZGDiKHH7lFKHRLz2xvj9iAIChLVMklmcO
 6f6wQdD1dPE6a0X+DgvrkFs=
X-Google-Smtp-Source: ABdhPJxqD/pZSuSBHWMb8HypknWgCPpnxkDydeh3FffMt/RtySc466ONb2jjtiSGIGpXRmF0strELA==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr1432516wro.381.1624502692466; 
 Wed, 23 Jun 2021 19:44:52 -0700 (PDT)
Received: from localhost ([147.78.177.108])
 by smtp.gmail.com with ESMTPSA id s23sm1618239wmh.5.2021.06.23.19.44.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jun 2021 19:44:51 -0700 (PDT)
From: Qiang Liu <cyruscyliu@gmail.com>
To: 
Subject: [PATCH v2] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
Date: Thu, 24 Jun 2021 10:44:47 +0800
Message-Id: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=cyruscyliu@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, f4bug@amsat.org,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The I/O sampling rate range is enforced to 5000 to 45000HZ according to
commit a2cd86a9. Setting I/O sampling rate with command 41h/42h, a guest
user can break this assumption and trigger an assertion in audio_calloc
via command 0xd4. This patch restricts the I/O sampling rate range for
command 41h/42h.

Fixes: 85571bc7415 ("audio merge (malc)")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/audio/sb16.c              | 31 +++++++++++++++++++------------
 tests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 5cf121f..60f1f75 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -229,6 +229,23 @@ static void continue_dma8 (SB16State *s)
     control (s, 1);
 }
 
+static inline int restrict_sampling_rate(int freq)
+{
+    if (freq < SAMPLE_RATE_MIN) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too low: %d, increasing to %u\n",
+                      freq, SAMPLE_RATE_MIN);
+        return SAMPLE_RATE_MIN;
+    } else if (freq > SAMPLE_RATE_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "sampling range too high: %d, decreasing to %u\n",
+                      freq, SAMPLE_RATE_MAX);
+        return SAMPLE_RATE_MAX;
+    } else {
+        return freq;
+    }
+}
+
 static void dma_cmd8 (SB16State *s, int mask, int dma_len)
 {
     s->fmt = AUDIO_FORMAT_U8;
@@ -244,17 +261,7 @@ static void dma_cmd8 (SB16State *s, int mask, int dma_len)
         int tmp = (256 - s->time_const);
         s->freq = (1000000 + (tmp / 2)) / tmp;
     }
-    if (s->freq < SAMPLE_RATE_MIN) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "sampling range too low: %d, increasing to %u\n",
-                      s->freq, SAMPLE_RATE_MIN);
-        s->freq = SAMPLE_RATE_MIN;
-    } else if (s->freq > SAMPLE_RATE_MAX) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "sampling range too high: %d, decreasing to %u\n",
-                      s->freq, SAMPLE_RATE_MAX);
-        s->freq = SAMPLE_RATE_MAX;
-    }
+    s->freq = restrict_sampling_rate(s->freq);
 
     if (dma_len != -1) {
         s->block_size = dma_len << s->fmt_stereo;
@@ -768,7 +775,7 @@ static void complete (SB16State *s)
              * and FT2 sets output freq with this (go figure).  Compare:
              * http://homepages.cae.wisc.edu/~brodskye/sb16doc/sb16doc.html#SamplingRate
              */
-            s->freq = dsp_get_hilo (s);
+            s->freq = restrict_sampling_rate(dsp_get_hilo(s));
             ldebug ("set freq %d\n", s->freq);
             break;
 
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index 51030cd..f47a8bc 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -37,6 +37,22 @@ static void test_fuzz_sb16_0x91(void)
     qtest_quit(s);
 }
 
+/*
+ * This used to trigger the assert in audio_calloc
+ * through command 0xd4
+ */
+static void test_fuzz_sb16_0xd4(void)
+{
+    QTestState *s = qtest_init("-M pc -display none "
+                               "-device sb16,audiodev=none "
+                               "-audiodev id=none,driver=none");
+    qtest_outb(s, 0x22c, 0x41);
+    qtest_outb(s, 0x22c, 0x00);
+    qtest_outb(s, 0x22c, 0x14);
+    qtest_outb(s, 0x22c, 0xd4);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -46,6 +62,7 @@ int main(int argc, char **argv)
    if (strcmp(arch, "i386") == 0) {
         qtest_add_func("fuzz/test_fuzz_sb16/1c", test_fuzz_sb16_0x1c);
         qtest_add_func("fuzz/test_fuzz_sb16/91", test_fuzz_sb16_0x91);
+        qtest_add_func("fuzz/test_fuzz_sb16/d4", test_fuzz_sb16_0xd4);
    }
 
    return g_test_run();
-- 
2.7.4


