Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB16006CC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 08:45:10 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okJs5-0001iJ-9Q
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 02:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJZ1-0006yv-1m
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1okJYt-0000dY-92
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:25:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id d24so9893324pls.4
 for <qemu-devel@nongnu.org>; Sun, 16 Oct 2022 23:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=AoUrzYYVv5dML3wv2jWgoEHPYQc2m1iZ4tKGQUBgTNo=;
 b=lV2qkjdygwRk4VeYLRalPgE+RWdXEq2yw/ejtgk7nfF3dPebOgzbTddYINE0YsuQCO
 PVngEyEVspaX1unf19X+sHs2LI4Jptsac/Keq6jKFR87cMbkU0cQQgO5xKfNADK+mOjC
 Mb7Ck21VBX9g/U+Dyt415O1r3ptqngfzWxL0n5r938PIOCoHV1tX8Fi+HDcrkupBaB4m
 m6NWuX9RSpTSBYsPfPZRiPjXuz/lSshJ4uj6vFySXcgqCTb+gouPVs3H4Tk8mesLIIoB
 jgbq4kEMxA7G8ihrkpj32UC5LV/nQYHK0XOVrTnFVZp/pi8rck/2ixqjBP2Z3yztSS88
 0SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AoUrzYYVv5dML3wv2jWgoEHPYQc2m1iZ4tKGQUBgTNo=;
 b=AKfUy8eC5zMqiPyeL4gw+JoY5J1CsudwZPRMfflv3nOnqzzTxXenycO4ZC4nVMjc6Q
 tfrJwkalUdtPjlE1ZCkrOQYV14K+qSzyLtVaHy8ZLQ6zD+QL9XHb9JbJ/LstuQxPL5Ih
 qsWdjCd8//IWFmcPAxqpjKDTl+bVpVvU7G2qRilFQ+bvUGkp1d6Ky6K0fkl+Cug3mERz
 J88HZOywHQ73/sV43+XY9VqWT1nV9qPbHS5P/MsbyYyg477ZpZtgY602r5lNWgFgX3Sf
 5mNxxHOXkKq54hihPCobGrB56C7Ercxl+YQSvhmTxeYXwwWDxCNuXX9DH2cibGYjwFgm
 JwTg==
X-Gm-Message-State: ACrzQf2sq5/LiocTlc1U78ubhWRSoNolPSs/NsbnZg3893j5KEG6hCnl
 2kjzlbRzmk8qBNJaGi8M43AzL4p6jUcJQZPz
X-Google-Smtp-Source: AMsMyM4JfldPXDoWIow9L51T37I48Vj7N92YMqWzn5mPEHcI/7ETBwAx0vsg0YfnltsO/FchVqWjWw==
X-Received: by 2002:a17:90b:4f89:b0:20d:8411:ca9 with SMTP id
 qe9-20020a17090b4f8900b0020d84110ca9mr32009063pjb.110.1665987917364; 
 Sun, 16 Oct 2022 23:25:17 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a170902d4c100b00177f32b1a32sm362632plg.271.2022.10.16.23.25.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 23:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tcg/sparc: Remove support for sparc32plus
Date: Mon, 17 Oct 2022 16:24:42 +1000
Message-Id: <20221017062445.563431-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While working on other cleanup/new features wrt calling conventions,
I noticed, again, that I am unable to test sparc32plus.  The current
debian installation in the gcc compile farm is for sparc64, and that
is also what gentoo is currently building.

It has been 10 years since qemu dropped support for pure sparc32.
I recon it's about time to finish the job.


r~


Richard Henderson (3):
  tcg/sparc: Remove support for sparc32plus
  tcg/sparc64: Rename from tcg/sparc
  tcg/sparc64: Remove sparc32plus constraints

 meson.build                                 |   4 +-
 tcg/{sparc => sparc64}/tcg-target-con-set.h |  16 +-
 tcg/{sparc => sparc64}/tcg-target-con-str.h |   3 -
 tcg/{sparc => sparc64}/tcg-target.h         |  11 -
 tcg/tcg.c                                   |  75 +-----
 tcg/{sparc => sparc64}/tcg-target.c.inc     | 275 +++++---------------
 6 files changed, 78 insertions(+), 306 deletions(-)
 rename tcg/{sparc => sparc64}/tcg-target-con-set.h (69%)
 rename tcg/{sparc => sparc64}/tcg-target-con-str.h (77%)
 rename tcg/{sparc => sparc64}/tcg-target.h (95%)
 rename tcg/{sparc => sparc64}/tcg-target.c.inc (91%)

-- 
2.34.1


