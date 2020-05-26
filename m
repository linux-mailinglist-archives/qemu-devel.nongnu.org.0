Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197ED1D887B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 21:50:53 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jalmm-0005Om-2c
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 15:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jalep-00038D-HB
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:39 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaleo-0004eI-VQ
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:39 -0400
Received: by mail-lj1-x243.google.com with SMTP id g4so11172031ljl.2
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L66Agc2lHgpy7FO0yh6pn/rfQ2aSoQ2VmphzAuOdIik=;
 b=vGY1hKRB0ZyOZm2sZstGyWZUYDH823rpzDqzzVSB2oKrT+cl80BEFydZo4Btm33SZo
 4j4yLUaIPvS+oYCbYvBa5oAVUvef9mRfErPgVjSYsfuFKhUVdr9ithIuVcr2OG2WGNvq
 S9D5Y7Zrh6KDSkULj8Pdj7teLNP0F+8y063iulV5Loe2t+VrxonDFkJ8H7sTXrt27tI0
 dpXE4+cvndw5G+x3BoTKnWegA8dA3mvWj2ITGVlbeV+bE1l6Y04ZQwPBJS1nuTqyOjfS
 4f+Oe/u5A95KLRydcrOOqvcgMA2e4HW5KGfXcmcnwXzqOI0NVScjMp0rIkk+K1nlwR/y
 7wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L66Agc2lHgpy7FO0yh6pn/rfQ2aSoQ2VmphzAuOdIik=;
 b=DU9x8ZAuAkKJqvIHx79XvGj1PmqkJHF/IQcxzkxJXACVh4HMgm1hrDTQGUTWkqaIsz
 JXAnySmvOIKxlXNY6owF0HleL2Qt94TKdR6Qv2z80WQJe00nRQRlrK+/pyqgPJoykar0
 mCzWcaztDnAZTP3jk2Wxpbox3V5Kp6z9XA/GNKPDk8UawH8wMB3y8Dr901OmFG8S6u0J
 crXfK7e9bbFXMWaOg1S6efO8snywy+1t6kR4BkOP0dbTX92yGWoC1ytYGDPqrp9OaOwW
 uOIoB1PzrQE7K0zP96FzlVhkVHW0q+mwvHezz8d6MLQfSEbfVfI6I2OHNOazgVNv+jI6
 w3Hw==
X-Gm-Message-State: AOAM533JGHh346zCf8UEzmjbZc94ZN9wgKF2r0AEAxg75CHDPCjlqWnY
 ywU/Ybq4lKZINT15LRc4ifcFRUA2LZk=
X-Google-Smtp-Source: ABdhPJzOmKlQYTRwsOXo8IcdtLa51qD6MwwlQDl1h3NTmp/wo+kJUKM7nGa+xuU6BkkjE/qH7hdeaQ==
X-Received: by 2002:a05:651c:20d:: with SMTP id
 y13mr11356564ljn.29.1589830957350; 
 Mon, 18 May 2020 12:42:37 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id r15sm7593128lfp.34.2020.05.18.12.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 12:42:36 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/22] hw/mips: Add some logging for bad register offset
 cases
Date: Mon, 18 May 2020 21:41:48 +0200
Message-Id: <20200518194149.16281-22-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
References: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log the cases where a guest attempts read or write using bad
register offset.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 hw/mips/mips_malta.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index e4c4de1b4e..88869b828e 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -427,10 +427,9 @@ static uint64_t malta_fpga_read(void *opaque, hwaddr addr,
         break;
 
     default:
-#if 0
-        printf("malta_fpga_read: Bad register offset 0x" TARGET_FMT_lx "\n",
-               addr);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "malta_fpga_read: Bad register offset 0x"
+                      TARGET_FMT_lx "\n", addr);
         break;
     }
     return val;
@@ -515,10 +514,9 @@ static void malta_fpga_write(void *opaque, hwaddr addr,
         break;
 
     default:
-#if 0
-        printf("malta_fpga_write: Bad register offset 0x" TARGET_FMT_lx "\n",
-               addr);
-#endif
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "malta_fpga_write: Bad register offset 0x"
+                      TARGET_FMT_lx "\n", addr);
         break;
     }
 }
-- 
2.20.1


