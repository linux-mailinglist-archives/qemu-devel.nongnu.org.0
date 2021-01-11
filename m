Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8D2F2338
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:03:49 +0100 (CET)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7A4-00029m-O6
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74E-0005Pv-Qr
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:57:46 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74D-0003Ux-Fe
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:57:46 -0500
Received: by mail-pf1-x429.google.com with SMTP id w2so244465pfc.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 15:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zatfyXOxSXAm72pAS+OrSbicSsn0LfrDrs51sewnb54=;
 b=Frk1CPUujx4N30J9g24nO3Nim0kcrYUFCfyGK12O+bxMTwKx99ZWIkbJq3SkajgOgS
 N4Noo0C50FhowCOK4ZMaFhzP+HRmUhrRIlCenQKNiNx1r9wEZJjKw33V1gQusgs17iGD
 DLTOu7uSEG4P/jDS7zH3drazljXe7fGNfKkI2ypzfx4paxfedkIgUGfgOo9C3rgx6X5l
 kY9X3fEVHs84ZK+D3G5J3c0Qa989loUgErBc2CPs+hM0pH9HbMMk7kd+iNBwpjugyI3f
 W1SCKOmn8gJrNvai/JmPnHFlGvhHY4EHKIXkNLTg3rXJhKzzw5pL6ZojjrmNLJNVfdYg
 lN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zatfyXOxSXAm72pAS+OrSbicSsn0LfrDrs51sewnb54=;
 b=N69G1Ag1YwumBFOenuJvVhAvmUmg0kxw3CD6Jz3A0q71+FCzB40ieEXYTO59qmVW9P
 +dRoBcB2Jhwv6OqnDdA/O7OEiJP7JrVUeVzr0ikvjlUglg3GjixnB7Ll4SzZ5MJd5jjg
 Msh1f/CDK7LMtMVyWVNpMQgyXOR/IXl9Q6w4yMKYe8EqdTmQcjp/JYNtubA2p0J8qU0S
 ytQBNm1xZ2ZGWo8FGpz7o/UA1xS0dLPpWsWjmx0Vxkm4cjuNfq4ZjrmWT9ghxFxcev8e
 wrgoLu5Wxq+CRBA2N9HVvmTRWb3VF6WpDDGfAJddHaS0bzBt3FXAXuO1kNLqJS2l8Wmw
 D02Q==
X-Gm-Message-State: AOAM530qZenYBsHyMdtAKwqu0+5/76jeWo/Xmdzp9LQGjd0jt4tXiFNs
 fOYbtz1/Gj/6q4aae9UajEz9/gAWOLZaFA==
X-Google-Smtp-Source: ABdhPJzn3bMna8qhMfzwrektrzzWWIh4B6fK5NX9QW4AnZ6fhzcbivfjZ5T96lpefxDnoWSlNtfRMA==
X-Received: by 2002:a63:d246:: with SMTP id t6mr1844270pgi.283.1610409463690; 
 Mon, 11 Jan 2021 15:57:43 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s67sm872220pgb.60.2021.01.11.15.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:57:37 -1000
Message-Id: <20210111235740.462469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.
  
Version 7 changes:
  * Fix rebase error (drjones).

Version 6 changes:
  * Rearrange xxhash64 (pmm).
  * Add documentation (pmm).
 
 
r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 docs/system/arm/cpu-features.rst | 21 +++++++
 include/qemu/xxhash.h            | 98 ++++++++++++++++++++++++++++++++
 target/arm/cpu.h                 | 25 ++++++--
 target/arm/cpu.c                 | 13 +++++
 target/arm/cpu64.c               | 64 +++++++++++++++------
 target/arm/monitor.c             |  1 +
 target/arm/pauth_helper.c        | 27 +++++++--
 tests/qtest/arm-cpu-features.c   | 13 +++++
 8 files changed, 235 insertions(+), 27 deletions(-)

-- 
2.25.1


