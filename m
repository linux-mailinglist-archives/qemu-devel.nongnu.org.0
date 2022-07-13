Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32722573116
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:28:05 +0200 (CEST)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXj1-0007Vu-8y
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZW-0005cH-Pq
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:14 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZU-0004mw-1d
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:14 -0400
Received: by mail-ed1-x52c.google.com with SMTP id fd6so13100708edb.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TsQkvWvy9rR281aclrHcJiJxmz0ne6wj08lCmwkqTXA=;
 b=CtsK37mNTFD9IwyfANbx+Xuj6hImAM1V5fFzprWgo5QtYPb9HsOFH7vc7GZJoksAGF
 /AlaVQScJW5tBR0l60czicr9SR3sNfOKaNDF0nNISSBD8tAuum7SQT07k9qcspC5XJ+F
 vrxotQrA4X9VRw7XEKXNZ6r1KbDuc0v15nQ4Aox141dPeR7N0mXP6kGa784I0qoURGUx
 VH0BpcA7YDlJIWhYsWJOdbiHgs/1OY0JmeZujV2q+YwhPW5PkwQ4X3o76tf2H9CeEw9e
 VnM4ZaMK7fIii1ylUoOO9L/o3qAXdsB1DvHH34HZqPhI4QWqbWYvMxedQdWl0FEXQflZ
 3glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TsQkvWvy9rR281aclrHcJiJxmz0ne6wj08lCmwkqTXA=;
 b=deYtpdHy9sVL0jCzHgeZLfsSNnO+63+2gRDom9Muj8K5lDn355frLBlChRldy27u9M
 4kdq/aaX4VZAR2KiibgpuU/O3AmVr1/ZqKZBTEMkNyD3Rznx57PK473obnuKKHwk9QW/
 9C/v/0Kr72xDSiciNhQORlyAFlZgSUJS5jOeB8QPV0XL1jBAjjO2vKFblZzTp5lbMUrL
 iyOiXvzwLQSiHv5y27bNglmkgHI2U4tt2qFKXnyz+XoJW0i+36kNT4tmR4A7u41j8rLi
 egpV9MNuz5zk+rg0Y4pL5jTrMeVCJnD55QilOOuN6o0H04AVOHlLqz0+5eCitDON9u9K
 vDuA==
X-Gm-Message-State: AJIora84zyv8+Rzi2j+cXmOuwLZY5t63LNd/9mX2auodpeUfJrejqwRQ
 +maywoU0IXB96PrjYVr+vvsQwfqQpkA=
X-Google-Smtp-Source: AGRyM1v73Ed8ZHj1D0zvkg77g5PO2wyYRpCHGZ656tDYf65ATZlFENLd+TmG+ZNWTTLeO6xPElZ0NA==
X-Received: by 2002:a05:6402:40d6:b0:43a:cc69:1db9 with SMTP id
 z22-20020a05640240d600b0043acc691db9mr3193915edb.380.1657700289959; 
 Wed, 13 Jul 2022 01:18:09 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:09 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/11] QOM'ify PIIX3 southbridge
Date: Wed, 13 Jul 2022 10:17:24 +0200
Message-Id: <20220713081735.112016-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Similar to PIIX4 this series QOM'ifies internal device creation for PIIX3.=
=0D
This reduces the delta between the implementations of PIIX3 and PIIX4 and=0D
therefore might allow to merge both implementations in the future.=0D
=0D
There were two challenges in this series:=0D
=0D
First, QEMU considers the ACPI and USB functions to be optional in PIIX3.=0D
When instantiating those with object_initialize_child(), they need to be=0D
unparented in the realize function to prevent an assertion (see respective=
=0D
commit messages).=0D
=0D
Second, the PIC used to be instantiated outside of the southbridge while=0D
some sub functions require a PIC with populated qemu_irqs. This has been=0D
solved by introducing a proxy PIC which furthermore allows PIIX3 to be=0D
agnostic towards the virtualization technology used (KVM, TCG, Xen).=0D
=0D
Testing done:=0D
* make check=0D
* make check-avocado=0D
* Boot live CD:=0D
  * qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-=
21.3.2-220704-linux515.iso=0D
  * qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde=
-21.3.2-220704-linux515.iso=0D
=0D
Bernhard Beschow (11):=0D
  hw/i386/pc: QOM'ify DMA creation=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    southbridge=0D
  hw/isa/piix3: QOM'ify USB controller creation=0D
  hw/isa/piix3: QOM'ify ACPI controller creation=0D
  hw/i386/pc: QOM'ify RTC creation=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/intc/i8259: Introduce i8259 proxy "isa-pic"=0D
  hw/isa/piix3: QOM'ify ISA PIC creation=0D
  hw/isa/piix3: QOM'ify IDE controller creation=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Remove extra ';' outside of functions=0D
=0D
 hw/i386/Kconfig               |  1 -=0D
 hw/i386/pc.c                  | 17 ++++---=0D
 hw/i386/pc_piix.c             | 70 ++++++++++++++++-------------=0D
 hw/i386/pc_q35.c              |  3 +-=0D
 hw/intc/i8259.c               | 27 +++++++++++=0D
 hw/isa/Kconfig                |  1 +=0D
 hw/isa/lpc_ich9.c             | 11 +++++=0D
 hw/isa/piix3.c                | 84 ++++++++++++++++++++++++++++++++---=0D
 include/hw/i386/ich9.h        |  2 +=0D
 include/hw/i386/pc.h          |  2 +-=0D
 include/hw/intc/i8259.h       | 14 ++++++=0D
 include/hw/southbridge/piix.h | 16 ++++++-=0D
 12 files changed, 201 insertions(+), 47 deletions(-)=0D
=0D
-- =0D
2.37.1=0D
=0D

