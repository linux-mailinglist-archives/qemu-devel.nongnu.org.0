Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F783B37D2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:29:36 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwVyh-00012O-30
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVx3-0007ix-Bs
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:27:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwVx1-0002zq-L1
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:27:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id j1so8054880wrn.9
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9+/eP+V94hgUwGJh3E+JDW/AZY6l9Rex1E1aOp0vUQ=;
 b=PA/dWIdvSa33+wcdoROXk6e/ctqhTve8g8kQ770+xUg61T9d2S9XXmVMcCF+wOof8j
 m60aHtPAXyyYU0XA5gKoHVrYzt92U1lDXk6Wvqx80gNXg9W1K8UgADqu91WlK652Ipi/
 AorbrALhUK8R6F5Eo02UBI4F+vwGcgFORFoguQGLVEbNxHG41pSmySVLGUuvWrxb4IUT
 g8MF8m4bRUzfuyHkDmw2FN26bTQQ2xOWO3XORAKvWrGcpB/7yCHIH1terTWKd0GQtFGC
 zbrMpfrLtTzt9aUQa9oAq6kJzJ9JGZR+96/Ovewixzz0FUns7wVHFrpp5hbWy7UyTrcY
 R9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H9+/eP+V94hgUwGJh3E+JDW/AZY6l9Rex1E1aOp0vUQ=;
 b=UQGPC3opuKngp0y9sv/39R4351+wytOSSdNVfgIT5nEuv2gvD7aG5/HkBwz+jJn+7Y
 Psas59R1OJi6pHXgHIIJZ6U6MdYlhxeq3YTpZjJ/H/NlVNzvp/cFgY3SW8+y+mC1uyNm
 7HlPyItxK50rjrw1bZV6n7X1nx9ko66wlQsGAcB0FqZm5bxuJiLvG5aq2uibgeF0sO4K
 0XsAu7VrHufk3Fanw2iaye3XzvkLPe5PMIfHX3cpPQbFVMYljdExUf/KpVAEOAwXuq3G
 J1f1aIxgj2PJw3P3qwNeQgg53BL1sekQIBPWif4vWsZscLupWLlli/QXtREXW9Xtzekm
 dOPw==
X-Gm-Message-State: AOAM5322Nv4mTg1kFr93rXdD9FPvavcEB7Wa65htUOQ6pTxQGaKZM51Q
 X0pME5Q1RuFTcAs2ubbsmbxPdfkL5txQKQ==
X-Google-Smtp-Source: ABdhPJzmyaHgjocfLec7rdrdGyLQ8km98Q7w92XrgZijZ83NI+XgUGTzlTeT2Rsc6N+j+7dRrCEAlA==
X-Received: by 2002:a5d:65cc:: with SMTP id e12mr6531325wrw.354.1624566469551; 
 Thu, 24 Jun 2021 13:27:49 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l20sm3893509wmq.3.2021.06.24.13.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:27:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw/mips: Fix the Fuloong 2E machine with PMON bios
Date: Thu, 24 Jun 2021 22:27:42 +0200
Message-Id: <20210624202747.1433023-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 911629e6d37 ("vt82c686: Fix SMBus IO base and configuration=0D
registers") exposed a "bug" in the Bonito north bridge. Fix it=0D
and add tests.=0D
=0D
Thanks to Zoltan for support while debugging :)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/isa/vt82c686: Replace magic numbers by definitions=0D
  hw/pci-host/bonito: Trace PCI config accesses smaller than 32-bit=0D
  hw/pci-host/bonito: Allow PCI config accesses smaller than 32-bit=0D
  tests/acceptance: Test Linux on the Fuloong 2E machine=0D
  tests/acceptance: Test PMON on the Fuloong 2E machine=0D
=0D
 hw/isa/vt82c686.c                          |  50 ++++++----=0D
 hw/pci-host/bonito.c                       |  12 ++-=0D
 MAINTAINERS                                |   1 +=0D
 hw/pci-host/trace-events                   |   3 +=0D
 tests/acceptance/machine_mips_fuloong2e.py | 104 +++++++++++++++++++++=0D
 5 files changed, 151 insertions(+), 19 deletions(-)=0D
 create mode 100644 tests/acceptance/machine_mips_fuloong2e.py=0D
=0D
-- =0D
2.31.1=0D
=0D

