Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D88308DA8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:47:08 +0100 (CET)
Received: from localhost ([::1]:57932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZjX-0007Ms-B8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zgs-0005fD-Rl; Fri, 29 Jan 2021 14:44:22 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zgr-0005R9-88; Fri, 29 Jan 2021 14:44:22 -0500
Received: by mail-wm1-x335.google.com with SMTP id o10so7639839wmc.1;
 Fri, 29 Jan 2021 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/SsznvUOPafmTl5qUYK0iZ5NhczZABOHV/F9XW5GoQ=;
 b=sxrnsQuWeA96SXzdI19O0VPLqBtiUiE1AgCmUuJ72xn4sZzxOLNlx3EVbAy09NnIHS
 S9TlJmYNYtxtMEqzUkcUXud5glpSUclAAFQiNfte1hT2vUP0OGLPxuSsSv+7MklkJcdP
 uZnSQCyCwUXaegeDqkYW5evcU5p+6hfqlufQXAU/6C0xUn642S8kcVr59Cmw3N2r0Dsq
 SAGBFx6TPIWX3PGTDZwEBIVn3aNUvvfhdqSsgb23sdTjElUWxXN1Un6WhtGCSSeomwkU
 B7Yc3sAA2HENf52Sk/LHvo0fV8+PdzJM4nugiQk4QNeODLYvPOv5StUHB1WmGsq8kiVT
 8qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l/SsznvUOPafmTl5qUYK0iZ5NhczZABOHV/F9XW5GoQ=;
 b=M+HqnKw5AK7VfYNlR9Vc6nZPLAkY3M3Keq7piZ/8YtVAfJcWX5JST27h8kOcY+NfKZ
 HLwvivHPS3djPxnuCK7yLlnsWmiX0ap+34VsVjHCwHmzaPZEDmFljdaPypyz3UrveuII
 M0nUB1BVwhg3S97riOqjAeC7UWzz0vEVZXx4LQqmcKW8glOOTclLNP7hY88d35OugzwI
 LzdA/pog3w9pJ6wl78grGpr7AGmGE+cPc9zUll7HYdb56VqlvjVAmfKHuQFB5OteNZqS
 qMHdaflog8RCTTURykdCsE1bt1vA4tWjfSvc15sjz/HrbIEIKJnWo78rPwdklJF5fMef
 Tipg==
X-Gm-Message-State: AOAM532suMRO1YjoEQVkiQd//e/pC4ClWARKmLWRUOnc62+4GqEAWPZ0
 7naQzlX8qHsqoXXWrHDmfwyECL+Xn/w=
X-Google-Smtp-Source: ABdhPJzvrzKRqIhADka2PQRFgCwVG6hn1Fus6E0B9yfr96UGRFZgJAH7j5S3BTBcv9DcDB9ji13fTw==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr1052234wmj.35.1611949459188; 
 Fri, 29 Jan 2021 11:44:19 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w129sm11691194wmb.11.2021.01.29.11.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 0/4] hw/xen: Fixes to only build the XEN_PV machine
Date: Fri, 29 Jan 2021 20:44:11 +0100
Message-Id: <20210129194415.3925153-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,=0D
=0D
These are the Xen patches I'm carrying to build the xenpv=0D
machine alone. I haven't tried to build the xenfv one.=0D
=0D
Tagged as RFC because this was part of a draft, so must be=0D
think better, but I don't have much time to finish it.=0D
Anyhow quick review appreciated.=0D
=0D
Missing (out of scope of this draft):=0D
Possibility to build another config than the default-configs/=0D
ones.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/ide/Kconfig: IDE_ISA requires ISA_BUS=0D
  hw/ide/Kconfig: IDE_PIIX requires IDE_ISA=0D
  hw/xen/Kconfig: Introduce XEN_PV config=0D
  hw/xen: Have the xenpv machine select 9pfs=0D
=0D
 accel/Kconfig  | 1 -=0D
 hw/Kconfig     | 1 +=0D
 hw/ide/Kconfig | 3 ++-=0D
 hw/xen/Kconfig | 7 +++++++=0D
 4 files changed, 10 insertions(+), 2 deletions(-)=0D
 create mode 100644 hw/xen/Kconfig=0D
=0D
-- =0D
2.26.2=0D
=0D

