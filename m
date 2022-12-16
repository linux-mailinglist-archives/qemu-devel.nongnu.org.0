Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB83864F3CE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iqu-0000iK-In; Fri, 16 Dec 2022 17:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqj-0000bo-EF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:39 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqe-0005me-GM
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:06:34 -0500
Received: by mail-ej1-x62c.google.com with SMTP id kw15so9219161ejc.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FgRh+J8ugBdTp+hBAPKxvrVE6x2miNoYmydbOZW5heo=;
 b=HNUeMPgzvuf6AsZmElsdhHeaksTRLQtyPVlctzXt0s+RftDHFpCzUNFYprNzhhJbOY
 o7NZ8KpQbPujdhQqVFK2K/eHcYw9gDbOQo16JfxsQL1dJHZv8gGs3T+8cFP6fTWXxpZr
 tvMxjF1uC9UDQLtTA6zQ9u/yAJINT5VlGns1UzWYWi222Go/JAwbniNEcoMntAZoEde1
 BwRxGn9bmKJCgxfw2T3mFM8pjloOyF26G6ZwOs6qsoN1Y5snYZQwtb6GYaxgpiWOmxoZ
 6xidAvRxPjlU3mUtrs6lOEPiIEmW4Hofzoe20PxgFr/foQ43Ypj1zzoW2sHNGDoEPrIp
 SI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FgRh+J8ugBdTp+hBAPKxvrVE6x2miNoYmydbOZW5heo=;
 b=FVLyVDjrQq0jMThYsSEZWtCOo4e2AISG+l65T0AVwnbGcuJcWS+kButOmVxxdeZPF8
 1wg9Ccnm9cRk43wlKMbTKiKlidj7PG1lh0OHEhR+WwHOWjJVTW0Hqgb67EMPx2CTPujT
 Lww37pWEMo8QC0aEfl7DFekHCHyaxQW76GdDfTvHQe1uY8TVBKkmxv2e5d6p4hZLbAXR
 6Bqu6LqDzFUs6MFlbpOg7H6XJktxzM14q9IKWayF04xSvtg39djcCzSLfF23ZolmdNcJ
 FAELerm71J9ldzwYo1h1oS5NsF1hM7PkfELULda9kHQozZyBLapUskKz3U4wOQaNNBdR
 4NQA==
X-Gm-Message-State: ANoB5pmYSIbRlEW4uCmtc7x3RiATHaTmi3nvyqagZDJ1b4tX5KJbEuOU
 Pe45kLu1uzkhFvIDUY4YU1+lADz7MgNS3pLZcRc=
X-Google-Smtp-Source: AA0mqf64ZR0uLQR9LOIGCEXZVqJpMTXiNJDeOkdZ/u6E1Hq6gzDZC9uXtQLjzidWR7ml/klyNpol9w==
X-Received: by 2002:a17:906:a886:b0:7c1:8f53:83a0 with SMTP id
 ha6-20020a170906a88600b007c18f5383a0mr13347269ejb.13.1671228390734; 
 Fri, 16 Dec 2022 14:06:30 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a17090632c100b007c10ad73927sm1293554ejk.28.2022.12.16.14.06.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] target/ppc/internal: Restrict MMU declarations to sysemu
Date: Fri, 16 Dec 2022 23:05:36 +0100
Message-Id: <20221216220539.7065-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 337a362205..901bae6d39 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -242,9 +242,12 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+#ifndef CONFIG_USER_ONLY
+
 /* PowerPC MMU emulation */
 
 typedef struct mmu_ctx_t mmu_ctx_t;
+
 bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp,
                       int mmu_idx, bool guest_visible);
@@ -266,6 +269,8 @@ struct mmu_ctx_t {
     int nx;                        /* Non-execute area          */
 };
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* Common routines used by software and hardware TLBs emulation */
 static inline int pte_is_valid(target_ulong pte0)
 {
-- 
2.38.1


