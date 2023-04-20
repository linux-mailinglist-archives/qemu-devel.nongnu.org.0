Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE0E6E97F4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVpV-0004QZ-5w; Thu, 20 Apr 2023 11:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpF-0003OH-Bj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:03:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpD-0004z7-RY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:03:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3725034wmo.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682003034; x=1684595034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zt3y0jKqA4EVjyUWYoncGVQ6DBoqmyXwhCD2BBZXWCo=;
 b=SQP1tHOQZdaU753Y4VoOUVtC8JPGaMLk2nzdm1uD0r2EQJwZobQUtpxyP2IBTu5n0x
 7NutV2xUhclFdg2+c8Y7AdAAX0htHzZBrW6p856P9q66YS7GWrHPh+5ZEYbeQbDbDL7P
 VTKscqLMQDy0tXSAzAodND2yqn5qM1u6ZQFQge9eiLrihioyyjb1Nuptp707LoSpwz4m
 omsojAk7wLIZJJ3CDe3XPqk3FMgRjTnWeCyZDN5r4MV4PqfcmeN203G6WCq/F7ysfQ4s
 ORwPQOjGc0FFv0+qgL5x/liGy8rUNYxztfbTqDAlU8+UsYK2LUfSY2iNkeWyMO89VoCa
 lPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003034; x=1684595034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zt3y0jKqA4EVjyUWYoncGVQ6DBoqmyXwhCD2BBZXWCo=;
 b=Zi4fAmHIBmK4GkWAk+uRm0sDqMjUtmr44cX7iPdRK1oCH9kTokNlKNBulhPo9w14Cn
 1nl/pf4scPK+2S9VQGmeyacvYbcezjYvAnxH7Vna99pqF6SXT9+mFvDGiTYhZv3Pt7YS
 NJn7AG0Eg4iFzm5l4Y6lKN4zCBRYv+aV34pqDwfDiS8Y18cfxTyc/YyEml47kiQC4XCP
 ZIQOpCmKKGyuFZmJJvWiWMGNtyrF3gj8BCdcZGqsu4U+lBCr9k97JXqzpkZt4IadEsjg
 KgdbCKreYO+NYOtVUy963vCAhHEqUpUmdZLX4xB9AxuLA1javNiFV6FOmrXKKRvNm94F
 6/RQ==
X-Gm-Message-State: AAQBX9e84xItXRxrDzdkNw8kZ2uGKFuhBJ8NSAhHZ67mZpWF5BUYFmzl
 FaJKwqvUEtEw2MKHVCgGOWF6A93ruO3xJQCO4VI=
X-Google-Smtp-Source: AKy350YQnLaaJz8sgVr8LlwjLy71oOicQrkJ1gJdCM77oGlmHLOryhjFEho1MSti3CzJJ5s1vhj1Jw==
X-Received: by 2002:a1c:750c:0:b0:3ed:9ce3:4a39 with SMTP id
 o12-20020a1c750c000000b003ed9ce34a39mr1626085wmc.26.1682003034151; 
 Thu, 20 Apr 2023 08:03:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm5542458wmp.21.2023.04.20.08.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:03:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/2] docs/interop: Convert QMP related txt docs to rst
Date: Thu, 20 Apr 2023 16:03:50 +0100
Message-Id: <20230420150352.1039408-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

This patchset deals with a couple of the old .txt files
that are still hanging around in docs/interop: qmp-spec.txt
and qmp-intro.txt. Patch 1 converts qmp-spec to rST and
integrates it into the manual. Patch 2 takes the only
interesting parts of qmp-intro.txt (the example command
lines) and puts those into qemu-options.hx so we can
delete the old .txt file.

thanks
-- PMM

Peter Maydell (2):
  docs/interop: Convert qmp-spec.txt to rST
  docs/interop: Delete qmp-intro.txt

 docs/interop/index.rst                      |   1 +
 docs/interop/qmp-intro.txt                  |  88 ------
 docs/interop/{qmp-spec.txt => qmp-spec.rst} | 325 +++++++++++---------
 qemu-options.hx                             |  26 +-
 4 files changed, 201 insertions(+), 239 deletions(-)
 delete mode 100644 docs/interop/qmp-intro.txt
 rename docs/interop/{qmp-spec.txt => qmp-spec.rst} (57%)

-- 
2.34.1


