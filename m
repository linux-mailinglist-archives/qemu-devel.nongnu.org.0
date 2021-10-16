Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD794430166
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 11:10:35 +0200 (CEST)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfi4-0005Hn-Jz
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 05:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffR-0002i5-O4
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:07:49 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffQ-0001A9-1B
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 05:07:49 -0400
Received: by mail-pf1-x433.google.com with SMTP id d9so3266565pfl.6
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZ1KI+SSAwSkrp1DeCdr4PA7deK/tLqedEy67K7eJC0=;
 b=iFQsPJtgzPwSrkXV5gNmOtLGwI1+KiPz9JSl4MmYNjHM57Nj/RisxHpQCFWGz2z3sy
 WEIc0lXqFKoknNCUcNz5zWiXZ/vXtFyC0FW3vL5ezhcAVgqr7bHis2ZELi72Cp4In7T/
 Of8g0MTp6+Bnjwhx82jJrzuP0M5+kXy2Gf3RSmwu5lfeS8RzrU/RTsdhC1fcWjGqoJBi
 +YxbKKxN7k5CLwnxdonWTr1p3r1yCteD/zcKe2CXZ5V7cDw2CRSy3XBcQe/jATT4ZIZy
 VxhLtl/+xw6eTsLd35kVzAyHEanXQoy+vj0R5oIFsOBVa90HCwvGwkyMQHCdR0ysbTw5
 U3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FZ1KI+SSAwSkrp1DeCdr4PA7deK/tLqedEy67K7eJC0=;
 b=XuUc5FIeAG3hx+Ivlcaq6W8e2mVX0ConTSY/UfFniUHhlhUsHmLf+ZMoIYtpd00DTT
 O1AwO/weTXkRvSr+fDo3/9O8cGMcvNyB+bCHdXpdP2tZxFZXzass46gspA8bktmJErG5
 8Fi4LUXuQU5K7yXWgvzeGKx8H5w4h8ZRTo3RhwMDIwaKZ3Oz2Rnvz9aQFo4LjsC45ucg
 9ogNnIzAKizNRmfVkGB6sPdE2FC0VqzA7osFIep06KDqrgm+QprroxaAKQbMfEIz2gv4
 5zYqSZ1ZRbdONU0vsnjAose20H1/95XTSsH8Q3xg800Cw1PW0aeJjcp5tM03Q3h79nX+
 2CTQ==
X-Gm-Message-State: AOAM532eU7AtKhYxbVNyKzIY6NnhWrdl+HyvDe2F48MeZGqZsC69ielU
 nD8VtQfE3CwZPRFuFgoiYiVKSHcDm/pl4A==
X-Google-Smtp-Source: ABdhPJw/j5441qJMdfmRFTi0IwS2/nppjS2YrSHmLdoP8bf0quNB1t8+jqOCdVWL1+suPFhd+eiKFw==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr13046910pgl.376.1634375266239; 
 Sat, 16 Oct 2021 02:07:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:07:46 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 0/6] target/riscv: support Zfh, Zfhmin extension v0.1
Date: Sat, 16 Oct 2021 17:07:35 +0800
Message-Id: <20211016090742.3034669-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frank Chang <frank.chang@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Zfh - Half width floating point
Zfhmin - Subset of half width floating point

Zfh, Zfhmin v0.1 is now in public review period and is required by
RVV extension:
https://groups.google.com/a/groups.riscv.org/g/isa-dev/c/63gDCinXTwE/m/871Wm9XIBQAJ

Zfh, Zfhmin can be enabled with -cpu option: Zfh=true and Zfhmin=true
respectively.

The port is available at:
https://github.com/sifive/qemu/tree/zfh-upstream-v3

Note: This patchset depends on another patchset listed in Based-on
      section below so it is not able to be built unless the patchset
      is applied.

Changelog:

v3:
  * Use the renamed softfloat min/max APIs: *_minimum_number()
    and *_maximum_number().
  * Pick softfloat min/max APIs based on CPU privilege spec version.
  * Add braces for if statements in REQUIRE_ZFH() and
    REQUIRE_ZFH_OR_ZFHMIN().
  * Rearrange the positions of Zfh and Zfhmin cpu properties.

v2:
  * Use {get,dest}_gpr APIs.
  * Add Zfhmin extension.

Based-on: <20211016085428.3001501-1-frank.chang@sifive.com>

Frank Chang (1):
  target/riscv: zfh: implement zfhmin extension

Kito Cheng (5):
  target/riscv: zfh: half-precision load and store
  target/riscv: zfh: half-precision computational
  target/riscv: zfh: half-precision convert and move
  target/riscv: zfh: half-precision floating-point compare
  target/riscv: zfh: half-precision floating-point classify

 target/riscv/cpu.c                        |   2 +
 target/riscv/cpu.h                        |   2 +
 target/riscv/fpu_helper.c                 | 180 ++++++++
 target/riscv/helper.h                     |  29 ++
 target/riscv/insn32.decode                |  38 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 537 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +
 target/riscv/translate.c                  |  20 +
 8 files changed, 824 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

--
2.25.1


