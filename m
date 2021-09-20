Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3044128BB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:18:52 +0200 (CEST)
Received: from localhost ([::1]:58580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRch-0007VJ-DL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7n-00061e-75
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7l-0003E5-MN
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id d21so33524139wra.12
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ng68G2SUo/Wom1Lm26r0e0XZx7BrOhoYuLk/QBnpHvs=;
 b=kevIubyPGcrs5Ak8lDXLPOYv4bwO0r/sFPqrxkO0FB7xO6HfDQcotW5BFShwPheN9T
 xYmBSCY+vBy67CkfzkqaTFCdEXKjqmtwSvbgMCAfuTaUkKjw24ccMFUsZlR+axlN91Da
 lSg2bS/8hD8lQTFc9ITdzfSdtrg/1CJz5vvWzYqwSejNm4qwm+V0DpyM+ufwAokzh+r0
 X+6ofhJriKGyXum/M2HsIEuyGWnBbial0jE2byFZrYCkQJrqNlAE1IrQeeFumC+xT6uZ
 OxrApjopFD7UpPcHnmAp8rpLXxjPis+caNxQtM+UNzq8VsciST58SG1zef5ujP1+FZd9
 DLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ng68G2SUo/Wom1Lm26r0e0XZx7BrOhoYuLk/QBnpHvs=;
 b=Io+AT9vMuIL8ROsEWk9+fJ+8Ayl7cY+KXR/xa34OF/DYfTXpHBTr1xU0wmhGqvOiVf
 PvrEXVzR7Po76jK97T1BuQ3UQCD4B3WRt+eKhdcAydYLSJUF2o/rO11/32LSqpui4jlg
 D9SXpScOJ4oSzbpAe3ZD9y/NcAb2u0FVej+tzuNh5vq2yvqLb4lk0qkUmVH690BsKwMD
 6iM2BUOgoj3S1I4Wvx/KQJw46FviLB/Oyuu8ip/nvf4BIq0FqWzonen1/fAHEyq6htWo
 jmNmQMo81QyLqfa5q3pwPHRzBKC1D7FAlaF3PrSOKlNNsc7uNZ/L0x4qjznilPydf5Vc
 bIhw==
X-Gm-Message-State: AOAM533WsiWa+yUhd3lCKEvJYlJmSaXXgLKDEppyKEmOFiAB5w6D9aDy
 3D9IBK1FMCN3YyBP7O0EFpfj/CeOS+I=
X-Google-Smtp-Source: ABdhPJw9WCwjDAdBMimjv3YzkuWzJBSedyx2xh3ptMzY65sc4hAlEQOw6NwoDJoA+UXD3z7PuG9wCw==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr1183501wmo.138.1632174412095; 
 Mon, 20 Sep 2021 14:46:52 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 f19sm706102wmf.11.2021.09.20.14.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 27/31] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Mon, 20 Sep 2021 23:44:43 +0200
Message-Id: <20210920214447.2998623-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
index 5a8a4ce7506..e83e305aa9d 100644
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


