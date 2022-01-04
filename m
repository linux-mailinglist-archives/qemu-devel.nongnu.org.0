Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99439483A86
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 03:18:19 +0100 (CET)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ZP0-0005Jo-O5
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 21:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMZ-0002eV-K5
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:47 -0500
Received: from [2607:f8b0:4864:20::1033] (port=47035
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4ZMX-00089h-TX
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 21:15:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so1534798pjb.5
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 18:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6wMKf9WQuJh0uf86l3yzSvA28qzOgjbwZds66MwlPw=;
 b=UxeD8JHmai/WAerESFfwJOEVN6WSZGiwu9RjZlo/9Frjena1QEFP3GF/BFKqbtXpL/
 1XHPRsZ5X8swg/CdmasZMD65rrV3fy+aScA8LxAnHvbPs0wgN7wHHRQAyl+PfaeZCaBz
 4EMM0+pzOuBZKQNv6Q6gBrcUbFXBG2eoHnFcMblc0T4huU0OT5i2pCc5ss7irvNedUv1
 AXid/4wRmLfBj0nV3/L5goB9OJ1Up1go4BqP1RI20fePzW/q2J4NwUqSSdJjV/9Keoy7
 ws1tPzJLTTb3/R17Q6uixm0eflFZPzkVCxky4yjieb+E/bLVRq5oum1hGXrS6JCCTNl/
 0mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L6wMKf9WQuJh0uf86l3yzSvA28qzOgjbwZds66MwlPw=;
 b=O6eU+skIKBE0S/hSsmHnfy8iMv82xd8wkz/aOp6YIkgZIhafUyUlfVJUqLbj0Br/Qe
 m/HiyvyXZzFusknlG9iruVXbBNc609OJwBT671csbuse/EjfAu80sUS+C0o/KOm6eZhy
 ZTZxLLKOpfdwQIIhTBUnJUczN0rNbNC+wprjtUzrjyF1gjVMocN+MDSPtLQNyaaZFsXL
 nQKctsAlGiGkTO3/bzyK2NN74i625t7wk2FHCTYbOKTk2K+zuzkQSSz6GOx4i5xHyj/c
 DOIcROKG5fu1y9SLh95Qe743O3NtdXViHvlwmge8FXNleSO5f5Sc2dc2ntSC+Uuhfs56
 psyA==
X-Gm-Message-State: AOAM532oeV3A9/Opelreno2/S6UnRanwkUdr/cKNi2olWZzQb8AN4ai2
 NtHioVPapan/nrk78VO9B6QHbXbl81CpqA==
X-Google-Smtp-Source: ABdhPJwtfbcGksSwabr3NEEmefKEFOu1GF6Jae1BEDmCjmr4+Piq1OovQtl5vDX9CF9bwXObdEOeZQ==
X-Received: by 2002:a17:902:7146:b0:149:537e:e35e with SMTP id
 u6-20020a170902714600b00149537ee35emr46711991plm.55.1641262544272; 
 Mon, 03 Jan 2022 18:15:44 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b4sm37395501pjm.17.2022.01.03.18.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 18:15:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] Unaligned access for user only
Date: Mon,  3 Jan 2022 18:15:36 -0800
Message-Id: <20220104021543.396571-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 3 was way back in August:

https://lore.kernel.org/qemu-devel/20210818191920.390759-1-richard.henderson@linaro.org/

Quite a few of the patches in there have been merged, but not all.

Based-on: <20211227150127.2659293-1-richard.henderson@linaro.org>

There are follow-on patch sets for arm, mips, and sparc, which I
will be refreshing soon.  Xuerui, I believe that tcg/loongarch
should be as simple as one of these five.


r~


Richard Henderson (7):
  tcg/i386: Support raising sigbus for user-only
  tcg/aarch64: Support raising sigbus for user-only
  tcg/ppc: Support raising sigbus for user-only
  tcg/riscv: Support raising sigbus for user-only
  tcg/s390x: Support raising sigbus for user-only
  tcg/tci: Support raising sigbus for user-only
  tests/tcg/multiarch: Add sigbus.c

 tcg/aarch64/tcg-target.h     |   2 -
 tcg/i386/tcg-target.h        |   2 -
 tcg/ppc/tcg-target.h         |   2 -
 tcg/riscv/tcg-target.h       |   2 -
 tcg/s390x/tcg-target.h       |   2 -
 tcg/tci.c                    |  20 +++++--
 tests/tcg/multiarch/sigbus.c |  68 +++++++++++++++++++++++
 tcg/aarch64/tcg-target.c.inc |  91 +++++++++++++++++++++++++------
 tcg/i386/tcg-target.c.inc    | 103 +++++++++++++++++++++++++++++++++--
 tcg/ppc/tcg-target.c.inc     |  98 ++++++++++++++++++++++++++++++---
 tcg/riscv/tcg-target.c.inc   |  63 ++++++++++++++++++++-
 tcg/s390x/tcg-target.c.inc   |  59 +++++++++++++++++++-
 12 files changed, 462 insertions(+), 50 deletions(-)
 create mode 100644 tests/tcg/multiarch/sigbus.c

-- 
2.25.1


