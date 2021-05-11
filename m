Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68717379E40
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:20:48 +0200 (CEST)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJt1-00015K-Eh
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrF-0007GR-Of; Tue, 11 May 2021 00:18:57 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJrB-0000Ql-QL; Tue, 11 May 2021 00:18:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so27697150ejc.10;
 Mon, 10 May 2021 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWOKFzYCzHQnZ4fDU+WMBlGxgwQG7csH3dWCf6w0BeA=;
 b=D0pGrcbYGLJSLfJllcdIzZEFlNd0D0cwuBJOrW3Ie09xjbMEyClJ9aHoBIoCQAybBS
 2uoD+4+4ZWT3jfBXHI7ue4TYdwpFYxicjJ4AiJM16S8z9aznfHc0578f8YfYJ6Vhf3UE
 rFcMzlbIQ0P2++ObUdveIHVnZesnPC+OoyrL1i3ZpToEIzEeeNky52jKE+IEWLScA90v
 PVrQjqRzdmUX+KqQOSqpjGo9GhrWnk/s5zEgHkEUejNnnITMQ0cMpbW4e6I0Oh6HS+Oj
 sVY0nuw/sBqbDAr0f/Sq6Z2nCqDcjwO20no21H+XsiVAgseG1YGk3FFNN+Zo0344Ckad
 KByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AWOKFzYCzHQnZ4fDU+WMBlGxgwQG7csH3dWCf6w0BeA=;
 b=Oo+PLp3vG7LH+1DGTbge6dyAbQ+s/QD/K7E8JeWsROk4rn+Hndx4Yydm/uQ3Lo2xWW
 XAyMfnw0PGWN17FkOASgl9vwrm6SqGdsqDzfCHt1ul05kDEwQ1BWj1U761y63FEFPNif
 1tfQx3oKPJ1rH3y0UVzfpcRCOdmScvEs6fYUnfDmeeohVf+vC0NGyNICbgDNnbH1FeLq
 NNy4vlEakUw5DwgaFIrJ2avkpXRuD+VgsLkEYStuRyOsjTMI7nfbuULphRPPZQ9w86wm
 L/2SCSpnUFr7PLqhWeRD+8V0jDYQpJGCNAYzfFIW9caqC+UKEn4s75tKJwEQeyb/Yk/T
 M1Nw==
X-Gm-Message-State: AOAM533Y8oANohJfz+oy1zZtYxiL6OvowOt7mSAD3yi10EFF5KTAWrym
 owLY0UbpGPimt8svlh6cb6x1LQi8Ig37Zw==
X-Google-Smtp-Source: ABdhPJw8H+/LFGPBuJNymhRmKhkH8hfdJoyZe18YafSBwuTLVyDzvXyysos6Iv77ko9CfvIYLRNeUg==
X-Received: by 2002:a17:906:dbfd:: with SMTP id
 yd29mr12986725ejb.534.1620706731125; 
 Mon, 10 May 2021 21:18:51 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r16sm13408675edq.87.2021.05.10.21.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:18:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
Date: Tue, 11 May 2021 06:18:42 +0200
Message-Id: <20210511041848.2743312-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The motivation behind this series is to remove the=0D
isa_get_irq(NULL) call to simplify the ISA generic model.=0D
=0D
Since v1:=0D
- rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  hw/isa/vt82c686: Name output IRQ as 'intr'=0D
  hw/isa/vt82c686: Simplify removing unuseful qemu_allocate_irqs() call=0D
  hw/isa/vt82c686: Let ISA function expose ISA IRQs=0D
  hw/ide/via: Replace magic 2 value by ARRAY_SIZE / MAX_IDE_DEVS=0D
  hw/ide/via: Connect IDE function output IRQs to the ISA function input=0D
  hw/southbridge/vt82c686: Introduce VT82C686B_SOUTHBRIDGE=0D
=0D
 hw/ide/via.c               |  31 ++++++++---=0D
 hw/isa/vt82c686.c          |  27 +++++-----=0D
 hw/mips/fuloong2e.c        |  35 +++---------=0D
 hw/southbridge/vt82c686.c  | 107 +++++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                |   1 +=0D
 hw/Kconfig                 |   1 +=0D
 hw/isa/Kconfig             |   9 ----=0D
 hw/meson.build             |   1 +=0D
 hw/southbridge/Kconfig     |   8 +++=0D
 hw/southbridge/meson.build |   1 +=0D
 10 files changed, 164 insertions(+), 57 deletions(-)=0D
 create mode 100644 hw/southbridge/vt82c686.c=0D
 create mode 100644 hw/southbridge/Kconfig=0D
 create mode 100644 hw/southbridge/meson.build=0D
=0D
-- =0D
2.26.3=0D
=0D

