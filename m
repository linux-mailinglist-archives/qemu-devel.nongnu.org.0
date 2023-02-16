Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B40698AF9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeM-0007YI-Qy; Wed, 15 Feb 2023 22:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeJ-0007X0-Sp
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:31 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeE-0000Br-MP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:31 -0500
Received: by mail-pf1-x436.google.com with SMTP id bd35so594336pfb.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oTGtji2gFH3RPMGsbULntVwagtctLLdB2UDLnFD4qU=;
 b=fu/XE7ozh1m1IF2AGnAXm0CwKpYNz7sPFNk1V0BruBVbN3LJzSdHq76glFoyMrsOKH
 TwkFwrFMNLmmnJM9hO+dpUF7++HucE3R6umH9cod8Gbqhb4IQAqtWggFo4sBptIXCKrm
 EE8X93ldJkOhMeU12AWfqZkj5T+RpioZChdPIfUuCDUITd7hXogsRTQfmcixyEXILANm
 lmR/zOEa00K8k/B6h3INQ3KaVyrTGDxrA67P9+vGDvYJnXrAUu9VjM03lxEIh3jDY4xd
 Fz7//jBnuQk6EzT5HftQtRtRq6tSxAm7F/PPcTgMLaMiSyMw95RKbChLIImNmmCNGhcH
 M8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oTGtji2gFH3RPMGsbULntVwagtctLLdB2UDLnFD4qU=;
 b=6eEaBGkseg8cGrFM9vjNPqA3tE+vUF6ajMuqPgJFEgFjTmle/EQ92N7dGrZDJyHw+y
 rzFuDFi6h/ey2Fw2Ypfaot2sQpSP7wlo67ZJgnaAlink7f82U2rqKiy6x5dnJ0br0k85
 eyZH50awVpYC79IGFUrui1Nn5NN9dHZIIM/y2RumLJVhDzCEbzvN/IBroVO7Sx9kelLh
 lqEZ6MkrtcUeYG1Mzw54AWK+HzfQyNiT2l/Dwf1VvCXwMypb8lSuVK5bun8dr+rJFPEA
 0XLSrvzxDj/2YyARXNCx1bXUDvUHKvJOs5euSBh3Ca7XoLxbTHDDwXtXp+jogyO0evdl
 JGSA==
X-Gm-Message-State: AO0yUKVrB39QGpw+svNkArWQHtd2v7s8qWdlSF7v1Fio2tnIGWS7sgVk
 3lOwUnev2pKo6Tdy0TAg55+EG2hEjW/PZp5KKMc=
X-Google-Smtp-Source: AK7set9T/VusCJvHu7lg8CNH4Gogv9SrjsNgvXN9hO8W6CDTVlGEF/4q6lpXGjqNWjbvtS62aR0DJw==
X-Received: by 2002:aa7:9402:0:b0:5a8:bf60:fa57 with SMTP id
 x2-20020aa79402000000b005a8bf60fa57mr3196974pfo.4.1676516965844; 
 Wed, 15 Feb 2023 19:09:25 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 19/19] target/arm: Enable FEAT_LSE2 for -cpu max
Date: Wed, 15 Feb 2023 17:08:54 -1000
Message-Id: <20230216030854.1212208-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2062d71261..a97e05e746 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -50,6 +50,7 @@ the following architecture extensions:
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
+- FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..ab91b579bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1245,6 +1245,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, AT, 1);       /* FEAT_LSE2 */
     t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1);      /* FEAT_IDST */
     t = FIELD_DP64(t, ID_AA64MMFR2, FWB, 1);      /* FEAT_S2FWB */
     t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
-- 
2.34.1


