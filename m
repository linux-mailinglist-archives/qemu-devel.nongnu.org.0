Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB42E18C4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:08:58 +0100 (CET)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krxKT-0005ei-7O
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxE5-0008Pw-N7
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:21 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1krxDs-0000KA-Hm
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 01:02:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id z12so2481843pjn.1
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 22:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfIXmumI0ng96dnj0JiYVKRUUb1x0N5xRVZ04a3Obt8=;
 b=jyGJRMj8ji8ISEbfHAuY9AYoeU+xd20Et/t7bEpHC/EY/GfCHpIT4RHrgkHB2X6yW9
 pg8WUojfY3x8pPg1NtCiGAHZpnMVoF5Odccy2xT7n9j3333gE7O25HHsbPgYZ2t2hLo1
 73Q4DZ1YETgPROX7kv2JC6uHRNkdGvIggViLOZ89WKwnhEJGsSkp/oNI/hKlFStGwfKA
 CC6ef6NzSIjjNFj2D8nxYs5vPb8aOdAR65KwUwVdbw3N8xPPFlV2xUK8tEfiS35qvNnr
 +tyM55NYM91TWyMfU1fcmFPJ1g7aCAm57I5Zc3fHCTmGM2UlD7mNPILPbKmYwjU66mCJ
 A6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfIXmumI0ng96dnj0JiYVKRUUb1x0N5xRVZ04a3Obt8=;
 b=iIItSy4M8nymsCEriFUW4OAx7KZ8qgYJ0hZsM2BAA5+406wg+gWZUonGS5fdAhlRwi
 ebosynJA1URaot7OAQAhCZYHsL8AJm4kz4uFweujDrVrOz4iHi66Jhvhe4UhygItBpXR
 Q4x4MhvZVymeQXQhynRUz6owsTZxnJ/YCzBWwm33HXVCYbnP/uXJxpRfoLC0zpZ1qb77
 BIHmY4id0r88jA22f0NkbUOL+XwJHJm+04WWvXsBhL2xWSErH/74GqUOJPf1csuljlgI
 hQfs92dvGnRR7lD3Cf41n9J88gnkgcecF+whCNrFF7lmgTbWyr6/eir9bxpmlWMmCGek
 lMUw==
X-Gm-Message-State: AOAM533F9U08x85suoFvISqp7I64Td1oK5Wq6YmkOcGYmR6aa3la6wKx
 BXKQJYmJVsxtZI2YF3O+8yp0eIVUIrFK/Q==
X-Google-Smtp-Source: ABdhPJw4R/Y0m4rWAAe4xr4Bu7leR+SD+uMhujW9YSgBWdJyGvUGFOznKxTOwE45/wzyyTxU/qnz2Q==
X-Received: by 2002:a17:90a:cb8d:: with SMTP id
 a13mr24818364pju.155.1608703326041; 
 Tue, 22 Dec 2020 22:02:06 -0800 (PST)
Received: from localhost.localdomain (174-21-139-177.tukw.qwest.net.
 [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id s1sm21943620pfb.103.2020.12.22.22.02.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 22:02:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] tcg: backend constraints cleanup
Date: Tue, 22 Dec 2020 22:01:42 -0800
Message-Id: <20201223060204.576856-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pulls out constraints to a couple of headers, which
reduces the boilerplate just a little.

I have a longer term goal, which this aids, in which I
move some of the startup-time debug-only validation into
build/compile-time validation.  But not yet.


r~


Richard Henderson (22):
  tcg/tci: Drop L and S constraints
  tcg/i386: Move constraint type check to tcg_target_const_match
  tcg: Split out target constraints to tcg-target-constr.h
  tcg/arm: Convert to tcg-target-constr.h
  tcg/aarch64: Convert to tcg-target-constr.h
  tcg/ppc: Convert to tcg-target-constr.h
  tcg/tci: Convert to tcg-target-constr.h
  tcg/mips: Convert to tcg-target-constr.h
  tcg/riscv: Convert to tcg-target-constr.h
  tcg/s390: Convert to tcg-target-constr.h
  tcg/sparc: Convert to tcg-target-constr.h
  tcg: Remove TCG_TARGET_CONSTR_H
  tcg: Split out constraint sets to tcg-target-conset.h
  tcg/aarch64: Convert to tcg-target-conset.h
  tcg/arm: Convert to tcg-target-conset.h
  tcg/mips: Convert to tcg-target-conset.h
  tcg/ppc: Convert to tcg-target-conset.h
  tcg/riscv: Convert to tcg-target-conset.h
  tcg/s390: Convert to tcg-target-conset.h
  tcg/sparc: Convert to tcg-target-conset.h
  tcg/tci: Convert to tcg-target-conset.h
  tcg: Remove TCG_TARGET_CONSET_H

 tcg/aarch64/tcg-target-conset.h |  31 +++
 tcg/aarch64/tcg-target-constr.h |  27 +++
 tcg/arm/tcg-target-conset.h     |  30 +++
 tcg/arm/tcg-target-constr.h     |  31 +++
 tcg/i386/tcg-target-conset.h    |  44 ++++
 tcg/i386/tcg-target-constr.h    |  26 +++
 tcg/mips/tcg-target-conset.h    |  31 +++
 tcg/mips/tcg-target-constr.h    |  31 +++
 tcg/ppc/tcg-target-conset.h     |  37 ++++
 tcg/ppc/tcg-target-constr.h     |  37 ++++
 tcg/riscv/tcg-target-conset.h   |  25 +++
 tcg/riscv/tcg-target-constr.h   |  24 +++
 tcg/s390/tcg-target-conset.h    |  24 +++
 tcg/s390/tcg-target-constr.h    |  15 ++
 tcg/sparc/tcg-target-conset.h   |  27 +++
 tcg/sparc/tcg-target-constr.h   |  16 ++
 tcg/tci/tcg-target-conset.h     |  20 ++
 tcg/tci/tcg-target-constr.h     |   9 +
 tcg/tcg.c                       | 140 ++++++++++++-
 tcg/aarch64/tcg-target.c.inc    | 132 +++---------
 tcg/arm/tcg-target.c.inc        | 154 +++-----------
 tcg/i386/tcg-target.c.inc       | 281 ++++++++-----------------
 tcg/mips/tcg-target.c.inc       | 152 +++-----------
 tcg/ppc/tcg-target.c.inc        | 194 +++++------------
 tcg/riscv/tcg-target.c.inc      | 122 ++---------
 tcg/s390/tcg-target.c.inc       | 161 +++++---------
 tcg/sparc/tcg-target.c.inc      | 114 ++--------
 tcg/tci/tcg-target.c.inc        | 359 +++++++++++---------------------
 28 files changed, 1064 insertions(+), 1230 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-conset.h
 create mode 100644 tcg/aarch64/tcg-target-constr.h
 create mode 100644 tcg/arm/tcg-target-conset.h
 create mode 100644 tcg/arm/tcg-target-constr.h
 create mode 100644 tcg/i386/tcg-target-conset.h
 create mode 100644 tcg/i386/tcg-target-constr.h
 create mode 100644 tcg/mips/tcg-target-conset.h
 create mode 100644 tcg/mips/tcg-target-constr.h
 create mode 100644 tcg/ppc/tcg-target-conset.h
 create mode 100644 tcg/ppc/tcg-target-constr.h
 create mode 100644 tcg/riscv/tcg-target-conset.h
 create mode 100644 tcg/riscv/tcg-target-constr.h
 create mode 100644 tcg/s390/tcg-target-conset.h
 create mode 100644 tcg/s390/tcg-target-constr.h
 create mode 100644 tcg/sparc/tcg-target-conset.h
 create mode 100644 tcg/sparc/tcg-target-constr.h
 create mode 100644 tcg/tci/tcg-target-conset.h
 create mode 100644 tcg/tci/tcg-target-constr.h

-- 
2.25.1


