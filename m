Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E71612FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNX9-0001bf-JQ; Mon, 31 Oct 2022 01:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNX8-0001bJ-0d
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:26 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNX6-0003mU-6U
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:25 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so3909721oti.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9OVsqAmyqPbTHmE3w0Zkzp7OCwHypnqZuwBCZ2+0TpM=;
 b=UNYOaaYZ3FhPCyRhkIlnn8n8h4/bd8c82EJGRZh2dFysSIB8j6Qf0RJNT2rTrqZ+JF
 K64r4P7PMYvGVm5JzHK09Mbx2N75sCJbHa2I5qNm7HfVtaOR2yBwTyWvXAQg9Rij2+nh
 KfM2EPjrlxx5twUoSXcdYMPiXicQTsvNtldzYCH0kanx5zEn8+3PFTvnsDL9Ea7vFCHP
 /fcIhCRPf+98/sx96Jk9aJ0T33/MQvgiUS1sZLb+cNABd832RLiI5k9sV01sNLKGNE51
 S4mqaoCs2+lu3jjfRxwlnhO02BWozbOTIGQF8sznLG0e3LjJggMvI2m/4pxswlCtCqkZ
 4VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9OVsqAmyqPbTHmE3w0Zkzp7OCwHypnqZuwBCZ2+0TpM=;
 b=FxxRuDiZpopL04VyJ+lqeUS/lDFVATXXdUiNgjuBelGdPRAXRzHf4g7c0a1V4HJOOg
 Q/Fdlei+pxaadMF20pjsY7tUpm1wA453zoF+cFyZPvj+3g1vT0SqmYpsFQjafu9Vd3JI
 8pbIDAlAC63azHMyQ3TTN040S7TlgEO7nmYwBZ+6ZCO+zppzkVGffgl6ZsZv8jblIAb2
 3PXoOzX6lGleCAE2FF9SxSKAl1O3yQvM7rPDPbMaTqiLzp1QT2oz+7DQcRkA2n1k0O9p
 7YbJOgA7uPApL/CsLKigvraXLqfsOvh/CTtLRP0I2RmlmXHqiNlmTsogceAJuVIoM/g5
 MbiA==
X-Gm-Message-State: ACrzQf3xIJJBzCQK0OUEZQfnS+bIS0a05yTmiBf9LHay31Y8gQ3CFtpq
 VbuMtKAMLzSUcYzdbvJb1Om9GIxa8SIeqg==
X-Google-Smtp-Source: AMsMyM45LapvvE4Ut6NvzhxlNz/JV7ZgZwtgLDpGtdSbQMUw1tyXyeKNpXwj0q6Zm9pLz24/D/jm+A==
X-Received: by 2002:a9d:5f82:0:b0:638:eab8:14a4 with SMTP id
 g2-20020a9d5f82000000b00638eab814a4mr5724758oti.71.1667194821777; 
 Sun, 30 Oct 2022 22:40:21 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Icenowy Zheng <uwu@icenowy.me>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/11] tcg/tci: fix logic error when registering helpers via FFI
Date: Mon, 31 Oct 2022 16:39:41 +1100
Message-Id: <20221031053948.3408-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

From: Icenowy Zheng <uwu@icenowy.me>

When registering helpers via FFI for TCI, the inner loop that iterates
parameters of the helper reuses (and thus pollutes) the same variable
used by the outer loop that iterates all helpers, thus made some helpers
unregistered.

Fix this logic error by using a dedicated temporary variable for the
inner loop.

Fixes: 22f15579fa ("tcg: Build ffi data structures for helpers")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Message-Id: <20221028072145.1593205-1-uwu@icenowy.me>
[rth: Move declaration of j to the for loop itself]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c9e664ee31..b6c46b7e25 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -634,9 +634,9 @@ static void tcg_context_init(unsigned max_cpus)
 
         if (nargs != 0) {
             ca->cif.arg_types = ca->args;
-            for (i = 0; i < nargs; ++i) {
-                int typecode = extract32(typemask, (i + 1) * 3, 3);
-                ca->args[i] = typecode_to_ffi[typecode];
+            for (int j = 0; j < nargs; ++j) {
+                int typecode = extract32(typemask, (j + 1) * 3, 3);
+                ca->args[j] = typecode_to_ffi[typecode];
             }
         }
 
-- 
2.34.1


