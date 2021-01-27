Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9F306823
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:43:22 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uT3-0006wr-Nr
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRB-0006Bq-Pt
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uRA-0008Cn-E2
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:41:25 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z6so3604921wrq.10
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+t4DS/RTtMX4Ty3BMweMBtODBcGBJ5r/iA11fP9w6jo=;
 b=bE10/xCY+msRA+2K3mQELDuSoPcl+9xyH19AU40pRjDZu7TmIRAg7GPF+QvaaT2jzZ
 tYR/GoDxUWZkaj+WRHBxFY9vX52r1np1oRWDI5ts8gMsnzTh0CE/370kG/Wovmet9OJc
 GNNq2oRnmlDLBeLF1E1BF+MAt7ks7IoGLdH88SRuUzX/PqxW408vCeTIIfnhe3sbCBUZ
 tvz+xAM56Z0lU/Hi40Vr4U7U4Xa+aoAm7QP/GOv51kSXqLL4aLHseTTM4fQyCQW3UhF3
 P7wJFMrKxWvRynxlRmYBkN/v7BuT8ATaOBu+bk9BrCmqfRH9H9iHOzoFtqptUwvuNE3D
 ac7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+t4DS/RTtMX4Ty3BMweMBtODBcGBJ5r/iA11fP9w6jo=;
 b=lWOF4EzHkjGi0Iw0dGuVsN46dtfWODG9CNMVBjV/lF+lrsAHgVPCZOr7pdBrD1zJZM
 hor1FBjswXFXN4xvSYF2mbGQyNmf9BZqHX6iwUGOfVAy6f/Rj0+hbt1Jj3BCJn+DGFOv
 IYx3y7cmkX57GxCPfRFrtyDo/zHKIVIIJO0+Dblxpbh0o6PB3b051dVPwE9Bao736fs3
 07LX3OONtbX1fl6a/YlfWF4B1wRxxoFCfhGA5IMlyUJ8xtLjRWqRLgyPzWpwjAwmCJ6X
 Rf18qt0diDqFZJrwnPflLybg0mFqbmaMC2lwSchIuONC4TR07b6YVRN+LYy+4yaGDcdt
 D3XA==
X-Gm-Message-State: AOAM532rPnlDrHIF3sg2HHBwFjKPkABR+pYeqZPjLOtaS7/urGxt2b3G
 w3RNoW5wabo9FIMCjWa6n2mundAf+YI=
X-Google-Smtp-Source: ABdhPJwgjwBOIUjhlOGnSanSvb2lM/i/+vqfNWv8I7pAvQ/9WWpiPTgbFR5rgItpUihD7yL1ftsVHw==
X-Received: by 2002:a5d:6311:: with SMTP id i17mr13393519wru.195.1611790882341; 
 Wed, 27 Jan 2021 15:41:22 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id l5sm4611999wrv.44.2021.01.27.15.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:41:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/nios2: Pass MMUAccessType to mmu_translate()
Date: Thu, 28 Jan 2021 00:41:17 +0100
Message-Id: <20210127234119.3537399-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Taking notes while reviewing commit 671a0a1265a=0D
("use MMUAccessType instead of int in mmu_translate").=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/nios2: Replace magic value by MMU definitions=0D
  target/nios2: Use MMUAccessType enum type when possible=0D
=0D
 target/nios2/mmu.h    | 3 ++-=0D
 target/nios2/helper.c | 2 +-=0D
 target/nios2/mmu.c    | 4 ++--=0D
 3 files changed, 5 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

