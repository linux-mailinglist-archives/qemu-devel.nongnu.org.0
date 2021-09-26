Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0D418CF8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 01:06:27 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUdE2-0003lT-Bz
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 19:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceu-0006EH-4K
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcep-0007EL-Qr
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so46565509wrq.4
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=Plli2p4RgeCRhPsFN89Fs1h+89fzRWd8GEWmlE/eAvFyzN75Uh2lZEXjTp8c5bwVaL
 bXimWXCvfnrGi/pbLYoEXVB4bGpL32xIDTrTpqFOgqen5AUMtDzPVL9nlqflnlEkGi6F
 iHEYwOcgEmfw4myJxO4EOW8Yjiw9syeiloLKT16rgA1ctYa094b3+DPqKMPrMG72SysQ
 Yv5FtDZiCo70GPUS60sCpRKbOBE7NHQmFHCN4bWTJL0nzNYer+AG/3yF1ZbFfShFQh26
 Nu9Fzm5G7w2U+Yk1YNnhUUgVeoMXeTZ7SqlIcsnRNy+ycfaI7BbGyoFvf0m0I2ioOMcP
 R53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LjvVczq8n5tzr9drSBRznUr4y3SH1knsfynMe8Ogfbw=;
 b=f+iXskJwgaw3ipGAlln+lOM7iOvO8toErfpXt5oAf4/7+PaFhL0akCieTcEPUGcYWt
 XI4VLod37oJybv+q0LkCWEX97sMGvW9jtBOHBklnxhUdwv6SDqy9gXi5qXWqQy2qXNMX
 kco03nYuqbP4gkXWjvvsa6VG1A/F0GQ7XLJo+4QULcjoDIda4KE5+/AnlsyFnKxvRzR2
 Nw47LaeWTkNLzVIsIDREoGrcGgZK99z9vIJglQBLFlHwT3QWhSUUDwrXbs2FohXV51OA
 KAt1++yazERJLg5ppR68oKouzkB0dsckcNNBZjPiJjwZeMoAFgiErWu4NilZ5We9+VKu
 ExfA==
X-Gm-Message-State: AOAM532EZBoIOfYmli9od2xQFfGradvoKvflQErbM4234PpHlaCeuUlS
 DKHnFsxmPCAPFoKn9cPSykO80zFcdPs=
X-Google-Smtp-Source: ABdhPJxK35w25ovSfVt4Px0Bb5inK2M68TKXZR/POoDgejvYEqnpHi1m+0dFrzGUx7nti8W3YW0mPg==
X-Received: by 2002:adf:e646:: with SMTP id b6mr24465466wrn.153.1632695402245; 
 Sun, 26 Sep 2021 15:30:02 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u5sm15966577wrg.57.2021.09.26.15.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 35/40] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Mon, 27 Sep 2021 00:27:11 +0200
Message-Id: <20210926222716.1732932-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SPARC target only support TCG acceleration. Remove the CONFIG_TCG
definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 21dd27796d0..0d252cb5bdc 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,7 +859,6 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 };
 #endif
 
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps sparc_tcg_ops = {
@@ -874,7 +873,6 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
-- 
2.31.1


