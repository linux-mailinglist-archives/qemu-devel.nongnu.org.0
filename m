Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6564803B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:38:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Zoa-0004EX-7f; Fri, 09 Dec 2022 04:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoS-0004Db-Lb
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:37:05 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ZoQ-0003kV-KC
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:36:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 125-20020a1c0283000000b003d1e906ca23so2842916wmc.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 01:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqbawvL4vHvZpY+2DyinzrBtHU1TrIUtt76G41fXH68=;
 b=U198fHmPFbp0ue9DQeYt8z4UFPNtjBZ1pcRFkxzV4JSOU0rBM8ywKuzzkIoMIuVfX7
 GkCDvsps7ExKS1aQ/Tfu/B1yM9Bq1dZJxh4pC/dFHRdeaKPNiWmRRpcz+zkJ+L01peiA
 UEf63os82eKL5MqzxL+n71Buobypn5mM5bFUVKm4n+RADR8RfWXb4i50R40LzBtS1MMl
 5haUqH3boZ+0QqkTgBkzmX6OGlnrSxuexleNQSVYjpRvDOO98HZMlpZXiYqbFp8pkk2E
 R7L2Ip/Kg3lEN9YlRyquncFlyilbg8CVJNRK2E+aVxJAD7Go9F0u3HE9tWUE5kOKyOq+
 F9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqbawvL4vHvZpY+2DyinzrBtHU1TrIUtt76G41fXH68=;
 b=x+PnlU/yIakzKWO2VP7A3u7MPwadgBZrURiW40lL/GbmTyGmaLrGos/d39ow5JJh4I
 cR9nsjNDAtfPVmxCemMxOgVIUwbthVH55f8XaFZVvDFtBJJ18ccUorYyXuYlXC3I9j36
 SrselJEH5DlMjLnApdLIyafqLQD65+ZFOSzWcTKX5a0HqDvPPxTheWeDSh72ulUFex38
 TPuMLqkUkTmSmWK7v0cE4Z3xzF6x+QzYkGkATOdi3LxG430STOSTNoIBdlGE21bnvL7B
 uVoYbQZRUBkeW70+7nPdxz/SON2D+JMxsuuRZBAyRLtQUVaXKl74tN7P79zk6K4UXWVI
 DSDA==
X-Gm-Message-State: ANoB5pmBZoX9QryDvj6a9nEfZ4p/sAnE5FwIJGMFx09fQB8pFEfZMANp
 VW36ucWLH0biFmPXUh45dQluugIvQvKtCPqr7eA=
X-Google-Smtp-Source: AA0mqf5WNexLcFWoVXjangt0NlfSbtV5LlhlR8n9u3uHGVVUxls6+CmZbh7vMyaEy0Un/HIGy1+qMg==
X-Received: by 2002:a05:600c:1d83:b0:3c7:a5:610c with SMTP id
 p3-20020a05600c1d8300b003c700a5610cmr4137749wms.16.1670578616525; 
 Fri, 09 Dec 2022 01:36:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o30-20020a05600c511e00b003a3442f1229sm8603629wms.29.2022.12.09.01.36.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 01:36:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/5] accel/tcg: Restrict cpu_io_recompile() to system
 emulation
Date: Fri,  9 Dec 2022 10:36:45 +0100
Message-Id: <20221209093649.43738-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209093649.43738-1-philmd@linaro.org>
References: <20221209093649.43738-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Missed in commit 6526919224 ("accel/tcg: Restrict cpu_io_recompile()
from other accelerators").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index e1429a53ac..35419f3fe1 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -43,12 +43,12 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
 struct page_collection *page_collection_lock(tb_page_addr_t start,
                                              tb_page_addr_t end);
 void page_collection_unlock(struct page_collection *set);
+G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 #endif /* CONFIG_SOFTMMU */
 
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
                               int cflags);
-G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 void tb_reset_jump(TranslationBlock *tb, int n);
-- 
2.38.1


