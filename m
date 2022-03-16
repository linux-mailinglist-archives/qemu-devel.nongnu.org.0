Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA94DAA26
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:00:47 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMiD-0004p4-Gc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:00:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgH-0002DC-JZ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:45 -0400
Received: from [2607:f8b0:4864:20::42b] (port=33477
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgF-0006R1-Rt
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:45 -0400
Received: by mail-pf1-x42b.google.com with SMTP id s42so2623940pfg.0
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Vb0Z1Z8IT2ILmjXwDBk2qs1FMWyJHykcRlpQYRu2s=;
 b=a6ZfZzFqIn/8zcsX7f3GB5k2T0nTjlGXinxL/kqTCjU7146Haktu+cuoFYgEcXIOKn
 tzUkbnPK/Gi2GWuH1q10G+vA8B/IlpzCoXlnoO8V8/4jTCRW33Srknz+Bc1v9WJ7h66B
 dd0pmIB4c1TDHH41/PR55sFCToneQNbvuXXcNEDFhHgJ0mqUNTVwlBsICmkf4FKn7Brm
 pkALf4TPq0WShoVju15SAUr/PdcEIACpE4bDPXM0aO8QD1vYOuGEjGBNdWaBTQM4tJYL
 GK0ddcfKCGkbqAqhCPrKbcDCuwFbYQMTljstUIr+7nmhMKTOAO5iYioltKqMesGTQYap
 UW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8Vb0Z1Z8IT2ILmjXwDBk2qs1FMWyJHykcRlpQYRu2s=;
 b=qV6ZXE/X/p0RaFQN/1ZwUa1PeGO0itfyVfkZ6TwjF4vSCdlQqibNSjUY/BzNfksiww
 /9NGLOHTolwCW5v/rREWcQGFwacNgPwEHIu9D4GD2Eyo8bj58nM0TJnRipuQnqDM35m3
 +2g9Ap+AE5MxfBl93RGi9bxWSJLtvD4v4cpsaeFlWFOueNyugRWbp+KrjvWK/eqXuZGb
 iOicLdGg2IheadRl4XA1LQ1QjuXl6R62ogQFTYl9DQEs1iINABOndILSLYMBye+T4f5k
 iLS2+6W544bx0Lr61Hzc+oib8qYWWlRVpxv3ePnpVp10EiEkNwAbqJrH4OyMQGoFm1Z9
 6tNA==
X-Gm-Message-State: AOAM533Bp/FWeXbTH+RAOj041pAa4IElpVVUz9weyjmM+RkUg9vDCdYX
 Nk2OnDGV/9V9y6hf8jTGzSO3eZJ+RUZopA==
X-Google-Smtp-Source: ABdhPJyhKir+TF1QrQNgOjDxOrBBcmPSJA4cd3WVhboiQi5ZiqTctuGkel0IM5Y+u5wzKxwyuDTCMA==
X-Received: by 2002:a63:d64d:0:b0:374:6edc:989c with SMTP id
 d13-20020a63d64d000000b003746edc989cmr26759117pgj.434.1647410322205; 
 Tue, 15 Mar 2022 22:58:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/17] target/m68k: Conditional traps + trap cleanup
Date: Tue, 15 Mar 2022 22:58:23 -0700
Message-Id: <20220316055840.727571-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I should have gotten back to this right away after 7.0 devel
tree opened, but oh well.  There's always 7.1.

I believe I've fixed up all of the comments from [v2].


r~


v1: https://lore.kernel.org/qemu-devel/20211130103752.72099-1-richard.henderson@linaro.org/
v2: https://lore.kernel.org/qemu-devel/20211202204900.50973-1-richard.henderson@linaro.org/

Richard Henderson (17):
  target/m68k: Raise the TRAPn exception with the correct pc
  target/m68k: Switch over exception type in m68k_interrupt_all
  target/m68k: Fix coding style in m68k_interrupt_all
  linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
  target/m68k: Remove retaddr in m68k_interrupt_all
  target/m68k: Fix address argument for EXCP_CHK
  target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
  target/m68k: Fix address argument for EXCP_TRACE
  target/m68k: Fix stack frame for EXCP_ILLEGAL
  target/m68k: Implement TRAPcc
  target/m68k: Implement TPF in terms of TRAPcc
  target/m68k: Implement TRAPV
  target/m68k: Implement FTRAPcc
  tests/tcg/m68k: Add trap.c
  linux-user/strace: Fix print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k
  target/m68k: Mark helper_raise_exception as noreturn

 target/m68k/cpu.h              |   8 ++
 target/m68k/helper.h           |  14 +--
 linux-user/m68k/cpu_loop.c     |  11 +-
 linux-user/strace.c            |   4 +-
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 173 ++++++++++++++++--------------
 target/m68k/translate.c        | 190 ++++++++++++++++++++++++---------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 394 insertions(+), 144 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.25.1


