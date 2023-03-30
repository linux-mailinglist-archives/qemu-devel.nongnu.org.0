Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CE6D00FB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:19:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpN7-0000NU-O3; Thu, 30 Mar 2023 06:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpN4-0000Lb-4h
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:19:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpN2-0001Rl-9B
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:19:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v1so18518203wrv.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33H26SmKB1RHJAPoW14amug925cmsjB3S/B1b0LxD4Q=;
 b=IIEMywrROY5LVN417eyUDyH1NwAsGkG6WKj7Eb+AprpUAoJJbBPV0PAHGUiVeC5G8+
 Cw8kKm0bpequcW6SrO8IbvNyhWXtDhnbtU9dHpU5ywKKtRp5cKDj/tNo/8tF5h3Yx8JK
 cwb7v1WSiHtLynJLiMGyt5V2MeC6x0HOtdkpDTqhcnxdYz5ykSkHf/TsXF9/QcZvAcdC
 J0v6M/v+WuiFZDyDiw6XIEpAN5162szk93moHXh/3N9q3fhUCp/JJPYpx2K7sOI2zqbq
 9GU/WAYifzdZbcb/CnA3u5zssh8t8yiVOsL4lIzCZKpx0VkdOYOOfmH9UkUxABqfT7CE
 MCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33H26SmKB1RHJAPoW14amug925cmsjB3S/B1b0LxD4Q=;
 b=1Mh3opM7ZnIDIkjsiNp+t2vAUHDkPRypcHiDsZxq3+z3MzISE+Q9yt3SOyLqZd9gUj
 kRva+l6WHgTE2YfKmfaFdiDwx2F0lEzirNAHfrvULn8NUmpkkevcfNiRlthlgLajA3hm
 XWKbo0ZqVGUXX422TvMHzP/dfTBMinawmhSX+WMZmH2xWsoiEqcFD1d1U07EgymP8weH
 eriyYsOOxQjt8S8jodzc8xBRKzbdUFzqzZbsit8zY5ed+wGzUlANynli7SmwBDFhrtW3
 Wbio9j31XfKgKCGd2MgiOq8gE5pR355BXX00+N7RsIaokP2C1WQtMSAEDyQDtwiIJegc
 p/TA==
X-Gm-Message-State: AAQBX9fmJrWapANILb1kUwelOxL6qXneoBmmjIyu2j37CieUeQY1BKkQ
 BBamB/bzTG3g3z7vpwb0k/ALoA==
X-Google-Smtp-Source: AKy350by+20m1uBPB4L92D0S7d0gsC5NAuN4r9WAfFPeVcaVtQh7ZtWYX9P9WZ3d2MDjU6NsjCM6PA==
X-Received: by 2002:adf:fe07:0:b0:2c9:d91b:a6ff with SMTP id
 n7-20020adffe07000000b002c9d91ba6ffmr18360240wrr.21.1680171542353; 
 Thu, 30 Mar 2023 03:19:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d4889000000b002c559843748sm32395801wrq.10.2023.03.30.03.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:19:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Date: Thu, 30 Mar 2023 11:19:00 +0100
Message-Id: <20230330101900.2320380-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

In commit 049edada we added some code to handle HSTR_EL2 traps, which
we did as an inline "conditionally branch over a
gen_exception_insn()".  Unfortunately this fails to take account of
the fact that gen_exception_insn() will set s->base.is_jmp to
DISAS_NORETURN.  That means that at the end of the TB we won't
generate the necessary code to handle the "branched over the trap and
continued normal execution" codepath.  The result is that the TCG
main loop thinks that we stopped execution of the TB due to a
situation that only happens when icount is enabled, and hits an
assertion. Explicitly set is_jmp back to DISAS_NEXT so we generate
the correct code for when execution continues past this insn.

Note that this only happens for cpreg reads; writes will call
gen_lookup_tb() which generates a valid end-of-TB.

Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: just unconditionally set is_jmp to DISAS_NEXT.
---
 target/arm/tcg/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 2cb9368b1ba..3c8401e9086 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -4623,6 +4623,12 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
 
             gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
+            /*
+             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
+             * but since we're conditionally branching over it, we want
+             * to assume continue-to-next-instruction.
+             */
+            s->base.is_jmp = DISAS_NEXT;
             set_disas_label(s, over);
         }
     }
-- 
2.34.1


