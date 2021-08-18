Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F02B3F0CC1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:29:51 +0200 (CEST)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSC6-0003tA-0P
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-0007vB-JX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2C-00065Q-5G
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y190so3336836pfg.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7w0HWyXic/x2058Ly+JGXboUXjv80jNHjIcu02qZP5w=;
 b=qqfAwGUiYNiYpEaN9beBvjb4tHMGqiDLVeQK5fOjuUzF9WA8ek+QpHHZ6eKJy/YSqF
 ST7BZ/RGLJF3xJFmTvY0Av8VNG0yJxtqllQ9W7VB8Wz2C11v7pfOKQeNGm3i7RclkI50
 vANO93+PyDSmInetETXI0g2UN4GwB/Udt+aMkq1UXgaMZDWm3pe/8ZNZhMcCJ3oAYnOm
 4zBLmqaZkhU8nwfjRKk+O+/qQT+65N5E8sXLD1cCkYs0ZT3vDA7TscQ/tqWHy1e5rK7G
 IZReBasMti0ZfVlkhibSjCaUEF7+Y+zzyk+RcBZFscI1jhhW2CdU1LfS7UKPj25K7XbM
 iRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7w0HWyXic/x2058Ly+JGXboUXjv80jNHjIcu02qZP5w=;
 b=m+zvflGlTarsrVgzCjnUMS+kzrZT9N3O7A87yL8rtEJPOmrybNhWRIzX+tNWrIn6DT
 RRsdn0cENXnlKtGJG1mpHLEgaTG/kuTGrb59hYReMWfF7HpFBi/KxMfueMcJ9OuawsEw
 9bcrw8kV9pQ46gCHzFCd3oQTDUjjJ6IQDxGnmvnsMZE97xJMklg0lMvl+bBdIzdfZlZB
 5W4H5RWctvZORQT3SRVl6nzq3chSflcSs76jLt8gJOX2XshKs0aS5sRf5v4I+bh9jA4A
 dEBXzMjmfhzqoAfco+7p7nvk8wqsPYvZEn8XgF65E18pybBKVPnM52/X0/8c8BfV6FKb
 hECQ==
X-Gm-Message-State: AOAM530CVJk+cIZmoKaqHQYVuHlu4Y9YsMnaTppx5lMnj10jAVz+4jXF
 d5Vs09JiIxkaL/2snhzJPUkshUxRIHIP0Q==
X-Google-Smtp-Source: ABdhPJz2ceKO5bo87FFn9B7l6IddxsNB3hBh77UgkX9s//W5CAeuZz+MxY36UguQ95+1l9s6t/JMIg==
X-Received: by 2002:a65:63c2:: with SMTP id n2mr10738714pgv.292.1629317974222; 
 Wed, 18 Aug 2021 13:19:34 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/16] tcg/mips: Unaligned access and other cleanup
Date: Wed, 18 Aug 2021 10:19:15 -1000
Message-Id: <20210818201931.393394-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
("[PATCH v3 00/66] Unaligned access for user-only")

Important points:
  * Support unaligned accesses.
  * Drop requirement for 256MB alignment of code_gen_buffer.
  * Improvements to tcg_out_movi:
    - Have a tb-relative register for mips64, reducing the
      code size for most pointers,
    - Try a few 3-insn sequences,
    - Drop everything else into a constant pool.


r~


Richard Henderson (16):
  tcg/mips: Support unaligned access for user-only
  tcg/mips: Support unaligned access for softmmu
  tcg/mips: Drop inline markers
  tcg/mips: Move TCG_AREG0 to S8
  tcg/mips: Move TCG_GUEST_BASE_REG to S7
  tcg/mips: Unify TCG_GUEST_BASE_REG tests
  tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
  tcg/mips: Unset TCG_TARGET_HAS_direct_jump
  tcg/mips: Drop special alignment for code_gen_buffer
  tcg/mips: Create and use TCG_REG_TB
  tcg/mips: Split out tcg_out_movi_one
  tcg/mips: Split out tcg_out_movi_two
  tcg/mips: Use the constant pool for 64-bit constants
  tcg/mips: Aggressively use the constant pool for n64 calls
  tcg/mips: Try tb-relative addresses in tcg_out_movi
  tcg/mips: Try three insns with shift and add in tcg_out_movi

 tcg/mips/tcg-target.h     |  17 +-
 tcg/region.c              |  91 -----
 tcg/mips/tcg-target.c.inc | 730 +++++++++++++++++++++++++++++++-------
 3 files changed, 604 insertions(+), 234 deletions(-)

-- 
2.25.1


