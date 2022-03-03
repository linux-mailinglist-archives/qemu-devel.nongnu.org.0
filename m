Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8B4CC5FA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:24:25 +0100 (CET)
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPr3o-0003Zp-HX
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvp-0001vB-GS
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: from [2607:f8b0:4864:20::630] (port=46021
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqvk-0007SE-3k
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:16:09 -0500
Received: by mail-pl1-x630.google.com with SMTP id s1so5554570plg.12
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 11:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRoC96QloKA4VzKRWSmGH6cqEWnqPXsa2N8et3ChLAE=;
 b=IqQjL5f0uDjMqt74Utpsz5ihCPrnYuepEtD3ICKaNwrbOGW2W/Sd90dAlG82UQenh0
 Dxhjmr9pOxeDpSaggmDOTqMTyEYRiq6OY2wbSz/v39T0QeFHiQnPk0zghknl5Ootgh9E
 NnW3ao5XBscglEkAXRGeCZ1C/NDKqg8FLEVuRXRYymSLeWR7ZzRpR5C+kjZ1L9WyS7pZ
 PY2Q3+GtCwd8Y/EFVRiXILggMOvvE45u4p8axzMEAfED965Ads6PocH1fvZWoJ/KHvBX
 n4skHN9p03PDkXot5npXUH+Ev+cRi3dkh6qZB5pUknaC/1OQiHzS4vFNE39lsuIIk2LV
 FN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NRoC96QloKA4VzKRWSmGH6cqEWnqPXsa2N8et3ChLAE=;
 b=QUS2ItA5VFJlydhhEer/1z2FyZCYgn8Q+m9s+vpv9k0UFiMjTKqvBdzfLnpnZd7Qs5
 TLjGh+wr96PHVWwIR0fdFfvJwg015u7iDi7CgpyO6n2gJEpo8zVYKXNhBrrtVRsKOHda
 MrhbP27+5/LZPz+2yaAwsFwHaZJ64Y/AJHIWmgH06+E+BcclQkuhRR0p3GTqmLcKxMKF
 LZjZSx6N4duwNgKa0wCTinLItJy9NQWgmFjGtQftSgjrCd+h7IhBulc5Sw3jJ561vQ10
 1Wd5+IJ94mBBpwbrpQzy2Ixl9HCRTB244H+9oalj+RQWU2WwUuwcu70EvzPQXRciBFM4
 1uQw==
X-Gm-Message-State: AOAM53180Zdjg6h+/68f8K8ufF7HZuLV2S3d8bSsREXig60HlXJ175rP
 NznRRFRVqr04SIC2PJspCUMmKie0emyTHA==
X-Google-Smtp-Source: ABdhPJyrYnCU04yij/o4SpRTTv9leqQlio6zhREWx6MY3xLpEX9gCriAlZK2UPYJEfRN+l5BoALlJQ==
X-Received: by 2002:a17:902:d486:b0:151:8e66:621c with SMTP id
 c6-20020a170902d48600b001518e66621cmr12591749plg.141.1646334953794; 
 Thu, 03 Mar 2022 11:15:53 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm3318043pfh.46.2022.03.03.11.15.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:15:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/9] tcg: support 32-bit guest addresses as signed
Date: Thu,  3 Mar 2022 09:15:42 -1000
Message-Id: <20220303191551.466631-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


We have 3 hosts that naturally produce sign-extended values,
and have to work extra hard (with 1 or 2 insns) to produce
the zero-extended address that we expect today.

However, it's a simple matter of arithmetic for the middle-end
to require sign-extended addresses instead.  For user-only, we
do have to be careful not to allow a guest object to wrap around
the signed boundary, but that's fairly easily done.

Tested with aarch64, as that's the best hw currently available.

Only patch 6, for tcg/aarch64, is lacking review, which has
been revised to include a AArch64LdstExt enum, per review.
  

r~


Richard Henderson (9):
  tcg: Add TCG_TARGET_SIGNED_ADDR32
  accel/tcg: Split out g2h_tlbe
  accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for softmmu
  accel/tcg: Add guest_base_signed_addr32 for user-only
  linux-user: Support TCG_TARGET_SIGNED_ADDR32
  tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
  tcg/mips: Support TCG_TARGET_SIGNED_ADDR32
  tcg/riscv: Support TCG_TARGET_SIGNED_ADDR32
  tcg/loongarch64: Support TCG_TARGET_SIGNED_ADDR32

 include/exec/cpu-all.h            | 20 ++++++--
 include/exec/cpu_ldst.h           |  3 +-
 tcg/aarch64/tcg-target-sa32.h     |  7 +++
 tcg/arm/tcg-target-sa32.h         |  1 +
 tcg/i386/tcg-target-sa32.h        |  1 +
 tcg/loongarch64/tcg-target-sa32.h |  1 +
 tcg/mips/tcg-target-sa32.h        |  9 ++++
 tcg/ppc/tcg-target-sa32.h         |  1 +
 tcg/riscv/tcg-target-sa32.h       |  5 ++
 tcg/s390x/tcg-target-sa32.h       |  1 +
 tcg/sparc/tcg-target-sa32.h       |  1 +
 tcg/tci/tcg-target-sa32.h         |  1 +
 accel/tcg/cputlb.c                | 36 +++++++++-----
 bsd-user/main.c                   |  4 ++
 linux-user/elfload.c              | 62 ++++++++++++++++++-----
 linux-user/main.c                 |  3 ++
 tcg/tcg.c                         |  4 ++
 tcg/aarch64/tcg-target.c.inc      | 81 ++++++++++++++++++++++---------
 tcg/loongarch64/tcg-target.c.inc  | 15 +++---
 tcg/mips/tcg-target.c.inc         | 10 +---
 tcg/riscv/tcg-target.c.inc        |  8 +--
 21 files changed, 199 insertions(+), 75 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-sa32.h
 create mode 100644 tcg/arm/tcg-target-sa32.h
 create mode 100644 tcg/i386/tcg-target-sa32.h
 create mode 100644 tcg/loongarch64/tcg-target-sa32.h
 create mode 100644 tcg/mips/tcg-target-sa32.h
 create mode 100644 tcg/ppc/tcg-target-sa32.h
 create mode 100644 tcg/riscv/tcg-target-sa32.h
 create mode 100644 tcg/s390x/tcg-target-sa32.h
 create mode 100644 tcg/sparc/tcg-target-sa32.h
 create mode 100644 tcg/tci/tcg-target-sa32.h

-- 
2.25.1


