Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7806A4D49
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 22:35:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7r-00076P-0Q; Mon, 27 Feb 2023 16:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7p-00075r-0g
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:37 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7m-0004G0-PK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:36 -0500
Received: by mail-pl1-x62e.google.com with SMTP id h8so4959086plf.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VXRCA+PjO/uaA5aTfL5Vr2LtBhamB7EK3d38CQkfsHk=;
 b=IofhOBPzhm6Sx8AaXG4YhqNORPHhhH605zM0YqAMm6C9OpsHiyyPp+xCQSI+xnWsUh
 +BdOrQECodHLWeoKFbxuKMAFhUeT+6H6lt/6OEV2nqTc4s/flInJLiepjwigoNfZeYKj
 r8LMeEDyhAFHyVmgQ/1Ge43q/2COZFiWV6YfzmPxFy977qAj242L+/lX4wL0suKGKQ9J
 g7tL+7hKC8eJnZJ6P4qPM5mc7HvAmjCgMqfOEvsggDZXHXjOo7FKhFQVJXg9ai3If+8K
 fJEsLVepKt+ZsdSBhJfnHo1kaEKjLwkdmebQYgh/KF5KIf2EtTrvR5sQuzEXgcKddBN1
 9WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXRCA+PjO/uaA5aTfL5Vr2LtBhamB7EK3d38CQkfsHk=;
 b=5cKS2MmklBCai+59A+dIQEuv7/pTIxZKhZUS7CIQjvz6zTyhq89n50iKNNG84O6oSZ
 adP4KiyCGD0uu40l2VxoYB5NIspQaaMNPJ3zhq345v9+WEPDql0RYBl3uxL8CcmAaj3H
 DvaIHCluZZ1XuTOx3OdZyzTr8Y5gRURLN2K3yXw9m732gLdVXQACdqkGoaWL4QdUD9nN
 pg2F0HdzkwYcSiWRDeNfowXxyMoufaWC1eilraNsXUzA1NX/o8txJyOLLqNLu5Bjfx5O
 VUori5p9WzFu9VWOKpNN7LhAdJXl6cuLss2w0v9x4m/G6EcAxuIyJG/Rm1sqI71fu3Jk
 /d1A==
X-Gm-Message-State: AO0yUKXhHZTFbtrExqYCo/LJrGlqVx35qnh59DuZwKW5LN2ztuev32Rc
 BiIC0TD652ACxSHbEmXwNqnUEyY5hVr5pQWrHeY=
X-Google-Smtp-Source: AK7set8R3q+QSqBB+obgTiYWI9lx7sU+gOty66sKe3dWaJuMTd84s3ZCEFgXCIKOt48AzRI1Mc+MxQ==
X-Received: by 2002:a05:6a20:6986:b0:cc:cb28:382f with SMTP id
 t6-20020a056a20698600b000cccb28382fmr1046919pzk.26.1677533612037; 
 Mon, 27 Feb 2023 13:33:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/14] target/arm: gdbstub cleanups and additions
Date: Mon, 27 Feb 2023 11:33:15 -1000
Message-Id: <20230227213329.793795-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Changes for v3:
  * Drop write paths; there's quite a lot to reorg in v7m_msr, and
    it's not clear what should even happen on the exception paths.

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
 target/arm/gdbstub.c                      | 278 +++++++++++++---------
 target/arm/gdbstub64.c                    | 175 +++++++++++++-
 target/arm/tcg/m_helper.c                 |  90 ++++---
 target/arm/tcg/pauth_helper.c             |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 458 insertions(+), 175 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1


