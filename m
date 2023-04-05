Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7E6D7973
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk0Dc-00065H-4T; Wed, 05 Apr 2023 06:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0Da-000656-CA
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk0DY-00018i-Er
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:18:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso740240wmo.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R3c7APLhxJFNCqIErCGS2nhF3aw+HLHuokeVO/lFk00=;
 b=OBiO/iyMPp7HhyBZcX7fJgp2AA6LNBmXbyqspQfxTpbw5ifIhJkHachSnVGxiHum7T
 pDyTjdZU/TDYDH8YqIYCNPP2VKdx3wdUBLlBxM9gzo34nXlEfQws3UH3CuMpU0XuvBtJ
 BR0Y9rfffghCpUn3Lq722SfA08hTOExgU+rQvnILo+j+5Ft88ticBqenXwg5p/GlGvca
 41krEivQExeKbzC6OcydV1hPviKH9pwe4ul7G2ol7M0QTifUHh3PLePZ/6n5cypktE9F
 2KVXZ7OB0raOVG9XCJUMp3dAf1zpvJiqWUaGdW48AgcrjBnZSMXe3CucyEtdxru47k5Y
 KTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689894;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3c7APLhxJFNCqIErCGS2nhF3aw+HLHuokeVO/lFk00=;
 b=enRhiLQCu1ESJzoLSvE+69N2FtEkUoAXF4dCk4lVcYCi84vwh5ZkEK6gHnWID+g/ly
 hF58UQye9BLeBGcOcncZ57LCmGZ0WPGp/cLI6NNfNt4n44rNOo81g6sxJYqk9jjby+5B
 SbnSGuHLvcMjdkmpQ8D2RZolWWw0F1wkj5Aov002kA4I+Nfp6C0D5MJ2KsXqk2K7Er6+
 5guvPpYbpDI4EGoNm4J58MlRJN+5nKblmZPiXXhSerWcK+H3aJLk9dK9x12lKASxS+Oo
 r66VQefGNnG0I1drDoEuKBRwMMdWFqLJOsFkOzy9YLm59lIKpYAvpQ/2NwgTYDMYC19M
 4BBg==
X-Gm-Message-State: AAQBX9cZC9xWbUlLRqRVGcb1feegQ7FyKfmToP3VrHbRvn6lr02wXsah
 qFB9apuXs61Y/py0I3AiFvDjZU1Mnuc+j+jdMs4=
X-Google-Smtp-Source: AKy350Ybve9k60nXpw2N7+saf2pFb1rgNJYM8Jf0Z78V3ulPWVpu1aVqOeAnHikWi6TcyhWdL0mjyg==
X-Received: by 2002:a7b:c4d3:0:b0:3ed:551b:b78f with SMTP id
 g19-20020a7bc4d3000000b003ed551bb78fmr4181570wmk.4.1680689894558; 
 Wed, 05 Apr 2023 03:18:14 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003ef66c89af0sm5203608wmo.0.2023.04.05.03.18.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/14] accel: Share CPUState accel context (HAX/NVMM/WHPX/HVF)
Date: Wed,  5 Apr 2023 12:17:57 +0200
Message-Id: <20230405101811.76663-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

This series is part of the single binary effort.

All accelerator will share their per-vCPU context in
an opaque 'accel' pointer within the CPUState.

First handle HAX/NVMM/WHPX/HVF. KVM and TCG will follow
as two different (bigger) follow-up series.

Philippe Mathieu-Daudé (14):
  accel: Document generic accelerator headers
  accel: Remove unused hThread variable on TCG/WHPX
  accel: Fix a leak on Windows HAX
  accel: Destroy HAX vCPU threads once done
  accel: Rename 'hax_vcpu' as 'accel' in CPUState
  accel: Use a typedef for struct hax_vcpu_state
  accel: Rename struct hax_vcpu_state -> struct AccelvCPUState
  accel: Move HAX hThread to accelerator context
  accel: Allocate NVMM vCPU using g_try_FOO()
  accel: Rename NVMM struct qemu_vcpu -> struct AccelvCPUState
  accel: Inline NVMM get_qemu_vcpu()
  accel: Rename WHPX struct whpx_vcpu -> struct AccelvCPUState
  accel: Inline WHPX get_whpx_vcpu()
  accel: Rename HVF struct hvf_vcpu_state -> struct AccelvCPUState

 include/hw/core/cpu.h             | 11 ++---
 include/sysemu/hax.h              |  2 +
 include/sysemu/hvf_int.h          |  2 +-
 include/sysemu/kvm.h              |  2 +
 include/sysemu/nvmm.h             |  2 +
 include/sysemu/tcg.h              |  2 +
 include/sysemu/whpx.h             |  2 +
 include/sysemu/xen.h              |  2 +
 target/i386/hax/hax-i386.h        | 14 ++++---
 accel/hvf/hvf-accel-ops.c         | 16 +++----
 accel/tcg/tcg-accel-ops-mttcg.c   |  4 --
 accel/tcg/tcg-accel-ops-rr.c      |  3 --
 target/arm/hvf/hvf.c              | 70 +++++++++++++++----------------
 target/i386/hax/hax-accel-ops.c   |  5 ++-
 target/i386/hax/hax-all.c         | 26 +++++++-----
 target/i386/hax/hax-posix.c       |  4 +-
 target/i386/hax/hax-windows.c     |  6 +--
 target/i386/nvmm/nvmm-all.c       | 38 +++++++----------
 target/i386/whpx/whpx-accel-ops.c |  3 --
 target/i386/whpx/whpx-all.c       | 39 +++++++----------
 20 files changed, 123 insertions(+), 130 deletions(-)

-- 
2.38.1


