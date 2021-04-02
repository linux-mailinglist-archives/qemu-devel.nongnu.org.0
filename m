Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C1352DA4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:21:10 +0200 (CEST)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMXl-0002LJ-51
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVP-0000tq-5S
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVM-00035A-Ex
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so4828596pjb.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhHqeyidCB+9/uyN78QecO6UZ1exOGFoiaz07QlfopQ=;
 b=QkZCKP+k2IrB/f8r4ebE4hAAOiTl0bbs1komSIkEebZKiL13cgMo46b5tls1Tnw5Ht
 a9lViBULc9+pHNRjxzqlNFxyLrwydS+iMfEbjRsaaFolz3vzRk8ux22xH65FzAUeCU/R
 fhPZGZBKRK93GOfRWyUqE/UhvOS3DAyCinFDz8Wqe+/l1WAMrbNvCxVDQDhoCVUSnPmT
 RhUjp2GoAgVsbxK99YkO1dPolapct8j2quRm9Q78HbHsnG4wCOtI64jvPmKv4FsPfL/Y
 C6me8slgLSU9XRhkO7cJh1Vri3vv5p7PiMhTlp5fR9pyXOjpL6gfuHi0CNv5L1Vp0+hM
 3Reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhHqeyidCB+9/uyN78QecO6UZ1exOGFoiaz07QlfopQ=;
 b=UTc6soj9b3qHJlEcp/T3EYafP1QpeuOLXw7EipMd7cv3kZUvwYn3uS/oh2fBbLDBTZ
 nJpojKgJhdgfbxRnPsGx+iCMv6eLPT9tTVAVI4jqdRHpAx/txAx1IuYCw/vRpsG11GtU
 eRF6UR4HzYiUbrt3sqXyCKDE/mDvOrfijBqqh7yEm2Q34okwV2UH+il0aiGpMLOkI2V7
 StfAGe3hQw6z5yT5n97DxTBm4KdWxyZbA+Uh2r48gjWXhoFbjIFvAXHHl6Aojfg890Kt
 tZXnBlr+msWC1Pyhhf/g5fVeI9YkeJpmlzEycD2qf/LvcG5+7Y4MFH2eGpaQfTErBhKI
 oP0w==
X-Gm-Message-State: AOAM531crU5PS8UYrZjrEKwdlkz8kSD8cyZZ0xfd81Okd2bcKrQH/ILZ
 pvyb+ei+ujD72BzdsrouQqak7NfR2+16Rw==
X-Google-Smtp-Source: ABdhPJwX/Wbd3SeaZgZ1po3ltOiJ43c0nMy778bO8M00/paklJ5WvkRim0QwwISZcG8DY/kWLmRJhQ==
X-Received: by 2002:a17:90a:5587:: with SMTP id
 c7mr14008245pji.5.1617380317698; 
 Fri, 02 Apr 2021 09:18:37 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id m7sm8821761pjc.54.2021.04.02.09.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 09:18:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm mte fixes
Date: Fri,  2 Apr 2021 09:18:32 -0700
Message-Id: <20210402161835.286665-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In addition to re-instating the "is tag checking enabled" test
in gen_mte_checkN, add a fix for a second bug in mprotect.

I have verified that the 5.10 kernel, running in system mode,
allows setting PROT_MTE with mprotect.


r~


Supercedes: 20210402053728.265173-1-richard.henderson@linaro.org
("target/arm: Fix unaligned mte checks")


Richard Henderson (3):
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks
  accel/tcg: Preserve PAGE_ANON when changing page permissions

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  13 +--
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 171 ++++++++++++------------------
 target/arm/sve_helper.c           |  96 ++++++-----------
 target/arm/translate-a64.c        |  31 +++---
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/mte-6.c         |  43 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 12 files changed, 222 insertions(+), 204 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1


