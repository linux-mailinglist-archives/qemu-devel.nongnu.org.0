Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE251DE9F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:06:10 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2LA-0000PE-Ti
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hx-000539-An
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:49 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hv-0003nu-HU
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:02:48 -0400
Received: by mail-oi1-x230.google.com with SMTP id e189so8276376oia.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWD4Tg6DN3u0dhSlsiJ3CQzt9+zcyyxzJeNgLCVwvU0=;
 b=UChIhTWDU3WaEehzMJEb3pSIvtCP9WzFl0Tifwpa4ZE01IsN7ZpgZuIov0OfgcdfX0
 x3uOKXW1FLepxMDJjYWRLF+0SXyjx7D1bNd9fqCUXkxyXbvBE3CeNO/Tkjr7p0WYnBPB
 VtZfHZuKYWD0fPAMYr7HyqmEsFW+evsytPTAC10c0NM7qep/ZRlQ45IKT5/Evv3eJKQ5
 50jT0tXQcrY7sqgLUBpP1eDZW0JDMj1yfE85M5ULphxGUwHeT20QmRpX3zaPOqEwb/H6
 OxaeUez7sMohLllzQUXf2fU2xdstPaxtPqYw6/mgQuH5M58NAfUmH98lxDra0otvyFRQ
 V+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWD4Tg6DN3u0dhSlsiJ3CQzt9+zcyyxzJeNgLCVwvU0=;
 b=GD+xOZib/YSJgmLarjl/nPXIY7aOuCnFq0W911VdgGso4YkgorV45q3iCFB8qkvNjo
 ZW64l/hqlZRhNcK/cre0c21DCFlDAoysAAQo7p6wvktfLrsA9/WnDQCc0MTj+RSO347m
 9B1QUNafxeNZI3QqOsNVG0FdyI2W9grr9yhH8SoPqfaHDJ1mVg7HUZlZScYN7A64deV1
 Pp+qzj3uxLrsPCIazfVtHSWp3UHq/vazVFw8YaV4FvqG6DxQJKBf4FBvO8NJTq+eScx5
 h147bTYHQXfyYwp3aOriF7gkgjbwInDfA42bJpF/k/HQfsOQWVoeCMtTpD9Z6hG3Cwj5
 ssyw==
X-Gm-Message-State: AOAM533J56YxA4QfCn/z2O743M+kbRj/07DGsGkA49p43eClpPtIumc7
 h8a2Pr27zaz6frogi0aC+CbTerJCxg4m6A==
X-Google-Smtp-Source: ABdhPJyUF+k7dhzDRg7CTTkY5AWlhwN7PQnYZlZdjuQhCIX46NDndZTwphv2P2EZB/sIE6sZKhBRQQ==
X-Received: by 2002:a05:6808:124c:b0:2f9:c7cf:146 with SMTP id
 o12-20020a056808124c00b002f9c7cf0146mr5430464oiv.54.1651860166052; 
 Fri, 06 May 2022 11:02:46 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/24] target/arm: Cleanups, new features, new cpus
Date: Fri,  6 May 2022 13:02:18 -0500
Message-Id: <20220506180242.216785-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Changes for v6:
  * Expand the commit message for "Drop EL3 no EL2 fallbacks" (pmm)

All patches are reviewed.


r~


Richard Henderson (24):
  target/arm: Handle cpreg registration for missing EL
  target/arm: Drop EL3 no EL2 fallbacks
  target/arm: Merge zcr reginfo
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out aa32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 target/arm/cpregs.h           |  11 +
 target/arm/cpu.h              |  23 ++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 +
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 target/arm/cpu.c              |  66 +++-
 target/arm/cpu64.c            | 353 +++++++++++---------
 target/arm/cpu_tcg.c          | 227 +++++++++----
 target/arm/helper.c           | 600 ++++++++++++++++++++--------------
 target/arm/op_helper.c        |  43 +++
 target/arm/translate-a64.c    |  18 +
 target/arm/translate.c        |  23 ++
 18 files changed, 949 insertions(+), 487 deletions(-)

-- 
2.34.1


