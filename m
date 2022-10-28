Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6253610EAC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:37:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMi8-0006lo-F0; Fri, 28 Oct 2022 06:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi4-0006l3-G9; Fri, 28 Oct 2022 06:35:32 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi2-0001hx-Pt; Fri, 28 Oct 2022 06:35:32 -0400
Received: by mail-ej1-x631.google.com with SMTP id k2so11990633ejr.2;
 Fri, 28 Oct 2022 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2wvle4IUZUyCZpPS19a02GuZUVBZifORD3IMu+5UOA=;
 b=oOJ4l5UNzQf3kLMyvTdC55nZ7uqKtPOCcTAncZQDuT//ugQLqDBkrplWgdEhGViZZm
 06KkuZEyHylqPi2s9E55zUjIU12i+ycqgprspPFQjD9nuZivm2xI/wGBhnEc3Yce3a2K
 L4lBJmeUltI+i0ke6Q8xyToGr+olEBr5W/co+8GTr/NbW2yeE98ElMdfVPEf3FkROx5v
 gha4TIMfJ2lI3RSM/AJU21P0/8Gfg+kgJLB3LFEA/wh5ZC01RpTFBOIpXanGyaI7uwCi
 ZhE2ftloYOnxu9yhod3uPIdwunow60yDv5sy1vJy7r68FKK4WxDJEzLFPyd1qhrHAvWG
 /SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x2wvle4IUZUyCZpPS19a02GuZUVBZifORD3IMu+5UOA=;
 b=STSA4ONKL/VTECPcPaFp2qD48zvDGiCRHJA9nFojXOPlgqzUqdcrEZrX3e58iPcGtJ
 B8Vc89sd3rVsArjQ10KGmuhfoNAggNHZvUzcif5dZ7ZduuzPf6+5R87MGYLb97ZFJ5tD
 gYnyKikLZOaRP/+XSz1bs/9zJooM4LxJuhGKcwfz+3C5Jf4pYO7AC5frlb54lVbQi2qi
 wEcWsDATHi36OAOv4cYMfh+gtSPW2DQqtP07p99A+KUYoBnkUZdW8thR4scFlPyd/aB/
 3H2klBUgdb782h9rj2twzRrZkArlfFgKb/o65OLLKC1QfZsm6KcZvlgyI4HTG7qmg2hn
 dBhw==
X-Gm-Message-State: ACrzQf0PMXrelQ0vpKLkYpPUmP9c0+nQ7b7ET0g4WSBMDGqN5wxTfwXV
 7NewBXB/Li+7K/7JbAMMMM5anmmjy5Q=
X-Google-Smtp-Source: AMsMyM6A2aEOUMKAQceL29Kt19ZR7ZHY2fO6Xm5ljPmkDSYgaVUqz8ZduqvSq5hsV0JSs+QVmQQshQ==
X-Received: by 2002:a17:907:75ef:b0:7aa:3373:e7d8 with SMTP id
 jz15-20020a17090775ef00b007aa3373e7d8mr20908236ejc.231.1666953328469; 
 Fri, 28 Oct 2022 03:35:28 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0078128c89439sm2050527ejo.6.2022.10.28.03.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:35:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] hw/i386: Cleanup AML generation for north and south
 bridges
Date: Fri, 28 Oct 2022 12:34:16 +0200
Message-Id: <20221028103419.93398-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series extends Igor's "x86: clean up ACPI PCI code part 2" series, doi=
ng=0D
some further cleanup. It also simplifies experimentation with different sou=
th=0D
bridges (PIIX4 and VT82xx) in the pc machine [1].=0D
=0D
Testing done:=0D
* `mache check`=0D
* Start a live CD using "pc" and "q35" machine types=0D
=0D
v2:=0D
* Rebase onto https://patchew.org/QEMU/20221017102146.2254096-1-imammedo@re=
dhat.com/=0D
* Squash and rework patches 3 and 4=0D
=0D
[1] https://github.com/shentok/qemu/tree/pc-via=0D
=0D
Based-on: <20221017102146.2254096-1-imammedo@redhat.com>=0D
=0D
Bernhard Beschow (3):=0D
  hw/i386/acpi-build: Remove unused struct=0D
  hw/i386/acpi-build: Resolve redundant attribute=0D
  hw/i386/acpi-build: Resolve north rather than south bridges=0D
=0D
 hw/i386/acpi-build.c | 28 +++++++---------------------=0D
 1 file changed, 7 insertions(+), 21 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D

