Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2E37A25C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:41:56 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNxj-0000fR-R3
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXF-00027C-1H
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWs-0000pn-3f
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5HFBj0dQS8/s20bsHUXmaBQQ//ExnZWYXR9CSg98Uk=;
 b=dMcT3yPL49HP0X+hYdFgk7jNxLUiOXumNsRJ81ivXfuK3Rsw/aX/9fT6V1MKYyRxbIZJ/V
 tdIqsPbO/a7RxlZBKC6CAJxVQYpQ9PgbSa7rNmwnFryUAo5oKq2yiS8jflz9SClphXPiuO
 n9UDxiBycoTj+6J75X7T46oGTgYG4G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-hq1RcLOpN2WAH66b5u0SHA-1; Tue, 11 May 2021 04:14:07 -0400
X-MC-Unique: hq1RcLOpN2WAH66b5u0SHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D1648015C6;
 Tue, 11 May 2021 08:14:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 055C562499;
 Tue, 11 May 2021 08:14:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] coverity-scan: list components,
 move model to scripts/coverity-scan
Date: Tue, 11 May 2021 04:13:50 -0400
Message-Id: <20210511081350.419428-34-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Place all files that can be useful to rebuild the Coverity
configuration in scripts/coverity-scan: the existing model
file, and the components setup.

The Markdown syntax was tested with Pandoc (but in any case
is meant more as a human-readable reference than as a part
of documentation).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md           | 154 ++++++++++++++++++
 .../model.c}                                  |   0
 2 files changed, 154 insertions(+)
 create mode 100644 scripts/coverity-scan/COMPONENTS.md
 rename scripts/{coverity-model.c => coverity-scan/model.c} (100%)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
new file mode 100644
index 0000000000..02a3447dab
--- /dev/null
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -0,0 +1,154 @@
+This is the list of currently configured Coverity components:
+
+alpha
+  ~ (/qemu)?((/include)?/hw/alpha/.*|/target/alpha/.*)
+
+arm
+  ~ (/qemu)?((/include)?/hw/arm/.*|(/include)?/hw/.*/(arm|allwinner-a10|bcm28|digic|exynos|imx|omap|stellaris|pxa2xx|versatile|zynq|cadence).*|/hw/net/xgmac.c|/hw/ssi/xilinx_spips.c|/target/arm/.*)
+
+avr
+  ~ (/qemu)?((/include)?/hw/avr/.*|/target/avr/.*)
+
+cris
+  ~ (/qemu)?((/include)?/hw/cris/.*|/target/cris/.*)
+
+hexagon
+  ~ (/qemu)?(/target/hexagon/.*)
+
+hppa
+  ~ (/qemu)?((/include)?/hw/hppa/.*|/target/hppa/.*)
+
+i386
+  ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
+
+lm32
+  ~ (/qemu)?((/include)?/hw/lm32/.*|/target/lm32/.*|/hw/.*/(milkymist|lm32).*)
+
+m68k
+  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
+
+microblaze
+  ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)
+
+mips
+  ~ (/qemu)?((/include)?/hw/mips/.*|/target/mips/.*)
+
+nios2
+  ~ (/qemu)?((/include)?/hw/nios2/.*|/target/nios2/.*)
+
+ppc
+  ~ (/qemu)?((/include)?/hw/ppc/.*|/target/ppc/.*|/hw/pci-host/(uninorth.*|dec.*|prep.*|ppc.*)|/hw/misc/macio/.*|(/include)?/hw/.*/(xics|openpic|spapr).*)
+
+riscv
+  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*)
+
+rx
+  ~ (/qemu)?((/include)?/hw/rx/.*|/target/rx/.*)
+
+s390
+  ~ (/qemu)?((/include)?/hw/s390x/.*|/target/s390x/.*|/hw/.*/s390_.*)
+
+sh4
+  ~ (/qemu)?((/include)?/hw/sh4/.*|/target/sh4/.*)
+
+sparc
+  ~ (/qemu)?((/include)?/hw/sparc(64)?.*|/target/sparc/.*|/hw/.*/grlib.*|/hw/display/cg3.c)
+
+tilegx
+  ~ (/qemu)?(/target/tilegx/.*)
+
+tricore
+  ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
+
+unicore32
+  ~ (/qemu)?((/include)?/hw/unicore32/.*|/target/unicore32/.*)
+
+9pfs
+  ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)
+
+audio
+  ~ (/qemu)?((/include)?/(audio|hw/audio)/.*)
+
+block
+  ~ (/qemu)?(/block.*|(/include?)(/hw)?/(block|storage-daemon)/.*|(/include)?/hw/ide/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
+
+char
+  ~ (/qemu)?(/qemu-char\.c|/include/sysemu/char\.h|(/include)?/hw/char/.*)
+
+capstone
+  ~ (/qemu)?(/capstone/.*)
+
+crypto
+  ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
+
+disas
+  ~ (/qemu)?((/include)?/disas.*)
+
+fpu
+  ~ (/qemu)?((/include)?(/fpu|/libdecnumber)/.*)
+
+io
+  ~ (/qemu)?((/include)?/io/.*)
+
+ipmi
+  ~ (/qemu)?((/include)?/hw/ipmi/.*)
+
+libvixl
+  ~ (/qemu)?(/disas/libvixl/.*)
+
+migration
+  ~ (/qemu)?((/include)?/migration/.*)
+
+monitor
+  ~ (/qemu)?(/qapi.*|/qobject/.*|/monitor\..*|/[hq]mp\..*)
+
+nbd
+  ~ (/qemu)?(/nbd/.*|/include/block/nbd.*|/qemu-nbd\.c)
+
+net
+  ~ (/qemu)?((/include)?(/hw)?/(net|rdma)/.*)
+
+pci
+  ~ (/qemu)?(/hw/pci.*|/include/hw/pci.*)
+
+qemu-ga
+  ~ (/qemu)?(/qga/.*)
+
+scsi
+  ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
+
+slirp
+  ~ (/qemu)?(/.*slirp.*)
+
+tcg
+  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
+
+trace
+  ~ (/qemu)?(/.*trace.*\.[ch])
+
+ui
+  ~ (/qemu)?((/include)?(/ui|/hw/display|/hw/input)/.*)
+
+usb
+  ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
+
+user
+  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
+
+util
+  ~ (/qemu)?(/util/.*|/include/qemu/.*)
+
+xen
+  ~ (/qemu)?(.*/xen.*)
+
+virtiofsd
+  ~ (/qemu)?(/tools/virtiofsd/.*)
+
+(headers)
+  ~ (/qemu)?(/include/.*)
+
+testlibs
+  ~ (/qemu)?(/tests/qtest(/libqos/.*|/libqtest.*))
+
+tests
+  ~ (/qemu)?(/tests/.*)
diff --git a/scripts/coverity-model.c b/scripts/coverity-scan/model.c
similarity index 100%
rename from scripts/coverity-model.c
rename to scripts/coverity-scan/model.c
-- 
2.26.2


