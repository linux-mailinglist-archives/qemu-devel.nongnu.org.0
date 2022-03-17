Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945704DBDFF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:13:25 +0100 (CET)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiRw-0000hk-K7
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:13:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKX-0000JE-5I
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:45 -0400
Received: from [2607:f8b0:4864:20::1036] (port=53762
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKV-0002C1-L5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:44 -0400
Received: by mail-pj1-x1036.google.com with SMTP id bx5so3937073pjb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=jQKBj7M1B5PT4TVdwx8qOBj0rMYajDxageJyB2R9YfLuFnkRheYOnbvI9fDQlJcWaI
 G8TvYeQkMiBw7NUTm+wQZ7vacbDTYRHCgADZi5kToyLWzDMpOh8oI5vMZjXAjZpLcM3Q
 wR7G736RgNXcFbNStfEdsqZIhL472cnI4DM6tkk6Ta80XhRLiuYyQkoYcmCvlQ2yNxB3
 SIVz4RMwaJWE3lF5ja6DKZG7N8ziQ9/NIeOUcrtBZk1ILZzNIGUxi7GwvyY0SHhLrilw
 v1qKQ2iJ7MLcLvQfRbBZEOOzj8IIk/CqCU3Nm3pFAflj9C1MZjYg19myuUQJ6f6NQ2J+
 f5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NA9HskFqPeLh+02a0cXnYrdAXovGtw+F2Po8AxVhC7E=;
 b=4iJsbRTrB8yFQr82DvUDNYOMjisuAIk1VfWv7iY4VWbF7amXsRUXiaFJD+3aErRJd8
 elhfaqhrFfn24er+oFuRmdWtxRxsLZjFiYBhGQeDqWkpq35hyslHjtBAMi8cyi99Kt/S
 MLAt2xsjFNuCbYFYoay1cJT5W6AVjPC3Aw/z8uACK3aYWRt3RpT/K+JhbrZ8x6Zw7y8t
 Nhu315TpUSyecC7uu05n0QEbMlWiwHDiASLOj/2Ye69dNiLYsN97StWrb9LBYOcsCl+t
 ThN4knbH95ug3x5jhABMSHbH3+EnHEkZYs8BJJkDk9FSK5QNx/OGy5EJKKSXYfacLrRV
 5PqA==
X-Gm-Message-State: AOAM531Sm+uZSpSrCPy1OV+q3HFUvF8MlQS+LmMnbz2CDwS9KJbzhtnT
 uSzS99F78Q/WmLh2yoXRCX4ZcK8XK+MQvg==
X-Google-Smtp-Source: ABdhPJyw1JnXh/0kecOIe1l7Rlp+q+JmRuojyxNDR0eOhQ63gm4IuKYHckkV7d8IpR/gkpBvR4on0g==
X-Received: by 2002:a17:90a:1f88:b0:1c6:7cf9:8a23 with SMTP id
 x8-20020a17090a1f8800b001c67cf98a23mr2171350pja.21.1647493542179; 
 Wed, 16 Mar 2022 22:05:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 02/51] target/nios2: Check supervisor on eret
Date: Wed, 16 Mar 2022 22:04:49 -0700
Message-Id: <20220317050538.924111-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

eret instruction is only allowed in supervisor mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f89271dbed..341f3a8273 100644
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
2.25.1


