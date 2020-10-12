Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC1C28AEF6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 09:21:46 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRs9R-0005mx-4O
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 03:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRs6y-0004E8-F6; Mon, 12 Oct 2020 03:19:12 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRs6w-0007it-Uw; Mon, 12 Oct 2020 03:19:12 -0400
Received: by mail-wr1-x444.google.com with SMTP id t9so17869865wrq.11;
 Mon, 12 Oct 2020 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZeAWSRu/BMpoDszgoEyIXN5rmeh4aCYGpZCyQIYA5os=;
 b=ToDcZ5PYUAc6EdoIVZtduwI4XKGrHQsXi+aDB4+vX+P/VaH3sfOLR45zbQ9fJdLPAC
 nS6o38JZ4MibNu9jbxzqIWdCGm9fp6YkFLBg0pammPWs3b1492MYyYG2Sz8R2AkSRVMs
 30LJE9KiQFGw5l8rFQIt+/Z1MT9xKxoRk3+ivsdVFNlpNEpgiWN7VNtkr3YrQJurIbWL
 jvYsmW3aQSuwuEUCtA1CYWxKDjTkVY/dkkHBPjNRqN4oSe6e1uNah8tyKiMoYyzMLmZH
 bwOqXdg8LmI+SwK0U5JLeZyEC+cpI+QQjN00y6sJZPvu3upAwK3uqMTnorKzjb3Y0UXg
 K/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZeAWSRu/BMpoDszgoEyIXN5rmeh4aCYGpZCyQIYA5os=;
 b=bJdgotu+gKma69PXRlXXFjnlaj0k8fbzYsxpqrPoILF0vo3Q6nB2pVR952FtxOE4QQ
 JwMLvAYTfEkgfWb+VKdKBEr+Dyp4jWHgFVjEUk5zfzjUIpC+PlFRJBpIfSOYnWXayr+F
 4Quhnjo6FcURU4g7PzAA6OKDE//hLQHFYhA3Iw0DAnUF3rSma+pYpFcPUK9OGJgQDFBR
 +O3kva7OMvIBgRXVkNKnDmZOG88d78F4HwhXyjyeDo903pyJsT4bTKXP2KtHSVfv/Ag7
 2cZ3GzBuiT5sGYBUkSx55Gztf8eb7Dq/cubiVjyspHRKppuGeDLdkBHQbjjHGxtWS6CI
 y4mA==
X-Gm-Message-State: AOAM533KTqsXcppzO5tD7jtYKwI+2KaWMnKE8RWOj1WO7juzgZ7678+3
 4yxdHEtAiqcGtvgRinywcOZWxna/TMA=
X-Google-Smtp-Source: ABdhPJwCPVD7tbuDNOhuXt2tMaLVWe1w1qz6LegsA7x6dosLaSdorCoBTqv56gTgwEK/WRb+7pLd+g==
X-Received: by 2002:adf:f50c:: with SMTP id q12mr30373259wro.249.1602487148528; 
 Mon, 12 Oct 2020 00:19:08 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id l1sm2894426wrb.1.2020.10.12.00.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 00:19:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/pci-host/prep: Fix PCI swizzling in map_irq()
Date: Mon, 12 Oct 2020 09:19:02 +0200
Message-Id: <20201012071906.3301481-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a bug in the Raven PCI host, plus few cleanups while here.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/pci-host/prep: Update coding style to make checkpatch.pl happy=0D
  hw/pci-host/prep: Remove legacy PReP machine temporary workaround=0D
  hw/pci-host/prep: Fix PCI swizzling in map_irq()=0D
  docs/system/target-ppc.rst: Update PReP historical information=0D
=0D
 docs/system/target-ppc.rst |  8 ++++----=0D
 hw/pci-host/prep.c         | 32 ++++++++++++--------------------=0D
 2 files changed, 16 insertions(+), 24 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

