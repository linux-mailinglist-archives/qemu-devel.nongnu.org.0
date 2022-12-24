Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524B655BF5
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:14:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9ES9-0007Ss-1q; Sat, 24 Dec 2022 19:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERw-0007NV-Kk
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:12 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9ERr-0000iw-UV
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 19:01:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso10217535pjb.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 16:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOYCCYtPdnKj+yfIPyQ3b3Eju8B6onYQzX1BsWT7Kq0=;
 b=Faje3W4rWEiNKGLIZtaELEXOVtTGmUbEFupcf1xnevsg5SJBzRnKonbJxiYL/Jglbd
 GHeBPcV+0j0JQaV8pBiQFl4gfBZCbB7vXZj/eIIMHPWR/kXaEeN9lwW+74VNuBM6ZofG
 ORNMhU3D3v/6SUvP/vR95h4lehYyK3s7Sh6++ntzHsmUmgbZSMJRKtGCnFTH4Am5hCzX
 VyU35mD6clALHKAMHYPO7gxtWHv0t7eBbB6L4zKAiGKhWjzbjVSoJ/WTR1M5BlfSX8IN
 T0mkjK+Ole9gG8I7bwz7G81xqko990bB2X2lyu8Rd1h77iEtWveGLHtsDymNiDkUFtrE
 o7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOYCCYtPdnKj+yfIPyQ3b3Eju8B6onYQzX1BsWT7Kq0=;
 b=kCPUZk56R40wgaBc1fVT+c0AUoizucC6dmkuhvcptSqXIOxZgHheQEQZE3YzXIH6Xx
 9ZMNj2u7NPcBB7liXhWyPqE893phmPlcM4PuC3zRCHaijJwgIBvc9p5RRGqIU62E4tPm
 G6NvbiXexoZfH4P/bhPAcLnxbeDTQxe5ZjS4V+sW3pwHq3nzcLX5uqgzQPpx+2iIyamc
 EQ8Vxb1EjmiXAoW5KUREddyIGeQ0GX3r3frHP3SSJXgOXXetpAPefuRZ7jCXfYI9kBEp
 UVDmEdFGg94rZnWPNyw8euKNCHlFwTm/S/gV5a6sX1n5/3YNTBexuRbqLRQYfAzu1fo5
 0CXw==
X-Gm-Message-State: AFqh2kq9WmwUYiPorLnZKZi1v9fxzmr2phv5kgYbu54ddZkeu0atdVuF
 QeFwLA34UWfvZgHSqEX6lvyxXV5tqGH1xmb4
X-Google-Smtp-Source: AMrXdXvxH8MxJPqMaTlh08UU8Ya078up99KPPPMGSRa8LQQSDgsuufznw4xMnlOQdJkMqNGSugOfGg==
X-Received: by 2002:a05:6a21:3942:b0:9d:efbe:2065 with SMTP id
 ac2-20020a056a21394200b0009defbe2065mr20523207pzc.27.1671926462646; 
 Sat, 24 Dec 2022 16:01:02 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 e32-20020a630f20000000b00478fd9bb6c7sm4161280pgl.75.2022.12.24.16.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 16:01:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 42/43] tcg/aarch64: Merge tcg_out_callr into tcg_out_call
Date: Sat, 24 Dec 2022 15:57:19 -0800
Message-Id: <20221224235720.842093-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

There is only one use, and BLR is perhaps even more
self-documentary than CALLR.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 344b63e20f..1af879e6f5 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1336,11 +1336,6 @@ static void tcg_out_goto_long(TCGContext *s, const tcg_insn_unit *target)
     }
 }
 
-static inline void tcg_out_callr(TCGContext *s, TCGReg reg)
-{
-    tcg_out_insn(s, 3207, BLR, reg);
-}
-
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
 {
     ptrdiff_t offset = tcg_pcrel_diff(s, target) >> 2;
@@ -1348,7 +1343,7 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *target)
         tcg_out_insn(s, 3206, BL, offset);
     } else {
         tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP, (intptr_t)target);
-        tcg_out_callr(s, TCG_REG_TMP);
+        tcg_out_insn(s, 3207, BLR, TCG_REG_TMP);
     }
 }
 
-- 
2.34.1


