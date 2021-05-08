Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC0A376E48
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:57:42 +0200 (CEST)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCDt-0001lh-Bx
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4k-00048Y-Lz
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:14 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4h-0003Y6-CQ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:14 -0400
Received: by mail-pg1-x531.google.com with SMTP id s22so8628767pgk.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKeNDHnMG1Vsy9FW47wdnzGiSOuMJBBVUnKRaVqfH0g=;
 b=oO/gx93zWnMzhrE1cdfAndYhjl8nz8nrizqkANgfOfpf2lx6E5OtgHHRzXaKX/YSqH
 fep+9IzrgiW4e+b9N7oDzxy/+XcYtAaAuFsDceUFL9o4po00+fvc4u7VX8nOnO4BFdkr
 jU2BgeMVW6ere6EkP0KB90wvehZ6/mdchGidUcDoc3ng6Ac83vHoh5/X0HrSoCl6WN3W
 rchcF4BdGEF8dqqsoKI+E06Yd78S0aZ0ZYIxJ8flqjxClVkqSRmoPgYZuOQX44kYwU6B
 Rm8zEuAWeuxHHW810Xu1x1+dknF5DbcHVDYtaIPocebUoqBxKA6JWaGCU9g47hWZwFIG
 STtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKeNDHnMG1Vsy9FW47wdnzGiSOuMJBBVUnKRaVqfH0g=;
 b=Wq3U3wZSE4lxQhU5gtVadPnwzVH5K2t6fiBhjYcXpcih0/vlzZT59Q1sXXwETry23y
 Jz6qkSikrznGzkEwc3U/Lv/X9nxriTKzyZEO+d5eQ759uZFvPsFGf9J2Qs+aZvk7KYa6
 4KSnCSTunuNfms1dBq+mrOXRMto8+W6NDXLPWpukRN8ogPDS6G9w+nWlHx/XEnPwwgCE
 OOf9ZaZJw9ZjJ7HPHUTdBI04PYxjnzu9cqvFiXDUW8SgVQaS78IPQTzxXLfamONPaZaS
 rlS6nxnWe7iZJmOR/bipfwwsLZD9+1Kr4m/ons74Bf3WYisYU2YXCEgYuZBiktYM95hA
 heVg==
X-Gm-Message-State: AOAM533deju43w3wQ+6CUWG2y1xTFeNLAXcsSGRSFQ6WJragR8m+zs7I
 i5raAX1507U5rP9orMgYAivQqsImvjtFeQ==
X-Google-Smtp-Source: ABdhPJz+tyrXqik2vyt+V81dUscbY5eHS2R/uXVWcWSbgd4n+LWxUZamTvhs+ZFFkXWqqZ4EAohc6w==
X-Received: by 2002:a05:6a00:168d:b029:23f:376d:a2f8 with SMTP id
 k13-20020a056a00168db029023f376da2f8mr13455495pfc.20.1620438489723; 
 Fri, 07 May 2021 18:48:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/72] softfloat: Tidy a * b + inf return
Date: Fri,  7 May 2021 18:46:59 -0700
Message-Id: <20210508014802.892561-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to set values in 'a', when we already
have float_class_inf in 'c', and can flip that sign.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 93fe785809..ee4b5073b6 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1384,9 +1384,8 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
             float_raise(float_flag_invalid, s);
             return parts_default_nan(s);
         } else {
-            a.cls = float_class_inf;
-            a.sign = c.sign ^ sign_flip;
-            return a;
+            c.sign ^= sign_flip;
+            return c;
         }
     }
 
-- 
2.25.1


