Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4B4A41E4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:07:45 +0100 (CET)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUX9-00043R-E6
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:07:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURn-0001tT-Vn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:12 -0500
Received: from [2a00:1450:4864:20::12b] (port=42682
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURl-000423-1W
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:11 -0500
Received: by mail-lf1-x12b.google.com with SMTP id y15so25962669lfa.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUs2T6CyNl4fWdkLDYWKTfnj1yRT/hYrlxBhmmqHK64=;
 b=Qk/gzuA3+Qu7pxlS/U3nRL7+wa2O6XaWIBwwytdG8chvPezrrcbzbmYpuNbz38jbrv
 TKEXS5rWNJE63vsLj3QMbVMNXN0XOQrI8jSEvqwtWCMmW1K01nUD5n1usy+DcZSxc/NR
 KoUlcc6XUZUu2jW00wO9RrtdnarHpA0NKABh5XY+fXSYRI6qBViUyQXoj778J6UDFNEe
 OjvQ5qYNiTmRlibawamQceynw5RN90lBSazjp+q7vKEN2F8dBwXr6p4N6lYiW6QyfhYN
 +/97EQVCiSty57BhdAWrbTdMJgT9yG8jLobeIERzXJOlyUQrqojhNKbKzEdX9GgLM2X1
 NHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUs2T6CyNl4fWdkLDYWKTfnj1yRT/hYrlxBhmmqHK64=;
 b=rsslrvEgPp9U+ksdVfimGhiE1HX3QJMFrWD9f1apueZi5Ns7bTy0x3ShRTKjsZviLt
 Hi3Ewgv02fUoVogQDW8qOQVsmz11Qr59txauFD+hhtP5zd1+qjnpPToWw9i13lK+K107
 f9Hdcmghw4laBQfBMLwoGThqVIqNVqG5YbSBup9Gc55GPL1mi5FrrtZnSxAgIRtakZq/
 ZMf93kns64xGZroIJ6s8O2NJHh0EUs2ZNDf3eWQkGZfm2pMBdTKBwM/RNZDNuFFS7TKm
 O7ORVf20yCEwkmXbTEP++lqEINBnQmAtocEAe/hvlqqMUwNWfzu0fCoSrA2XegQUvCOO
 g1RQ==
X-Gm-Message-State: AOAM5304jHzG54MZkMSn0Yb09NuiCAJM/EAOsvNP78wUWdQKG9BG03+q
 /WUessmH0oK/ekjdC6UbrZ2EOBpB6+e1towG
X-Google-Smtp-Source: ABdhPJxWmH7v2D6/ddUaHv/OY5vun8ejieCohLLe10rRMyCmW++hFEd0LPXlbaTbV5MDEzCzn+QnYQ==
X-Received: by 2002:a05:6512:20c6:: with SMTP id
 u6mr15210069lfr.290.1643626927291; 
 Mon, 31 Jan 2022 03:02:07 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:06 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Mon, 31 Jan 2022 12:01:56 +0100
Message-Id: <20220131110201.2303275-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the number of extensions is growing, copying them individiually
into the DisasContext will scale less and less... instead we populate
a pointer to the RISCVCPUConfig structure in the DisasContext.

This adds an extra indirection when checking for the availability of
an extension (compared to copying the fields into DisasContext).
While not a performance problem today, we can always (shallow) copy
the entire structure into the DisasContext (instead of putting a
pointer to it) if this is ever deemed necessary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

Changes in v5:
- use the typedef in DisasContext instead of the naked struct
  for RISCVCPUConfig

Changes in v3:
- (new patch) copy pointer to element cfg into DisasContext

 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..49e40735ce 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -76,6 +76,7 @@ typedef struct DisasContext {
     int frm;
     RISCVMXL ol;
     bool virt_enabled;
+    const RISCVCPUConfig *cfg_ptr;
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
@@ -908,6 +909,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #endif
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
+    ctx->cfg_ptr = &(cpu->cfg);
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
-- 
2.33.1


