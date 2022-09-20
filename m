Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE6D5BF183
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:48:51 +0200 (CEST)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamyx-0004VU-4b
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj92-0001U8-Pk; Tue, 20 Sep 2022 15:43:04 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8z-0001vO-Q6; Tue, 20 Sep 2022 15:43:00 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso2460408otb.6; 
 Tue, 20 Sep 2022 12:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=o82dmMYVIeyjWGJorBMegF7+ykPzRR5ijcT4lCtt9jk=;
 b=p0rIJc+ezo+im4rcmiKjvgwrrFY8ZwOUVue4fZKJqD92MGRKQcKwtSdjgLI5gd89DB
 KEDLZPGFQTcKdymuXr2YF/oN+kdBuJF4nROBjOo2l+f2sLW4Wf2v5jA3Is+U/STcAuEo
 ODPV8XpLnK/+9XYe7TgTJfju0J2z+QmY01ToPr7Y+3jXeSpbZ28MPCEoFycaKXNobGaL
 DWPkYrh3V9fte7kwQ1fPyF85DW6hS0uZlwPPV36vqHN0maMJssOv7rMECJf2dL4JOvjQ
 mm2QCpb+MWFp+HHruZSYWJiKCjmKJoj1UNHxPM4QmEiq2XKgAOI3MGqX3jUjqPR7xcGA
 F/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o82dmMYVIeyjWGJorBMegF7+ykPzRR5ijcT4lCtt9jk=;
 b=bZ8raKGgiI92lTF+NIk9Az3bm7UyhfJ1il/jLRu0kIDDyL34A+tXTwq/E7ADaKcg/M
 MwoVI0ahHDTHFFAEO59GogRlNWUKHpzm/N8Iqaz3DFyCFbJKgLe9NcFSfiqhGAXWiIMp
 KkVzqMqesurvwg6LHl+Zj6KhXQuVdCC9gwIVt77Ubb7vIWTxP3Va7AdiAz374OBWqmuZ
 Ps6LTjjs48nVUVsc9e/axHPRWfwDIb0z/MYO4Rb3XJM81xj8Tc7YQRokueyCyiwcp1XR
 UTdNN8Q1ZASFzJjdoqSjxhiIBnwyXLkCQmyU82nJDZMasU7ffVRF3CROK/gcLyTuP9Hh
 37OQ==
X-Gm-Message-State: ACrzQf0SfmcqCNgcjW87ejMLagKAY4TobPlvSa+N9q/P0qYzpAethZhp
 nZ8Ya/XSmTDBcc/ec9eQZ3NMCdg+YPQ=
X-Google-Smtp-Source: AMsMyM4BVvYfmA1b1BPs1BD9QB0uYhzFdaRtjOx6RVW75FRCLcyvpxNzIzaxfLvLgcqYPpXTlD0riA==
X-Received: by 2002:a05:6830:d8c:b0:639:6034:b3d7 with SMTP id
 bv12-20020a0568300d8c00b006396034b3d7mr11186079otb.125.1663702974983; 
 Tue, 20 Sep 2022 12:42:54 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Bernhard Beschow <shentey@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 17/17] hw/ppc/spapr: Fix code style problems reported by
 checkpatch
Date: Tue, 20 Sep 2022 16:42:02 -0300
Message-Id: <20220920194202.82615-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20220919231720.163121-5-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/ppc/spapr.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 530d739b1d..04a95669ab 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -848,7 +848,8 @@ static inline uint64_t ppc64_phys_to_real(uint64_t addr)
 
 static inline uint32_t rtas_ld(target_ulong phys, int n)
 {
-    return ldl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n));
+    return ldl_be_phys(&address_space_memory,
+                       ppc64_phys_to_real(phys + 4 * n));
 }
 
 static inline uint64_t rtas_ldq(target_ulong phys, int n)
@@ -858,7 +859,7 @@ static inline uint64_t rtas_ldq(target_ulong phys, int n)
 
 static inline void rtas_st(target_ulong phys, int n, uint32_t val)
 {
-    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4*n), val);
+    stl_be_phys(&address_space_memory, ppc64_phys_to_real(phys + 4 * n), val);
 }
 
 typedef void (*spapr_rtas_fn)(PowerPCCPU *cpu, SpaprMachineState *sm,
-- 
2.37.3


