Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037DD52D593
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:07:11 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgo1-00011G-Md
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgga-0002CD-Kh; Thu, 19 May 2022 09:59:29 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrggY-0001ZC-4e; Thu, 19 May 2022 09:59:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so6090945pjb.1; 
 Thu, 19 May 2022 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rtvf9wMwhE+cLepszcQA0NiOqfuWl2f+Ach/5N2R/dw=;
 b=H+kYIJTOgxqDodtRYtZLkwnd5nBhjpmDa71h7ocbtAx91z+JzWpfIx6rAqdG+z+Vy2
 mTiqeUXMmKGTjJtOU5r+nbFCFAGaMje+yx/ugGVWL38xqTzzxc1z2garVEfSvtGiCYKa
 yWyh+tJIH6gQXGJYf4uS8bfShzrX4KPv4/67j1FRRQwHu1HoMjZcTbtP4lz3UXWtNVOK
 RAyQ8dcJyCnEyZEhuLn+QUf/zU9+NuJX6W821QNprQTtUgPOdny6KRcaMEEVXxzqr8KD
 +M1jNFNPqe905cGucc1WcBV/t+jKlZP8JUOXbCf6WXSQts6qCw0xjt1Q/rShNXgi2qQj
 mZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rtvf9wMwhE+cLepszcQA0NiOqfuWl2f+Ach/5N2R/dw=;
 b=pGiLtRqiYkJb4td4L4UWABZ2bUj8nKaPHO0I764O4Sq0B9VM1WjgsHorUtKvu2WW32
 hjQqzJwVITCKEL4WP/oEQjSOabmONQua1Gp6oeEHrLeMWMzQavh78NWy/Cfgu8Kgq2uH
 dnD1N1mrAdahVibZ44XdtaKopWH5OTTnMjO9KH+XMOdncshOozpYCCQoUzGImo4O9DN+
 MxPCCDSrmiBxBvWqEzkpmBdlOoFyaSqM7x2foRJapl7fo36P9RB+JYIcWnNlzDMiVACr
 vWpaVgiSL4bARmySwp4VBdELKIS2B12uqdgyZ9aoD3OOi7qZVT65m1yEuKhvDzRfTS9M
 M/9A==
X-Gm-Message-State: AOAM533ZOSewVSkGJoPBBYaJ+AClGwFM6GHYCM7zsTTS3H92vfmO217m
 PB9yc827v/MKQ9qhxvfE3kEnXY0oysfuKQ==
X-Google-Smtp-Source: ABdhPJzgJqrxYrMkdhfmHPoESMAgi9l8ugdk4fkUw0kkWjngUDD9GjIRoImlN3tGl61AQm+z5E7auw==
X-Received: by 2002:a17:902:ba97:b0:161:524d:5adb with SMTP id
 k23-20020a170902ba9700b00161524d5adbmr4971111pls.126.1652968764421; 
 Thu, 19 May 2022 06:59:24 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.131.68])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090b078800b001d9927ef1desm5603817pjz.34.2022.05.19.06.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:59:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/4] tcg/ppc: ST_ST memory ordering is not provided with eieio
Date: Thu, 19 May 2022 23:59:06 +1000
Message-Id: <20220519135908.21282-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519135908.21282-1-npiggin@gmail.com>
References: <20220519135908.21282-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eieio does not provide ordering between stores to CI memory and stores
to cacheable memory so it can't be used as a general ST_ST barrier.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
---
 tcg/ppc/tcg-target.c.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index cfcd121f9c..3ff845d063 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1836,8 +1836,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     a0 &= TCG_MO_ALL;
     if (a0 == TCG_MO_LD_LD) {
         insn = LWSYNC;
-    } else if (a0 == TCG_MO_ST_ST) {
-        insn = EIEIO;
     }
     tcg_out32(s, insn);
 }
-- 
2.35.1


