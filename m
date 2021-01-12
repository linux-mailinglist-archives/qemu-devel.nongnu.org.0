Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763FA2F2B95
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:47:44 +0100 (CET)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGH9-0000KI-6x
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9q-0002ZC-FA
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:12 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzG9n-0006t5-Co
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:40:10 -0500
Received: by mail-pj1-x102d.google.com with SMTP id j13so1305626pjz.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4Rp9WKBRHuwGqR8BVwPx7zHTTiFInEpex1TEVTg+Jmk=;
 b=GrDEGubnxai9h3tAakEiVoRDIJ5lpZrxAuFKqAsB0r2bpvgixf1cwde3F4bChcrGhn
 zZzPvul/H7EtijwX47N+cEueyJe3c47sIurll0hNL1FaUeXVTLxMY5/n81KHjxn0IR/7
 qfHciZhPLU7FKc+Q6W42lKmUNqGUDP/zudx9B6FaPmjtouIDW4GCIpc5V0L90NI58CnD
 9bn49VgIlNg9p3rE4+c7bHGqENi394ISokl4uRVDpupdjAnJNzZQqRssAZyvVm2kOE8o
 IxQixL5F12TBJX9LM2sso+Q67fDr6UudWfVYgQPGoKtjR71YLyLNUYgZ9KdL4DaDH72I
 JLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4Rp9WKBRHuwGqR8BVwPx7zHTTiFInEpex1TEVTg+Jmk=;
 b=EgCc6xUzE/Xl4TqjDJeIQ4LH+rhjwF4zoWQkmVSkmh2ut9RyOfh2B6VWU1yuzratGV
 V6cGrEWSQmCtlBKy9E/xM/lpvlnsqmT6JHpcQx0AK5PRV8b0FWIyS49ttbCi4N+WxA9f
 DbHQwQenkC83V3KSkQwecNdmNFvpkC1y9QK9IxFRs7A1YzPC9xHSh9z8c/pNxUTKxWtp
 fvEUE2oRzHlje4z2cAPYFcG0yt72NOAGE4D9+AuciBlkX+pEgrSC1C7ZBXdKrlsE5uAs
 zS8I18ImPST4UYzLYFX+E+Sybc8R9/zZmz7efhdKnKWAVEUFW0rHMWWUHHJ9Mdi1TL+J
 VI3w==
X-Gm-Message-State: AOAM532edVu9FTLB7OsJFKh8yysKfzGHzk24ZED0XwTkPFU/3wo5XeA/
 AqV/xrdMGNdqhCNW1/D0fQS9RnksNM+qfQYJ
X-Google-Smtp-Source: ABdhPJzVkb/MSmNl51NXZutYQLuG1uZzVcaV7DeZCWwqwNyN1z4EAS5isYXENH4fzv2uBn31a1yXBg==
X-Received: by 2002:a17:902:8d82:b029:dc:20b8:3c19 with SMTP id
 v2-20020a1709028d82b02900dc20b83c19mr4365074plo.29.1610444405405; 
 Tue, 12 Jan 2021 01:40:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 02/72] target/riscv: Use FIELD_EX32() to extract wd field
Date: Tue, 12 Jan 2021 17:38:36 +0800
Message-Id: <20210112093950.17530-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..bc3f212ceac 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -98,7 +98,7 @@ static inline uint32_t vext_lmul(uint32_t desc)
 
 static uint32_t vext_wd(uint32_t desc)
 {
-    return (simd_data(desc) >> 11) & 0x1;
+    return FIELD_EX32(simd_data(desc), VDATA, WD);
 }
 
 /*
-- 
2.17.1


