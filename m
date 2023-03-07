Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD546AED4E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbb6-0006jR-RP; Tue, 07 Mar 2023 12:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0006Ua-LA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZban-0000DP-OF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: by mail-pl1-x630.google.com with SMTP id x11so10474240pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xffz8xRWVNZWrvs24qOa1ycbxFWSeBUwSXkTAy3AiJs=;
 b=T6OkHDEjHWko2YN5rF/0VWnElAfx9O28xV7NoarJABguI36WHHMhKqv2RibiaVRyHI
 2eW/BNr3GHJ8LCDlFejTLfuVpTIKQb+LDK4LY6JsR8M9U7GUk8a2zU8aXgl9n1xho45B
 kR36zMABgsqZ9jD9GnNHgm7Czx/CjRJ1i+n9xxXl5Rxb3G7MKPdmiCF0ZC2XE82+vlvT
 BOdiXItgMMCFRzk/KpWLlXYIkjF4ZuzkraQvFwyG90eQLAS/LivbtW6qEriIN3ey/XCE
 wCi2dbZZRzmK0oumwSHus9E/uDDgkfj0yR16TbYoBEdAt8TUvyCYqmuJ2ow5gwkqzyWt
 +UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xffz8xRWVNZWrvs24qOa1ycbxFWSeBUwSXkTAy3AiJs=;
 b=7DTBC5kEHUanDsgUBFYGcnS+kHsdvp1w6yobmM+mKXrMvcDYG3VXPCgQneYzwPYpF8
 49rLwKsC+sgmYuapSmBebZbMDZSv1QHUF7JY4T1AvlnaxsCaf69hDoD441bJB0aXaopz
 2wleay3gKvTudt2A1aIBrNQ2qMXoBV8UG7BT8Odv8R2J3dkXYOTtFN5hcZ4FeJ6fHry1
 pyXvCFsCbeep3VgLmvn4qWuZGFzfhetYF+kSeEb78EDcXL4qzxHJFApKWZuR/cD908WH
 0kmafg35Fy6cvBFgLM9Y4aQmfw7At+5qN4mGhjKXNfQdmPq4mFGL8d2wt+s+yqzaunn1
 JiOQ==
X-Gm-Message-State: AO0yUKVFRQvJC6gkqod+Gz8WFNOWwAsQxvzucsDrrIodnq2fgD5pyFWo
 Idz4M2Pqzh4eZ1nPbPDMwPcgeDXGkA1PkyBOqyI=
X-Google-Smtp-Source: AK7set+ywuvL8PYGt6WfoqWn5epeeY8e4U6oHgZKvRtLdFWp6ATNyMkKa75ipxq0ezteb4M09ge2Eg==
X-Received: by 2002:a17:903:2290:b0:19e:25b4:7740 with SMTP id
 b16-20020a170903229000b0019e25b47740mr19033725plh.28.1678211956832; 
 Tue, 07 Mar 2023 09:59:16 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 34/67] target/sh4: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:15 -0800
Message-Id: <20230307175848.2508955-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Message-Id: <20230306175230.7110-20-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/sh4/cpu-param.h b/target/sh4/cpu-param.h
index 98a02509bb..a7cdb7edb6 100644
--- a/target/sh4/cpu-param.h
+++ b/target/sh4/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 # define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


