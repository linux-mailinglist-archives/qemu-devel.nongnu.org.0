Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1951A6CC0FA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:32:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9Pq-0000CB-Rx; Tue, 28 Mar 2023 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Pg-0000Ae-GU
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ph9Pe-0006CN-W5
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:31:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id h17so12210383wrt.8
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680010257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RkLefBby8GHB7D7b9Jb4bIaLZXqnZO2qePDhjw0TaDM=;
 b=pSBMoV3aPQGyBwoxR6SXKnXJTpzeWuJ3//GjmISODNJWgy+uB2EoLuc9bkJZsiuJVk
 4rL+D2hr/e/+C+81jiUesZNjOy5zuPlGr7/LWLE6Qpi+jrjmIk+SjUSn6woHpVqS4YUT
 EGks8TnLQxKi3Wc54gpMBO2lKmv/i3rRCSMPuPddG1v0uNTfGha2VlNgTYQ84/8DdLjv
 IeC1XgKMVoEyMXWtdA/qNuvKCVAwhzGAkfWa/dDcnvCBnUUHKj06WphVDXPEPQBH5sE4
 tuKbBSyr+kenOoneuEzjI5oE/6VEPgNUtE+u0OtB/ESkQKT4BUU73sai/kw/IrIsBD4s
 HJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680010257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RkLefBby8GHB7D7b9Jb4bIaLZXqnZO2qePDhjw0TaDM=;
 b=i+X+fBDL/K3UiWeqHuz/llPuKx+H0YH6rA1QosiDtm/Xp6Svk3GGVHw3Nt7hpDGOYv
 Wmlk0Bog7jeZfF/mKUaFYKvdVodWSLOEPD+vv3b3lNjDuwwImvpurBgFCIPbtS7/oc+l
 rQQOpcS0+RzwHzu9JwWY+HFbsE6PoPRQJnFnqc1BAv9vKPaDpBBvFrOscER4nvkz3nEo
 UxeQuUDsrvzvrbp6eaTRAp0IWxGcAc3XEaIIkEj7xzEngq++byzkCtrImYOWP6sF5fIx
 2PVp74jVHgqS69xtGYn1pS1i/DySlC+NlmsVs09NyqCwe/TDIEm35ZcdRitd28cnyNC9
 hTTw==
X-Gm-Message-State: AAQBX9fKDA2Q7IZ/6AK4JGECP3CcKoPH7quPHxoa3IZguJEN5HRZ3bVf
 XRKiUtD74ikt89b+/qmT/PVgrQ==
X-Google-Smtp-Source: AKy350Y2G19ZilaxQ/WGGrpjVRZhqLPVJqijGbyKFHoIkFBBQTUBIsdqnOpTvGKALo3pn7S+VKJkUA==
X-Received: by 2002:a5d:6b83:0:b0:2d4:5301:fac0 with SMTP id
 n3-20020a5d6b83000000b002d45301fac0mr11867088wrx.15.1680010257264; 
 Tue, 28 Mar 2023 06:30:57 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 a7-20020adff7c7000000b002c70ce264bfsm27914823wrq.76.2023.03.28.06.30.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 06:30:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Date: Tue, 28 Mar 2023 15:30:52 +0200
Message-Id: <20230328133054.6553-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since v1:
- Replace "Restrict aarch64_gdb_get_pauth_reg() to TCG / KVM"
  by a new patch "Inline pauth_param_mask() and pauth_ptr_mask()".

Fix when building QEMU configured with --disable-tcg:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Philippe Mathieu-Daudé (2):
  target/arm/gdbstub: Only advertise M-profile features if TCG available
  target/arm/pauth: Inline pauth_param_mask() and pauth_ptr_mask()

 target/arm/internals.h        | 16 +++++++++++++++-
 target/arm/gdbstub.c          |  5 +++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 3 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.38.1


