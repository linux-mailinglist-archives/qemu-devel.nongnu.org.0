Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5001440CEEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:36:19 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQcZm-0003cx-DR
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV0-0003SG-BQ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcUx-0003EV-Ti
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 il14-20020a17090b164e00b0019c7a7c362dso264350pjb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YqsW/bH1ZZxJQ4KV3dmDvV/VxnGBdqHYOPo96/w4To=;
 b=F3xFDq/Yog6xPWdk6ZudCovLDK4C9EQYhGE8qvEtVeKcjRBs5ofV9j7kwClRp471iR
 O1619COFuEvmyOqKEvgvfSWn5GY11PDC3b0ySIfu+2awN9+a2I640mel5y/oZJC8oxXF
 mPjd12CCvweSx3yIaMY5XMYDYCHRccJcuLI6+n/vBGRFSp2okyEza0owgxXOTs6JAiAG
 8ocR+ZfYY6XOB4TVtZd/kSRz50e1PJvaOcm2VschBuQwWsAUndvVhDlc4PxByXSXQ2kB
 BeqyLUWtIyhV286vXU49evlYmpT72lwbmMRk52ukpJ5GVgVuCV+kAcLIQ9oARpYVqr1f
 zY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3YqsW/bH1ZZxJQ4KV3dmDvV/VxnGBdqHYOPo96/w4To=;
 b=RKScml6uqF4/9TBZHfVwaSbN/o641OLKW3/xAEwvL5tsU7ehibrLu3TnnnKJdvCXyq
 WSV0qm7c5SMJWHrPVVB/XUIYuwC2ikEXY+0tIQ5SjA5KDE0R9dVuLKi6cZ45PIASFlve
 9gp0bBZK9iF54UM4g81koXYidFif3wQbBMh1MasPlYBAj27E4kg2F23+NT6HmG2/brdf
 WfJ+4N3RwuHEiCDZi7Y/pBbiJuy24ML/sVRlTd8KErxATgRgkIk1BDFvcvDkOQ3to26Y
 Py7kl1ZwmLNmn4LTuzCVg7hui6MdV/9HTmlGqCtCFX1rd2xhZIDUZdC5Ez3HDhthbvQc
 P7rQ==
X-Gm-Message-State: AOAM533I+ouu/niVi1maxTM4MHZ3fMQ4H1diPtDC/4btkXyeMuLFidul
 89BCgB6UTwaBIB3CM4i3ip116ph2REQ+dg==
X-Google-Smtp-Source: ABdhPJwYVm+XPg3DPw5aUJZ93CrbiHSHRv8Lcx4CE/FmnnIgBo7WXvnmSP+GDHYpu2ht5kZ0cQ1Qxw==
X-Received: by 2002:a17:90a:a386:: with SMTP id
 x6mr2025171pjp.56.1631741478081; 
 Wed, 15 Sep 2021 14:31:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/16] tcg/s390x: host vector support
Date: Wed, 15 Sep 2021 14:30:58 -0700
Message-Id: <20210915213114.1923776-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v5:
  * Add is_{general,vector}_reg predicates.
  * Use 0xf not 15 for masking.

r~

Richard Henderson (16):
  tcg: Expand usadd/ussub with umin/umax
  tcg/s390x: Rename from tcg/s390
  tcg/s390x: Change FACILITY representation
  tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
  tcg/s390x: Add host vector framework
  tcg/s390x: Implement tcg_out_ld/st for vector types
  tcg/s390x: Implement tcg_out_mov for vector types
  tcg/s390x: Implement tcg_out_dup*_vec
  tcg/s390x: Implement minimal vector operations
  tcg/s390x: Implement andc, orc, abs, neg, not vector operations
  tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
  tcg/s390x: Implement vector shift operations
  tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
  tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
  tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
  tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec

 meson.build                              |   2 -
 tcg/{s390 => s390x}/tcg-target-con-set.h |   7 +
 tcg/{s390 => s390x}/tcg-target-con-str.h |   1 +
 tcg/{s390 => s390x}/tcg-target.h         |  91 ++-
 tcg/s390x/tcg-target.opc.h               |  15 +
 tcg/tcg-op-vec.c                         |  37 +-
 tcg/{s390 => s390x}/tcg-target.c.inc     | 935 +++++++++++++++++++++--
 7 files changed, 993 insertions(+), 95 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
 rename tcg/{s390 => s390x}/tcg-target.h (66%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

-- 
2.25.1


