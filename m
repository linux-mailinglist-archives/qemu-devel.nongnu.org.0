Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696273ED874
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:02:35 +0200 (CEST)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdCE-0007eK-Fk
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8b-0003Di-Qz
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8Z-00061q-9o
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:58:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso40297wms.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VBtGWb/UVz2tfNXP6f5EjNvqMgeAreTUW2EA1pbtu8=;
 b=w+GIVovzhwkfCyRaEIpManudXScFiAWToD7aPR/MjKr3SZwsZVOW+2wPKi72QRSZ3O
 YXOmo0enPqmMKovAJGtm3Uwrkv8EUj7qtkJA9kRaOgLibpRawAXjVdEFiHD+0fT6m08o
 BaFKMQGserBdDIHv2ijiFTzwI6O+MvilrU6hm64mict1omUOWllSTDfneNG83ZyWWd/q
 MuCH8b+an4bDcI7b8/jyzLwpGEKf4jU4FWxeO/U/CORI13fI6vEcW4ntNJULhFkWLBPV
 HWVfaeQlYOi2s6vYKmCN4DN5bhpNegtmSzwCIjccSBMU2YilsQX1EPdYYBqWVW7c8mWd
 6hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VBtGWb/UVz2tfNXP6f5EjNvqMgeAreTUW2EA1pbtu8=;
 b=cBOYaN3fm4BOPwqaJSl7LSB2qmeWtV8Lct9IYsJvh2OiKp0ATI8axRSpnMXv2qSnEg
 BxN55sm3dVOwNzRpQwecVeiwAK7GI253VROdURW/B7J5884T3IeS7pS5uBTVOEnBmuOp
 daRTK6z10iQZUmBtWnrxMZJOV6oDWcCRGfvXRvVB0NOGDXhHfZN0PK9suWQUr05/0gwN
 /SUYYYp37AfYqHjtZNplvLjfh3cK84lG1Dyd6lpI+Wd3F0XzXnai8g3EiDiQ3MfTEIx7
 mekixjS/I8DNmv+k1gX1h2gkDg8llbueIGs9DegXBekFpELfIBcrJfKeyYD/LqGGZBf5
 5msg==
X-Gm-Message-State: AOAM533wCYwlhVun/m4SVS2rNlOmCnjRDLVK/vlxtHIGmGXnZNKnB/y6
 ITVsiX5/jA4pBFU0s5SEqI6XcQ==
X-Google-Smtp-Source: ABdhPJxDh4HUNg9327fTgBwmHcgAOu/dljUQ8nIJ5RZa2megw/SEMYfhjYmLRDCB10OXGIi8trLC4g==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr15870357wmc.129.1629122324601; 
 Mon, 16 Aug 2021 06:58:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] arm: Avoid asserting in cpu_address_space_init()
Date: Mon, 16 Aug 2021 14:58:39 +0100
Message-Id: <20210816135842.25302-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM can't support more than one address space per CPU; if you try to
create more than one then cpu_address_space_init() will assert.

The Arm CPU realize function wasn't checking for the combination of
KVM and various features that might need multiple address spaces, so
it would just blunder on and hit the assertion failure for command
lines like:
 qemu-system-aarch64  -enable-kvm -display none -cpu max -machine raspi3b
 qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524

This is https://gitlab.com/qemu-project/qemu/-/issues/528

This series adds the missing checks.  It also fixes the raspi board
code to not assert when CPU creation fails, and removes a
now-duplicate check from the virt board code.

thanks
-- PMM

Peter Maydell (3):
  raspi: Use error_fatal for SoC realize errors, not error_abort
  target/arm: Avoid assertion trying to use KVM and multiple ASes
  hw/arm/virt: Delete EL3 error checksnow provided in CPU realize

 hw/arm/raspi.c   |  2 +-
 hw/arm/virt.c    |  5 -----
 target/arm/cpu.c | 23 +++++++++++++++++++++++
 3 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.20.1


