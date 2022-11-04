Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB3619573
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquys-0001BN-Ni; Fri, 04 Nov 2022 07:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyq-00019j-QN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyn-000853-V6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5219255wme.5
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZILEcs7gVrun3BhktEfyfWSQRQlvBxIa2XjRbb6boco=;
 b=iD3fAoPTGLh3TphSZZzBhNHW3zz8BkXFBr6bVIHYeERsPs8gyJ59y4vZHcWsYlDGml
 LMidq15o7khNMGznCtKGQnW8jPSntoiJx02Wk/m82G9bF0doKmXIPvmhoKjfyNY34k/9
 FpQ9r8vAw7+kIfvqWL6QZUr0Xku90GDwtuONEjRAssYXiAPjd41eFZJ8EU8y3psDrDA8
 YYUT3FKE9XZ8ziqHZwFHwZRY5uee5Pe4EP8EgJfXJ5ide9+85KVn/oQ+ao/wdXsbl7B5
 AumouZBD467AlkQNv986/LOvbVcZorhy9NtS+9SkVsv64qPa7W3vy7Imyn57/rZEvRcL
 3z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZILEcs7gVrun3BhktEfyfWSQRQlvBxIa2XjRbb6boco=;
 b=U3QgwwoXTFSYIpfHxJbbjzyWdjKNTEJhUQqrmX6M+4yeZGUYlUQWgqyilDsZWWSCXy
 /MRLL2azXR/067Uczx+8Vq7kUS8dbGGubIwlBJ/4ESgNy/tqvMrfEy3I4qD8GVNayvb+
 SqyOgtvw6ww9rB9g3WDKrcQsYJm7o/IDZNMRgz7tdUEulWZ8oExA1KR95VipWbdJpDYo
 9pzFs/6b0CXORwtk/cHWKuRF1TRDedZvgTARArwPz3RGVxWpbJzmcgFe0NVeMvtUNVPX
 Qo9teKPJaMqsK0GfN6EJrEhXuW446q78T52qo3DuOMxu0knnVVqXCBcqVcfixIo6hsGg
 ENoQ==
X-Gm-Message-State: ACrzQf2t0CrwJYJZWSnmR/jDpRm71qHRms08/nsEuaartbIySVqobrfo
 gH7XDQXqQqqotwSBqMcmNEN2jK1859gUeQ==
X-Google-Smtp-Source: AMsMyM7vqoDJpZ/+Wre1f95hb81WMxMSy1g4lY2OaYJYGtfjsA0mGtnNNYpgHLexHnehXqliTVsw3w==
X-Received: by 2002:a05:600c:1ca1:b0:3cf:7aa1:c682 with SMTP id
 k33-20020a05600c1ca100b003cf7aa1c682mr15565474wms.135.1667561720352; 
 Fri, 04 Nov 2022 04:35:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] hw/arm/boot: Set SCR_EL3.HXEn when booting kernel
Date: Fri,  4 Nov 2022 11:35:10 +0000
Message-Id: <20221104113515.2278508-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

When we direct boot a kernel on a CPU which emulates EL3, we need to
set up the EL3 system registers as the Linux kernel documentation
specifies:
     https://www.kernel.org/doc/Documentation/arm64/booting.rst

For CPUs with FEAT_HCX support this includes:
    - SCR_EL3.HXEn (bit 38) must be initialised to 0b1.

but we forgot to do this when implementing FEAT_HCX, which would mean
that a guest trying to access the HCRX_EL2 register would crash.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221027140207.413084-3-peter.maydell@linaro.org
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 17d38260faf..15c2bf1867f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -771,6 +771,9 @@ static void do_cpu_reset(void *opaque)
                         env->cp15.scr_el3 |= SCR_ENTP2;
                         env->vfp.smcr_el[3] = 0xf;
                     }
+                    if (cpu_isar_feature(aa64_hcx, cpu)) {
+                        env->cp15.scr_el3 |= SCR_HXEN;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.25.1


