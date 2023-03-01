Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E086A664A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCis-0004OO-Aa; Tue, 28 Feb 2023 22:01:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002X7-7y
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiH-0004Gs-0a
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id v11so9038306plz.8
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WO/WNmxqXYXjMjcDnY/5oHZY/YP6Syoy835yd9Gioo8=;
 b=O7XN2KOTJsl4bLXEDz/6q/s5bZ3SbPCLkzeTFTM8mdwUPGiiSw9bvH6en0DFuWzBwT
 1Smr8aRbe0u4JM0fz/kZHxcF1ocEtwJ/e+P3a0DbV2Jwq/yFXCKApEHn5QOhsiXAV8/I
 sJ7QvAqAmRLXiQqeNrg2bb63dmvnb8z48t8/Vh/AqNT9/vsxD12cPk+FFeUHUUvTNzos
 d7DrWvEHBkfKaXmS6cCkqIMUuOpMdKCsnO29EIaONxKlNAOjTZRZR3tXy/DGh+lo9yAv
 tPCZ2DaiR6CEZK2dx6airmPPwU94swoSI5SvRTgrJZe9g/11IEgTEFcEiKl/jZzRYhOR
 Z19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WO/WNmxqXYXjMjcDnY/5oHZY/YP6Syoy835yd9Gioo8=;
 b=jOUd5ZDPuVaJj238fx3ChpXTBSes2NCcUkzumbJ3OtzlgLxMecBliRHhRNJQTKVZDH
 wcBfzPN0RAkCHv0EOyJ4UXaXrRvZF13ci1UJ2+bnZ2spbioo4oly5m38R9QwbecfQWoz
 2MraWrIOStUh1AVi1v+Gj6CR53eyDHWyyDOYGotQaAKIjtjw84XzS3xRYarI4VSWTpw2
 7PWdLE6iO6xxMQ3UHWGJK9AwLu6xow6ob173Q3FBF68qdZqhh89/5yrnje4VXI/h0wmK
 AM8kBl2vacaO1qVtKX0s0RdDKHDZ6NjqGcNSf0Kg3nrB97Ely4MgIYWSijykn6C0jaSr
 Vc5A==
X-Gm-Message-State: AO0yUKU5xZCTTM1BGW2yISAX9ttLoQuFarSFREK1/Ff8PmGAFNfuAKEA
 8d2S01KaYPpiMkSMK5Hoh/Fnu0aKHe+jE0x86HQ=
X-Google-Smtp-Source: AK7set9jqc7Fs6iI9K3sbzxE6CTZuDw1oZyfhFGuZqOyEUjihQqaYLlwpac5SLZBtaLmY6Iog5u2kQ==
X-Received: by 2002:a17:903:41c6:b0:19c:1455:d588 with SMTP id
 u6-20020a17090341c600b0019c1455d588mr5693650ple.0.1677639663357; 
 Tue, 28 Feb 2023 19:01:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 45/62] tcg: Use tcg_constant_ptr in do_dup
Date: Tue, 28 Feb 2023 16:56:26 -1000
Message-Id: <20230301025643.1227244-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a42e13a773..291a65c4bf 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -629,7 +629,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
      * stores through to memset.
      */
     if (oprsz == maxsz && vece == MO_8) {
-        TCGv_ptr t_size = tcg_const_ptr(oprsz);
+        TCGv_ptr t_size = tcg_constant_ptr(oprsz);
         TCGv_i32 t_val;
 
         if (in_32) {
@@ -645,7 +645,6 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
         if (in_64) {
             tcg_temp_free_i32(t_val);
         }
-        tcg_temp_free_ptr(t_size);
         tcg_temp_free_ptr(t_ptr);
         return;
     }
-- 
2.34.1


