Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12A7677CA4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx01-0006DT-BS; Mon, 23 Jan 2023 08:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzj-00060h-Nk
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzg-0002U1-MG
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id k16so9027400wms.2
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UKUCDtm5zNRWKAtz89l2k8txnv+LgwgNpjX50RbpUOg=;
 b=U5boNfvsqtBzHRVwYqUWgnrGX/YKuxqwfdJCEKt3D4v1E/5Tf8WMZCyYGhjXH0rDft
 Rh1eKJjGR+TN+PdmLsZWseWrrP9vbtrCOM0RJGVybzRn61Z9T2M8du2/mWNhzqiyOE8n
 fmIv8NgYpo2+VxtZpBhGpp0tx4F9fWKJhUqernTCjoG63ilML+PR/RmEyP27PDPgDrVx
 /inlDPoq1OpvL4v0KpFpm+5gRvjkIZIwPrqhoqVa4fk8WMpO5KZ+QXr5ird8ttOd9c+z
 E4K0eKADooTHcdkhlwiYh20TuV4v1wY6hRXmhua3bGmluvmgPX127hJld1fwFvLSofQJ
 hGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKUCDtm5zNRWKAtz89l2k8txnv+LgwgNpjX50RbpUOg=;
 b=K1QCHoeckaJbyCe4rapb6C+BM4PLjy7OAZ2TERM1OIDiAyOz5tD+iMpnD4S1+Gv0PV
 WiFxw2SCnmhGI/GyTbuhMUTOlMZLB7f8zGNOjgEIIsOX3BnNfASL/BHt0yqgalzAd8J8
 U8RASFSHNfm3pKIKDyJBREuoju8AjdqUZjFUYOOGQpkCaRcNfcHJ6zNm0cSmnhQJLu+T
 WQiyPoo1GBgdruW7WyfmsyVxNo+IzcLkQFOwhTBLS7miusuSgqmw6wbgKgfT5eJnx8bx
 PLUAiOfgHwAvfx6HTMfElHqVNaUpZpUqkveNXYgrpem2t2J43+0fiDqeP6cV/ddDM9qp
 82DQ==
X-Gm-Message-State: AFqh2kpr8ZssB3cyTO3Yzlib0gXsw8+40ezzA0cvaJWsxA84JU+6L3BL
 KOpz0mycPPqOwPIrf7M2fY7GZIrYXaa+9ObT
X-Google-Smtp-Source: AMrXdXsr9QMRelyFN34fFsQQzmDfIn5dlz5pmyl8AB3xDKyIVhOQUQomCrpXjxL6z3xCsbLodC2qXw==
X-Received: by 2002:a05:600c:3b13:b0:3db:26b8:5023 with SMTP id
 m19-20020a05600c3b1300b003db26b85023mr15627804wms.10.1674480975407; 
 Mon, 23 Jan 2023 05:36:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] target/arm: Don't set EXC_RETURN.ES if Security
 Extension not present
Date: Mon, 23 Jan 2023 13:35:49 +0000
Message-Id: <20230123133553.2171158-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

In v7m_exception_taken(), for v8M we set the EXC_RETURN.ES bit if
either the exception targets Secure or if the CPU doesn't implement
the Security Extension.  This is incorrect: the v8M Arm ARM specifies
that the ES bit should be RES0 if the Security Extension is not
implemented, and the pseudocode agrees.

Remove the incorrect condition, so that we leave the ES bit 0
if the Security Extension isn't implemented.

This doesn't have any guest-visible effects for our current set of
emulated CPUs, because all our v8M CPUs implement the Security
Extension; but it's worth fixing in case we add a v8M CPU without
the extension in future.

Reported-by: Igor Kotrasinski <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index d87b9ecd123..e7e746ea182 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -879,7 +879,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         }
 
         lr &= ~R_V7M_EXCRET_ES_MASK;
-        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        if (targets_secure) {
             lr |= R_V7M_EXCRET_ES_MASK;
         }
         lr &= ~R_V7M_EXCRET_SPSEL_MASK;
-- 
2.34.1


