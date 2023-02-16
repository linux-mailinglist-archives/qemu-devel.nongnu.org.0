Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6016993D4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:04:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScys-0001Uh-Sk; Thu, 16 Feb 2023 07:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pScyr-0001UQ-CY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:03:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pScyl-0003iI-QY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:03:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676548991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uQPVSRaSLmsg7yFgNbBIw5NLid76ue0wQb89zs7fWFQ=;
 b=aI1336eac+AJnsueVgYUgVjGRT0vgYC4uyajVanKLSC/X8TYMRT4D2bbYM0RKS19jXuXl3
 Uy4/PcwOxgy/4ka6QE7GymEtGLmApsiZ8SKy/V2b3QevEjh+QxsRILrANIlvEhuINL2wLn
 WusZL5ghIgcnu/b1sGdW45LJUaIpD/Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-Op9ILKisPv-mMrsM_1Z5rQ-1; Thu, 16 Feb 2023 07:03:07 -0500
X-MC-Unique: Op9ILKisPv-mMrsM_1Z5rQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 784D41C08973;
 Thu, 16 Feb 2023 12:03:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BABF2026D4B;
 Thu, 16 Feb 2023 12:03:05 +0000 (UTC)
Date: Thu, 16 Feb 2023 12:03:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] qemu: make version available in coredump
Message-ID: <Y+4bd1ao+o1ZLmTP@redhat.com>
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
 <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
 <Y+368RcZsG+t7SjW@redhat.com>
 <56843688-7985-2e54-de54-817298f213eb@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56843688-7985-2e54-de54-817298f213eb@yandex-team.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 02:30:16PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 16.02.23 12:44, Daniel P. Berrangé wrote:
> > On Wed, Feb 15, 2023 at 05:05:47PM -0500, Stefan Hajnoczi wrote:
> > > On Tue, 7 Jun 2022 at 16:33, Vladimir Sementsov-Ogievskiy
> > > <vsementsov@yandex-team.ru> wrote:
> > > > 
> > > > Add a variable with QEMU_FULL_VERSION definition. Then the content of
> > > > the variable is easily searchable:
> > > > 
> > > >     strings /path/to/core | grep QEMU_FULL_VERSION
> > > > 
> > > > 'volatile' keyword is used to avoid removing the variable by compiler as
> > > > unused.
> > > > 
> > > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > > ---
> > > > 
> > > > Hi all!
> > > > 
> > > > Probably, I just don't know the correct way to get version from core
> > > > file. If so, please teach me :)
> > > 
> > > I've never hit this issue because bug reports usually include the QEMU
> > > distro package version. Keeping the version string in the core file
> > > seems reasonable (unless there is already another way to do this).
> > > 
> > > Something I'm curious about: is the coredump guaranteed to contain
> > > static const variables? I wondered if they might be located in the
> > > .rodata ELF section and excluded from the coredump because they are
> > > referenced in the NT_FILE mmap note instead. Maybe volatile prevents
> > > this?
> > 
> > In Fedora / RHEL based systems (and some other distros too IIUC) for
> > many years, all binaries have included a "build-id" ELF note which
> > uniquely identifies the package build.
> > 
> > Note section [ 3] '.note.gnu.build-id' of 36 bytes at offset 0x3c0:
> >    Owner          Data size  Type
> >    GNU                   20  GNU_BUILD_ID
> >      Build ID: e3143405b7f653a0a65b3295df760fdf2c09ba79
> > 
> > This can be used to query what RPM it came from (assuming the RPM
> > is still in your repos)
> > 
> >   dnf repoquery --whatprovides debuginfo(build-id) = ...hash...
> > 
> > this makes it into the coredump files and is what current distro
> > tooling uses to find the binary (and libraries).
> > 
> > There are some downsides/limitations with this though, so in
> > Fedora 36 a new impl was added alongside which provides full
> > package info in json
> > 
> > Note section [ 5] '.note.package' of 136 bytes at offset 0x404:
> >    Owner          Data size  Type
> >    FDO                  120  FDO_PACKAGING_METADATA
> >      Packaging Metadata: {"type":"rpm","name":"qemu","version":"7.0.0-13.fc37","architecture":"x86_64","osCpe":"cpe:/o:fedoraproject:fedora:37"}
> 
> Looks very good
> 
> > 
> > This format is supported by systemd core dump tools
> > 
> >    https://systemd.io/ELF_PACKAGE_METADATA/
> > 
> > I believe it has been proposed (and possibly implemented?) for
> > Debian too.
> > 
> > This is a long winded way of asking, do we really need a QEMU specific
> > solution here ? Especially one that only tells us a QEMU verison, and
> > nothing about the many libraries QEMU links to which affect its
> > operational behaviour.
> 
> 
> Generic solution is of course better.
> 
> Hmm. I'm on Ubuntu 22.04.
> 
> readelf -n /usr/bin/qemu-system-x86_64
> 
> Displaying notes found in: .note.gnu.property
>   Owner                Data size        Description
>   GNU                  0x00000020       NT_GNU_PROPERTY_TYPE_0
>       Properties: x86 feature: IBT, SHSTK
>         x86 ISA needed: x86-64-baseline
> 
> Displaying notes found in: .note.gnu.build-id
>   Owner                Data size        Description
>   GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID bitstring)
>     Build ID: 4298cd7c2623c58e1cd71668d9d48508bb7f8d52
> 
> Displaying notes found in: .note.ABI-tag
>   Owner                Data size        Description
>   GNU                  0x00000010       NT_GNU_ABI_TAG (ABI version tag)
>     OS: Linux, ABI: 3.2.0
> 
> 
> OK. But I can't find this build-id in core file..
> 
> readelf -n /tmp/cores/core.qemu-system-x86.20351.vsementsov-win.1676544081 | grep -i 'build'  ----  gets nothing
> 
> strings /tmp/cores//core.qemu-system-x86.20351.vsementsov-win.1676544081 | grep 4298cd7c2623c58e   ---- nothing as well

I don't understand why that's not visible directly, I guess it must
be encoded in some binary format instead, because at least tools like
eu-unstrip can extract it. eg "

# eu-unstrip -n --core a
0x558ff8145000+0xd3f000 e3143405b7f653a0a65b3295df760fdf2c09ba79@0x558ff81453d0 . - /usr/bin/qemu-system-x86_64
0x7fffdf36e000+0x1000 9ff92e165010e0806172add635849ec55533b287@0x7fffdf36e554 . - linux-vdso.so.1
0x7f00d2e35000+0x6028 e62598a2d2be298ca20184413edea75fc5a3f1d7@0x7f00d2e352f8 /usr/bin/../lib64/qemu/accel-tcg-x86_64.so - accel-tcg-x86_64.so
0x7f00d02bd000+0x432b0 05ba68b0c1f03dd879a78a4a8b75713d7134bdbc@0x7f00d02bd2f8 /usr/lib64/gvfs/libgvfscommon.so - libgvfscommon.so
0x7f00d0301000+0x34300 7c9fd184be4d2c3593d4901feca9fd59c4981d11@0x7f00d03012f8 /usr/lib64/gio/modules/libgvfsdbus.so - libgvfsdbus.so
0x7f00d2e3c000+0xf0e0 08e41432bd5cec0b0dd36158402ce963c711e46f@0x7f00d2e3c2f8 /usr/lib64/gio/modules/libdconfsettings.so - libdconfsettings.so
0x7f00d0491000+0x22008 ee65b3f0999329d66676c60df8ed1feaab83e15f@0x7f00d04912f8 /lib64/libbrotlicommon.so.1 - libbrotlicommon.so.1
0x7f00d094b000+0x8008 73a48146553f6009aea4cbfe65a01fed665c9bed@0x7f00d094b2f8 /lib64/libdatrie.so.1 - libdatrie.so.1
0x7f00d0954000+0x22008 5c9099941d5c7af74f952367da1368a78d06347c@0x7f00d09542f8 /lib64/liblz4.so.1 - liblz4.so.1
0x7f00d0977000+0x9038 f3f24bb6e411e3885602e753eda1e764fc1f5bfb@0x7f00d09772f8 /lib64/libcap.so.2 - libcap.so.2
0x7f00ca200000+0x1d05008 47276216e74b87c4b9bd01ac85c7bf332e6f2aed@0x7f00ca2002c0 /lib64/libicudata.so.71 - libicudata.so.71
0x7f00d0981000+0x5020 5f69b36d838d0ec4967f94dd1ea95fd830262997@0x7f00d09812f8 /lib64/libXau.so.6 - libXau.so.6
0x7f00d0987000+0xc008 5fc05a35af263c2149bb2c0fae2533c2ebe0a225@0x7f00d09872f8 /lib64/libbrotlidec.so.1 - libbrotlidec.so.1
0x7f00d0994000+0x12c08 101a76ab214af7a108f9a601fd298bcf405eff5d@0x7f00d09942f8 /lib64/libbz2.so.1 - libbz2.so.1
0x7f00d04b4000+0x14beb8 931d94ba5734f5d1a4b24af1283af44c786ef5d0@0x7f00d04b42f8 /lib64/libsqlite3.so.0 - libsqlite3.so.0
0x7f00d09a7000+0x2b198 e21ae41532eae88d92bd3b18dd7cba5d3873f960@0x7f00d09a72f8 /lib64/libjson-glib-1.0.so.0 - libjson-glib-1.0.so.0
0x7f00d0600000+0x32e328 f4748e4011f7e0fd328ade31e62bc9167e417b74@0x7f00d06002f8 /lib64/libicui18n.so.71 - libicui18n.so.71
0x7f00d09d3000+0x540a8 a3251522721d67203dd4dbe5166334f6643d16c0@0x7f00d09d32f8 /lib64/libstemmer.so.0 - libstemmer.so.0
0x7f00d0a28000+0x3c4a8 62c94aa0bc23c6d131160f48caaef6afdc7625ca@0x7f00d0a282f8 /lib64/libatspi.so.0 - libatspi.so.0
0x7f00d0a65000+0x542c8 d0687c050fb1599e99195661d70fdbbe6bf9c4b1@0x7f00d0a652f8 /lib64/libdbus-1.so.3 - libdbus-1.so.3
0x7f00d0aba000+0x179728 946e0bba5825d11471d055a39041747e2db65d7a@0x7f00d0aba2f8 /lib64/libxml2.so.2 - libxml2.so.2
0x7f00d0c34000+0x21008 24975d617308ccea1539745afa0ace7a6057f225@0x7f00d0c342f8 /lib64/libgraphite2.so.3 - libgraphite2.so.3
0x7f00d0c56000+0xa870 99e9f4339b7296c8be1d4e1a51049598ffc9af1e@0x7f00d0c562f8 /lib64/libthai.so.0 - libthai.so.0
0x7f00d0c61000+0xdc578 35de99f90f9858bb028b57fa6eef9d8238562527@0x7f00d0c61330 /lib64/libsystemd.so.0 - libsystemd.so.0
0x7f00d0d3e000+0x1fc2a0 f0a97a601f057dd0739c60482ff1b33c5e054456@0x7f00d0d3e2f8 /lib64/libicuuc.so.71 - libicuuc.so.71

> So the case is to find the package not having the binary, only by core file.
> 
> Probably right solution is to fix our workflow so that if you have core file you always have corresponding binary as well.

With debuginfod present, Fedora can find the binaries, even if they
are not installed. Older RHEL versions probably lack this, but IIRC
it should bein RHEL-9


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


