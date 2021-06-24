Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983E3B2ECE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:19:37 +0200 (CEST)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwOKW-0000pj-E0
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHz-0005bU-Sn
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwOHy-0000vV-1W
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624537017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7oZ22Bi5+IbavTFf4QR3vzYmXjSwNwIDPtscwtvR5Q=;
 b=MqaAhStrmznncjNJO+sEcSmdz8iVqllblTZ1bsIrEVTIZ1nmCWZRnz08erwbqHgsUTg9P3
 Mb17Szk9u8yXVuPKc8TTXJ4tov1Kx0taVjb+Qp0k/KBS0zMt7Ibpp3Yuzm1HWUY05+gxMt
 7knUM1CynX+56+C2paH3rU4rU4p7A/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-dXovfSd-N5O_rSgXY7rmpA-1; Thu, 24 Jun 2021 08:16:54 -0400
X-MC-Unique: dXovfSd-N5O_rSgXY7rmpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F9C1100C665;
 Thu, 24 Jun 2021 12:16:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28251100EB3E;
 Thu, 24 Jun 2021 12:16:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 865931800918; Thu, 24 Jun 2021 14:16:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
Date: Thu, 24 Jun 2021 14:16:39 +0200
Message-Id: <20210624121639.2422367-3-kraxel@redhat.com>
In-Reply-To: <20210624121639.2422367-1-kraxel@redhat.com>
References: <20210624121639.2422367-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
 Qiang Liu <cyruscyliu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiang Liu <cyruscyliu@gmail.com>

The I/O sampling rate range is enforced to 5000 to 45000HZ according to
commit a2cd86a9. Setting I/O sampling rate with command 41h/42h, a guest
user can break this assumption and trigger an assertion in audio_calloc
via command 0xd4. This patch restricts the I/O sampling rate range for
command 41h/42h.

Fixes: 85571bc7415 ("audio merge (malc)")
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Message-Id: <1624502687-5214-1-git-send-email-cyruscyliu@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/sb16.c              | 31 +++++++++++++++++++------------
 tests/qtest/fuzz-sb16-test.c | 17 +++++++++++++++++
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index 5cf121fe3639..60f1f75e3ac8 100644
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
index 51030cd7dc40..f47a8bcdbd91 100644
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
2.31.1


