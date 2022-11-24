Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE981637842
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:58:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAkm-0003bv-LJ; Thu, 24 Nov 2022 06:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkT-0003Qt-JL
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyAkR-0004pk-8l
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:50:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso4578763wmb.0
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vD0Cc37CcTxWt1/XvjfCLN/FjuSOyiDDi2JBPJBu9j0=;
 b=PN9AIoAzVOhCzrAvNZ9QRUizpKlM/aPILjX4u46Uc53R+0j5SujJ3+p/yZTTkWuj2g
 tRHOhwKuPjflHLYVhjMWBPIhUPJaObv3LWDptzur0zFIavKY2gC8vsLRtuUV8OIpIRXz
 Z8+TeUpqFjQpctgVTv3PxWEQAAHkRkGEUUQlHai8/B1KvqmPZxvJ5Y7iFgzUZw11SqGI
 ML93Y+O30DR0t/pURqmMqXHpNuivbXnXdoeUn1e9Ts8RLgBKEjkxZAlIRzofVQjYKDVI
 vHkI5RQ6pTHXJ4rDqOCrzM1cf6Z46W4bA6xNkfsorH5fEArKI+FIWJ107KovFMriTdjm
 l7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vD0Cc37CcTxWt1/XvjfCLN/FjuSOyiDDi2JBPJBu9j0=;
 b=1jFvvxAkZH/bWsWRX/Rv3Kp7Itg+uY4GE+coSSmUZHdDtoBG5cAMaQbBhAWezdMEPK
 FLfrgpy9DR3NoQlqjPVJffFhyvYKTVas94uEZ4z0oGbMotUDTYTyiOw33F35y4wI1VU/
 JhEV4UmYq8v9zYTNjPkFAwXQ/MfYgJcwchI3t2Mby9/NfVstYzuZNvSnuaU3PqOJi5xN
 HoOTFp7T1sWON7CD2Wf/oWbhHzQzmwlkToiO7idWbev/A6ZeDcdlGJzpzba7OlSyyrMH
 r++BAOfvyfrBsVY2Yi5NhbXbayQXbGM5EnHBRGJeKhpXnfFXZn9MgLJbyRt5ykdBKzXW
 Z76g==
X-Gm-Message-State: ANoB5pkAkYFE4jdYMhjI2WmPrn88vDpCGDRWD1gXqT2FcbSO+by+rXOa
 Enz2qEKPP9o+46Mey3UXFlOnO9CCjhwt9g==
X-Google-Smtp-Source: AA0mqf4f/lwwcuISKRk0uY674d4zrtbTIq0I9RR6IVUEBsRckUPPZCb5feD8ENyq4u68GK/aO3cKjQ==
X-Received: by 2002:a05:600c:19d0:b0:3cf:e7b7:d87d with SMTP id
 u16-20020a05600c19d000b003cfe7b7d87dmr9177192wmq.95.1669290627821; 
 Thu, 24 Nov 2022 03:50:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003c6f3e5ba42sm6212559wmg.46.2022.11.24.03.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 03:50:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH for-8.0 01/19] hw/core/cpu-common: Convert TYPE_CPU class to
 3-phase reset
Date: Thu, 24 Nov 2022 11:50:04 +0000
Message-Id: <20221124115023.2437291-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124115023.2437291-1-peter.maydell@linaro.org>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Convert the parent class TYPE_CPU to 3-phase reset. This
is a necessary prerequisite to converting the subclasses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/cpu-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index f9fdd46b9d7..78b5f350a00 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -116,9 +116,9 @@ void cpu_reset(CPUState *cpu)
     trace_guest_cpu_reset(cpu);
 }
 
-static void cpu_common_reset(DeviceState *dev)
+static void cpu_common_reset_hold(Object *obj)
 {
-    CPUState *cpu = CPU(dev);
+    CPUState *cpu = CPU(obj);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     if (qemu_loglevel_mask(CPU_LOG_RESET)) {
@@ -259,6 +259,7 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     CPUClass *k = CPU_CLASS(klass);
 
     k->parse_features = cpu_common_parse_features;
@@ -269,7 +270,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
-    dc->reset = cpu_common_reset;
+    rc->phases.hold = cpu_common_reset_hold;
     cpu_class_init_props(dc);
     /*
      * Reason: CPUs still need special care by board code: wiring up
-- 
2.25.1


