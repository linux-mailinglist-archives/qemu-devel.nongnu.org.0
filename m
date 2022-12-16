Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A164ED55
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:01:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6C9u-0003ld-4Y; Fri, 16 Dec 2022 09:57:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9i-0003ji-Ms; Fri, 16 Dec 2022 09:57:48 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9g-0001zp-97; Fri, 16 Dec 2022 09:57:46 -0500
Received: by mail-ed1-x529.google.com with SMTP id i15so4000515edf.2;
 Fri, 16 Dec 2022 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fhTJ7nT8+xkifb2NL/PzXfnL3Zp3ULldt2qmukepgTc=;
 b=o+CfEsg6lMXgXvtSQ/Fy6sdJPPzvzGrtSIUzE8MMhp7Ltm+47c9Vg/EhwvJXawx+eV
 ahXwg7Rg4WzBNMR1Gae0LCURg/yEUbZKisN5noiR3aeWPe7F/3DCJs4DTejy3GUvaLYj
 FccO8DvC8apzAFTFn8l6ehas2VfeJyBnSbvG3jVjHGTW2uOLfAjZOF2Pb/LJ76CLsYtL
 KFUb0vP78NswNdGubm2UAM/9910C7Es1ll9vi/RW4Y+H15mSMsbJudEY8pnLhjYMXOVE
 EQlYu3ywvRJTJ5pv/wo21aUhAZSRKEHs8O1ZXN3/km/sas3vtsSBE9pOjAji7pp0QDXP
 Jujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhTJ7nT8+xkifb2NL/PzXfnL3Zp3ULldt2qmukepgTc=;
 b=gieaqqS1nj9DqHmdkUfCKiqerhPtmUNxIVlGaVu9FuspqU8kEy3KabjOgnHWy1nEOr
 m5Y3PQF+18da1KA9r21ccw/CxRFTtU8E4c11/ZtWYLzFa+fold/uI0Tk8wcLpQ3916ci
 p9Qk/9AfM0nCnDfJ+gNOy/v6u5QVvzVeQsWmFWt4UamBpcJi394ZmTV7Ul719dkExOM3
 p1YDZ93jVPLs+oXa2bDZVI3RRoGIyxLSyKLx346XFcZX5hEiS/fDtPUF2i+115re9Xlw
 2To8ElHvBT0x9usALBFDIzLsUw7o1+sd9FrxmAYYp7xFzkiQpTF+5f/WT7jeJsSwxB4Y
 fvRA==
X-Gm-Message-State: ANoB5pnlVINcyGsC9jWcbGlTFzx964YXejV9TOT5XxPX17UwcVLxd18Q
 kB5pdN2afT6VirylSuC4C87MBvAHdh4=
X-Google-Smtp-Source: AA0mqf5XxBAtPUnPFpXXBqM3royNCYgWXpqcJshUkIJ3HtBVWPAvX3JyIvTl/aGW4bFEz+vhu33JUQ==
X-Received: by 2002:aa7:da02:0:b0:46c:f631:c0dc with SMTP id
 r2-20020aa7da02000000b0046cf631c0dcmr27870380eds.12.1671202661308; 
 Fri, 16 Dec 2022 06:57:41 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/6] Trivial PPC cleanups
Date: Fri, 16 Dec 2022 15:57:03 +0100
Message-Id: <20221216145709.271940-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

These are some patches which helped me when getting a u-boot image to run o=
n ppce500 machine.=0D
=0D
Testing done:=0D
- `make check`=0D
- `make check-avocado`=0D
=0D
Bernhard Beschow (6):=0D
  target/ppc/mmu_common: Log which effective address had no TLB entry=0D
    found=0D
  target/ppc/mmu_common: Fix table layout of "info tlb" HMP command=0D
  hw/ppc/virtex_ml507: Prefer local over global variable=0D
  hw/ppc/e500: Prefer local variable over qdev_get_machine()=0D
  hw/ppc/e500: Resolve variable shadowing=0D
  hw/ppc/e500: Move comment to more appropriate place=0D
=0D
 hw/ppc/e500.c           | 10 ++++------=0D
 hw/ppc/virtex_ml507.c   |  2 +-=0D
 target/ppc/mmu_common.c |  5 +++--=0D
 3 files changed, 8 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

