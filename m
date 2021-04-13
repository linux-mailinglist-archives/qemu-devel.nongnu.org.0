Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8535DC53
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:15:05 +0200 (CEST)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWG4W-000179-Ji
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1T-0006NT-UC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWG1S-0004p7-FS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:11:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f12so15888792wro.0
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjQxr/jFzbomVhE1MW9X6lY8//4Qu15uyh6N5jl5uwI=;
 b=fWg2n4QMGc/XXR8TtpILiRQdgOgZQHoUDz1QoS3jf2Pmj0u4btAIbBI+ap6Y9rp1xg
 EBOtngIp+fDjsvYtcmzOuRB7Td8ktrB0iyfYJdgURpD/HPi+gNSHnN1ieYx3NBvzyX52
 n7y9UXdGt3V9sQ0/idZ4QXM3S4N7Bv+AgZ6uGZvSJumzD1v438+NxRQ2gWKBF1RTAz4C
 8z9AfaLWUztnbCbND+zQHHaPfocVqXCvVhH1GOPxnuCcGtszDdIP8lRSWGHHIuj9z+aK
 KbsGeiXVC+QOTKT60IdfCHbApVX4SdB75CnwDGeR/dQaHeggHJ6lK/G5v8xZ6V9fHOaO
 9mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OjQxr/jFzbomVhE1MW9X6lY8//4Qu15uyh6N5jl5uwI=;
 b=ipgF5bf+O5zln1gCAHQxluWScuCx+0hiM0r6snpNHkpJY5NwqvIY+zmjhFPSTxYIba
 GIuIUKVONBra8PNiFw34C8RXMdDgUOjnWXFyfB37mb2jn/lMLgCJtaeIMqYbMmUmurGw
 deE00fnh8dEdIremgTP4pP4Kr1Cs+qh0YA6qOy57h6QFF3yqpcJms355rIZJ/U/9RbbV
 gDhD0qLa/tJdGTzJUyM3BeYb4dqVoUuueYYjHdv3QRv/ZdrEGA4+L3xg0+6wCj+LvrUJ
 HkCEtUoDkRIttx+hckyC9aUud9x/oDpATcpBBDTYdg22VSeV61H1drjslxpPAw+Hlok7
 1CNA==
X-Gm-Message-State: AOAM533Qo/W9deYtCVgoFmBilea5VD038O1cLsiT3NKos9det6E1K0Gk
 I8uZAlKGOjw0JIQN/eSJLIMS0LkFlmI=
X-Google-Smtp-Source: ABdhPJxnYNeDJkqc6fq5vGm7SdWiXySvTbDgd1wOSmYrl7TH/hb8Vikfsy3IBJuygD+MoMjD8wUk5w==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr35645779wru.30.1618308713052; 
 Tue, 13 Apr 2021 03:11:53 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x14sm19275847wrw.13.2021.04.13.03.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 03:11:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] target/mips: Fix TCG temporary leak in
 gen_cache_operation()
Date: Tue, 13 Apr 2021 12:11:31 +0200
Message-Id: <20210413101131.3480173-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210413101131.3480173-1-f4bug@amsat.org>
References: <20210413101131.3480173-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a TCG temporary leak when translating CACHE opcode.

Fixes: 0d74a222c27 ("make ITC Configuration Tags accessible to the CPU")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210406202857.1440744-1-f4bug@amsat.org>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c518bf3963b..71fa5ec1973 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -12804,6 +12804,8 @@ static void gen_cache_operation(DisasContext *ctx, uint32_t op, int base,
     TCGv t1 = tcg_temp_new();
     gen_base_offset_addr(ctx, t1, base, offset);
     gen_helper_cache(cpu_env, t1, t0);
+    tcg_temp_free(t1);
+    tcg_temp_free_i32(t0);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.26.3


