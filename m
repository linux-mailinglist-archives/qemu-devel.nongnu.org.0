Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D860E248
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:37:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongVp-0005bZ-Mj; Wed, 26 Oct 2022 09:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVi-0005ZD-R9; Wed, 26 Oct 2022 09:31:58 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ongVh-0007kQ-Bi; Wed, 26 Oct 2022 09:31:58 -0400
Received: by mail-ed1-x529.google.com with SMTP id a5so28370080edb.11;
 Wed, 26 Oct 2022 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7XFjlVpcxaj5zu3U9gU7k60uMx2pDm5CTfU/4CJL5Uk=;
 b=q1l8rx5p/vt+FXr18VdAMFHEhBHuPsHJ/Eg1YEXVdcPpHpYvGarnPC6gqky2lh0n4L
 yRBg+3lxvgSPMBUiZAZvoFstF/5neDtA1JPiTNX11lu7KVdo1ohYNIUZSxV5VxGLGjs8
 94M5K3d/4ZcFXvuCi4O+W+SJ3AgQnxW44gSVBmYmQ7xfFwS/hDRKhIdoaHPh3o7OksjV
 ahkxL36vGO23szbhdV4a2fw71ezZIdnOnCVfpdHOGHmD3MlNCWTlZglQDBsSUfjE+Nvl
 KJu+9CoNSbeDLRMM47L6wh+KrLgIpTlnEW9NLEheUB56PNQ30J7meHSXok0lDq+Uo9vO
 bedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7XFjlVpcxaj5zu3U9gU7k60uMx2pDm5CTfU/4CJL5Uk=;
 b=UMmTXQduqdYszzEJAE4bZdn2sCwwudnPD/UXxmpBUQ+Sqte1JeDQqppjhxKrqLBgGE
 L7uovEHQsWC9VgJ5WxiA74J6Q5tEwZCpqtMGpXPBbnfxSsc52/dk6q16sMCE2AZZ3ZKs
 IYQvRgfA9es+9ZvAbkCvrzN9C6JOuDyOlr05YuFarXclIbhXRcWhxzNmj80DtVbYc88p
 MNMCWrpR2avDY/khUg/SScVFPX1FMLVmwAN2yBvHaEyLW8EmJBTjxXeszxYrMwcrcOt7
 75OFVUqPdZj4/odJoO7OWxzQg4gN0lo/IBqqdDMw3yF7FYd/djRFHasohgpDHyclxK7w
 LR5g==
X-Gm-Message-State: ACrzQf3IkhYaCf3rvhzemjzvkcp5ISmwJTGnJko+cPpudwwQgIMdLu/b
 cjkkBlzrFLZ6NyYcAoa7gLqoNr64nsY=
X-Google-Smtp-Source: AMsMyM7c4rMgPwe0uTsE/9aksYLm81y6p6UNMAp+4qacsve3YQdYmZdl4g1nTBfal6B6GBWkp1ow8Q==
X-Received: by 2002:a05:6402:26c6:b0:45d:374b:fb73 with SMTP id
 x6-20020a05640226c600b0045d374bfb73mr40390433edd.424.1666791114842; 
 Wed, 26 Oct 2022 06:31:54 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170906328d00b00730b3bdd8d7sm3032524ejw.179.2022.10.26.06.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:31:54 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/4] Cleanup AML generation for north and south bridges
Date: Wed, 26 Oct 2022 15:31:06 +0200
Message-Id: <20221026133110.91828-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While refactoring of PCI AML generation seems to be still ongoing, this ser=
ies=0D
attempts to be an intermediate, short-term step to improve comprehensibilit=
y of=0D
the code. It also simplifies experimentation with different south bridges (=
PIIX4=0D
and VT82xx) in the pc machine.=0D
=0D
Testing done:=0D
* `mache check`=0D
* Start a live CD using "pc" and "q35" machine types=0D
=0D
Bernhard Beschow (4):=0D
  hw/i386/acpi-build: Remove unused struct=0D
  hw/i386/acpi-build: Resolve redundant attribute=0D
  hw/i386/acpi-build: Resolve PIIX ISA bridge rather than ACPI=0D
    controller=0D
  hw/i386/acpi-build: Generate AML for north and south bridges=0D
    separately=0D
=0D
 hw/i386/acpi-build.c | 45 ++++++++++++++++++--------------------------=0D
 1 file changed, 18 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D

