Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4784A6AC8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:12:52 +0100 (CET)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF70l-0004Ub-B3
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:12:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tN-0000d0-SN
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:02 -0500
Received: from [2a00:1450:4864:20::130] (port=35702
 helo=mail-lf1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tJ-0003DT-KY
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:00 -0500
Received: by mail-lf1-x130.google.com with SMTP id i34so17029226lfv.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ifyO0U3WU+aEW53usXKonrrqh+2fiZvZX0iSkoogExU=;
 b=aw9YwHQrX2v+qHDi2TSBRrMNDNKTfOOxiFsHfpvBVaDu7WiNa3Fu/NRLKfBCW2uAxG
 jWlI9HmKzPz5BULRYWoeUr0vcB2la4GVXYle1K538SxeD7oqG5TiBFybwD255mK1dlYA
 glcZo4rKFNX/61a2rQyPZn3hS8Y4XPxW96BE8o5VVLrhncXuryoedkbBzBBfGRivP75r
 oiuL4qwj7J9Ji4EskpGqXdyEzSpiZ2hV7EXXEDsYR60Fc3Txu1kk6+DbpxTcSXq/rg4z
 35d1/VSkQegi+N9tzKsS6I+d7QlJynj/DIMtZmi7ickmXkUSE0wWp6cuiUr1gJmPCRu3
 z3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ifyO0U3WU+aEW53usXKonrrqh+2fiZvZX0iSkoogExU=;
 b=lR89nadN4fGr+rLtN+Iazzrbc5BXCPVsNw0uxr7rglyIUxRHhG3I15dcFLcJVe0rO3
 LAajFtOUMtNZtrVscsxx/mzXZTtHFMir3RDZmAEm4+NzgiYW+oDJPamHMgleduv1ZrJp
 Jjp7GchJN4XpdaPMAAdRqbP/X2lDumv5UAX0R+q/057Q06Grtf3fMKKFlEy7bcxmd371
 5T35rjenrVgGtUOsoiypz4+ErLITtliF//od2NMB2K7ciNkvfdK66xIN0A2bU+8TyWTN
 DXQJrDqPlhyPvxlUJqC9yPFd3U5mad6X+cDVASAP6CLiBYlVjLeNltqixeTUhFb594RT
 vv0w==
X-Gm-Message-State: AOAM532Cd5gXU+I9RWRHByVmAuIbVgBbATN6hg8zwhpeccInIMuqZorn
 Lz9HW8LlS9nDsierzKEFRkEG/yGmAkiqbSLX
X-Google-Smtp-Source: ABdhPJzMUBh2KCx2ge56EzLAxn3ysaed4HWdUMWU46ZdcARDVD9SfJ+18Vo2NfgvIgRE+EmU1j9d4g==
X-Received: by 2002:ac2:4c09:: with SMTP id t9mr20610109lfq.406.1643763175011; 
 Tue, 01 Feb 2022 16:52:55 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:54 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Date: Wed,  2 Feb 2022 01:52:44 +0100
Message-Id: <20220202005249.3566542-3-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::130
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

(no changes since v5)

Changes in v5:
- use the typedef in DisasContext instead of the nakes struct
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


