Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFD3BA1BB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:51:47 +0200 (CEST)
Received: from localhost ([::1]:47056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJa6-0006ar-9h
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJML-0004fI-V6
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMK-0004Jq-FJ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id l1so6674074wme.4
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=erflfoQZg1zmJhaY5+bBLo3ktzzY4R/YAAD7gOAMH4Y=;
 b=ehIuFKNCoZxrPpqeDb3mouNygSzBqn0qXPpThpiERIHsd3HKnhfo2znWjZGM6E3luU
 WFoDUmy5nrIPhGVxouOvx56q19qO863LtpqilrqTLMKHol0aADd2fpb00jGW7VD8TEll
 xzsXzQVwgFleibqtQSSHQBj9Ysivc4esZ30BNB4XaZG6vK6fvsTlOQ/t6fsfnY1MZWCr
 47U6V9Ve5RJvoUJQg5b73iUB7yud3RYeNr/95XIw969SYA0c5flwbOaIq5aYQukAXRMR
 puFLj7pEuFd3wesqnQfDssfctbe9DhYbIA8f9SgzJQvGjFtSViD8urJ0/9qpkVg+zW6Y
 RSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=erflfoQZg1zmJhaY5+bBLo3ktzzY4R/YAAD7gOAMH4Y=;
 b=gk7SGyb0weBxPl5OZo5BdjaVhCwYiHzGEFbsI89a5nprHlq+eqw9lmJ6SBfXmL/+rI
 3f+XL4kjz3c9NGSyCUau6m9lhaJh2WKoXGKrYjpYRmByeFiKbmsHHV65dOre7E2/rQw8
 F40SPOLqpro7YaurEbzGWHl0Bb0+RdqYkdgaxvu8UxButWmFjIm5aL9oj/kyM/g7J/VB
 Hqpp0S1RLNhpYOsT+UKR25lUM5R8ZhMfV0EsqzDj+/Bs7U40IQWeohOf+bs7q+Vyt9/P
 VJTZzcAYcjHfaNNo/hcZvWWYtvlcze7VbjDSmbuMq46bP4sIQP5VOz39QXrDACrZTFMT
 sxTw==
X-Gm-Message-State: AOAM530kLOyC6rGygFbCuf5MEQC687ACknvED5ZDPHySIYNbt25M4i3F
 fVtM7l3KQm+Xm7hsz13d2J+FyL1KBD8bPgt+
X-Google-Smtp-Source: ABdhPJywG/3yi7DbCLL+EsFEAtNWK1rU6OXUhDsCWML3RrkCqKBosySxzOxGB6MTJObLMk8DABRdIA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr5471046wmc.102.1625233048549; 
 Fri, 02 Jul 2021 06:37:28 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id y8sm3035642wrr.76.2021.07.02.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/18] qemu/bitops.h: add bitrev8 implementation
Date: Fri,  2 Jul 2021 15:35:54 +0200
Message-Id: <20210702133557.60317-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This will be required for an upcoming checksum calculation.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952c..110c56e0993 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -618,4 +618,26 @@ static inline uint64_t half_unshuffle64(uint64_t x)
     return x;
 }
 
+/**
+ * bitrev8:
+ * @x: 8-bit value to be reversed
+ *
+ * Given an input value with bits::
+ *
+ *   ABCDEFGH
+ *
+ * return the value with its bits reversed from left to right::
+ *
+ *   HGFEDCBA
+ *
+ * Returns: the bit-reversed value.
+ */
+static inline uint8_t bitrev8(uint8_t x)
+{
+    x = ((x >> 1) & 0x55) | ((x << 1) & 0xaa);
+    x = ((x >> 2) & 0x33) | ((x << 2) & 0xcc);
+    x = (x >> 4) | (x << 4) ;
+    return x;
+}
+
 #endif
-- 
2.31.1


