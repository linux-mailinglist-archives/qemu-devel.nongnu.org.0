Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F961DD3FB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:11:21 +0200 (CEST)
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboj2-0000Kz-Q3
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIv-00045l-8M
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:21 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:43430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIu-0006dQ-C7
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:20 -0400
Received: by mail-qk1-x743.google.com with SMTP id i14so7815678qka.10
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oS4OFCHOXLNPVShms1TjWbnrC15wr+ouKwB5TcDXaeE=;
 b=PApIav66WsDc1bFqajYu0cRHwN7mfnbvpm1wtAm6l9c+Kn/zD+Xi7kBv3kOikQn8of
 ue3AN3ddkcbx9dyNM7kcu+nsKgbO8n8E/IJZdEoY3c508n9Cvl4brDZolFBg5u/Cg84Y
 Ty1sVQgraHCo313hncSfyLg6WTFIEJWBmoNn6RpBanz1HlHPPhm8JpFXj+ZIFh6iT8PG
 8a3r60+NYc/pafcnPd3DfgIjIpv7l4TMGYgAVMTyK3kWoEoMkspRgIMKco7hKFVT+RFn
 Tqwgo4sH/B3ji0TT+eLIrlZhZtSJ7FyYcBl9poOgA2x2H5b5bERkMDAZ5wU5GsT0sJhL
 MNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oS4OFCHOXLNPVShms1TjWbnrC15wr+ouKwB5TcDXaeE=;
 b=HgO3Co6IACo7UmWWAAMqqujfQPuyqCXla5Ttnre2/siSGYJUkoHZyMXVYOp5e6Orix
 +ET4rFPXj2LqM5fkpEKCzYZBKLz4XluR8QQGP+Xyz5fLNInYWEaSHrNVxKjHSmiBG2hw
 x/z1e2wSV2H1HkBesD9c44SR8EhoNdV+OVyeGR7pXTKptxox6Y+vDbQybgVOyH8uXfFW
 WC39tN40yzq/SWoI8HfgDRICzJ57LmJBlixGAkfeg4Sz/z0kUGmPtJTJ4p1n8spVtYY3
 Vdj/eovr6fU6gukNjRcsw4ETaFfi4B22IsICOXpRCVNMNO7WKwAFtqJBNihaHw8JfvTe
 jU9w==
X-Gm-Message-State: AOAM530sb60ZKP0g7oMnTQFalloeyGuuPWiyqdhCNhgZeRM28i1ofEDA
 7AQqW6s/j5feU4+vw5XX25B+iuHhbQluew==
X-Google-Smtp-Source: ABdhPJxVo3qqeqqFsltgKt+Cr6IXu1GmbYY9pxNhyBFpd20suueKSQEfcrWEgSFIH4RVdZe22f/GaQ==
X-Received: by 2002:a37:8d85:: with SMTP id p127mr9862865qkd.35.1590079459260; 
 Thu, 21 May 2020 09:44:19 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:18 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 48/74] hppa: convert to cpu_interrupt_request
Date: Thu, 21 May 2020 12:39:45 -0400
Message-Id: <20200521164011.638-49-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x743.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/hppa/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 71b6aca45d..287055f96e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -61,7 +61,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
 
 static bool hppa_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
 }
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
-- 
2.17.1


