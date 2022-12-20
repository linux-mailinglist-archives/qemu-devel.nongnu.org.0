Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F336521D9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:57:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3m-0004Ns-O3; Tue, 20 Dec 2022 08:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3l-0004NT-Bf; Tue, 20 Dec 2022 08:53:33 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3j-00012h-SM; Tue, 20 Dec 2022 08:53:33 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14455716674so15427099fac.7; 
 Tue, 20 Dec 2022 05:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaZTRCWB3+vNJHSy/PbrNyDQSIagPPPMiaqor4aGfWQ=;
 b=AWXO9NPWFHslD+5dwAOde1z7o8seFZI0rGW6xxJIzYSF4F+6WAaSPpCYxAUHkygUgM
 ZNhBnvcayvXDCq27bIKkoj1JTWVSLRaeugJZdqc3WHMZrFHRqT1RUrhdMXgeUSG04+GO
 84St2WeM/Ph9kmmfdd7KI3nnyNQn+vDeh+el3Vmk9TP8TakysuMXBvCB1toWU5JvDl86
 TW7tgzrWc8DogqFqIFXQMh2FJ7vZeKtJiEuKlBZA5Yt+iM92RvnpMgh90FiCNZ4A6ndw
 XEXgDiIiHTZTZ3+WJ0jPc7IjPAW5RbA32l+GfbveInq1DrL9a7ZEx5DJ/GAdYTabmWVR
 6Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaZTRCWB3+vNJHSy/PbrNyDQSIagPPPMiaqor4aGfWQ=;
 b=WXDeij0HqJ5ThBD31etVIhcDadMmLPJIUz0ScA7QPHtQnrOahjYmvnMSvmal01oPUS
 l1h1pOtNPnvNX+T9JH7ScxY+Q0WkL2EDABR6tyD0758+vWPh7HSkVC85sle0l8Q9yEFt
 oORW2mz+WBXPk4elx3B6KGBA6R+OEvWiCYR26KA/7uEOaWkAhliW/aSG29eh22rOk7yo
 pLXB62A2a0zaa7XJKD4+U2A5xwH7tbpu7r0xhXN7O33BWR6xCYnh41/w6OffafRE5Wh4
 1UvlqIh/AaEHte6VDhZSv4IQr5u5ttzdUh9WFTm/UmECx64DwiZsFCFz2XUSFwqxh8hF
 Vp0g==
X-Gm-Message-State: ANoB5pkcneLuMdGB4d+On2b+2M7oh7YpraYNLvEo8E9MgOUgV7aBY6K6
 JhxUCVmq63flN8VCAkSw8u9KGrMpqaE=
X-Google-Smtp-Source: AA0mqf5B9ckP1ZEYJFBnnWRL4vZOHwBVzL2WXgAZt9mE7heiQ2Cuc6dKu1jR/WIU3IxO/FWV0jaytA==
X-Received: by 2002:a05:6870:9e84:b0:144:95ca:c5cb with SMTP id
 pu4-20020a0568709e8400b0014495cac5cbmr23247262oab.37.1671544410751; 
 Tue, 20 Dec 2022 05:53:30 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:30 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/15] hw/ppc/e500: Move comment to more appropriate place
Date: Tue, 20 Dec 2022 10:52:49 -0300
Message-Id: <20221220135251.155176-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

The TLB entries are set up in mmubooke_create_initial_mapping(), not in
booke206_page_size_to_tlb().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20221216145709.271940-7-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index fee14ff8b3..cff2acbb34 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -717,7 +717,6 @@ static int ppce500_prep_device_tree(PPCE500MachineState *machine,
                                     kernel_base, kernel_size, true);
 }
 
-/* Create -kernel TLB entries for BookE.  */
 hwaddr booke206_page_size_to_tlb(uint64_t size)
 {
     return 63 - clz64(size / KiB);
@@ -748,6 +747,7 @@ static uint64_t mmubooke_initial_mapsize(CPUPPCState *env)
     return (1ULL << 10 << tsize);
 }
 
+/* Create -kernel TLB entries for BookE. */
 static void mmubooke_create_initial_mapping(CPUPPCState *env)
 {
     ppcmas_tlb_t *tlb = booke206_get_tlbm(env, 1, 0, 0);
-- 
2.38.1


