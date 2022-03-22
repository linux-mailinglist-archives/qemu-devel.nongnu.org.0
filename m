Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003624E3FCE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:47:14 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeqv-0004Ty-Nq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:47:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWeme-0006ya-Ac
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:42:48 -0400
Received: from [2607:f8b0:4864:20::62e] (port=40882
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWemO-0006i2-Mu
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 09:42:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x2so1959157plm.7
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=FA9jZSioYw87H5L2oUEYeTh1DqtACI+HmGZzDV4p7oo=;
 b=o/c0AV68c2TFeVYuwkrgonm7Z8Skcvkh8z0o0XdL3wwkO+ypytTRE3w3Ali/m5WJS0
 I4JFLXibwlK/CDIlrfo/HwI8o3s8KTmLyosYiY/u3skD229a4UTpSbKhs6Yf118EpT94
 VjBrp5a//LjJZNXdXVhFXpCxFiod/jbzPcCsxBRQFsfU3HVJwofj6eih/B9CBx4MnOLa
 hev2EYTTcbkFVPkv6F7yDuVNhauV5TATVUzDvT989efHspBKFEked+ktUN7VpFqvhCrJ
 cOAh1jV+qk5HqMrVXSYMWHDJagE73nn8m1nfWNmWFsHzMN/ngkrrs3kx4htZt+xQgTgC
 /72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FA9jZSioYw87H5L2oUEYeTh1DqtACI+HmGZzDV4p7oo=;
 b=xAc+yKuAAYtNeXEDDAyNs3uPif4id+QuiIZt45S73Xpzy59UovySj/qWPecJdjWrsx
 yILa1ozP68+CtZ7NNc9YJj0B+EYpPymRiakj21xW7qx7+c2LUbMwb1aigb+pk3vH+Mxb
 LGRCArMdUZF0Fze+ofNBz9imuypHX5Xg3rsidNzS4hKyFSDgpk3yok2FTBSf9SkBFBGg
 dLoVGwRlV2dH/BVPUtumAsdGSO+BPzSaQmifDVIDHhCR/V2FA/vZ/qo5SJzH3ioqtBWH
 ftA4BREl1JfNEzkzyJjsn5GPlvFEeInUkT5ox3TJv0P/L+jB6NDTsTtzim3WWmXfUoF3
 27tg==
X-Gm-Message-State: AOAM5336Q+oRLBtXBuew3zxc/in/ZOpk+7HUkk4mxBPiA0dk6YzfGk1Y
 R4nSScM8gTEPjrFbffRMy4UucA==
X-Google-Smtp-Source: ABdhPJzpE53G8MdhhARKFdulfZO0FJOCpw6DuBUNXlCj54bvCm2Y144sILfuITOkizwIxaTRSLCeCA==
X-Received: by 2002:a17:90b:4f4d:b0:1c7:467c:e24e with SMTP id
 pj13-20020a17090b4f4d00b001c7467ce24emr5152188pjb.102.1647956550584; 
 Tue, 22 Mar 2022 06:42:30 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm3101216pjb.2.2022.03.22.06.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:42:29 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v1 0/4] RISC-V Smstateen support
Date: Tue, 22 Mar 2022 19:12:14 +0530
Message-Id: <20220322134218.27322-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

This series depends on the following series from Atish Patra:

https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00031.html
https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg00142.html

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 550 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  22 +-
 5 files changed, 610 insertions(+), 4 deletions(-)

-- 
2.17.1


