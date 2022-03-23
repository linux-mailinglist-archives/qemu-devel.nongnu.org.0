Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234C4E5120
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:17:13 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyzI-00079x-4K
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:17:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvf-00053A-2G
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:13:27 -0400
Received: from [2607:f8b0:4864:20::102b] (port=53792
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyva-0007Iw-JU
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:13:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id bx5so1330962pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/nBwTzZoAqfE2DaZUbpvgceUUYSjkvKzw2P86oSeMZ4=;
 b=cQNhQ81gA++kRISqEBu60YYymNy0woUIuvGT4yXUKLpQ7NTgmdwoQNoSklNWtB9crX
 RIF8VgUE/DDeF1ma/IlIavHRJmBn9ev6FF0V+u3l1jqHA5DBkYL+drFujmMh7xhKWVy9
 CNWpY0qqCoLIwc8V7vJYl6vd4Xhyb9u57Xsg4H2+8xHz8UMyYfbzs5K4JeQmpTnObwJi
 FM4APTmpNSaY1H4iESV4ye9QgarJJjBLJVEJdRKH/ZdcdGLxAnLDqsB2ml88XP2wJgSa
 rJLEErD+3oqLy7/tsyHISX0vc7/sPO8EnaC2bnxtCXAAU7FuEQjadTJGNN/NB07GIZ31
 QS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/nBwTzZoAqfE2DaZUbpvgceUUYSjkvKzw2P86oSeMZ4=;
 b=AF38pxXuleEdocggbveZXiwfKDusvHv51nNxmRKIHiACBhNZ4ICRZPeIrirkvtK66D
 AbCVO6/nImgFd3BzfqfufwQx+CR7H92NCYvnyJuF5Ee2sJ8rMNPBNQ362ofHxvAyid6/
 E9c/k5niH7bRNdn78G/ZXU3/nwb8ye+XdOfn4G7cdkOhWHc/YgBwKuePhKUyZHqeAjYr
 1kFHYh1eiAo/ctV8VpRG7XVZibAfBu5rlCxv3nIt4b3twWLdwBJw+NpdYS1+bHjW0OOo
 2G96ivdAFDC5HBNvIWDerYrG9GozBmHjXQ99Y7/Gc4+6W/MGzA+AgZW/gyw/UWb7k9ep
 eg0Q==
X-Gm-Message-State: AOAM531F03n7A4frMi8WTxfbYNlSestNOT8eR8JU0Zt8YO7q57X0ubl/
 yshlNavneBADDyKhJ6p6ks2BdR/q5R69dkz/
X-Google-Smtp-Source: ABdhPJxzz9F5SbCoXFjLn752LZXmJqFbpOEZodCa1JewesU8fMpFRY8T1fBGyLQF6JUqh+nwXV0D8g==
X-Received: by 2002:a17:90b:4b8b:b0:1c6:452c:f76f with SMTP id
 lr11-20020a17090b4b8b00b001c6452cf76fmr11016063pjb.28.1648034000496; 
 Wed, 23 Mar 2022 04:13:20 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm19798002pgf.32.2022.03.23.04.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:13:19 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 0/4] RISC-V Smstateen support
Date: Wed, 23 Mar 2022 16:43:05 +0530
Message-Id: <20220323111309.9109-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102b.google.com
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


Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 554 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  22 +-
 5 files changed, 614 insertions(+), 4 deletions(-)

-- 
2.17.1


