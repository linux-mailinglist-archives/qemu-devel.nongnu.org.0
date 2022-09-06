Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E025AE68F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:27:00 +0200 (CEST)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWjL-0006OK-9V
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeS-00034j-P3
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeQ-00059t-GS
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e20so14658090wri.13
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=gYhyum6pOzckrUFu4BVVweK7XpMxrZqp4t8rlGrepl4=;
 b=nTol2E4HSfvOTHvgBNGQio8E+rDqwjCd//jNFTgTbw3WhthMoTFvyEXefl9uUWKna1
 R3SpK7R+04EVR17Fr1ycM9E9QWEwg0ZIM7z/aKbJGumtsxgqVKytkbfUKonP+IPC5jGj
 s5tn9ZhFPf+t69fRhwphAnswcXwvQ8OnBhhqpeoDhTEKBLlC3UjtLr5q9l2XsBo6RRui
 WkY47fQHDYmX0vod1gmAHcnWVzoFCf8JiX5/yhTgvCoXRTSGz2eQuar6Inf+cTC10alg
 b7vAhMwPR4HXwZTPSFMc4SbPVkCzHd76YwBuUEUvkTBsrOIRggIx3rm+z4QxeAQsTsq4
 stEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=gYhyum6pOzckrUFu4BVVweK7XpMxrZqp4t8rlGrepl4=;
 b=PkQamLrnW8z6kUsKqbkI/JpBe6eNVtL6cfQKxvVWw7eMUW067oBPPFoiIQwEm7gc9G
 AOqrcRV+sT8KGpOD6RlpEN12SIs2XPWiYEQku4HxrhfkVSMILoBV/3A8/I6EvYwVUFjU
 5utVB1KelI4bu9f6lrUpHG5ILtV/hvSpJB2y0QgQZs2cQ+s7LOIC4msSYF1y3N4TpizV
 twltw66/vPCv7Vda1I1NUEo5rkqiAmEf14B8Klc3BDGZNU9xkLHn8wtHXWOk8fPQkXn0
 wN/w8uORfVBQ1m29h4jxfE+GfLtCGM0Ym/YVM/ZhOLQK42ZPND5nKAGf1RV9UyhRKMKA
 mONw==
X-Gm-Message-State: ACgBeo3PqOAe6xXfNL0ML60rsZsQtdgZxxrnd2n5tivsS+Uz1WmYIYWY
 oQZe03mWGZF0N5GQcB2hLAekU1STJpEXaDT0
X-Google-Smtp-Source: AA6agR7ind++tzvt25pxAQNrqetO8nV8yQc+F24zrjvu0V3SHMjllm4x9eAUAATIai/3EOgxS+urLw==
X-Received: by 2002:a05:6000:184c:b0:223:2c8b:c43c with SMTP id
 c12-20020a056000184c00b002232c8bc43cmr28028099wri.16.1662459468804; 
 Tue, 06 Sep 2022 03:17:48 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 00/26] target/s390x: pc-relative translation
Date: Tue,  6 Sep 2022 11:17:21 +0100
Message-Id: <20220906101747.344559-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is the S390 specific changes required to reduce the
amount of translation for address space randomization.


r~


Based-on: 20220906091126.298041-1-richard.henderson@linaro.org
("[PATCH v4 0/7] tcg: pc-relative translation blocks")

branch: https://gitlab.com/rth7680/qemu/-/tree/tgt-s90x-pcrel


Richard Henderson (26):
  target/s390x: Use tcg_constant_* in local contexts
  target/s390x: Use tcg_constant_* for DisasCompare
  target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
  target/s390x: Use tcg_constant_* in translate_vx.c.inc
  target/s390x: Change help_goto_direct to work on displacements
  target/s390x: Introduce gen_psw_addr_disp
  target/s390x: Remove pc argument to pc_to_link_into
  target/s390x: Use gen_psw_addr_disp in pc_to_link_info
  target/s390x: Use gen_psw_addr_disp in save_link_info
  target/s390x: Use gen_psw_addr_disp in op_sam
  target/s390x: Use ilen instead in branches
  target/s390x: Move masking of psw.addr to cpu_get_tb_cpu_state
  target/s390x: Add disp argument to update_psw_addr
  target/s390x: Don't set gbea for user-only
  target/s390x: Introduce per_enabled
  target/s390x: Disable conditional branch-to-next for PER
  target/s390x: Introduce help_goto_indirect
  target/s390x: Split per_branch
  target/s390x: Simplify help_branch
  target/s390x: Split per_breaking_event from per_branch_*
  target/s390x: Remove PER check from use_goto_tb
  target/s390x: Pass original r2 register to BCR
  tcg: Pass TCGTempKind to tcg_temp_new_internal
  tcg: Introduce tcg_temp_ebb_new_*
  tcg: Introduce tcg_temp_is_normal_*
  target/s390x: Enable TARGET_TB_PCREL

 include/tcg/tcg-op.h                |   4 +
 include/tcg/tcg.h                   |  49 +-
 target/s390x/cpu-param.h            |   1 +
 target/s390x/cpu.h                  |  13 +-
 target/s390x/cpu.c                  |  14 +-
 target/s390x/tcg/translate.c        | 858 ++++++++++++----------------
 tcg/tcg.c                           |  14 +-
 target/s390x/tcg/translate_vx.c.inc |  45 +-
 target/s390x/tcg/insn-data.def      |   2 +-
 9 files changed, 458 insertions(+), 542 deletions(-)

-- 
2.34.1


