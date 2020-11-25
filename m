Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580982C4969
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 21:59:28 +0100 (CET)
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki1ss-0001TW-IN
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 15:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qN-0000DD-83
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qK-0003IQ-BY
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 15:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vp6Wlim5SVLgfNFkuevppBSy6qdGHTfmXHKH6O+OyEo=;
 b=VBmmV1M+9DJVpxHS49ktkos2zZEAAf5KEq6P25bM52Q1aZMzNjMsjBfhL7Zr3jf8kZqZAR
 iVzXPU4TbOXOJkP+c1zATXu7pR1tzUrSBWW3hrutBlOCfBoyUhc3rvJXxKjnoHRrXrb+zE
 6G+pTjqaFZwyvFxR2cfrxwEglCIgRMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-sYDDhkpBNhWcQPmTTXmxTw-1; Wed, 25 Nov 2020 15:56:42 -0500
X-MC-Unique: sYDDhkpBNhWcQPmTTXmxTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815979CC0D
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 20:56:41 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F75B60855;
 Wed, 25 Nov 2020 20:56:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] arch_init.c cleanup
Date: Wed, 25 Nov 2020 15:56:30 -0500
Message-Id: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series gets rid of most of the code in arch_init.c.  It=0D
moves the QEMU_ARCH macro definitions to corresponding cpu.h=0D
files, and gets rid of kvm_available() and xen_available().=0D
=0D
After this series, only two things remain in arch_init.c:=0D
- the arch_type variable, which seems to be a useful feature; and=0D
- the initialization of graphic_width/graphic_height/graphic_depth,=0D
  which is a hack we must eventually get rid of.=0D
=0D
Gerd got rid of the graphic_* initialization hack once (in 2017),=0D
but the series was never merged:=0D
https://lore.kernel.org/qemu-devel/1487715299-21102-5-git-send-email-kraxel=
@redhat.com=0D
=0D
Eduardo Habkost (6):=0D
  arch_init: Move QEMU_ARCH definitions to cpu.h=0D
  accel: accel_available() function=0D
  kvm: Remove kvm_available() function=0D
  xen: Delete xen_available() function=0D
  Remove unnecessary usage of arch_init.h=0D
  Rename arch_init.h to arch_type.h=0D
=0D
 include/sysemu/accel.h                      |  1 +=0D
 include/sysemu/{arch_init.h =3D> arch_type.h} |  3 -=0D
 target/alpha/cpu.h                          |  1 +=0D
 target/arm/cpu.h                            |  1 +=0D
 target/avr/cpu.h                            |  1 +=0D
 target/cris/cpu.h                           |  1 +=0D
 target/hppa/cpu.h                           |  1 +=0D
 target/i386/cpu.h                           |  1 +=0D
 target/lm32/cpu.h                           |  1 +=0D
 target/m68k/cpu.h                           |  1 +=0D
 target/microblaze/cpu.h                     |  1 +=0D
 target/mips/cpu.h                           |  1 +=0D
 target/moxie/cpu.h                          |  1 +=0D
 target/nios2/cpu.h                          |  1 +=0D
 target/openrisc/cpu.h                       |  1 +=0D
 target/ppc/cpu.h                            |  1 +=0D
 target/riscv/cpu.h                          |  1 +=0D
 target/rx/cpu.h                             |  1 +=0D
 target/s390x/cpu.h                          |  1 +=0D
 target/sh4/cpu.h                            |  1 +=0D
 target/sparc/cpu.h                          |  1 +=0D
 target/tricore/cpu.h                        |  1 +=0D
 target/unicore32/cpu.h                      |  1 +=0D
 target/xtensa/cpu.h                         |  1 +=0D
 accel/accel.c                               |  6 +-=0D
 blockdev.c                                  |  2 +-=0D
 hw/i386/pc.c                                |  1 -=0D
 hw/i386/pc_piix.c                           |  1 -=0D
 hw/i386/pc_q35.c                            |  1 -=0D
 hw/mips/jazz.c                              |  1 -=0D
 hw/mips/malta.c                             |  1 -=0D
 hw/ppc/prep.c                               |  1 -=0D
 hw/riscv/sifive_e.c                         |  1 -=0D
 hw/riscv/sifive_u.c                         |  1 -=0D
 hw/riscv/spike.c                            |  1 -=0D
 hw/riscv/virt.c                             |  1 -=0D
 monitor/qmp-cmds.c                          |  3 +-=0D
 softmmu/arch_init.c                         | 66 +--------------------=0D
 softmmu/qdev-monitor.c                      |  2 +-=0D
 softmmu/vl.c                                |  8 +--=0D
 stubs/arch_type.c                           |  2 +-=0D
 target/i386/cpu.c                           |  1 -=0D
 target/s390x/cpu.c                          |  1 -=0D
 target/s390x/cpu_models.c                   |  1 -=0D
 target/ppc/translate_init.c.inc             |  1 -=0D
 45 files changed, 37 insertions(+), 92 deletions(-)=0D
 rename include/sysemu/{arch_init.h =3D> arch_type.h} (94%)=0D
=0D
--=20=0D
2.28.0=0D
=0D


