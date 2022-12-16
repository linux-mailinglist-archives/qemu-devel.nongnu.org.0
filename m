Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BBF64F3FE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:21:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU2-00060g-SM; Fri, 16 Dec 2022 16:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITr-0005wQ-Sx
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0000bu-Gu
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id ja17so2736186wmb.3
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A2o/3JD/47KFZGGuCaIY7m7S85np6OtsBKjDrudLLbI=;
 b=hcsLKqGhSuByZBWzM6fIlTEEvqViVoWa5KW1CJ1tcEdkIWrkmG7xpg1mwLz+PiOvEY
 bN5RGmJMiQWY9sczcyD/iDjdibM78JVn2XodSvPBW9aG95Xfjw2L3oPL6EtpluUyEgAy
 /xm4J7S0WNAI7CqB5VI91oFCC5G+RNKykPRSCX5pFDRVrLiwvImDj/zAAkbEFmo/15Hn
 7N8vZCd3ER09NZRZvu879A/5DseqXmYGGQjwGKoZ+dxMYNXySkXntVfeMd7WhQESy929
 Wn5V6yXWl9NfeXv//Zh5V2eR6HKjOCcp3Q0cVMtlkgwENo97CBASs/I1ORI7mYbcUFQ+
 JKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A2o/3JD/47KFZGGuCaIY7m7S85np6OtsBKjDrudLLbI=;
 b=2887D0EQqVzvBBRu1WQG0oBmgx74nWe4nVJEZQ+tQG5DNkyGn6tb7iqB3HuDuJukpd
 CZxACVpPr5dAF4oYwGGVQKISHGJbncT0dLFYPnouGIGfL1GKiNjX4O0KHC7KORX1c5tx
 hfNpRAyCH/ezxjFtK5YwXFztO32/VoAtoL9YgMXEHYcJTMHxABsFSaKcafDGx+uxAnrc
 /DXPXQO954A10/+KNraDLRjYgIFLjzfgRyYrkpWK1sqTm98JtLnnTWe0sCA8ziinXjd6
 X+14wKeyTz4pX2KtZKTwvTL4KasO1bIk5buI9ANsSFlEd32Tt6OEM/PORR8nIS7AeB7e
 z3tA==
X-Gm-Message-State: ANoB5pk+lYgFzqjeDqVJuCHzckCNLB8gOlUlzASNY4b/4bhyMaQHWXg4
 yG9l2w7umq+yQ448GZV7gEBqZRH7pFCpI8P5
X-Google-Smtp-Source: AA0mqf70bB27ADxaTZ2ejT8fYjU2vyjwfppqBJ7mD7ne018b+8aIGMSq9KKo1xxp9r5WtAJqt2YTHQ==
X-Received: by 2002:a7b:c4d2:0:b0:3d1:f270:a81e with SMTP id
 g18-20020a7bc4d2000000b003d1f270a81emr27490719wmk.17.1671226974271; 
 Fri, 16 Dec 2022 13:42:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/36] hw/misc/mos6522: Convert TYPE_MOS6522 to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:17 +0000
Message-Id: <20221216214244.1391647-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Convert the TYPE_MOS6522 parent class to use 3-phase reset.  This is
a prerequisite for converting its subclasses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221110143459.3833425-2-peter.maydell@linaro.org
---
 hw/misc/mos6522.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index fe38c44426b..0ed631186c3 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -643,9 +643,9 @@ const VMStateDescription vmstate_mos6522 = {
     }
 };
 
-static void mos6522_reset(DeviceState *dev)
+static void mos6522_reset_hold(Object *obj)
 {
-    MOS6522State *s = MOS6522(dev);
+    MOS6522State *s = MOS6522(obj);
 
     s->b = 0;
     s->a = 0;
@@ -705,9 +705,10 @@ static Property mos6522_properties[] = {
 static void mos6522_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
+    ResettableClass *rc = RESETTABLE_CLASS(oc);
     MOS6522DeviceClass *mdc = MOS6522_CLASS(oc);
 
-    dc->reset = mos6522_reset;
+    rc->phases.hold = mos6522_reset_hold;
     dc->vmsd = &vmstate_mos6522;
     device_class_set_props(dc, mos6522_properties);
     mdc->portB_write = mos6522_portB_write;
-- 
2.25.1


