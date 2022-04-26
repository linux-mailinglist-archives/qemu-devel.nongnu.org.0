Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CB510757
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:44:02 +0200 (CEST)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQAL-0006U7-T5
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmX-0002Y1-Ls
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmV-0004MA-9y
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so2260491pje.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6UYSlRGZfhDryiA9u1wA9vZSGmpcy5aRg3TaG0SXLQ4=;
 b=oVbNU6YPBNHQkUQsZ1r9L5kgyOSEQC9SRbC428MN90SJL/dLSnSNJFXPkWt8yQxgYR
 SqxKN0nbnC+ZsfMLbYnr/rTuHyUr0Rjbcpp/yJTte9XURZCnBaG8cPqs0ytVCZRutMBI
 pJxeswesInR6eP8+OwyNpxT8UgWZpFHxpjGfbTKruenaco1CgYWAVr6mpJYGpyEcyfpA
 DG3NwH+CjtLG8J4FUmsX5Agyq+FWD+PGf8ZzoY77phTu+X5uz5ASfkGJLIlckwRPFCuA
 KSsxrcy7BOa2S7v80SAse69jrKYurplkuyTzL58ChXuMbyq9r2+Y973ZOaHT1k0Gqiva
 KcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6UYSlRGZfhDryiA9u1wA9vZSGmpcy5aRg3TaG0SXLQ4=;
 b=AC1Q0bp3GUOASBoiAesglr8ld1pZxPEC8Yka+uJG+72tjON9fkZqljTQo1Ib7S0ggb
 uqBE5XBQG2sqGeo/yrAEnEtiYE2GiWGl1JbvO+qZfAJO/YufgBzZp1rgkH92qYMulWML
 LSBU8XMj8feMAw2CC7Zgo9sksIaTAqGTJQPbr1uPH5N+RdFt4lLdShskCku0iYLVZ5xh
 lgPRn8FV7VshFEmF42FXjtRFosQiuRzfrSKKaU0iQ/UAWMjBEQ8OzCz9J2EKnUXaSULA
 O7pRxdn6BDijvC9SpD8KR+0QJtNcbNEqUcGK5mnqXgGUyNqfc1PtRzh6Ofh/Flappsqc
 Bf8Q==
X-Gm-Message-State: AOAM5328gcHhUfLEO36514858I8RWZjDdfh9iDn2DmEO17MDk9/YtGWL
 dTv0x7UHHJr+ivmV3CFB5/WsQy1oxNM7xg==
X-Google-Smtp-Source: ABdhPJxJONvP9ex+0hEsf8hbl/1pu0pimPn9W0xgiauXAh0mGPE+idV0b8D897ehS0kiinNe2DkBpw==
X-Received: by 2002:a17:90b:4a48:b0:1da:1fb3:2f65 with SMTP id
 lb8-20020a17090b4a4800b001da1fb32f65mr1484116pjb.168.1650997160079; 
 Tue, 26 Apr 2022 11:19:20 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/68] target/nios2: Check supervisor on eret
Date: Tue, 26 Apr 2022 11:18:12 -0700
Message-Id: <20220426181907.103691-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

eret instruction is only allowed in supervisor mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-14-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 89b97ef520..eb97e13feb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
+    gen_check_supervisor(dc);
+
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-- 
2.34.1


