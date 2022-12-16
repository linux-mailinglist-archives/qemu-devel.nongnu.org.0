Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5E64ED41
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 15:58:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6CA1-00043e-D9; Fri, 16 Dec 2022 09:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9r-0003lT-Go; Fri, 16 Dec 2022 09:57:57 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9o-00024S-V6; Fri, 16 Dec 2022 09:57:54 -0500
Received: by mail-ej1-x629.google.com with SMTP id gh17so6749122ejb.6;
 Fri, 16 Dec 2022 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmssZAyQ2lc00tGSHG/xjnWcVgniYqgYRJkzWqESq0k=;
 b=LFo7EbjIMCBpgoR7hN09+87vQmsJZ1T3dot1CzNM4w6Q8pAyHX3MV+e18xYSbSruob
 6v+wqZinOJ4CYgySuTCOwhz5U+krqp6+9htqDAcvmBqpDVReRvr9pvolWOck4cKkvWxQ
 K91+nJyO0uV55fJymzDnfSMCaBn3JEqRdWOHRhrW4PuS4idjEgVqn2bRhOg6YKWyjzud
 sL1/gPpWK6O/OHVFoD50iH9q8asvrCQzsYimoHkK7oWA/djiRW97+i02kh96OBjgu5/j
 349XzbX9TH5KFbK6Km0FM+KnKG6EmN00q+IqN449HQamR/1q/lNrOlMtEatUOX+/tpPZ
 hIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmssZAyQ2lc00tGSHG/xjnWcVgniYqgYRJkzWqESq0k=;
 b=e2+DgLM9kaTCCuiLrT4Nttoil5cy3r5upFzRnPFCyBYsaR5sfA7zP+WG283Q+g4V9R
 US91MId3TAIJwBWwBb4Q0F737oyE29sS+ydLdUyDdkH1SSCdISP2IBuUIKaRGgg2yVvh
 QEOYjPexEWiS6LnNasDbZZjGyzZ4Lw0EKMCB7B6/GTFHg1YGzqkNKvFEAOHNx+FzBbbG
 opAXqI6IeNZqLdirtpV4GyHgHJgV9yLZZCNSV0gsyndALY0ezE3OBt1Zw/8hshSPc5Ky
 iygbYohUvqFK1lHumuubZdI7dBng94MfQCuMlulhRMuoDQ4WtQSmeiQBc/bnuclfbPAx
 Ar+A==
X-Gm-Message-State: ANoB5pnLhREUp3NBEU4y0CmzLJRLDg1ivnrJCfvVd0QN4BfiZbe+W+qS
 roDLAB48HENglsxH4NQq4Q8EHydKfcA=
X-Google-Smtp-Source: AA0mqf4FygQgI8NX+FQafo6PPn6WxbaxxT1VL9952n4GfEk1tpHaRNZj69iU135WVHplbTbNhEY5jA==
X-Received: by 2002:a17:906:b013:b0:7ba:fcc1:f284 with SMTP id
 v19-20020a170906b01300b007bafcc1f284mr28437358ejy.73.1671202670303; 
 Fri, 16 Dec 2022 06:57:50 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/6] hw/ppc/e500: Move comment to more appropriate place
Date: Fri, 16 Dec 2022 15:57:09 +0100
Message-Id: <20221216145709.271940-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The TLB entries are set up in mmubooke_create_initial_mapping(), not in
booke206_page_size_to_tlb().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 104a85ad22..c6aeccce7a 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -692,7 +692,6 @@ static int ppce500_prep_device_tree(PPCE500MachineState *machine,
                                     kernel_base, kernel_size, true);
 }
 
-/* Create -kernel TLB entries for BookE.  */
 hwaddr booke206_page_size_to_tlb(uint64_t size)
 {
     return 63 - clz64(size / KiB);
@@ -723,6 +722,7 @@ static uint64_t mmubooke_initial_mapsize(CPUPPCState *env)
     return (1ULL << 10 << tsize);
 }
 
+/* Create -kernel TLB entries for BookE. */
 static void mmubooke_create_initial_mapping(CPUPPCState *env)
 {
     ppcmas_tlb_t *tlb = booke206_get_tlbm(env, 1, 0, 0);
-- 
2.39.0


