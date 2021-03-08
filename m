Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CED331575
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:05:35 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKG6-0000PI-8A
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkx-0006ug-L0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkc-00075D-Lh
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:23 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a18so12282946wrc.13
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N2F+JJGxlM1Auinyns7mUy688bdLS4GRC6jUh/XOtAM=;
 b=FzP9lnumWQ7UEPdXvDJYRVklr/y8BwZWGbP1t5tELyG9hYEWO7ZdzVJvo+NVDV3ULF
 YYxiMXj6+cQnuMZEmpfOD/r+2qR1M3GkHdO885/UCF/uK4UelXoffi2gLwwDRcDlM6Ai
 zrbBdCSGl0b01OPuHP9DRuGCUIi0BB+LqwwF8Dm/sNWQSOL5OBSGP+cZ4vAvfNlP0GF9
 zQdZhpS+93IKZO8qvoQ7tM3s8ynHNAlZQuRDjofcJfpBikgMVFJXz9+xX9ByPVqNqfQ9
 d2+9mnqwATOJ/4SbpgQuslltZ/+m3wvW+6RiboAp7OzHxt+tll6wrm93D2KlW/O03/Ho
 XmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2F+JJGxlM1Auinyns7mUy688bdLS4GRC6jUh/XOtAM=;
 b=TPja4UFvhGyDnNXfYI/gts2oTkfCXHZj7Apqbk+hbDMZvXbHO25TL+/hPzo0nwNPbB
 LTBQ+PpCn4yFc6gZ5zsodyg0PQrE/51Tya1+QQFCZNSw2pWjUuk4zuc+N5JjHTtAAup0
 HLgsIorDLnxWSAaskFrMRIF3mPs/ppRiOEroPVEcWyeEZP3u1U9pmjQVcNPLrYbYCRBR
 /b/3CuJLYUfTkjCihLFNogQM8H8xIZU+TrOSsQdzCGugOeurnw63xqVLSD7sJ+rTosaF
 5ClPj0xIw1V+UuZ0dN3fxbjh4eS4IsNXX6rxN4RXOde735l2T1wOT0hvA2n1VgKEEUYu
 6rxg==
X-Gm-Message-State: AOAM5332487mAK+sgjPsjYeQRyoOHFLA1i8pO8BiVGqidF7Nd0/XkjOq
 q5KXtUNen4RxO6oaec9vkgZF0XHiZsZqbA==
X-Google-Smtp-Source: ABdhPJwlrfwfg0bAXwaotyJVOZs8Nftar+oi/xbbUisyIurEq/1nBSAP/kVLpvdTsiQfm3wgODRW1A==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr25274973wro.200.1615224780321; 
 Mon, 08 Mar 2021 09:33:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/54] hw/misc/iotkit-sysctl: Implement SSE-200 and SSE-300 PID
 register values
Date: Mon,  8 Mar 2021 17:32:08 +0000
Message-Id: <20210308173244.20710-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The SSE-200 and SSE-300 have different PID register values from the
IoTKit for the sysctl register block.  We incorrectly implemented the
SSE-200 with the same PID values as IoTKit.  Fix the SSE-200 bug and
report these register values for SSE-300.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-19-peter.maydell@linaro.org
---
 hw/misc/iotkit-sysctl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index aa8c49d9b6b..9ee8fe8495c 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -75,12 +75,19 @@ REG32(CID2, 0xff8)
 REG32(CID3, 0xffc)
 
 /* PID/CID values */
-static const int sysctl_id[] = {
+static const int iotkit_sysctl_id[] = {
     0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
     0x54, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
     0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
 };
 
+/* Also used by the SSE300 */
+static const int sse200_sysctl_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0x54, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
 /*
  * Set the initial secure vector table offset address for the core.
  * This will take effect when the CPU next resets.
@@ -328,7 +335,17 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         }
         break;
     case A_PID4 ... A_CID3:
-        r = sysctl_id[(offset - A_PID4) / 4];
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+            r = iotkit_sysctl_id[(offset - A_PID4) / 4];
+            break;
+        case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
+            r = sse200_sysctl_id[(offset - A_PID4) / 4];
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_SECDBGSET:
     case A_SECDBGCLR:
-- 
2.20.1


