Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A086F8FD5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:22:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCFh-0003vT-9d; Sat, 06 May 2023 03:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFf-0003u2-D8
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFc-0004Kc-3p
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:22:43 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso17390795e9.3
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mjr+dUk/ZkwHWCLTUidpgZMvIzWIcBQNWf0MxO839Yc=;
 b=K0rPC0wIM5B0iPk9dL7oUNxUPfMNwuSSPEaz3X3bzJVLZPBTIngrIHU6wfUhk6ud04
 yqlCxKBprPJSdgtz2vl/EPmAX70esqToc+4bsG10ZTo9hbGPgaSsZ5g3MLoaSdeLN3MA
 adFrigAlyTZLv8DeB2tmtc7MYGUKsj0NfRxCIQraNb6FoaJiZZHDVgHulq0Dik16tIS2
 bAk0jkHuqJvOpcV1A9YO/nOdL5rxlhWsBBSLZ/LlcAZs6gwhnDUWGO9w7/+d6dIvKQVZ
 5hHU8SZeuEcJ9Dv+B9+lspc753CFSXYPgtFjjpcZ4WRgvPA1WKf/J3o5X0AXtd8hvDeJ
 xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mjr+dUk/ZkwHWCLTUidpgZMvIzWIcBQNWf0MxO839Yc=;
 b=IYLouXRSG9UIX+UX+EXUf/vzkpIBZKxGg+DCNh43HOawS+hTzfj2885FevdW9GHgm3
 e/HnONRtM6c2lhowiJIvz6VCClEMpcSCv5c1fiqs4w5hB5zRdkxwcSQtbidLs0A4Faj9
 xjo5MO91OXmXFehCxV2bNVseeKkfXgvP89Z020ZxdvhQ1RdR926L7D2bJbn4L9WM7gua
 m7MrG222YWJn0D0SEf4Qu7fNXSt7mfPvIxWkg5ADrHqDSb6+JNQA28OvUUJDqYyV1YV/
 0DTx6m884DQNTlpl04WJbyOZ+LEvMyqZS7w0E3xZthM4qESyfRt4+MruSecsZP0k/sm0
 dKpQ==
X-Gm-Message-State: AC+VfDx3Zd1l3pwYdbHHa3/c9TYS9PYELu01pkNmj/CIf8KSBzufILmd
 FF7qO+/HX7+qk2WE6byKYKzqI9GPDPH9bticUTpXDw==
X-Google-Smtp-Source: ACHHUZ53wxupCnuEvEklvsTTFOwo5FBYVmx7ATFl4Ccts44C2+fejk2k2gQCYzLjCbOYyW6CDxNBKw==
X-Received: by 2002:a1c:ed03:0:b0:3ee:6d55:8b73 with SMTP id
 l3-20020a1ced03000000b003ee6d558b73mr2556302wmh.29.1683357757066; 
 Sat, 06 May 2023 00:22:37 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 00/30] tcg: Simplify calls to load/store helpers
Date: Sat,  6 May 2023 08:22:05 +0100
Message-Id: <20230506072235.597467-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

There are several changes to the load/store helpers coming, and making
sure that those changes are properly reflected across all of the backends
was harrowing.

I have gone back and restarted by hoisting the code out of the backends
and into tcg.c.  We already have all of the parameters for the host
function call abi for "normal" helpers, we simply need to apply that to
the load/store slow path.

Changes for v5:
  * 24 patches upstreamed; 6 of the remaining 30 have reviews, but
    could not be merged out of order.


r~


Richard Henderson (30):
  tcg/i386: Introduce prepare_host_addr
  tcg/i386: Use indexed addressing for softmmu fast path
  tcg/aarch64: Introduce prepare_host_addr
  tcg/arm: Introduce prepare_host_addr
  tcg/loongarch64: Introduce prepare_host_addr
  tcg/mips: Introduce prepare_host_addr
  tcg/ppc: Introduce prepare_host_addr
  tcg/riscv: Introduce prepare_host_addr
  tcg/s390x: Introduce prepare_host_addr
  tcg: Add routines for calling slow-path helpers
  tcg/i386: Convert tcg_out_qemu_ld_slow_path
  tcg/i386: Convert tcg_out_qemu_st_slow_path
  tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
  tcg/loongarch64: Simplify constraints on qemu_ld/st
  tcg/mips: Remove MO_BSWAP handling
  tcg/mips: Reorg tlb load within prepare_host_addr
  tcg/mips: Simplify constraints on qemu_ld/st
  tcg/ppc: Reorg tcg_out_tlb_read
  tcg/ppc: Adjust constraints on qemu_ld/st
  tcg/ppc: Remove unused constraints A, B, C, D
  tcg/ppc: Remove unused constraint J
  tcg/riscv: Simplify constraints on qemu_ld/st
  tcg/s390x: Use ALGFR in constructing softmmu host address
  tcg/s390x: Simplify constraints on qemu_ld/st

 tcg/loongarch64/tcg-target-con-set.h |   2 -
 tcg/loongarch64/tcg-target-con-str.h |   1 -
 tcg/mips/tcg-target-con-set.h        |  13 +-
 tcg/mips/tcg-target-con-str.h        |   2 -
 tcg/mips/tcg-target.h                |   4 +-
 tcg/ppc/tcg-target-con-set.h         |  11 +-
 tcg/ppc/tcg-target-con-str.h         |   7 -
 tcg/riscv/tcg-target-con-set.h       |   2 -
 tcg/riscv/tcg-target-con-str.h       |   1 -
 tcg/s390x/tcg-target-con-set.h       |   2 -
 tcg/s390x/tcg-target-con-str.h       |   1 -
 tcg/tcg.c                            | 456 +++++++++++++-
 tcg/aarch64/tcg-target.c.inc         | 347 +++++------
 tcg/arm/tcg-target.c.inc             | 455 +++++---------
 tcg/i386/tcg-target.c.inc            | 451 +++++---------
 tcg/loongarch64/tcg-target.c.inc     | 313 ++++------
 tcg/mips/tcg-target.c.inc            | 870 ++++++++-------------------
 tcg/ppc/tcg-target.c.inc             | 510 +++++++---------
 tcg/riscv/tcg-target.c.inc           | 304 ++++------
 tcg/s390x/tcg-target.c.inc           | 314 ++++------
 20 files changed, 1766 insertions(+), 2300 deletions(-)

-- 
2.34.1


