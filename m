Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE72F4485
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 07:29:26 +0100 (CET)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZem-0005Yz-W7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 01:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcQ-0003uz-IK
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:26:58 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcN-0007DX-VT
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:26:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id p12so489695pju.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 22:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MeLUJUM2UA6sEPX7Pauw8rYZ0ucS7Q7ySOaRCO+5jQ=;
 b=hGvfQEIIX7j8N49gvAruZWVahtHEnNu304TCy/1BaEFzVRtugthX8ITjCCCmnFl0fU
 79i4QvPOzvEo9N2D84J6GFH6OcQOeyRN1LimAAtQAeFrowzCrbP1rc1lzQ9wy+pF1YT4
 ogYccXR0FJHQ/tR8DyfXBnAGVvpP0OTAq+AAna80CIb4yXkZCoFgVygcsymrMMLPfaJI
 6FNS9fXFYvHjXNHR6s7u2kJraMHpQ7AOdqLzSk+IEpdVB+tAW4R2R/8bZFtKOgwC6CA2
 LnQGgrzbgiQBa+oLC3e8xiGT5bWTIASDNnpTfzq1jO3uLcYTrirgO2fUHIb0f08dltMT
 5lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4MeLUJUM2UA6sEPX7Pauw8rYZ0ucS7Q7ySOaRCO+5jQ=;
 b=fSlpQSDwE6kl02E9ePx/6nEyHFyIzC+rd88EQF91pt8qLxj9RupkcKpOgRodXeAf9h
 PH8Vl521/AFvGYwN5pKPozmRu9iqVFyn1VXXfNN28kVFZSvlDABFdaMPDNc+9Bfuhep0
 J6YX0+3ssGfBrezHjfGWspb/TPaAFAWYlzbn0OpA5pE5V7ENXrXqMnV6G3RJxmGLExlw
 Oo8ke+da6RNHuwOFDVK4TyamUvVfhkHhfvwfe1VemqnBluZN7z4FJVFp8g497W/ImJUh
 DlGd7SMhZGPHlhvuYC12cyg0dOHQj2MwnVlassuDxUm1pUBYSyVOI+YCY+coq0c6z5VA
 knWA==
X-Gm-Message-State: AOAM532HuiRwc1xeTeqNWsCtIP9C0HVb2O3GxMitVkiGkaIXfSJk5SSj
 Spk1u5ubGuXlr3EicsTaD0D7CA2Z3aJSDA==
X-Google-Smtp-Source: ABdhPJzVM8K9SqRkBkJTsngfKgDL4VmaVSYUQXiH7H8MNL+aHjQsM3ALrXO1gxyQkidZIfc39MlRFw==
X-Received: by 2002:a17:90b:368b:: with SMTP id
 mj11mr601183pjb.79.1610519214310; 
 Tue, 12 Jan 2021 22:26:54 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/arm: Fix sve pred_desc decoding
Date: Tue, 12 Jan 2021 20:26:46 -1000
Message-Id: <20210113062650.593824-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was an inconsistency between encoding, which uses
SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
This happened to be ok, until e2e7168a214, which reduced
the size of SIMD_OPRSZ_BITS, which lead to truncating all
predicate vector lengths.

Changes in v2:
  * Introduce and use PREDDESC field definitions, rather
    than abusing a different SIMD_* macro.


r~


Richard Henderson (4):
  target/arm: Introduce PREDDESC field definitions
  target/arm: Update PFIRST, PNEXT for pred_desc
  target/arm: Update ZIP, UZP, TRN for pred_desc
  target/arm: Update REV, PUNPK for pred_desc

 target/arm/internals.h     |  9 +++++++++
 target/arm/sve_helper.c    | 33 +++++++++++++++++----------------
 target/arm/translate-sve.c | 31 +++++++++++--------------------
 3 files changed, 37 insertions(+), 36 deletions(-)

-- 
2.25.1


