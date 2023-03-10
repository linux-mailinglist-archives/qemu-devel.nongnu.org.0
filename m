Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F219E6B512F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painV-0001G9-Cq; Fri, 10 Mar 2023 14:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painS-0001Ev-OT
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:58 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painQ-0004eS-Cn
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:58 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so8491767pjn.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhWkYcOhVpipdIZZNXYjZ5hy9+cyWvQ0gdF0syaRWxw=;
 b=lnyzWyf03lzy1Mk/YnEyHnZCY58862Xp61RSY7da1niP29A8jFz+0V8TYZbu6kU/T0
 5RbWFWCT1IlUIj8KnKNdJL3XyL75WzCbeyUu0eVrA/Lwz5vqFmWiQPkYLBSmmajVx4Qs
 NZdcFQLoW8axwhTfbEVTRgpqIKjiyw4a8/iBcTVmUI10S3zJkLR2fx0Q+sHAGgzPk5X1
 kNJruhOt3MYr3d/22CMgCYGJDZ/RKs3eImtgJhjz+1ueig+Uo1QUXWEHLVeLX71wcFOX
 ceXWLIB081FHzVKgtXm/0BQuPl1XfmbVlkQoL4Z8gruBjp6dW2JnLzdVVgZCx1EEpUGr
 xk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PhWkYcOhVpipdIZZNXYjZ5hy9+cyWvQ0gdF0syaRWxw=;
 b=xi/7Q33qvOqNcWL7sqOZBhFuHlsef3IQRxJKtgS7woh0htU8+VnFgcX4030meVn2+3
 v/wJWedEbgaBKW4EB5XL7oUMnxwJJWp6D2WbXc6gx8g4Cbe4uLQuo8n/LP5MBAZeAHwn
 g1H48OLzuLTRe/CK+xA7RFYRO91fxSig9OMjexkN/PiuW1SX35gppSc/P6v0SuU7PMOg
 y2o/HRHAU6FqBebN0emuddToSgDwt0jgnLmfwDPSM8Hc+MsRHbgfrE8GjJXVpqh/o9uS
 5Hth4oWQ4SCR9Lj9JSuc9T8CHuB4K5nuHrZARV4jtY1urVKClP5hY58+0SaRE2fxRpB8
 D5+g==
X-Gm-Message-State: AO0yUKWD/7UE/dlb4tEQhb7k8/Ad6Bofs7M8eL5RYjWHqblnSE2aAzV0
 ojH7JApG1KNd3t4keoUhoRgu4k6S2nAJvlAWhfE=
X-Google-Smtp-Source: AK7set++qPPdBhTFLAfBaSWoDhBM5h6cH8yoFoohuYKrBzUGOPC8GUixgmao/03Iuy2SdQjBFWpGUQ==
X-Received: by 2002:a17:902:ce92:b0:19c:f8c5:d504 with SMTP id
 f18-20020a170902ce9200b0019cf8c5d504mr7814287plg.59.1678477975225; 
 Fri, 10 Mar 2023 11:52:55 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 2/7] tcg: Drop plugin_gen_disable_mem_helpers from
 tcg_gen_exit_tb
Date: Fri, 10 Mar 2023 11:52:47 -0800
Message-Id: <20230310195252.210956-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Now that we call qemu_plugin_disable_mem_helpers in cpu_tb_exec,
we don't need to do this in generated code as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 77658a88f0..cc8fdb0e46 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2813,7 +2813,6 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
         tcg_debug_assert(idx == TB_EXIT_REQUESTED);
     }
 
-    plugin_gen_disable_mem_helpers();
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
 
-- 
2.34.1


