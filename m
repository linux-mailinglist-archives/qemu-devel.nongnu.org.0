Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6C700BFB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUn0-0003KQ-9S; Fri, 12 May 2023 11:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IM-UL
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-00061B-Q7
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso33382965e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LpqeiGLd9+Zpci9T4aU8zCO1St33HFkig64yWhzOPRs=;
 b=WwTkAsKZxuQIxOfwcQAEJZcXjLxTSG4nMBqYdLVhvac4/IaMDbrRO6cdldHNXtyk2+
 CwYqnRrRJOExgT6Us48FNUIrM4MhOllWLQFLh1VTMryS0/mVOxfnAORimM/u3KOTs2nC
 ihdfnCKAzvATRqm0p6CmsZvd6llO12g5l4jPPHLtULk6qyk55CdoLzSfc8n2TlbvHLNA
 9ZYnk8i97qtJ0whkSCUqw4kH2PE+GGuhEgj6cbHruLWroKOcG+7tpGLlWnPnXpPFgJhv
 dvPgh8WpX+dhwxeH/+S3bLl26iZq6Hr3PrgS4zUgJ4pwYydmQrvOKvt5ZjeNqaulWIdP
 5rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LpqeiGLd9+Zpci9T4aU8zCO1St33HFkig64yWhzOPRs=;
 b=RqbgkioHOGbH2/iarxVlln2cF/IKNQr8FxzuVy6OB5Roc6DXYHgdwER2UpH8xJ+7aX
 4MqC+RwETFNIT2BoerAQhL9XiDiezedigVRBpKtgE65lHeL+MlXHSZSJGP0jcEPMuthf
 fWkfha3vAOBMSY8wG0+Fx27ZdcRngFtR8yEVk1nmTAu7Q1xUO9qXqAe7WcxUR0oASbDJ
 YWV43W9JM6Wr2z/QaDv6xSqNgJ1x7/gK69haZRaUrl6EAFMoTjI/b2+F6lilOXIkUjFL
 V5CcL2XaMz1CSOuZu5PrnKeJqZg13pInLJvLV5YCSdxuJaF2Iu5CziywM2LeYWSgGi6N
 BNyA==
X-Gm-Message-State: AC+VfDx4a/AkpyBno1+JQjiJOOxd/Lu2APWUxZzrDnoa8LEEmVIhSLSf
 a7eB5fs829VVNT1yHKFvTK3HJdcY2/zL0UGxSk4=
X-Google-Smtp-Source: ACHHUZ7aSglKKDYjAf7K9eybnS9xN7V56mdZoeBgQW7YnEQ5Q98OKQUpygWfGRXah9eY/aOXRTQCKw==
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr16154929wmj.19.1683905670141; 
 Fri, 12 May 2023 08:34:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/12] target/arm: Select SEMIHOSTING when using TCG
Date: Fri, 12 May 2023 16:34:20 +0100
Message-Id: <20230512153423.3704893-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

Semihosting has been made a 'default y' entry in Kconfig, which does
not work because when building --without-default-devices, the
semihosting code would not be available.

Make semihosting unconditional when TCG is present.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230508181611.2621-2-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/Kconfig | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 39f05b6420a..3fffdcb61b6 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,13 +1,7 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
 config AARCH64
     bool
     select ARM
-
-# This config exists just so we can make SEMIHOSTING default when TCG
-# is selected without also changing it for other architectures.
-config ARM_SEMIHOSTING
-    bool
-    default y if TCG && ARM
-    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.34.1


