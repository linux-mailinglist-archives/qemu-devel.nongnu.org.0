Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B9379E08
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:08:07 +0200 (CEST)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJgk-0006x4-Kg
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfA-0004sI-4c; Tue, 11 May 2021 00:06:28 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJf8-0007RA-Mf; Tue, 11 May 2021 00:06:27 -0400
Received: by mail-ej1-x62e.google.com with SMTP id zg3so27701335ejb.8;
 Mon, 10 May 2021 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AXLwOlnywtn0SWUQvtRluR901ijhyZBwKkjxGmjnVbI=;
 b=tMCFZgIajJFWiXwanNEQ5rOCKSvCIhyfFZZUFCNmlLP6CXeEkLunZqnG4onUkDEB2B
 KI8duhbhdc9VZiFfia+I47S6wsrchpQ3WVntpEX3wC/VOSwDBJTsEwvxI/Ak4UtetSmC
 QVd5tU1NKAb0eInKPGYrgx3JQ+mNr6UKnGvFiwZ45t4Mpi0LrlOUxCdDJCx7rsYFHTOB
 vt/cxFiKiUn4p2d9/Gu48ykk6YNANaQJhRUW/IVOjKD/8Xupm7ecU/6kqhfVCxWL3l3+
 gx8YSMOAnd3I03g90MKuxDkjy9gcIk6l3qrdOzKsyh2yHtljqJCKIDEAK4uGN/Ni/c91
 DZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AXLwOlnywtn0SWUQvtRluR901ijhyZBwKkjxGmjnVbI=;
 b=cWesSUHK5XuFwphx6X1+IRiM9Lj22jl7YNRMjLSpzEWsmk+iYBYdsrHjkfOKFcSi1U
 1gZBHHG+cyH//K+J/A/nxHlr2lidcoP7OG2agSFft8kN+7vrY2PP82M6bXH7rllhlmq2
 CMOmz4flMjYWbSoyULjDvP/AxDMIL8p6cLfe3+qgAg6aU8nVmbA5rVHjGTJUnAcrW4Ot
 h01Uy7l/vAIER5Jl7/BgLt9Y5yZPPIS2DweUnIU1lLUXmm2mseHpSTVwfybgbIhhtVOh
 B7SMO+8GjPeghMt5UzSSwCUsFLBG6C07sKSGXQoFAW5nu+wBaRQrRRyMvhV3rt6cdY4i
 91Sw==
X-Gm-Message-State: AOAM5321lX/zaGY4rePiB7KBDROBJlFtECvA7ivveeM0gyLyD7uOjo7L
 X2hj0oBoWyCQlKCz3Oi0Qn83mHJdF367Qg==
X-Google-Smtp-Source: ABdhPJy+EK9YMUhbjOLooZSsZjgCTYfKRX2R/arz8QkscM7W8ERElXj4noboo/1X+XFwb1ZiHeuO2g==
X-Received: by 2002:a17:906:7ac9:: with SMTP id
 k9mr29874847ejo.229.1620705983939; 
 Mon, 10 May 2021 21:06:23 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r15sm12889054edp.62.2021.05.10.21.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:06:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/isa: Remove unuseful qemu_allocate_irqs() call
Date: Tue, 11 May 2021 06:06:17 +0200
Message-Id: <20210511040621.2736981-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I started to fix the LeakSanitizer error in piix4_realize(),=0D
then looked for similar pattern and found 2 other places.=0D
The older is i82378 (historically the first one) which then=0D
spread.=0D
=0D
Since v1:=0D
- rebased=0D
- removed vt82c686 patches=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/isa/i82378: Name output IRQ as 'intr'=0D
  hw/isa/i82378: Simplify removing unuseful qemu_allocate_irqs() call=0D
  hw/isa/i82378: Rename output IRQ variable=0D
  hw/isa/piix4: Fix leak removing unuseful qemu_allocate_irqs() call=0D
=0D
 hw/isa/i82378.c | 13 +++----------=0D
 hw/isa/piix4.c  | 10 +---------=0D
 hw/ppc/prep.c   |  4 ++--=0D
 3 files changed, 6 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

