Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CBE641A4D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 02:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1eAJ-0001Yy-93; Sat, 03 Dec 2022 20:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAH-0001YM-DK
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:33 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAD-0006oD-GY
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:33 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1443a16b71cso6174450fac.13
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 17:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/X/PweNAPHbRLy4stxb7I3pE8OoDuvoF0xSWsTWyH88=;
 b=cYvy35sdg1y5lUucQKmCtKj8F9E6GvNHp+KbKTNdZYaQ4g/D1yGlXY+4FK9PnaNrwl
 uR+sfTFBV+sQ7DgKvRC2vR5R7Tf1Ldyu6pMOCXQB5/1cMLFI4hdugYVSk0Tegc1Lgn9w
 IayxEpvIzMUxrSH18zs5PW5bLL1aW6EemQ+VxtlbjH2dvcwIPtC3d9U+MAWXo0J47PKL
 ej7eLxbfmOQ7M//6BxB7kFH4GwErQlJ/r6mK0wPoUpVkPlqArXO7R39rK+6NZ7TSlIlt
 +/VlPhOrPRNDKssrATlC4DPzPOTkCoHBFCnU+OoH9gSMVe3Xk7GyhztbPdhXYWWFpHHZ
 +yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/X/PweNAPHbRLy4stxb7I3pE8OoDuvoF0xSWsTWyH88=;
 b=RD5udCJPmQRzTNpitm0YF6srBvCelTLOR9LvkRMfyJW5i7qPR6axAHLJPOKayvu9b4
 DrOR7b3nQ0KImdaUSUNfAKYQJIc+BD6y6Bmgw9tqOycWgctxs1290JaP2unOTnYZf/y9
 nJ4jw/q8No2F2gxL0e/cT5j0pE6aa0/T14IYKWhvZyL0EKXRfErzkxd2rEsLOSfRNGY8
 lZRm4qfrOoxlHtZBxlGwhirJUigGRO52unxMWaQsEW6IWGqcnVU1cE1JsZyHAmsaKD6x
 /+DTBlvZI+1Nvp5jp9jkE/ydKLH75OAXKucztnkrEChsCwBquDwT8qEtopZqzv3cEVpZ
 aHsA==
X-Gm-Message-State: ANoB5pl3/KY8UgXBPDgmwe+3B+QdKSajnIBVdg2wvCpkpDEF/NWCaq+r
 1T4vINW6BNXBDQ+0U/WKopVgW3NcASbYiERmIZI=
X-Google-Smtp-Source: AA0mqf7NjE3hPJ1MWnb2vLbn+uRl7f6HCFHomk7kD7IFeRzEy9YZEyG8Z1vsgLjiJhfEeaswERCjCw==
X-Received: by 2002:a05:6870:a553:b0:141:7736:a839 with SMTP id
 p19-20020a056870a55300b001417736a839mr32303482oal.71.1670118688227; 
 Sat, 03 Dec 2022 17:51:28 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:6b63:a06c:99b3:833])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aca2310000000b003436fa2c23bsm4964215oie.7.2022.12.03.17.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 17:51:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	tstellar@redhat.com,
	berrange@redhat.com
Subject: [PATCH 2/2] meson: Set avx512f option to auto
Date: Sat,  3 Dec 2022 19:51:23 -0600
Message-Id: <20221204015123.362726-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204015123.362726-1-richard.henderson@linaro.org>
References: <20221204015123.362726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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

I'm not sure why this option wasn't set the same as avx2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson_options.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index 4b749ca549..f98ee101e2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -102,7 +102,7 @@ option('membarrier', type: 'feature', value: 'disabled',
 
 option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
-option('avx512f', type: 'feature', value: 'disabled',
+option('avx512f', type: 'feature', value: 'auto',
        description: 'AVX512F optimizations')
 option('keyring', type: 'feature', value: 'auto',
        description: 'Linux keyring support')
-- 
2.34.1


