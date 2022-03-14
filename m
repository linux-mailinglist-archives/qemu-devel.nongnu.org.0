Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D14D8B34
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:57:07 +0100 (CET)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTowM-000289-G2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:57:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocA-0006ru-DX
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: from [2607:f8b0:4864:20::102e] (port=36357
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc7-0007s7-N0
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso18233601pjb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHlvdTeEJH0Ni+sNVrOIMRWUpHKHamH8lfo6vskTyp8=;
 b=eIznPaU6Rybf6W8qrzhzn6xIbj6ReuJ0HIeWmZLmYE1PTrws64saOkpur2ijYUTR+g
 0PA3SZELDF5hbNlpSW1gI0pdeJmteprmzygIFa+/uzzMMMH8lSGZQkpqLHWzKGWJ4Zvm
 1+qiWKX3XpVIi8+r/uXu2Ozi1eH3KS3BBjtfxCSMbFORwRdll9GxPwQhUQ25mzUuiuap
 mzR+Z5g2O215oE4WUtJUAx8JdjoBLAD91Hd7LaAu+M8Aynfj63BXjafiGKTRU2Ngo/q8
 vXOL0/Hr/eyZFoK0a6dCA+Ck1rgNv0XWWAeVf9jVwI6b3matx9gZqi5qivWvGd7CWks5
 a1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHlvdTeEJH0Ni+sNVrOIMRWUpHKHamH8lfo6vskTyp8=;
 b=vEM9NGhzc8L/JoNG13TLjZH7L9SmWkUe4Rv0Bwh6tb5kxYkxVVItTpjvjLLNtYEhom
 NfCaL9wrCMP779IR2d0goWXyT+BUaVCam3TJ+neORllOs8HZL6KECrLzEnoZOcIxKf9z
 S1SgBNUCC3ZeHhs8kNQmvHbtK8CujCp3U1j6othJwbMmjzStLm+utaiNkST4qHjicQds
 wGEpda2fSzAYAOpFm/R0dxF/IhLGEEaZA8nrHV4rxgDdXQRjt9h6HgkNVwITGeWcW5uw
 cMJ9WzodMCOthZj3l+QNDrnNOFULZr9ZBAgsiXzKaJhMYx7k6pWgjZE4o0ktqLZOENbC
 ZZhw==
X-Gm-Message-State: AOAM530ZqNLAI4LmQU+eiwS61CtEu8h3UQw+3CyN/BDknNDG8zYnKMMs
 ltp+qdn8kP/WYsQt7vysRKgjh1HRlPY9NA==
X-Google-Smtp-Source: ABdhPJzYlKMIQHhwYUZAN2uotDm39AiEc+DkvDde9CCzXftF3EFtH4UTTw4nsC6ukqI/cxccJz1+qA==
X-Received: by 2002:a17:90a:528b:b0:1bc:c5f9:82a with SMTP id
 w11-20020a17090a528b00b001bcc5f9082amr317753pjh.210.1647279370336; 
 Mon, 14 Mar 2022 10:36:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b001c60f919656sm113847pji.18.2022.03.14.10.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:36:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
Date: Mon, 14 Mar 2022 10:36:05 -0700
Message-Id: <20220314173607.145630-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314173607.145630-1-richard.henderson@linaro.org>
References: <20220314173607.145630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The operands are output in the wrong order: the tcg selector
argument is first, whereas the s390x selector argument is last.

Tested-by: Thomas Huth <thuth@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/898
Fixes: 9bca986df88 ("tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 508f1bccc7..3b185b3c96 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2868,7 +2868,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_bitsel_vec:
-        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
+        tcg_out_insn(s, VRRe, VSEL, a0, a2, args[3], a1);
         break;
 
     case INDEX_op_cmp_vec:
-- 
2.25.1


