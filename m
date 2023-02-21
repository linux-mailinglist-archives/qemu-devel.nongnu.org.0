Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A769D85F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 03:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIG9-0001YH-07; Mon, 20 Feb 2023 21:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG7-0001XY-El
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:19:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG5-00080i-Mj
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:19:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b14-20020a17090a8c8e00b002349579949aso3206166pjo.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQp8Rn3P5bhugZzgS4E8U0wmbAgETeWvZejtKLGWnCM=;
 b=htvpKeQasXaXkUXg0lAlv4LO+L7jJcELxOXQ/9g/PgWzLlAO6uipnpIrxmmkyrWf6C
 qe4TEYF0vc4nyEDaApLLIHtUS58gH8TtKjfIUTNGCxL/98FL164+n5Sb+XouK3t+J2eY
 9j5V71M/kysKEaZD2RvV/dIWQybsOdn3QrBWH0reKK36mb0VTsGwsO2Mit9gxVQbofPS
 xQHAQO/HvWX7K27moNln6hlxAKp9UXLIiUXVomXBckdm9+sOsxZ0KLgoKgo+Vk+/B6C0
 DY+SYuduvcapvXT3HSs3TWqBtlxR8HnawzRC6or5894S2nSCnJQY4/OX59xs2VbLqqD8
 vi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQp8Rn3P5bhugZzgS4E8U0wmbAgETeWvZejtKLGWnCM=;
 b=VK6OLXFnGgj0em0SW5PxQ3D9dRkZLDU8o+37cHcmtQtT5Ji00g9RMvcKnXTWB7cH9Z
 ATakl5ruvnYAQ5HgA6nlJLz5h1erCAfyR0bE7U1exfEAbPYeVwiwqUv6JzhrDLTCXZSe
 2YeCL9q9Ci6fX/OqgsTVbDjG6qX2JXlIcnNtdZ6Cn++aV+Es4JhWGmCMV02iJBiDuSZh
 8Z8ESX+nZRCrIU6f0U/83MS0V+xVN7sAEbkf37m3wFskW/RyY0iy/ZVSdyUwKzlS+1Sq
 VT44VBoqVNO7pXQDPgvQZDpRMEm7xRB5V8VmS4YW8yEKAWmNq72oX5EtsTqK/0vJpirm
 DUMw==
X-Gm-Message-State: AO0yUKXtk9GzZ1wgwcSusAOO4UFRQmBC9t/dpv6M+mYXWzO0exZlJLP8
 EPcNxW7A9HfGQ1rW2lVJgM2OOmPA5MkZuDGAGFI=
X-Google-Smtp-Source: AK7set/PyO30yvSM2Kj4iip3yL6814ZDcLjt06BLHGw8gEomyfUWCKek2yoMBgoa4e5/H8PLUSQvaQ==
X-Received: by 2002:a17:902:db0e:b0:19b:c14:9f4d with SMTP id
 m14-20020a170902db0e00b0019b0c149f4dmr4509666plx.38.1676945995355; 
 Mon, 20 Feb 2023 18:19:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:19:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/14] target/arm: gdbstub cleanups and additions
Date: Mon, 20 Feb 2023 16:19:37 -1000
Message-Id: <20230221021951.453601-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is my pauth enhancements from last year, the corresponding gdb
patches for which are nearing merge.  If lore and patchew are to be
believed, I never posted this to the list, only pushed a branch so
that issue #1105 could see it.

Since the cleanups there conflict with the recent m-profile gdbstub
patch set, I set about to resolve those.  In the process, I merged
the secure extension code with the sysregs, since they're simply
presenting different views of the same registers.

Changes for v2:
  * Incorporate feedback for pauth.
  * Rewrite m-profile systemreg and secext xml.
    - Since these are Known to gdb, do not merge the two xml.
    - Upstream gdb only knows about {M,P}SP, but David's extension
      to include the other registers makes sense and Luis confirms
      that it's ok to have extra registers in the two features.
    - Continue to share code between the two xml, but separate
      out the mapping from gdbstub regno to internal enumeration.


r~


David Reiss (2):
  target/arm: Export arm_v7m_mrs_control
  target/arm: Export arm_v7m_get_sp_ptr

Richard Henderson (12):
  target/arm: Normalize aarch64 gdbstub get/set function names
  target/arm: Unexport arm_gen_dynamic_sysreg_xml
  target/arm: Move arm_gen_dynamic_svereg_xml to gdbstub64.c
  target/arm: Split out output_vector_union_type
  target/arm: Simplify register counting in arm_gen_dynamic_svereg_xml
  target/arm: Hoist pred_width in arm_gen_dynamic_svereg_xml
  target/arm: Fix svep width in arm_gen_dynamic_svereg_xml
  target/arm: Add name argument to output_vector_union_type
  target/arm: Simplify iteration over bit widths
  target/arm: Create pauth_ptr_mask
  target/arm: Implement gdbstub pauth extension
  target/arm: Implement gdbstub m-profile systemreg and secext

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   9 +-
 target/arm/internals.h                    |  34 ++-
 target/arm/gdbstub.c                      | 294 ++++++++++++++--------
 target/arm/gdbstub64.c                    | 175 ++++++++++++-
 target/arm/m_helper.c                     |  90 ++++---
 target/arm/pauth_helper.c                 |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 474 insertions(+), 175 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1


