Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8BB5F112E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:54:01 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeKD1-0006cA-Rg
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8J-0002BY-Of
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:49:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8F-0006nt-Ue
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 13:49:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id r6so7946258wru.8
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=JteizUGVldF/G//thhaFP2LIcXVYHyYcFpQ3HMFZOSY=;
 b=fQEFHskvXR11wtJg1+e5Fj4oSzdcMRnLyn+HS9G6QstFOFCstQXcPcxo3SwoO6d0nG
 qB/6sHV8hrW12o8PkXKoBKmQEgcGEC3d+of1kQaXR92GH4yMM1EjRtzGUzaP2x3SlE8y
 8oxgSOjhyQLfPsehHcDIzZD9kBEwyu1lX7Q6prwurps8DnrGfHTwHABiC9chWHuZaE+A
 wc/4vOuplrBbor6ubePxYx11VG/X2o2yLROlETsf8aMhcMrVqv7oOOaEksqEzk4UG88T
 5cmKx2srHCHhLPaIXd7Wi0U+tyLG4B51BhIsMCmh+C7HjLKMOXj6Zb15UxEdIOig8nZ7
 yJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JteizUGVldF/G//thhaFP2LIcXVYHyYcFpQ3HMFZOSY=;
 b=yeOgrVLv5/ldogJoxKUXKXGNQgd9Sf1tD5pe1BDZ1qi/45kW1OpEKv42COQ6c1cDlx
 A1oh+e5Cnb5CTwieN1ByglJzID77vg9C82ZEW+i5G8b4D3ouUzFzfZthP41EE5RuBCHU
 5P4StN3rSYe3tND0hZzQyyVjNVR8vfw1+azg1RNIbyAlokJc5TT9wEOR9mLoGHau202a
 u4Y7AnHBYXvv8IHYgDeOgqztYSYnBJ5JXKclvouLNaIXkgBTIRHwEKA5Yk+fGJpcM7aU
 mYzpk/i67iTtAXBRV4Xh+HcCBa3GNF79htDVzbqhb75NYjzzvIeqcyfgKp3s7EWKtCeq
 /ukQ==
X-Gm-Message-State: ACrzQf0S5Mv3urZr5exucNJ/C2Kl5WCtdjkHeQjdwCx/3j71zZkW2AFN
 wFk+qxP49g8ohN/nc48AFcA72hciDPxuJg==
X-Google-Smtp-Source: AMsMyM4kIpl3pIf2F6dlfay9QCeLEBCav9+NPMlq+/LlcfWmtCE/mlHkLn8Tme/N0irmItKhNO71Sw==
X-Received: by 2002:adf:ecc1:0:b0:22c:f296:1114 with SMTP id
 s1-20020adfecc1000000b0022cf2961114mr2938358wro.462.1664560141553; 
 Fri, 30 Sep 2022 10:49:01 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm7703541wmh.23.2022.09.30.10.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 10:49:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs/system/arm/emulation.rst: Report FEAT_GTG support
Date: Fri, 30 Sep 2022 18:48:53 +0100
Message-Id: <20220930174853.2233633-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930174853.2233633-1-peter.maydell@linaro.org>
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
can report a different set of supported granule (page) sizes for
stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
we already report the granule sizes that way for '-cpu max', and now
we also correctly make attempts to use unimplemented granule sizes
fail, so we can report the support of the feature in the
documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe595..cfb4b0768b0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GTG (Guest translation granule size)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
-- 
2.25.1


