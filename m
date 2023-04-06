Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879336D8BCE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 02:25:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkDR5-0004qE-Q6; Wed, 05 Apr 2023 20:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3VREuZAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pkDR3-0004mp-3h
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:05 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3VREuZAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com>)
 id 1pkDR0-0005EQ-Fi
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 20:25:04 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 n3-20020a056a00212300b0062dfd10c477so5776070pfj.20
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680740693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c73IHAi+aPqB32XxKH0euKSiA4W+L+UT08GhoM3WrRI=;
 b=f3brdb2gLxSeDXEv9Rrq13ek9vvvxJF8IrGVCxBDmTZgX7wlmqA5MewnZrXUm9y+o1
 DfOv2FDGT+PC7OOw06XpBN2C0kbgNrIajdxylQojMTOjvE/7bKDi6kYFO8kY11s7Zd1c
 DOdEYeq/WhU1Zn3eF5wprYgSxeIXrA/383C6RBt8YX5CHqC32WDukOL30ywarXxipmzk
 R8Ssv0umqHzXqWgU/geGyomVWmft9+4UqbchmCc9vMFO+q2ujJJYdRn8jczyES1R9tUP
 HNfnWMCm7dpm0gt20LYj1QWVqri/lyCXGS3jM3BHlhuRrnWSpTPl5wT1aR41y+4QeueK
 lQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740693;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c73IHAi+aPqB32XxKH0euKSiA4W+L+UT08GhoM3WrRI=;
 b=aXU87oCBNfFL02Wa4x+Qe6BW9AuNMiUhlepddtRVjcFQrSMjhI4akY9cxmSdzf8f0P
 NhVliZbJC3MhdDK4UpjvCEC5ZSkkHV4tQCYc9bHhxHCJeNjlUp94pxWrGKMxI0D4domw
 gARQ8+XWrr4/EsqkDG3fN9inoVnyW+vGyZJu2KnN/a75bK7wj9hGzmMqEpgWRBGQ3WOu
 No8du9lPtZzt/6PRzV6BRNrVNt3Wt0SLLB3EqfvuiAXAmvvlhb1AyXFG8+WDqbtTu9PT
 T8pIWwP6F05g1KbXD/uWZZ5mSKkhnAfhxjGFw2qjcrnIx+LZ+8lb5ksvC8Qorpq5EUDH
 V5UQ==
X-Gm-Message-State: AAQBX9eWhb1GOiExbq839xktCC5KVuZFhOE0J4lmd4WPy4Zvu8t+rnuD
 B0s+AmuAeu/HijOArYIhFgFid2qLc4ZaPZ9OzNbIxfXs7LFq/hmxce05LHkxKOFV8tnJbilSoLz
 6rs9cvtMrFXVIj0l7RoKkiYCwEhFyAjh72S5KGoNU+rUx4+Js/dgcIGo6zmmOjFk=
X-Google-Smtp-Source: AKy350a6HtIRv4dIRXUg5O+lh1rU1PuAnL2l714ZewTmS4LqQPAyollh1I64MyqXdf5S34FvD7r+Mcz/uWa1
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a65:5887:0:b0:513:f8ae:5bf6 with SMTP id
 d7-20020a655887000000b00513f8ae5bf6mr2573288pgu.6.1680740693100; Wed, 05 Apr
 2023 17:24:53 -0700 (PDT)
Date: Thu,  6 Apr 2023 00:24:47 +0000
In-Reply-To: <20230406002447.4046378-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230406002447.4046378-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406002447.4046378-3-komlodi@google.com>
Subject: [PATCH 2/2] hw/gpio/npcm7xx: Support qom-get on GPIO pin level
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, wuhaotsh@google.com, kfting@nuvoton.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3VREuZAcKClgAECBE386EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This goes along with input pin modification. In some cases it's easier
to know the state of all pins on the GPIO controller before modifying
input pins, rather than knowing only the state of input pins.

For example over QMP:
{"execute":"qom-get","arguments":{
    "path":"/machine/soc/gpio[0]",
    "property":"gpio-pin-level"
}}

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/npcm7xx_gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 2a7be60d8d..58db3a8d64 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -399,6 +399,9 @@ static void npcm7xx_gpio_init(Object *obj)
     object_property_add(obj, "gpio-pins-in", "uint32",
                         npcm7xx_gpio_get_pins_in,  npcm7xx_gpio_set_pins_in,
                         NULL, &s->regs[NPCM7XX_GPIO_DIN]);
+
+    object_property_add_uint32_ptr(obj, "gpio-pin-level", &s->pin_level,
+                                   OBJ_PROP_FLAG_READ);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gpio = {
-- 
2.40.0.348.gf938b09366-goog


