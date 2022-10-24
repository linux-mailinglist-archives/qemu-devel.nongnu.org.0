Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EC609A75
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:21:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsl-0007Hf-NX; Mon, 24 Oct 2022 01:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprq-0006ao-3p
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompro-0002Lx-J8
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 s22-20020a17090a075600b002130d2ad62aso1427550pje.2
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=Gc+bfP7hYkUTJ+yugL1DD4jgWGnArJcfNgDWIyBKeRJYwe7nJHPumH5qiawiX7vXQo
 IG+lACOkU8vEFz5ec/mVIRTTeWE6cugAMrokbkm3QZr0nxr/VfavawXmSZZtSmd6BOJV
 gXD8prEZxBob2u/Ad7P9XDSs8cohdlnq3KrgLS8oZdEw2LfU+odkLCeNX4rmqcT+hSA6
 eK1GJb2DftzMUaK1N0QyYynkqDwSL04CWXmH/M3VoxZqOO+YRO6EgxtK8hZZAhwYklf5
 2UnD4uFVI9XGxJim/WWvth8fM7QiX1mnb1dW9p8fXYL0SzUiFtB3HmWWZWg4akI/ydUQ
 cawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=Nk9C8XUbi1nzQCmm8YtP1TE6cX4bnCXpNqdMvgbitKmbijaJBT1nKRSHHLuXEA86LC
 K8n7F3xCLxw/nML2Bmm86xO+wMYH+ueSkphCNn+KF6wTRO1RXhjxwJ/k6xFYu3eiTd3f
 Oom+h0n1BfK8rI7cpQkZPe5wU5d0AeFouyNkBqxJfxcKLoVQbEOPZum6qw2fOom4nhgb
 fu1PzQw+f+ZqNLd74UyK8lPRNtIlz6jVeuoITkYbsdC8J+pTZ1D31Zb0oJYF5RHZQwga
 X2kaVaV5+Zgto+pj4VKd/E1Jlowf/0Nk2Yv6mJAzW0HiD6BTZnURXe/FyPtJuvF6ZlJQ
 GTpw==
X-Gm-Message-State: ACrzQf2FNFH9sqyNqDk4JZ/QBt3x3a+FU1Z2QyOOpXd3UdJwzuSLA9sO
 2jITVuTSK0BfETBV9w0YNiTwU+BkJiCKCjjs
X-Google-Smtp-Source: AMsMyM5XftKtrUz9t3jc2z0Nv5oGhP3rIvEU5lA9H+//lE72IrvcwTpWMflwLxkUM9iRhv4d8PphEg==
X-Received: by 2002:a17:90a:29e4:b0:20a:f9d5:c10e with SMTP id
 h91-20020a17090a29e400b0020af9d5c10emr73461562pjd.132.1666588754644; 
 Sun, 23 Oct 2022 22:19:14 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 24 Oct 2022 15:18:43 +1000
Message-Id: <20221024051851.3074715-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 16d7989604..a5ef5f6054 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1


