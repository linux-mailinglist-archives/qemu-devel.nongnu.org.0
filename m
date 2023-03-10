Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE83D6B5136
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painW-0001GI-0E; Fri, 10 Mar 2023 14:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painT-0001F2-04
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:59 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painR-0004ec-I6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:52:58 -0500
Received: by mail-pl1-x632.google.com with SMTP id p6so6843319plf.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJhvkoLDc/4Ng5JbPEdzxnJevo2RvOeeg5n87qn4/tg=;
 b=KwYjaAFt0znM53McSuz0AxQHgNt5kJR27R1NhUPcRkYZ7PtRjVqRMEgUaYtb5VCtUo
 Vcn16SGaqaXcmsp3NwFwt6mnXv4tn/g5XHjssfxt6bNNkJarHzZFxsT/Xr8jXyRm/i8O
 v5U25w85BIQtOAPSBB7Bw3nmPd1bWpFW/NY8M+RPUnxMwG4fxsS1QbIryXJN+URY4n1Z
 54J98Wp3kbyn3LEpwoyViqk0TaUe9sYeJJk9c7ehSrvav4Fc10PgMXy1FeUKFXEVvAq6
 8FyPqCsSdlVrMSKFTQvoPKtOvaqlKkeCUaR9PX7et4If8DHyNHaDoeNEOoBDsbbQycsw
 O8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XJhvkoLDc/4Ng5JbPEdzxnJevo2RvOeeg5n87qn4/tg=;
 b=jNKV9f7XD2cry5kcx4eb+T5y/KYULZfm5LG5R9Xq3I/D1D/3HTqXPJqHwQPm3bZ5DJ
 ljgO6gynsU5QQI3bETmlBIM+zvJFX3H+q4MUoUQBk1utoKqkjxor3dNgjYCLj9BbEGrV
 MgGA0YMjpLHT4Cx6pZbocthTU/FIborBU3rmteGLFRV9Y8tNQig1v+iOyuAIuXUyrTPp
 foKzHMxL3f9emgm6Ny/xtufYxnxLcZP14f0jDzDETb+ACjcJIfvHb9nBHjMWZ+gpYTy2
 SuamkQ8mQsBJKVCclV6aDIuWGfC2iZQ/WnG7AuhqBxNz3wUhjDavLgwPFc1PGVTmIeMO
 H79g==
X-Gm-Message-State: AO0yUKVEoRNi4g6ECI/y2Y8Hrvr5M3SLabqlspmy9gqlK0dAdHeqthXn
 OP/TYUSbQKyOYXH9pzDHpq1RC4jhxIBvgVnfDBA=
X-Google-Smtp-Source: AK7set95Uk7GG7GcZpxfZWXujNECQDcg9HWArWGxujFqNAWMZML2pR1gP7Z3rpHfSWHxzBmFZSEyvA==
X-Received: by 2002:a17:902:f64f:b0:19e:bc8e:6421 with SMTP id
 m15-20020a170902f64f00b0019ebc8e6421mr20097482plg.47.1678477976064; 
 Fri, 10 Mar 2023 11:52:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 3/7] include/qemu/plugin: Remove QEMU_PLUGIN_ASSERT
Date: Fri, 10 Mar 2023 11:52:48 -0800
Message-Id: <20230310195252.210956-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

This macro is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/plugin.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index fb338ba576..e0ebedef84 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -59,8 +59,6 @@ get_plugin_meminfo_rw(qemu_plugin_meminfo_t i)
 #ifdef CONFIG_PLUGIN
 extern QemuOptsList qemu_plugin_opts;
 
-#define QEMU_PLUGIN_ASSERT(cond) g_assert(cond)
-
 static inline void qemu_plugin_add_opts(void)
 {
     qemu_add_opts(&qemu_plugin_opts);
@@ -252,8 +250,6 @@ void qemu_plugin_user_postfork(bool is_child);
 
 #else /* !CONFIG_PLUGIN */
 
-#define QEMU_PLUGIN_ASSERT(cond)
-
 static inline void qemu_plugin_add_opts(void)
 { }
 
-- 
2.34.1


