Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9092F2F0E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:31:43 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIpp-0002gT-9V
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzInU-0001HF-9O
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:29:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzInR-00057R-T9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610454552;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jQGidC2sOpDr35xwQmDFHz8VGSyCIDFNFbnsXC2qRGY=;
 b=JiG0kkZ8mhwtYF/OrTT3D8GNPWgEAwnhJApzOQfCGTIaciHnnTZ2X3sbFigRBdMDsvyCvl
 w/q2Fr8QKPvVbMM2uifH0s6gI3ImnYHWJIBSlLXEpS4tEpGl380CpBAQXKF1ow6VuGVMwo
 8sdfUBM1DzDwnBxnFRIhfYYttXMJg3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-MIPxACGwMGyXqTQ7agkXZQ-1; Tue, 12 Jan 2021 07:29:06 -0500
X-MC-Unique: MIPxACGwMGyXqTQ7agkXZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29547100947F;
 Tue, 12 Jan 2021 12:29:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D79B5D9CD;
 Tue, 12 Jan 2021 12:29:03 +0000 (UTC)
Date: Tue, 12 Jan 2021 12:29:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
Message-ID: <20210112122900.GH1360503@redhat.com>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
 <2315616.PpvBb8DKss@silver>
MIME-Version: 1.0
In-Reply-To: <2315616.PpvBb8DKss@silver>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Olaf Hering <olaf@aepfle.de>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 01:26:00PM +0100, Christian Schoenebeck via wrote:
> On Dienstag, 12. Januar 2021 10:51:10 CET Olaf Hering wrote:
> > Depending on the build environment, the meson test to find a suitable
> > libattr fails. Something appends -O0 to CFLAGS.
> > 
> > I see no "-O0" in qemu.git. This is a regression, it worked in
> > 553032db17440f8de011390e5a1cfddd13751b0b.
> > 
> > Does anyone happen to know what is causing this?
> 
> Putting Paolo in CC in case he's got some suspicion. I don't see something 
> obvious right now.
> Olaf, could you run a 'git bisect' to identify the relevant commit causing 
> this?

The -O0 might come from a pkg-config file

$BUILD_DIR/meson-logs/meson-log.txt

might show where it comes from.

> 
> > 
> > Olaf
> > 
> > ./configure --host=x86_64-suse-linux-gnu --build=x86_64-suse-linux-gnu
> > --program-prefix= --disable-dependency-tracking --prefix=/usr
> > --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc
> > --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib64
> > --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/var/lib
> > --mandir=/usr/share/man --infodir=/usr/share/info
> > --disable-dependency-tracking --cc=/usr/bin/gcc-10
> > --host-cc=/usr/bin/gcc-10 --cxx=/usr/bin/g++-10
> > --docdir=/usr/share/doc/packages --firmwarepath=/usr/share/qemu/firmware
> > '--target-list=i386-softmmu x86_64-softmmu' '--audio-drv-list=alsa pa'
> > --iasl=/usr/bin/iasl --install=/usr/bin/install --objcc=/usr/bin/false
> > --python=/usr/bin/python3 --ninja=/usr/bin/ninja --tls-priority=NORMAL
> > --with-git=/usr/bin/false --with-suffix=qemu --disable-docs --disable-gtk
> > --disable-libnfs --disable-opengl --disable-rbd --disable-spice
> > --disable-virglrenderer --disable-vte --enable-attr --disable-brlapi
> > --disable-bsd-user --enable-bzip2 --enable-cap-ng --disable-capstone
> > --disable-cocoa --enable-coroutine-pool --disable-crypto-afalg
> > --enable-curl --enable-curses --disable-debug-info --disable-debug-mutex
> > --disable-debug-tcg --with-default-devices --enable-docs --disable-fdt
> > --enable-gcrypt --enable-gettext --disable-git-update --disable-glusterfs
> > --enable-gnutls --enable-gtk --enable-guest-agent --disable-guest-agent-msi
> > --disable-hax --disable-hvf --enable-iconv --disable-jemalloc
> > --disable-keyring --enable-kvm --disable-libdaxctl --disable-libiscsi
> > --enable-libnfs --enable-libssh --enable-libusb --enable-libxml2
> > --enable-linux-aio --disable-linux-user --enable-live-block-migration
> > --disable-lzo --disable-lzfse --disable-malloc-trim --disable-membarrier
> > --enable-modules --disable-mpath --disable-netmap --disable-nettle
> > --enable-numa --enable-opengl --enable-pie --enable-plugins
> > --disable-qom-cast-debug --enable-rbd --disable-rdma --enable-replication
> > --enable-rng-none --disable-safe-stack --disable-sanitizers --disable-sdl
> > --disable-sdl-image --disable-seccomp --disable-slirp --disable-smartcard
> > --disable-snappy --disable-sparse --enable-spice --enable-stack-protector
> > --disable-strip --enable-system --enable-tcg --disable-tcg-interpreter
> > --disable-tcmalloc --enable-tools --disable-tpm --disable-tsan
> > --disable-u2f --enable-usb-redir --disable-user --enable-vde
> > --enable-vhost-crypto --enable-vhost-net --enable-vhost-scsi
> > --enable-vhost-user --enable-vhost-user-fs --enable-vhost-vsock
> > --enable-virglrenderer --enable-virtfs --disable-virtiofsd --enable-vnc
> > --disable-vnc-jpeg --enable-vnc-png --disable-vnc-sasl --enable-vte
> > --disable-werror --disable-whpx --enable-xen --enable-xen-pci-passthrough
> > --enable-xfsctl ....
> > [  223s] Run-time dependency libnfs found: YES 4.0.0
> > [  223s] None of 'CC_LD' are defined in the environment, not changing global
> > flags. [  223s] Running compile:
> > [  223s] Working directory: 
> > /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> > vate/tmpg908fqs3 [  223s] Command line:  /usr/bin/gcc-10
> > -I/usr/include/ncursesw
> > /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> > vate/tmpg908fqs3/testfile.c -o
> > /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> > vate/tmpg908fqs3/output.exe -pipe -O2 -Wall -D_FORTIFY_SOURCE=2
> > -fstack-protector-strong -funwind-tables -fasynchronous-unwind-tables
> > -fstack-clash-protection -Werror=return-type -g -D_FILE_OFFSET_BITS=64 -O0
> > -std=gnu99 [  223s]
> > [  223s] Code:
> > [  223s]
> > [  223s]   #include <stddef.h>
> > [  223s]   #include <sys/types.h>
> > [  223s]   #ifdef CONFIG_LIBATTR
> > [  223s]   #include <attr/xattr.h>
> > [  223s]   #else
> > [  223s]   #include <sys/xattr.h>
> > [  223s]   #endif
> > [  223s]   int main(void) { getxattr(NULL, NULL, NULL, 0); setxattr(NULL,
> > NULL, NULL, 0, 0); return 0; } [  223s] Compiler stdout:
> > [  223s]
> > [  223s] Compiler stderr:
> > [  223s]  In file included from /usr/include/sys/types.h:25,
> > [  223s]                  from
> > /home/abuild/rpmbuild/BUILD/qemu-20210111T151535.b3f846c59d/build/meson-pri
> > vate/tmpg908fqs3/testfile.c:3: [  223s] /usr/include/features.h:397:4:
> > warning: #warning _FORTIFY_SOURCE requires compiling with optimization (-O)
> > [-Wcpp] [  223s]   397 | #  warning _FORTIFY_SOURCE requires compiling with
> > optimization (-O) [  223s]       |    ^~~~~~~
> > [  223s]
> > [  223s] Dependency libseccomp skipped: feature seccomp disabled
> > ....
> 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


