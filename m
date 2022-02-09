Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C094B0005
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:20:04 +0100 (CET)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvJk-0006CG-0J
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:20:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwK-0005ju-8L
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:52 -0500
Received: from [2607:f8b0:4864:20::433] (port=46795
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwI-0008A4-M9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:51 -0500
Received: by mail-pf1-x433.google.com with SMTP id i21so5257389pfd.13
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEX583CN6Lejo1CTi/cSn0WJLHR6qP5OaDMjAKT4qKE=;
 b=D0jTc3j6QXz+t79Fx7xk418Typ6VUKPTbkNJej7L/UpQz5dc1NgiL/SUCFC7IkQu8m
 5rercoH8PPGpGvpUqGFq62tD1qr0b0IrPGYba9SazoXB1b2A2qOc75brAW4d/0kF1fhB
 MIaR0TPHi5DTIgQxbgIIWx6IkxiyMSNzzubJeWjfQjJR02iOR1JeJjlAU/+d4DM4wXky
 S0yBJ4HQ/GzI75I9ciVNtYlva/XGPNwf0mtZ7LHShjv2M/ufTUwe8U69KufEg9dH7M1C
 5YHwYK3EY6NgFMtyqb0gnjhxqJ5WHG+DSN7HRTLVjwCdb1jR/KfKHpnA0ywyzfv8auHd
 QSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HEX583CN6Lejo1CTi/cSn0WJLHR6qP5OaDMjAKT4qKE=;
 b=VcxzeHdwPRRk5yKQN+iEOx5e7Xdzf1koa/v34WU49OeFvZPdXXwKecDkwhlqo+g6FR
 qZFpJr4lPyxHT44F+7E/xwu6oW1oNNDvRQG5/1yrRRCFDFIleFpK5RlJbnlOLJ/no9bR
 PfxtIyCldAy1GFd+lgEo33uOcA7Yg7SsfzHG9n+wNXKEu0v9BSElymjYPi6ej0aWBom9
 jq4dy+vHFqNQ3I1fAm896yBM9oFdWXwas2nctVEu9eTP5ai03SBnDJmkf+gwQVusqFwh
 gYkO/J0/UX1upigP/W3MbsdNb0aTRk8aSAWJYO6YQx64OD9U5OmjCUrN3mjTlmd0zAif
 6pbw==
X-Gm-Message-State: AOAM5321w/jDvD6A2wnYWqaapK1695UNCJ5GK2QCkin9JzmY4NTl8P4t
 NQX50qXbkTuDwYfjAsPmtmrU3iIVTok=
X-Google-Smtp-Source: ABdhPJwzShSz71ShZ5QNqpFyJNUG20tLAEqptFv8xlP09/FScIGUlNhGe3BFmTIXVQbO7/BJWJoMQw==
X-Received: by 2002:a05:6a00:198f:: with SMTP id
 d15mr4390926pfl.78.1644443749336; 
 Wed, 09 Feb 2022 13:55:49 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id u9sm12890935pfi.19.2022.02.09.13.55.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:49 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 07/15] target/i386/tcg/sysemu: Include missing
 'exec/exec-all.h' header
Date: Wed,  9 Feb 2022 22:54:38 +0100
Message-Id: <20220209215446.58402-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

excp_helper.c requires "exec/exec-all.h" for tlb_set_page_with_attrs()
and misc_helper.c for tlb_flush().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 5ba739fbed..5627772e7c 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 int get_pg_mode(CPUX86State *env)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 9ccaa054c4..3715c1e262 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
-- 
2.34.1


