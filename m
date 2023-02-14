Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AE6969B5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD1-0006ZA-DZ; Tue, 14 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCo-0006Pp-Ql
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:31:00 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyCl-00024n-95
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:30:58 -0500
Received: by mail-pg1-x533.google.com with SMTP id n2so10582307pgb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XPjfx2KfYL2ddUZpoHPW9GkaTnvkl4j+odd05Yy+n3c=;
 b=JACeXZ15qEShF/YeMVMnXpO9nCir/MbfwzZe7lhZLi/m78ntOHs6nYnz6qJ0mk549F
 vFfpcd0sH+gD6j6nS1C3KTDEMgFlC4M6LAdHncmN3p4+5NAswM1m54+D/Mwu3Pw29nbT
 /L6YtaQQI/sdsF+heXCTvB3VwxX9AwVvpJoLlkMoZGr/kXRxn2zUj+uFdT9sHhmqhwRu
 e23LCAkeeIEb2fei+pvCIVpndaIzpfJTxqzSEsugFcyChfgL7lfyJW1mGXW3tUj6mVTL
 thRyLFHd5dMmmXkCd9QjKbhcgcN+clM9tjAwpW3MUp2PfLvCZfrxRuSKEkgSS4HZu6q2
 qjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XPjfx2KfYL2ddUZpoHPW9GkaTnvkl4j+odd05Yy+n3c=;
 b=lUvj+pyYcxhoitulwpZPU+bsqZfjNiZBlR7tMQZ3pczinVizNtFQRDKl6PgObznRU7
 p7VEmhPy/sr776HPeJ61mZO1YMUiGd6qPWcAmJefkjYRePDFMoaqxCwO3gTbszJ6PpRD
 sHJAshqLLNNrsSitZGT/Ci3q/qmEnbfg4w7K1UsDpw78i/NhqAiY9vBCKtT4HVHNJYaA
 qZ8MVyXN2bvBB1j16M21HSr0MfTMPydZNhhmGkg72z/6ChcHicOupy43p+6VhAnlqeK7
 yGpQ5VIk1ghQ6UuNFAStmYj2hM3TL4Yh3qleeGzb++IncAYwRGUmu8erwOITMZH6go/S
 UleA==
X-Gm-Message-State: AO0yUKX5w6Df2UJ0u7PRTwCL760VTpFfHmkyXRatqN7zK86HQUbFk09/
 0BEC72lwtHRttR9AjTP2F5ZNf5mVXqo0C2T0VqU=
X-Google-Smtp-Source: AK7set9UFqgKgbcepfV5foS/zCySUyCYS5P3p3AlL8X7I2jHK/GWZ2cF1l0wUJkEXw4o2e8J58xADA==
X-Received: by 2002:aa7:96ad:0:b0:5a8:16b7:ce6e with SMTP id
 g13-20020aa796ad000000b005a816b7ce6emr12433pfk.10.1676392251609; 
 Tue, 14 Feb 2023 08:30:51 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa78691000000b0058d99337381sm10337011pfo.172.2023.02.14.08.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:30:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/14] target/arm: gdbstub cleanups and additions
Date: Tue, 14 Feb 2023 06:30:34 -1000
Message-Id: <20230214163048.903964-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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


r~


David Reiss (3):
  target/arm: Export arm_v7m_mrs_control
  target/arm: Export arm_v7m_get_sp_ptr
  target/arm: Support reading m-profile system registers from gdb

Richard Henderson (11):
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

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   8 +-
 target/arm/internals.h                    |  34 ++-
 target/arm/gdbstub.c                      | 287 +++++++++++++---------
 target/arm/gdbstub64.c                    | 171 ++++++++++++-
 target/arm/m_helper.c                     |  90 ++++---
 target/arm/pauth_helper.c                 |  26 +-
 gdb-xml/aarch64-pauth.xml                 |  15 ++
 10 files changed, 453 insertions(+), 184 deletions(-)
 create mode 100644 gdb-xml/aarch64-pauth.xml

-- 
2.34.1


