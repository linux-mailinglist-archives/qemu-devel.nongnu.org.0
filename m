Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDD3F88A9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:21:16 +0200 (CEST)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFJj-0001lb-Mq
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG6-0005ZL-Qx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG5-0004tH-5J
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id q14so5041734wrp.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82sgR5/m4fumkYT0/xj95NETaJMqRNknmR9Pa+WdhVA=;
 b=imN0DOeZR6bkgsi5Hx442o6xk8fu82/0dsEFgoKMospYshyFxVCdh3wfMwNtF/Qvx4
 MnGUsyH7ZVCCOZp5o++HX9DanW58q0GCpY4Sy3hpxRwgsleG3xjUXkPDEhla0ZssLDRa
 Y+l/eyH1F83DZwQRJDLRdAL+lCJ+tygncq9hNn2/5zjtXcCn65+QDtAxGjo6LTY9KcDK
 nbYOSW9idk0T+UAwYIzEFoczICYiIftPZ6Cg7Zp9k0FEoRKjqXT/5SvYxmj7rRR8hJ3n
 tcirycD5s4qlWbGfhmXQqyH44ZTBMyxmbW74WZBpNa6luVAbL4sgRzoLNQ5m0m20U3oL
 m7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=82sgR5/m4fumkYT0/xj95NETaJMqRNknmR9Pa+WdhVA=;
 b=UWq8WItdhCWgblms9x8SRfwuLw2MHYsE0pDBijUnG+7J2FOsj8fiNvuX1uBs9swejs
 kQlPceAfzxBWTgHOPIqmihbAGyNYAv3n+yC5TneJQxEkNZR9L9brybFZ8H1qIJLdH/PU
 qirHJCTnE8p8jwItgT592QfbDFPkGTDXsFq/gcXzearoKEld5jSC4MI2pPMy56gF/lCa
 Kuj3R2NQsgQB5swm+v8uWEz3PYhN/ksyjQ0YP2Z2hX1zoDWicIO5rcTuAnlGoFiy1Led
 WNothrk1qu9NJOsKWkpeAwnoa61JY2bO33JXrL87PUC0Zxj6zRu0qcl617NGghc0761N
 HL0g==
X-Gm-Message-State: AOAM532hapGfsT8ZH0ClAlgq6kxClgSRRSiCHQnLOTFjewKgwLpCI5Of
 zRwUsGKId8Q1OmST46fl5wtyZz+cmKcGqg==
X-Google-Smtp-Source: ABdhPJwN4JWsjMvihsgqZj2+A1sCB2NX6PFqiNaICEfmSKtOdkgVbU3Q+jhEbSCqqT/VcMCffuSbdw==
X-Received: by 2002:adf:c3c3:: with SMTP id d3mr3915842wrg.373.1629983847583; 
 Thu, 26 Aug 2021 06:17:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/18] target/arm: MVE slice 4
Date: Thu, 26 Aug 2021 14:17:07 +0100
Message-Id: <20210826131725.22449-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries is the fourth slice of the MVE implementation,
including the "turn it on" patch. These patches have all been
on-list before and have been reviewed; changes since v1 are
mostly just the ones requested by Richard.

v1->v2:
 * use float* types in macro arguments, not uint*_t
   (in most patches)
 * make do_vcvt_sh/do_vcvt_hs functions, not macros
 * new DO_2OP_FP_ALL, DO_2OP_FP_SCALAR_ALL macros that invoke
   DO_2OP_FP/DO_2OP_FP_SCALAR once each for float16, float32
 * pass a CHS bool to DO_VFMA rather than a function name

thanks
-- PMM

Peter Maydell (18):
  target/arm: Implement MVE VADD (floating-point)
  target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM, VMINNM
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VFMA and VFMS
  target/arm: Implement MVE VCMUL and VCMLA
  target/arm: Implement MVE VMAXNMA and VMINNMA
  target/arm: Implement MVE scalar fp insns
  target/arm: Implement MVE fp-with-scalar VFMA, VFMAS
  softfloat: Remove assertion preventing silencing of NaN in default-NaN
    mode
  target/arm: Implement MVE FP max/min across vector
  target/arm: Implement MVE fp vector comparisons
  target/arm: Implement MVE fp scalar comparisons
  target/arm: Implement MVE VCVT between floating and fixed point
  target/arm: Implement MVE VCVT between fp and integer
  target/arm: Implement MVE VCVT with specified rounding mode
  target/arm: Implement MVE VCVT between single and half precision
  target/arm: Implement MVE VRINT insns
  target/arm: Enable MVE in Cortex-M55

 target/arm/helper-mve.h        | 142 +++++++
 target/arm/translate.h         |   6 +
 target/arm/mve.decode          | 277 ++++++++++++--
 target/arm/cpu_tcg.c           |   7 +-
 target/arm/mve_helper.c        | 650 +++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c     | 277 +++++++++++++-
 target/arm/translate-neon.c    |   6 -
 fpu/softfloat-specialize.c.inc |   1 -
 8 files changed, 1318 insertions(+), 48 deletions(-)

-- 
2.20.1


