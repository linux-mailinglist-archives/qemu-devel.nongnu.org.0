Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A224C984B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:22:22 +0100 (CET)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAsu-0000Ef-8t
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAY9-00027n-IJ; Tue, 01 Mar 2022 17:00:53 -0500
Received: from [2a00:1450:4864:20::632] (port=36783
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPAY7-0005CE-Bb; Tue, 01 Mar 2022 17:00:52 -0500
Received: by mail-ej1-x632.google.com with SMTP id a23so34254503eju.3;
 Tue, 01 Mar 2022 14:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaGIu9qoSGH/+tDdpQADcIHfyD6Ow0XS1W32KV8bHt0=;
 b=EvPCgnaS86NdueklKLGsDNgcp1TA0dDt/I8TTC8xIZ7nO9908jaqAThrv48jx0lvvu
 Ms2KZXtHPyHnqE0S8IWGwutSobzQmcWe8ZESiuoDwjguwljiRF+rTwrDZSkuyxcgai9h
 O1DppZ/qQlvngZIHbIQDzAG1aDsWtSCCoezMZ8/SXU48xfjIMbmWG4XPtDevQRhSliBm
 LiuJmdi0JZeg88lBRx1/ThfI6z6o0TmPvLBWewXIr/CC5TiJe2fNI3CxnTBQwdejrqQ4
 cu1tAS+Ytf7txClzwbesEErICgBs98T61jxjRyYvZIkSgi6NTkuDZLzit0KJJXqtGiaD
 tG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaGIu9qoSGH/+tDdpQADcIHfyD6Ow0XS1W32KV8bHt0=;
 b=eoIk+V9xLlX0b3TkFxy/QXiIMLSYkDU3f9inaQ4eaA4n7st/GhbJZueG8zZ6oligjY
 zidQuincf449k03E3YcvXZWIiImat66lcLVlTAnCAT1AsGXJo2Kby2saXSRbwDWuK/yA
 9PlVb17nHlUgJayN16hgi/CHwXh2q1qEQZ1+oQCHxoaSmCRVIQ5QDP9DCfm8UpLfyaAO
 w4tCDwKKQeG2LNYroCKszhNY2q1MYw2LKxp31SWXRMreJQFWopJ3JlQkosP8+xKoN0ln
 YptM+M0k7p0Qs8kqkbBj/aa0o7O5y3/SQ+D+6H35QifBHVciKlfcJLuTitXcfcapLRu4
 ngFw==
X-Gm-Message-State: AOAM533Tm29oMn4E3l9LIrj+r5XHLFA2w3KJ29V/vP+8mNMF0WTwgj3E
 /jYfGp3CAUc8m/4w60amZvIkA2GSwiI=
X-Google-Smtp-Source: ABdhPJxFT68lAu7sKXvdcWljJZ08sFx/T2JUs2vj+PbusRzHQLhyEUThaW3aag7WgZ+y07Hkxeflhg==
X-Received: by 2002:a17:907:7845:b0:6cd:f2f4:cf00 with SMTP id
 lb5-20020a170907784500b006cdf2f4cf00mr20353620ejc.388.1646172047699; 
 Tue, 01 Mar 2022 14:00:47 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] hw/rtc/m48t59-isa: QOM'ify IRQ number
Date: Tue,  1 Mar 2022 23:00:32 +0100
Message-Id: <20220301220037.76555-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/m48t59-isa.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc21fb10a5..e9086eada4 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -42,6 +42,7 @@ struct M48txxISAState {
     ISADevice parent_obj;
     M48t59State state;
     uint32_t io_base;
+    uint8_t isairq;
     MemoryRegion io;
 };
 
@@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock)
 static Property m48t59_isa_properties[] = {
     DEFINE_PROP_INT32("base-year", M48txxISAState, state.base_year, 0),
     DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
+    DEFINE_PROP_UINT8("irq", M48txxISAState, isairq, 8),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
     M48txxISAState *d = M48TXX_ISA(dev);
     M48t59State *s = &d->state;
 
+    if (d->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, 8);
+    isa_init_irq(isadev, &s->IRQ, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.35.1


