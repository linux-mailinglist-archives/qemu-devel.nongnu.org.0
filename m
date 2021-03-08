Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E28331580
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:08:37 +0100 (CET)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKJ2-0003GA-1O
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkm-0006XD-6M
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkZ-00073o-Gr
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:11 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so16114wml.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E1ey0hndpH0T9OpqfMyEd6xWTlRARiM9Sxnw3HunfW0=;
 b=d85RqRWol+rzvaN2MOEIF7FlOcynlJu9tVdllpBOBjmoRLADUvTqSx4kSk3221+q5K
 UlbtGKHIdsno2SZsQRzzyUqsXV4tpbnhVGjewRoix12iKqpt5NQUroq+j8sViMbT6Wt6
 cN+MIdIDP1+mZCNjaE4+NahMgry1Eq08wCoEOzF3+kcQTIu/2qWA/y+tqIbY/Sm0y367
 Sh0LnrTTdbkra2LTBHyim5K30Kbz5fvo7HLBa995uYGjWs8BxDQhsxtZpCcboDqngDys
 pJa19u20cAZQd1VtA2p+Jii1hH31ksT9gKIESXEH9jsg5Dn/X3ttiC8M7MEBYVKpPtip
 h2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1ey0hndpH0T9OpqfMyEd6xWTlRARiM9Sxnw3HunfW0=;
 b=dEDz4fIxoh48vzafUTgsHZLUOwnLSjzjrHYDCcbYHBIAcGStx3LV3YfuI6DhAlwdyR
 nIW8DVjv6uZkf/pk+v3TbeTIwcxyY7Z+PliXoQ+9Zp5UZGHnESDgROiLuSWB6Nt9IEwg
 krT1Udp9HxRxtDNrjIEkbk5MzrE/cR2Onx9WKSm1t9C5g2+I0xwStttrBttIwtQZWs2n
 2avJa95jZTvAntaES3AW6CXdwb+RzFaFffa3rjUXCwM/ipVq9M91YRMu4cSEdP1ykkK2
 SO/YXCPCSeC/uRX2fhWzl9CBABb0vHXNiQccfW9S8jPJwfFtT1sKj1PCrOHdU0Gcx03Y
 VFUQ==
X-Gm-Message-State: AOAM531MZ6eYnrvL1fvOL4RyVwyGM494lL3xeA6S5nLfdyIztS0kcjxC
 etgujKMuG8g2w+aXgU6wJg/gf3jQGRZOzw==
X-Google-Smtp-Source: ABdhPJySbaKY+hPIgrKKl3oMeVO523EYOGfB2hbLxYLPBaHdiqZeE270m+mPvpTDEBRaEC0o2DvKdA==
X-Received: by 2002:a7b:c055:: with SMTP id u21mr23783431wmc.68.1615224778154; 
 Mon, 08 Mar 2021 09:32:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/54] hw/misc/iotkit-sysctl: Handle INITSVTOR* for SSE-300
Date: Mon,  8 Mar 2021 17:32:05 +0000
Message-Id: <20210308173244.20710-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has only one CPU and so no INITSVTOR1. It does
have INITSVTOR0, but unlike the SSE-200 this register now
has a LOCK bit which can be set to 1 to prevent any further
writes to the register. Implement these differences.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-16-peter.maydell@linaro.org
---
 hw/misc/iotkit-sysctl.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 54004bebcbf..511ede089c2 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -45,6 +45,8 @@ REG32(SWRESET, 0x108)
     FIELD(SWRESET, SWRESETREQ, 9, 1)
 REG32(GRETREG, 0x10c)
 REG32(INITSVTOR0, 0x110)
+    FIELD(INITSVTOR0, LOCK, 0, 1)
+    FIELD(INITSVTOR0, VTOR, 7, 25)
 REG32(INITSVTOR1, 0x114)
 REG32(CPUWAIT, 0x118)
 REG32(NMI_ENABLE, 0x11c) /* BUSWAIT in IoTKit */
@@ -167,6 +169,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->initsvtor1;
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
@@ -358,8 +362,25 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         s->gretreg = value;
         break;
     case A_INITSVTOR0:
-        s->initsvtor0 = value;
-        set_init_vtor(0, s->initsvtor0);
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            /* SSE300 has a LOCK bit which prevents further writes when set */
+            if (s->initsvtor0 & R_INITSVTOR0_LOCK_MASK) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "IoTKit INITSVTOR0 write when register locked\n");
+                break;
+            }
+            s->initsvtor0 = value;
+            set_init_vtor(0, s->initsvtor0 & R_INITSVTOR0_VTOR_MASK);
+            break;
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            s->initsvtor0 = value;
+            set_init_vtor(0, s->initsvtor0);
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_CPUWAIT:
         switch (s->sse_version) {
@@ -464,6 +485,8 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             s->initsvtor1 = value;
             set_init_vtor(1, s->initsvtor1);
             break;
+        case ARMSSE_SSE300:
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
-- 
2.20.1


