Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4154C9827
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:07:12 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAeF-0001Yp-P9
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXY-0001Hd-Tn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: from [2607:f8b0:4864:20::42b] (port=36650
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXW-0004xH-BK
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:16 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z16so77613pfh.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
 b=ufj/OzUbqqQUDuTaXi3d9MgYlKLV9cHEpkT37DK9zFn+XCtbqYVLdyNow4JjEbF3Qq
 QvI5lk8sM5Gkg1wnVXxNS2KAa+rFlcrCR0x1Qr/AgFjfmwJ5k3qQ8xBtSF8TDNlDdtN8
 yxXl+BTunQiP+U0vrBVX3CUyhPGITo8PaWJxSiPQp3Lt5E19VyyZs/pBLAQgRKLYmv46
 nFjtKrh1ynLQAgmNyk3xNpKTZ4Rk9WM+644t00CrAiswWsU7YKLTiaE5LvFAe4lVK4Lr
 FKRZJEFhNhZNTSBrDg83ZycGZ00yB/5FSoStrNLXbRdsH2XBlKhSx6roiHSO3GPRW/fM
 RQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIGj1SBy99bk76FDyotKqntArH5MW9KjKA2GprTkmIQ=;
 b=ylJ1Xpp0GJT/3Q8L3QX5G0fSKNSjJTmQ28gC+bleXdWgyvNy9gp/QfUtgVO4bBDucD
 tEnDEMX8ddue4Iu0ClNV+oe914PQA4sASydOdBGGDqjcTYWyYk3cEtFaUGbOsM9JZzHX
 McXR2E2CbeJAUBafZciUfTHdIHqoD5BxecNECQoFnnxyOiE50pA4LTe97gg+ldo9CLXX
 htwYRYd1XLRKdZ688iIXzoZcE6ZAOp0KKkVUWhI4DkcO3XozChiAIDWJbRCLsv6RDSfl
 YHAK+S5OdvwP/feqr4VPr9FDipMgp3+ZRQ11LoQ/jbdeb8du02Wlt/MEBqUa7+ASUHbK
 6+gA==
X-Gm-Message-State: AOAM533P6sq0o23BpYB4W4z4FdH1mKbXwFu7rIiivFa4NiFosw5PvQlK
 0PsO8e6n4q6rgxTJxsiuoL2gQjTjU2JRsw==
X-Google-Smtp-Source: ABdhPJx+/TTro2gia4SBDzgt3CLjBM2Oz0FOLhj0Dj5OMoAs5Cmz0cFRO9RGOW1v5n8ZxuLeLtuoGA==
X-Received: by 2002:a63:2c14:0:b0:373:7200:d07d with SMTP id
 s20-20020a632c14000000b003737200d07dmr23393129pgs.617.1646172012700; 
 Tue, 01 Mar 2022 14:00:12 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/18] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Tue,  1 Mar 2022 11:59:46 -1000
Message-Id: <20220301215958.157011-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro is a bit more readable than the inlined computation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 431b0c1405..675aec4bf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11518,8 +11518,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-- 
2.25.1


