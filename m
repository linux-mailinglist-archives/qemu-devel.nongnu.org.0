Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80B2C105C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:35:36 +0100 (CET)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khEoR-0006fR-RT
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khEmf-0005hR-0E
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khEmc-0006j1-4v
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 11:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606149220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYUaOtNN0mP87+ukQ8igK5CMAsL7ueGEu/E1MqzVCKQ=;
 b=V91xmwHFbXlEiiu+sc/YE8owCFo2MeuvHPtHAeyoFpCbvNOAFGeILitXfLIHhaXcwJXUHp
 +H6povV3CR5CZ7KEu/6wL6+vlg2LDloJLkcJHlMb9M3mrgg0i0KifZi2TVYO4PlNsN+rdG
 AWldpRsRMdvvMMDpPJZYalwcHSMTDs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-Dd7q9m7JNvO3ZpR2Nqr07Q-1; Mon, 23 Nov 2020 11:33:36 -0500
X-MC-Unique: Dd7q9m7JNvO3ZpR2Nqr07Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 052708042B1;
 Mon, 23 Nov 2020 16:33:35 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 951555C1C2;
 Mon, 23 Nov 2020 16:33:34 +0000 (UTC)
Date: Mon, 23 Nov 2020 09:33:14 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 1/1] Fix to show vfio migration stat in migration status
Message-ID: <20201123093314.10419cf4@w520.home>
In-Reply-To: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
References: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, cjia@nvidia.com, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 01:58:47 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Header file where CONFIG_VFIO is defined is not included in migration.c
> file. Include config devices header file in migration.c.
> 
> Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
> stats")
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  meson.build           | 1 +
>  migration/migration.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 7ddf983ff7f5..24526499cfb5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>  
>  common_all = common_ss.apply(config_all, strict: false)
>  common_all = static_library('common',
> +                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
>                              build_by_default: false,
>                              sources: common_all.sources() + genh,
>                              dependencies: common_all.dependencies(),
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83f4..650efb81daad 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -57,6 +57,7 @@
>  #include "qemu/queue.h"
>  #include "multifd.h"
>  
> +#include CONFIG_DEVICES
>  #ifdef CONFIG_VFIO
>  #include "hw/vfio/vfio-common.h"
>  #endif

Fails to build...

[1705/8465] Compiling C object libcommon.fa.p/migration_postcopy-ram.c.o
[1706/8465] Compiling C object libcommon.fa.p/migration_migration.c.o
FAILED: libcommon.fa.p/migration_migration.c.o 
cc -Ilibcommon.fa.p -I. -I.. -I../slirp -I../slirp/src -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/libpng16 -I/usr/include/capstone -I/usr/include/SDL2 -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/harfbuzz -I/usr/include/fribidi -I/usr/include/freetype2 -I/usr/include/cairo -I/usr/include/pixman-1 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0 -I/usr/include/spice-1 -I/usr/include/spice-server -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/vte-2.91 -I/usr/include/virgl -I/usr/include/libusb-1.0 -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -std=gnu99 -O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredu
 ndant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -isystem /tmp/tmp.HlKsni7iGC/linux-headers -isystem linux-headers -iquote /tmp/tmp.HlKsni7iGC/tcg/i386 -iquote . -iquote /tmp/tmp.HlKsni7iGC -iquote /tmp/tmp.HlKsni7iGC/accel/tcg -iquote /tmp/tmp.HlKsni7iGC/include -iquote /tmp/tmp.HlKsni7iGC/disas/libvixl -pthread -fPIC -DSTRUCT_IOVEC_DEFINED -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -Wno-undef -D_REENTRANT '-DCONFIG_DEVICES="xtensa-linux-user-config-devices.h"' -MD -MQ libcommon.fa.p/migration_migration.c.o -MF libcommon.fa.p/migration_migration.c.o.d -o libcommon.fa.p/migration_migration.c.o -c ../migration/migration.c
<command-line>: fatal error: xtensa-linux-user-config-devices.h: No such file or directory
compilation terminated.
[1707/8465] Compiling C object libcommon.fa.p/hw_pci-bridge_dec.c.o
[1708/8465] Compiling C object libcommon.fa.p/backends_hostmem-memfd.c.o
[1709/8465] Compiling C object libcommon.fa.p/hw_display_edid-region.c.o
[1710/8465] Compiling C object libcommon.fa.p/ui_gtk-gl-area.c.o
[1711/8465] Compiling C object libcommon.fa.p/disas_s390.c.o
[1712/8465] Compiling C object libcommon.fa.p/hw_pci-host_gpex-acpi.c.o
[1713/8465] Compiling C object libcommon.fa.p/hw_misc_macio_macio.c.o
[1714/8465] Compiling C object libcommon.fa.p/hw_misc_bcm2835_mbox.c.o
[1715/8465] Compiling C object libcommon.fa.p/hw_pci-bridge_xio3130_upstream.c.o
[1716/8465] Compiling C object libcommon.fa.p/hw_display_qxl-logger.c.o
[1717/8465] Compiling C object libcommon.fa.p/hw_net_net_tx_pkt.c.o
[1718/8465] Compiling C object libcommon.fa.p/hw_char_xen_console.c.o
[1719/8465] Compiling C object libqemu-mips64el-softmmu.fa.p/target_mips_msa_helper.c.o
[1720/8465] Compiling C object libqemu-mips64el-softmmu.fa.p/target_mips_translate.c.o
[1721/8465] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:171: run-ninja] Error 1
make[1]: Leaving directory '/tmp/tmp.HlKsni7iGC/build'
make: *** [GNUmakefile:11: all] Error 2


