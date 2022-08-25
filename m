Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009E75A1558
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:14:23 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREYo-0005tV-3A
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERr-0003ua-2c
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERp-0002Ly-GO
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id bq11so18427069wrb.12
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=2OVPYJQv5NBuPCjLGLGoSfyQ6B6HYDsVYY1WswEVFEg=;
 b=HlW3WjZfUrij5ZrefSQmkNWjpuUn/wy8J/6Od+GtGWrh9SkHt8f8snsFVBYr61MQ9K
 ddgT/4rZeoDQjeTSCA/iWWMxiJdi9rafGIqYlKtGPR7qfx3RLwmVc6STjXj+01UC0NsX
 ymk5IqqE8lw16lKQMQ7x/EJvjSGUCuB1TvEyvpHqEsjzazFyASpJr9k4Lgm+XBVspBuk
 Y/Sj5U6maWJ3cakbahYnqMLMHzpGI1u9GmplQG3FXlSducTWD1bbGddnpnJKtBSU4Sgt
 BqKMjsA9JCo8KVl7MIp9sAJgMGJ+G01vqS0hcfeAtAcEej4hbtLpz7UWNfGJ6L9Mrt8D
 4hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=2OVPYJQv5NBuPCjLGLGoSfyQ6B6HYDsVYY1WswEVFEg=;
 b=OFLAaTHFg4VvRF1ErbX3X1obpFJx3fIlo6ubQFhvMQRJx5g+ra1+saFZST5qWCPYnX
 LNx4uTFPKhL5qKnpgnqtsG+Gz1/BOBMjhxhZGHZ7pLHh1NJEWWxSOXedrYJx5aU6AeK2
 blSgbNmblHc/zgk4vQVoQEcTLFCdngsvSHcchpd/CM6v+nyOCNf/DyqkySIfAxdg/LUd
 2UbuI85Wq993C0s8z5sVSJHCvn7YYefVCsfzq9rj29Eq44OWk3ExPesX0+FzLdCjB6v+
 gAPRtS/qDKKVtIGFUXreWFiRR7IXLZbNb065Q8KdY4b4ARk4pXlgQjWIyapVrJqoJ0Oc
 HsOQ==
X-Gm-Message-State: ACgBeo38aXMjs+yaNrMkfurwKawe4gLoIIe08GX+u2jycFUTyx1+x/5S
 aEPq8mwWu0FMHNnaGdc6I4+iqPE6mHI0/g==
X-Google-Smtp-Source: AA6agR4kOX7LFGrNkfb1o9mGi7NK9eXNUofmdBLOR1/YK/bWdGPnahHqYM4UXykS9rWNh6jmlqfgBA==
X-Received: by 2002:a5d:6e8e:0:b0:21d:ea5:710f with SMTP id
 k14-20020a5d6e8e000000b0021d0ea5710fmr2622835wrz.48.1661440027724; 
 Thu, 25 Aug 2022 08:07:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] configure: Remove unused meson_args variable
Date: Thu, 25 Aug 2022 16:06:58 +0100
Message-Id: <20220825150703.4074125-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The meson_args variable was added in commit 3b4da13293482134b, but
was not used in that commit and isn't used today.  Delete the
unnecessary assignment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index efe28050234..b1acaca6dd2 100755
--- a/configure
+++ b/configure
@@ -311,7 +311,6 @@ pie=""
 coroutine=""
 plugins="$default_feature"
 meson=""
-meson_args=""
 ninja=""
 bindir="bin"
 skip_meson=no
-- 
2.25.1


