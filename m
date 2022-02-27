Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F74C58EA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 03:07:58 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO8ya-0005Df-P6
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 21:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v6-0002P0-Rd
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:20 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37691
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO8v4-0007RQ-KE
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 21:04:20 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso11730154pjj.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2X/VQDQ/Z+V8X2ty31v3CkWXgkAxTr9eBx28nguWVw=;
 b=foeyTieHiG1h7ui8QtSzs8Ls0V6/Puf/ssSaYHW8HEWwdzp0ho0UVU6S52DTnanSab
 KeLTI5apIaDOfWZ/yumZevRQpvOXXA/gsPujuVWv7GZGGohyoCP46aza8KJa68zMh+0C
 He7XC9XqdezjryLMwZvSMbQ96+pG5lbuRNkprPCZ4X3UXAfBki0NIf3caPEsO2cgOqLa
 1jJUffNJ8M/6494xz0RgpPKSP03ShK5YKjsVH/14s+3jDdW/tZC4mcHMdqeGiLU9z/+A
 jFjTO2kNL5Liu+G7P+8VxToaLCQTp0e0KkkhqOBggZO9Sqswv+wtB3plAzyioujZxnhC
 CHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2X/VQDQ/Z+V8X2ty31v3CkWXgkAxTr9eBx28nguWVw=;
 b=lkZRB6LM0vLng3TsSZHZiMg5vcJj+jtngr+sEXr8KWtZLnF2G21FovPECn94zHJXGe
 t2tJbQrOwR0gnZnCTh/fUV22DiBJdkY31qLVhVDNvhxwi7YOh1CtPe0YK6tcZ5NsHFXA
 xc/+hmLNx26SgFtk6+RmkRYL4aXjhhCm4mpZAqeF51T4M/EYItPcgSRNkz+sB0XV1zZi
 Fzc7gEDlqe4pEjQr0Qa6tiis3NecltECJV53VVwA3CNybIJr6F9nwfeQoKg55mJ1o++m
 qX4ZK63QK2vGtyHWjo72rWABbW+Qlao7dHD9uegh6bNaKvMPBcmOUvJdsW2+UtrqdZ0a
 j0rQ==
X-Gm-Message-State: AOAM532Ewt3URmuzqZgQjios6aE/mrYnhEx6sq5OGeiaJ0R1N6K+LG7d
 Dw6G0CHgLp7r5ztDm3MDYm1TE8IMmaMaZA==
X-Google-Smtp-Source: ABdhPJyEi/mhoRvqlPwLHXDhUCFaGFJZm1KjuX++hJCd9xLFo288UqVlal0cMbKFylAOxr73F3SJWg==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id
 s16-20020a17090302d000b0014d8a8d0cb1mr14320001plk.50.1645927455813; 
 Sat, 26 Feb 2022 18:04:15 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm8304021pfj.43.2022.02.26.18.04.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 18:04:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] tcg: support 32-bit guest addresses as signed
Date: Sat, 26 Feb 2022 16:04:04 -1000
Message-Id: <20220227020413.11741-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Patches lacking review:
  03-accel-tcg-Support-TCG_TARGET_SIGNED_ADDR32-for-so.patch
  06-tcg-aarch64-Support-TCG_TARGET_SIGNED_ADDR32.patch
  07-tcg-mips-Support-TCG_TARGET_SIGNED_ADDR32.patch
  09-tcg-loongarch64-Support-TCG_TARGET_SIGNED_ADDR32.patch (new)


r~

Version 1: https://lore.kernel.org/qemu-devel/20211010174401.141339-1-richard.henderson@linaro.org/


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

 include/exec/cpu-all.h            | 20 +++++++--
 include/exec/cpu_ldst.h           |  3 +-
 tcg/aarch64/tcg-target-sa32.h     |  7 ++++
 tcg/arm/tcg-target-sa32.h         |  1 +
 tcg/i386/tcg-target-sa32.h        |  1 +
 tcg/loongarch64/tcg-target-sa32.h |  1 +
 tcg/mips/tcg-target-sa32.h        |  9 ++++
 tcg/ppc/tcg-target-sa32.h         |  1 +
 tcg/riscv/tcg-target-sa32.h       |  5 +++
 tcg/s390x/tcg-target-sa32.h       |  1 +
 tcg/sparc/tcg-target-sa32.h       |  1 +
 tcg/tci/tcg-target-sa32.h         |  1 +
 accel/tcg/cputlb.c                | 36 +++++++++++-----
 bsd-user/main.c                   |  4 ++
 linux-user/elfload.c              | 62 +++++++++++++++++++++------
 linux-user/main.c                 |  3 ++
 tcg/tcg.c                         |  4 ++
 tcg/aarch64/tcg-target.c.inc      | 69 ++++++++++++++++++++-----------
 tcg/loongarch64/tcg-target.c.inc  | 15 +++----
 tcg/mips/tcg-target.c.inc         | 10 +----
 tcg/riscv/tcg-target.c.inc        |  8 +---
 21 files changed, 187 insertions(+), 75 deletions(-)
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


