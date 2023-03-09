Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDA6B2E16
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWc-0003zS-Bi; Thu, 09 Mar 2023 15:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWW-0003mA-OK
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:01 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWV-0000hP-0Y
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:00 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so3158889pjt.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjockYhWelpkA89u8rBpdCNAuPTh1O+y0bM/jqR+q/Q=;
 b=S0E8I6WaG0Ys0JaTYoLyS5GnKCg86HGr0cS+5RXL76X4Tcftv+Ex4WsWdXyaLozbK1
 3XuHwbNgd3SPAGQOtyfrl/bZoD7wnwjdNCg45fvubvaL/ViMatPacs3N4pKswwV99SCs
 elwL/H46PvtdLzPovQ+yCQZZvTOxyRj0+3LUK26gINnX+8dCeJZxCvU35r6u1Ff461zj
 gCnXFDNCUsSOCZ6BK0MrsKKLPgyJa+xqUV9bVf16ZZT85vjC/QRcPGS50E2vRBakPS/c
 AbzK0h0Rrl4w/aGlqkbztakeyr7lkyiXTbkAfOkYmVpYXG+m7XZSWdhjO4UDYExF5tfW
 hS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CjockYhWelpkA89u8rBpdCNAuPTh1O+y0bM/jqR+q/Q=;
 b=UwhnqufzI/UezwahwKufzFqwEytGF6QZITT0Lf7C77krwXhScVhGxOVJnZmdPTz+bC
 slmlNSBl/xBzxs47rIjKJt4MyC8AWIeGWNiU0HiOSuYv7sVzQB06tlf/y/irOPdKuQk5
 vRdnvWx2ffj4wfHwZnlpWyOnHWjLvJ+uN/PbvVLfUToC9NJvQNqsI1hNlGWHtkC9f3lP
 4JV8j0j+Eu5bQGW5QG+1OLAHKUeEkOk4jwH6nNi99DmeVEJBLkle8r95z6Uor+AdzIiE
 usGOiYsj0+/6riGNQp/dJgqcpw5DQU0+33vMCzXIIeo5mgoAlCMSkqQJzdCHMiFv0obp
 IhnA==
X-Gm-Message-State: AO0yUKV1AuqvHlXmuliHdCt2rRTBLKROWArTClEYyY7XNTFLA+IARt78
 aHCG9dZRhOm40RC0Hnc1MwyB3nRKVIaD+8Wk3UE=
X-Google-Smtp-Source: AK7set94hEnFdoRpGYXMr2ZjInXC3HR2CHhP2nKGkpHfnsVeipETQcnWq3l2LMNEaNI4hHVkN115hA==
X-Received: by 2002:a17:90b:3ec7:b0:230:86de:f390 with SMTP id
 rm7-20020a17090b3ec700b0023086def390mr24619654pjb.42.1678392357682; 
 Thu, 09 Mar 2023 12:05:57 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 06/91] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Thu,  9 Mar 2023 12:04:25 -0800
Message-Id: <20230309200550.3878088-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
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

Translators are no longer required to free tcg temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


