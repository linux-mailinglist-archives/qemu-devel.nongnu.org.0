Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2062045C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC0l-00047J-3l; Mon, 07 Nov 2022 18:58:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0j-000476-Dd
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:37 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC0h-0000TM-R9
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:37 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i5-20020a1c3b05000000b003cfa97c05cdso23329wma.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqdXWOgF+QqRi3UtOQa5YNqdO+ylycMo+xdPULOGfzw=;
 b=aoeAt2eMTMja+2VjIMLDVi7a5CKWaAATS7ECeWBJ850iYPMFXzP+eVK0oGQisRblmz
 0B392hght6sXes1Zz5NshVBlDUTSQ5QHHiAQVyOR/JrfaYJyguilQ6fyvWIc1gLCZ9wA
 x/WBisxPCIi0nWtlRsdt4RDpH7S/Zho9wDjWdwuegr7YrxNC0CFlaTFZCRFkMbvBMjgt
 PDt2jr2fL9gvHCbeN+Viwvqo0d2bszQkoCjUlAEjRaFyXwsL+XqQ/TdhpEn53kIn8n7q
 lskDxguLs/veqhIv+W9y2YbeRT6jl9H8H9JUn8518oaYC5A8oQy5IhTJ0t00NMehPpxy
 f17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqdXWOgF+QqRi3UtOQa5YNqdO+ylycMo+xdPULOGfzw=;
 b=gEVh6SVLQkOKwg90uMVIP0DoDY46n0+AgEYqDVJeBdSlp+3LXq64MAloVsOmRD6g3N
 RCh24IDE4sBSCElDCUhz6ExPdUS+Cwf5YwsdKSW8EgPZ1k8TXK1fDp/yuXwvGxmjMqQp
 jpP4A2mW0L6qhLIMgR1EDzPGLSqqHywSrlhGfOAeDXDURmqIylOAJHZXHZ2WNnfmQmWl
 ogK7ZRjbHqgjvI/C3YeCWBCNva8/V2ndyfH9ULEylQEQl81TIGGTv9aSuttIFlIwpS1y
 kfB9nC1o9d7qbhpHpzpqfo7sOcgWeXDn6MbcedIz9AmLCoA/q2q9/pfcWFAC4Y3Pwd71
 iRbA==
X-Gm-Message-State: ACrzQf1wQ49LvAJSufbIh8iN9j9+rqBnsTFQTRrkojHDfPuDgNdS53yf
 2NDB26E+a+0yyjwuYM3SZf+YH2AyrjZNpw==
X-Google-Smtp-Source: AMsMyM7/T7kRcPkLlbwXKD4jbzB51WaZq95ub4t/C3hyGVQ0bxJCcZk8iFp98lZpvqzC2FdXe9r2fg==
X-Received: by 2002:a05:600c:1994:b0:3cf:7c1e:8227 with SMTP id
 t20-20020a05600c199400b003cf7c1e8227mr25441066wmq.103.1667865513965; 
 Mon, 07 Nov 2022 15:58:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bca55000000b003c6c182bef9sm15153410wml.36.2022.11.07.15.58.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: [PULL 02/14] target/mips: Cast offset field of Octeon BBIT to int16_t
Date: Tue,  8 Nov 2022 00:58:10 +0100
Message-Id: <20221107235822.71458-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
Manual" offset field is signed 16 bit value. However arg_BBIT.offset
is unsigned. We need to cast it as signed to do address calculation.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221031132531.18122-3-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/octeon.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index 8929ad088e..0c787cb498 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -12,7 +12,7 @@
 # BBIT132    111110 ..... ..... ................
 
 %bbit_p      28:1 16:5
-BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p
 
 # Arithmetic
 # BADDU rd, rs, rt
-- 
2.38.1


