Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C199D6F43B5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:23:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovR-0004Dt-9h; Tue, 02 May 2023 08:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouj-0003oi-5i
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoua-0003Et-R0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so22355465e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029715; x=1685621715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LkRJy4h1XyrP1j+o4oo+tL8+y8DyXfS68NkWY5ch+OM=;
 b=orkoRhgZa0rk+bYoDEnuzxDjlPh/+YirEYWvWYj3O5e8JcufFuFnGEiqiqUXmREZNY
 A/bOg1voF1H+MBnpzQp+XEAA6j0N3M3qT/IQy0WZLVPYFBKZxBexYsi2cymAaVnbAwMy
 7JkQS5fVYP7jUNkMziLoGBE9409WQSZloSkcdYWq2zfdIbOjjlmRWUs7JKA5DUHHQKot
 aBx53C4NLvzzx4n+hy7nlj9yButyKYsbaBtvj29wqI0OevfoR4+5KjfLbuMH75xmaV5D
 X2FnoGRzj1gKDESkeW8SP1zKENsygOcGhPWhdJvQEbHSIwgfSjTu/5OdJLDdAXakDQrw
 dl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029715; x=1685621715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LkRJy4h1XyrP1j+o4oo+tL8+y8DyXfS68NkWY5ch+OM=;
 b=HMibohVDmrBBVnPu5ZfKxwrd9vrpMn9lbloBbewIXQiKDE28tVRBvq5QdeyPQdIm3m
 HfgDCY6bmTO/vhR8U9KZZJit8QN30Ku/3Sew6LSPkJENry6cpAbRaz2uejM2oU7ZB9q+
 iL9NwRmiNmP5CgoT9SiFJLXsY0H9ledZhMvILdqb/JLwkLqc1tYZVRTO4pOk9TodQ+xQ
 Wz9GJQ/EB3leH6/xPKTnprekLXmeK6kA8g/1jaAAOl6KrWA8NCoV2wCZahVVLiQHIEpX
 uxUb2eKF+WyQ8V/MKa9ddPVOSt1Jcrl+oFU7dEAIj+qdTkt7+nfHRqvrRRdwnYFq8b3r
 AdeA==
X-Gm-Message-State: AC+VfDzPoo0AmN5OC9cRsOS8r9gR07c97Cm8l16ZamwIHQHZBA3u0Oiu
 jlujCvio84iIe8wQ5qkOe0Gl1mDapsuObEzpyVA=
X-Google-Smtp-Source: ACHHUZ6oFGzud+GI6PTIS5vDdzj2Sh3E2KX4jLsH9DOK0OJERQT+v0Ocw84uxTqKJdLdV18VBs9AqA==
X-Received: by 2002:a05:600c:cc:b0:3f1:6f39:419c with SMTP id
 u12-20020a05600c00cc00b003f16f39419cmr12781631wmm.36.1683029714916; 
 Tue, 02 May 2023 05:15:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/35] hw/intc/allwinner-a10-pic: Don't use
 set_bit()/clear_bit()
Date: Tue,  2 May 2023 13:14:55 +0100
Message-Id: <20230502121459.2422303-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The Allwinner PIC model uses set_bit() and clear_bit() to update the
values in its irq_pending[] array when an interrupt arrives.  However
it is using these functions wrongly: they work on an array of type
'long', and it is passing an array of type 'uint32_t'.  Because the
code manually figures out the right array element, this works on
little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
in a 'long' are in the same place as they are in a 'uint32_t'.
However it breaks on 64-bit big-endian hosts.

Remove the use of set_bit() and clear_bit() in favour of using
deposit32() on the array element.  This fixes a bug where on
big-endian 64-bit hosts the guest kernel would hang early on in
bootup.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230424152833.1334136-1-peter.maydell@linaro.org
---
 hw/intc/allwinner-a10-pic.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 8cca1248073..4875e68ba6a 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -49,12 +49,9 @@ static void aw_a10_pic_update(AwA10PICState *s)
 static void aw_a10_pic_set_irq(void *opaque, int irq, int level)
 {
     AwA10PICState *s = opaque;
+    uint32_t *pending_reg = &s->irq_pending[irq / 32];
 
-    if (level) {
-        set_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
-    } else {
-        clear_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
-    }
+    *pending_reg = deposit32(*pending_reg, irq % 32, 1, level);
     aw_a10_pic_update(s);
 }
 
-- 
2.34.1


