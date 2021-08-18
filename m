Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E903F0C8D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:19:56 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS2V-00075O-GU
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA8-0008Pv-Gd
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA6-0002xX-Ux
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id k24so3318662pgh.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vNwWy+xC/ycIjV/MFMh5N0tv4BuNkqj0zWC2JbLhrZI=;
 b=ZmiT1K5Qb3IvJOm3MJrNPSOr2cGiPJPVxwEtbtdabVJrWSnVjHXngSRQNwzyCqD7fy
 5G52n3U5rYkng1PMHGJpNdopEbM9RPdv0Uajer6wqvF9lNgXqdzL6SDc1ssAGHYd//on
 uCJTyOuNmrKyKTxmUKRni1a17DLB66hisyfuZ61mSnLAI7uwb4Kn1uEX36mpocJ8ITTQ
 FvondRnqy5DKpKObkd4cS0mYlo/yTOg27EtTRmoqGsIcH0h0aegUhrxc0RgEGivsbNXf
 QdfP4Nac3vUNcsR2JMJvVXUBBU8w6YVtXK+NaBEsWGI5j36xmW9WDMjfo+ar4jRNdCF+
 Bc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNwWy+xC/ycIjV/MFMh5N0tv4BuNkqj0zWC2JbLhrZI=;
 b=UzM35XVkc3aZrfgyiht0Fza3mJMp0H6VTZB8Pq3AlBK7LVnXzW7ZjPA9bvIwkGPPwS
 KczF1IeHwQOnsLuNUmLHy1yIdEAAWBGRpCHkoN1RtCJPqyOIEb4ksCPZZwbmJtCgi7O5
 cCgdGC4HaPWGJ7NxgmzXLPfjh3gGhgZKgJok2s4ZIgGO8v776fdT2FdGzByzZ6LIqdPN
 SlXkHLQlNtoBkltxPQ5kKOY0a1D1JkLwLJL1ToNzkpzE3AwuLPPzd0PiPcWewCpkJxG5
 p2B6xAnxKgQZkmvyy27/tKRrcUl7yiKzSPKvKse+nP35/NASNudMztbXszDK6ZjRSPky
 ApgQ==
X-Gm-Message-State: AOAM530wFgTxfBoD+5Ty5QY6lAGfQ6nixmeAb7O0kXihSkmoVbPKBt3L
 ecHYakkUQCOU4ynnLL41muS95lYETT8HIw==
X-Google-Smtp-Source: ABdhPJzmh62Iz1wQmmKF45cq+xApjhkxZuwrfgV0tcu8EZQGpq+ZTT6T5VflyLgbN1kbrKhJjlExTQ==
X-Received: by 2002:a62:878a:0:b029:3e0:7810:ec36 with SMTP id
 i132-20020a62878a0000b02903e07810ec36mr10910220pfe.4.1629314621766; 
 Wed, 18 Aug 2021 12:23:41 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 66/66] tcg/riscv: Remove add with zero on user-only memory
 access
Date: Wed, 18 Aug 2021 09:19:20 -1000
Message-Id: <20210818191920.390759-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index f75dcf88f8..b84a4e876b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1182,9 +1182,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_regl, a_bits);
     }
-    if (guest_base == 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
-    } else {
+    if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
     tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
@@ -1256,9 +1254,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_regl, a_bits);
     }
-    if (guest_base == 0) {
-        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
-    } else {
+    if (guest_base != 0) {
         tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
     tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
-- 
2.25.1


