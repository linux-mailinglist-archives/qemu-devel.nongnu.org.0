Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EC3E0388
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:42:22 +0200 (CEST)
Received: from localhost ([::1]:52448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBI69-0002yw-OS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI2m-00046a-6n
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI2f-0002D8-Mr
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p6d17G2f/vY6Ohutt77Uwcqq6xVqFidX+CoxKbVzyPE=;
 b=cLrl6hB9r6KJa6dO2HlEBZbvf7Vy3O0Ya4ft+5/+zInlSGHdasiHgfijKZZCBa7sfoIOja
 1v+UApix60VUynBI5av0hdPI64CIR6h7S030D/3xS5Al0k97gl4iRUVKyRIyJPtGMJUuI7
 t4aPpGMvMg45mhPy9cqF2eKV7NRb000=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-lCpcxupgMoOhJMbThaXKxA-1; Wed, 04 Aug 2021 10:38:42 -0400
X-MC-Unique: lCpcxupgMoOhJMbThaXKxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5DBC87D543;
 Wed,  4 Aug 2021 14:38:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4DB5D9C6;
 Wed,  4 Aug 2021 14:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 288611800983; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] tcg: some small towards more modular tcg
Date: Wed,  4 Aug 2021 16:38:19 +0200
Message-Id: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Gerd Hoffmann (7):=0D
  plugins: register qemu_plugin_opts using opts_init()=0D
  tcg/module: move hmp.c to tcg module=0D
  tcg/module: move cpu-exec-common.c from tcg_ss to specific_ss=0D
  tcg/module: add some infrastructure for modular tcg.=0D
  tcg/module: Add tlb_flush to TCGModuleOps=0D
  tcg/module: Add tlb_flush_page to TCGModuleOps=0D
  tcg/module: Add tlb_reset_dirty to TCGModuleOps=0D
=0D
 include/exec/exec-all.h       |  8 +-------=0D
 include/qemu/plugin.h         |  7 -------=0D
 include/tcg/tcg-module.h      | 15 +++++++++++++++=0D
 accel/tcg/cpu-exec-common.c   |  8 ++++++++=0D
 accel/tcg/cputlb.c            | 11 ++++++++++-=0D
 accel/tcg/tcg-module.c        | 24 ++++++++++++++++++++++++=0D
 accel/tcg/translate-all.c     |  8 --------=0D
 cpu.c                         |  2 +-=0D
 linux-user/main.c             |  2 +-=0D
 plugins/loader.c              |  9 ++++++++-=0D
 softmmu/physmem.c             | 12 ++++++------=0D
 softmmu/vl.c                  |  1 -=0D
 target/arm/helper.c           | 26 +++++++++++++-------------=0D
 target/i386/helper.c          |  8 ++++----=0D
 target/i386/machine.c         |  2 +-=0D
 target/i386/tcg/fpu_helper.c  |  2 +-=0D
 target/i386/tcg/misc_helper.c |  2 +-=0D
 target/mips/sysemu/cp0.c      |  2 +-=0D
 target/s390x/gdbstub.c        |  2 +-=0D
 target/s390x/sigp.c           |  2 +-=0D
 accel/tcg/meson.build         | 11 +++++++++--=0D
 21 files changed, 106 insertions(+), 58 deletions(-)=0D
 create mode 100644 include/tcg/tcg-module.h=0D
 create mode 100644 accel/tcg/tcg-module.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


