Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957156AED1A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbG-00071h-QB; Tue, 07 Mar 2023 12:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbar-0006bq-WC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:25 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaq-0000KX-JL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:21 -0500
Received: by mail-pj1-x1036.google.com with SMTP id l1so14045179pjt.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTeZWwwAtTnIPC9TrujJ5aeZXfHXDktCeiu27jWI22s=;
 b=coIgg4ZdLvbqHfS1TMtekohP+qRxwLqIranMKG/MawKryxDwrimfSRl6ESqPF2O2JU
 tA8/mKygOenfO/4QTW8yDtll6Xk9vlH4LfuT0JmPSrlZoVsDkeHJSrUI6bH/I9HFr0zg
 YRhPxzBsowMnqb6rRegpLaEBUg4NcLKySva3XRgFqavMCr3SGHVQz0LO/na3mYhTkS11
 Ok/mOPRyWBKYXE+Z9ABeG9iz4uxOSyE1JJNVzJWmlWtnv+/Td7ya0zs96rWQMt4aiZp3
 okQG5oo2GCCvNaLtw9rRJ8qxCC1DEpwlqh0v6GRrMP8H1axiaGZtJFBeLdN8e6hxUa+J
 IWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTeZWwwAtTnIPC9TrujJ5aeZXfHXDktCeiu27jWI22s=;
 b=w5NOgk7rpAAtWdb5oPmgzshcHkr0M/Rk8yoyE9EzYloQmmhvUx655WTrU9ah1b2pob
 8wrAfnFBgAkmtyWVWwHBThLlqB2eNAY/JgHREzjgfpQZkAYm5ZGBhJuqerv2gBryh9fT
 Fn0eDadQqNiMh3LgZ+asgbo7RlvAa2nDDSe3unJsTsVvG8qN26ShNYgqPeTzNxvzrRn4
 2yGN4ixSSf+hr4i+QaC+4bBKnmN2n5/Tk+0vhlHg3yPJ5F01bloOgpOR5x+cFD7S6wkp
 Qq36CcvUqsLgvFsqyJ6NbWCALvD0OZvqwAHHeoLv9+sVBojvrPgWfC/YHgo4apg8Lnsh
 QEBQ==
X-Gm-Message-State: AO0yUKVMn1EBdfMGjLMbR01v6ZQdqVJ0EATj4Adj3JQt7gkYfe5TI3Hu
 R3TAaRNN/nd/se6JahHjzbX5KksKNSvmsHGZv5o=
X-Google-Smtp-Source: AK7set/AiY2as0UIwSEku83t/INqBD7+aXNyhVA67n6RkwCsX2AneWtvS5eatP+XUThpQuYnlekITQ==
X-Received: by 2002:a17:902:f54c:b0:19c:a9b8:4349 with SMTP id
 h12-20020a170902f54c00b0019ca9b84349mr19189868plf.32.1678211959284; 
 Tue, 07 Mar 2023 09:59:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 37/67] target/xtensa: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:18 -0800
Message-Id: <20230307175848.2508955-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-23-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
index b53e9a3e08..b1da0555de 100644
--- a/target/xtensa/cpu-param.h
+++ b/target/xtensa/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


