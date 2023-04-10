Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0726DC897
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:35:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltXj-0000VJ-6O; Mon, 10 Apr 2023 11:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXh-0000Nr-35
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pltXf-0000nC-Dr
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ie17-20020a17090b401100b00246d4b282eeso3801pjb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681140890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Isse/ZKrKXmFUhYVhK+vNCzDF8ItOUZYkA2cp2Tay4w=;
 b=MqKd90WXE2vfj0AYXInmbqSVqIONTyGYHFKpHuVPgitNNAv1k71VXRl38+nSdrlTp0
 b3onaH/JsFRI939J7yTa0JyMz0cSYP+wmE01aqSFjdpmLk+wD0S1KPubBsS1DaF4tydk
 /60A04NKjuvOjilxd0+tk9Lg9EK8vxkGQXUeGQaI6i51kokgqjPIOr20YyJeW6tm1Xtm
 anxdFtICgTlhBHZR3viaXkBiO/TjGjFde2jMSnhbA530FvT1zz/kf22d66L4Z3PeSb1x
 R4egpdbff3dGGf3WRX3khW+lSiEhYinw7QSFSbxEEEQMPabLspFVhCI1pbTPmTYnshM+
 BCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Isse/ZKrKXmFUhYVhK+vNCzDF8ItOUZYkA2cp2Tay4w=;
 b=daz9wVAC94AD0oA0g/qQ9jNjFdw+LYs3gjjYPECt/CcpU/nggE/HFWM66kekhiSvZw
 vhj4GAyo/VyUH2jBcJOjOqINtpyWDv2A1dctqbH5JpmEmhcNmUEt/3YpNUj/TwA1VtsD
 9gKx7RiQFWHBO9tOU4hg2sZbBhglBy3Hm8VvD7KpIUb833zsliJujfPHwmLJk7KAPmCv
 dK1ilI+dlZB3SR0kPnc2uC2oTUGsr0kiLIfv0xhgidcSHTou0VW4lzvHmmFK/1hnBUPD
 0vMKWRJXVeX1OebwV2Jp73DSfhEllJscc+rUqbb3YTh5Wrobr/NKLTLXGfjbafCLfPIn
 ex6A==
X-Gm-Message-State: AAQBX9clE3QO3dmMXNfgmwZ5UM7t3RYai84vFMU3EF7FwC+l7Ke4NUTu
 rtPO4GQ27eYCQ9TFzb6hldxSoneBj8uwgtM+KcQ=
X-Google-Smtp-Source: AKy350b7ybloJsgR6WWl3GXBKp04ndml9FExtpj+bXEII6wtHIUepdBbdUMCmOfTgvs/J8j0crkaWw==
X-Received: by 2002:a17:903:228e:b0:1a1:a727:a802 with SMTP id
 b14-20020a170903228e00b001a1a727a802mr20306126plh.19.1681140889664; 
 Mon, 10 Apr 2023 08:34:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:2e6b:e4d3:9526:71d6])
 by smtp.gmail.com with ESMTPSA id
 jj6-20020a170903048600b001a64e854553sm534402plb.159.2023.04.10.08.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/3] tcg patch queue for 8.0
Date: Mon, 10 Apr 2023 08:34:45 -0700
Message-Id: <20230410153448.787498-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

The following changes since commit 08dede07030973c1053868bc64de7e10bfa02ad6:

  Merge tag 'pull-ppc-20230409' of https://github.com/legoater/qemu into staging (2023-04-10 11:47:52 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230410

for you to fetch changes up to 20861f34e0808bd06a0b7d74f8bd29c29e516ca5:

  tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32 (2023-04-10 08:29:24 -0700)

----------------------------------------------------------------
Fix Int128 function call abi for ppc32, mips o32, and _WIN64

----------------------------------------------------------------
Richard Henderson (3):
      tcg/i386: Adjust assert in tcg_out_addi_ptr
      tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi
      tcg/ppc: Fix TCG_TARGET_CALL_{ARG,RET}_I128 for ppc32

 tcg/mips/tcg-target.h     | 3 ++-
 tcg/i386/tcg-target.c.inc | 2 +-
 tcg/ppc/tcg-target.c.inc  | 7 ++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

