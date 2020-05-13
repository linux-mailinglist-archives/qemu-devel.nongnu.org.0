Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0721D1B25
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 18:35:29 +0200 (CEST)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYuLw-0004wK-7o
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 12:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuJP-0003Yi-0M
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:32:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:32916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuJN-0001yz-TN
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:32:50 -0400
Received: by mail-pj1-x1035.google.com with SMTP id z15so1990782pjb.0
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUp8ZKhg888/EDX5pc3pPvHV6BAeafFriVAGzAJqaso=;
 b=D+ynQXdyo+e3aJ0iPqqSLwAgXKr2xONVA7pdOq/P5xhstrZ4+3Vh9F5l5/aMenC/Wz
 50SLpWt4kOT/JR838xB1FALqQK0chsXcTPOmyp5L+q2PoasGOZtKokebXDI2mNw8tp1Y
 23KQ/2plrIPUU6+6pP9o+RhDTBtxmpAb+2cw8oXZ3PgQ3e1IcCqM891wDpCaQqWHkxDV
 oZGLof6wgh+nXVr4tC7RR8AQns4mArBrPq4JeETC3m07BhVr6me/rzZBkv+rhh88e5sh
 irHRpTh3fDZisaV52zyYiDvwKWl10iYuCJ8nOSGLxACSNySjoIcf0eFdxQE3xnMQil3V
 wEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUp8ZKhg888/EDX5pc3pPvHV6BAeafFriVAGzAJqaso=;
 b=kEJxmNZncubleIJi+6G9h3CPopkJSNNnYn2TLCRPuesVJKUpFNjZQ8lNwtynFzwcRd
 JIdqJq/wk9F8HBKmSAZaPpv/t6xKPNh7bJIfUsOsk4takfCr+K4ukKKH/QxQuRzLFoUH
 pU67DwSoBRpbDz/nhF2uLaLLHdXmZliHecTPLQ/dOOXgGgb0uie9IlQWje5WE6bVH289
 mHjh9kMGTAu47IcxG2MYDVFt4hG43jz613tYHZ97jMLs+Fxfpdp25y/uuylPTJcSYhmA
 O2w3PNFmJFetAgyVmHJafZot8suTXFYkasdzBWKyIp49PyICfliAJXclTLJ8jouL3bBS
 Sy2A==
X-Gm-Message-State: AGi0PuZ+JASXh8pVYshWC+vszCWRzMoxeVfHGAkEbmh6RfXvhE9nlj9i
 0Po1NUxHaQSeIyDz9m65I96kWOBEdWw=
X-Google-Smtp-Source: APiQypKKDxqfBFgtcUP7dJi43PDJ/pHz7G7/Ms/tKOagn0qBXLV963m8MfuiMCEt9kWE7TVOpbmz+w==
X-Received: by 2002:a17:90a:276a:: with SMTP id
 o97mr35126752pje.194.1589387567858; 
 Wed, 13 May 2020 09:32:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b11sm158025pgq.50.2020.05.13.09.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 09:32:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/16] target/arm: partial vector cleanup
Date: Wed, 13 May 2020 09:32:29 -0700
Message-Id: <20200513163245.17915-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 4 fixes the VRSRA bug, and updates for other review comments.

For patch 13 "target/arm: Pass pointer to qc to qrdmla/qrdmls",
I added a note about the type change on the inline functions.


r~


Richard Henderson (16):
  target/arm: Create gen_gvec_[us]sra
  target/arm: Create gen_gvec_{u,s}{rshr,rsra}
  target/arm: Create gen_gvec_{sri,sli}
  target/arm: Remove unnecessary range check for VSHL
  target/arm: Tidy handle_vec_simd_shri
  target/arm: Create gen_gvec_{ceq,clt,cle,cgt,cge}0
  target/arm: Create gen_gvec_{mla,mls}
  target/arm: Swap argument order for VSHL during decode
  target/arm: Create gen_gvec_{cmtst,ushl,sshl}
  target/arm: Create gen_gvec_{uqadd,sqadd,uqsub,sqsub}
  target/arm: Remove fp_status from helper_{recpe,rsqrte}_u32
  target/arm: Create gen_gvec_{qrdmla,qrdmls}
  target/arm: Pass pointer to qc to qrdmla/qrdmls
  target/arm: Clear tail in gvec_fmul_idx_*, gvec_fmla_idx_*
  target/arm: Vectorize SABD/UABD
  target/arm: Vectorize SABA/UABA

 target/arm/helper.h             |   71 +-
 target/arm/translate.h          |   84 +-
 target/arm/neon-dp.decode       |   17 +-
 target/arm/neon_helper.c        |   10 -
 target/arm/translate-a64.c      |  210 +---
 target/arm/translate-neon.inc.c |   59 +-
 target/arm/translate.c          | 1910 ++++++++++++++++++++-----------
 target/arm/vec_helper.c         |  233 +++-
 target/arm/vfp_helper.c         |    5 +-
 9 files changed, 1677 insertions(+), 922 deletions(-)

-- 
2.20.1


