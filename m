Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DC6F7A8D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:17:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujx4-00034F-EW; Thu, 04 May 2023 21:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvZ-0001Ad-Is
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:06 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvX-000891-RA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:05 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51f597c975fso1057871a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248882; x=1685840882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqATn5U2LteHkQUhr4ed0Zy0wxeNGC/euNQ0q+PyYgY=;
 b=mK5OX32FnBkIjJZ/qKrAIjEr84PIlJdkTkuh4jD8+PVM9tAoyhSgKu+Tm7KiQ7WNCX
 MF6eoSYhxNcgKI5CEezForhJPXSM2UP8/YrVVZ3WbP9z3XJc2iJN3DBwvrg4Js89pz30
 zVTSU14m85V/g84GKVjvkWtV9h9/0GaeemiG5cOIdRk2eHyeeWsml0Llqi8Qy/XCn3pw
 nsE/kJKAEKuY99V5KYqLisQK684rm55Nl7JpJ5LHHTPJu2DCtLeuduDO2K3UPtG6Dsja
 at+Whs+CQ9o0AlKLa5Vfi7F4TZsuLJVHkeCXuYG6bFIHakF9JG79PlA0mlz42FeEcVox
 gNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248882; x=1685840882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqATn5U2LteHkQUhr4ed0Zy0wxeNGC/euNQ0q+PyYgY=;
 b=ECeWjimcrxGjjYPZkuF2hd4dGOWAyIbC5a4qbpE+a/VKN9rm0dfTwutx6/cfV1Pq9+
 VNLRs0qG7ezPTHUYL3NzNfoNy40Ms1598jsMESK7+ySKOmNDALxbT9aCzo2dotB9saOL
 PEUoJoqJOPuEPnZ1przunD8j4Qfka046ShWiplpoQx3XDeWLwBMMETWU+sodZbeZwf5w
 i0kcvhbaj+QhO4Ou9h6l5n7pt+rF3vsfHv25Q94/7w70eyGMk3QXhMMwn9ouOFLH73Wg
 hUKPIrE5+MWPr06M3q1cRH3HNpxxWYcjH9oikgfuqhkoV527uJXlfjd8ZdlbmwdstMEn
 T2BA==
X-Gm-Message-State: AC+VfDwH5MveODedsbWAg9DNfYrOuIZLKrxKhlN48QaSVT9tinNM7bUF
 N2l1Ws3XS0wBMYYmAuJ7mBgSAb1UCUnoMA==
X-Google-Smtp-Source: ACHHUZ6bKhWeH5tD1IDZ6ZIJAsHsoN/LcExIcDEXj35S/xS5LGNtat/CvejSpdhyyKZdN7+FeS0bCw==
X-Received: by 2002:a17:902:b087:b0:1aa:ebaa:51ce with SMTP id
 p7-20020a170902b08700b001aaebaa51cemr5100902plr.14.1683248882159; 
 Thu, 04 May 2023 18:08:02 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:01 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Ivan Klokov <ivan.klokov@syntacore.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup@brainfault.org>
Subject: [PULL 82/89] hw/intc/riscv_aplic: Zero init APLIC internal state
Date: Fri,  5 May 2023 11:02:34 +1000
Message-Id: <20230505010241.21812-83-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Ivan Klokov <ivan.klokov@syntacore.com>

Since g_new is used to initialize the RISCVAPLICState->state structure,
in some case we get behavior that is not as expected. This patch
changes this to g_new0, which allows to initialize the APLIC in the correct state.

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Message-Id: <20230413133432.53771-1-ivan.klokov@syntacore.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aplic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
index cd7efc4ad4..afc5b54dbb 100644
--- a/hw/intc/riscv_aplic.c
+++ b/hw/intc/riscv_aplic.c
@@ -803,7 +803,7 @@ static void riscv_aplic_realize(DeviceState *dev, Error **errp)
 
     aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
     aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
-    aplic->state = g_new(uint32_t, aplic->num_irqs);
+    aplic->state = g_new0(uint32_t, aplic->num_irqs);
     aplic->target = g_new0(uint32_t, aplic->num_irqs);
     if (!aplic->msimode) {
         for (i = 0; i < aplic->num_irqs; i++) {
-- 
2.40.0


