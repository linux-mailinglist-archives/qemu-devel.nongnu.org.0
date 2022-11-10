Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163EA6249FD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 19:53:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otCeA-0000Wf-O4; Thu, 10 Nov 2022 13:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1otCe8-0000TV-Gz
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:51:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1otCe6-0004yU-Jq
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 13:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668106285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIAXGYjHRzPUlRIjQX4w+qrIjyrEPktD0b9Vf5ABP1k=;
 b=GoouKp3cJGBXKPpLFujVqSj6IOBeOZ9oD5EBxy1oVLNUUs3xNwmFPx5va8ya8rbdRj91zd
 ubjHF+5sgOXe62rw/k+B4uVBj+Fs2bnaMq0YjYZHzcNtwRqAKBIQofm/MvoVKM/0xNRwCR
 776AZNIKUJFilyNhDUkV2gz8FT1tflU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-eukqjz9YNUK4vo5hTnq23g-1; Thu, 10 Nov 2022 13:51:22 -0500
X-MC-Unique: eukqjz9YNUK4vo5hTnq23g-1
Received: by mail-ot1-f70.google.com with SMTP id
 s5-20020a9d7585000000b0066c7a3ddf59so1273524otk.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 10:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIAXGYjHRzPUlRIjQX4w+qrIjyrEPktD0b9Vf5ABP1k=;
 b=Ny63XFiPzZJYRsAYUNz2SByp6GxPb4vrNA3wYMh5sE3ofjKz54UGAez4htEN8blQdZ
 JYQ5pSCzyPBJ2ZmUxgvuHmPRDD2nAqqUBQhO7/+ZKVzsAu9nOrc/TprMMkYlZ8yzBRdQ
 NRHt5yV7jmbqNYsny3X0IyPV4Pg8JSL9Umt/dkSA4AXAX3X/XhWgTGd3hnOP/ULWmDRD
 C4rhVjzFdYdRhZhXHjZdrIoO42W/zA845TivJMSF/LI4PLN63h3YZ9MnxUTKBePCfMQH
 4h3M2h4t8nehaqioux4y+zU51RAlVtkCOMK3z/m7wSUYfdlH0kxQOhfbI44wcVAyl1Vi
 lhNQ==
X-Gm-Message-State: ACrzQf0k7Hvnge4mxbfYi2fxPLtB01RQKtlA1VKT8cXWKDv5XLdiSqcc
 /Nt3tg4+Qu9D6K4PPKwPeKPu5LQiOeZ42x/SsuSL6dfvhzWm+6xhgsUp/JWbRU+OxXREbAzDcF3
 dUz9IujK+naWWovTGEzPfaGuMQuM4c3U=
X-Received: by 2002:a9d:6191:0:b0:66b:99a2:feb9 with SMTP id
 g17-20020a9d6191000000b0066b99a2feb9mr1847679otk.359.1668106281238; 
 Thu, 10 Nov 2022 10:51:21 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7GqFYRJZd+rrORYwGuytZP+GxKCibtunJmHywlsj96/fMiOlhu/2lrQdZo3u/qglcI07z7kKa+yXo5ufThfmI=
X-Received: by 2002:a9d:6191:0:b0:66b:99a2:feb9 with SMTP id
 g17-20020a9d6191000000b0066b99a2feb9mr1847662otk.359.1668106280983; Thu, 10
 Nov 2022 10:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
 <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
 <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
 <CAA8xKjW0JR-zs+YY5ui+KDhp9yY3AhzmwDaRrCY0GS7kaE2Z+w@mail.gmail.com>
 <CAEUhbmWj=4f8Kn3WLHZFz_LzDoU_yBW7mhvC_mR7Be6JdMFC1A@mail.gmail.com>
In-Reply-To: <CAEUhbmWj=4f8Kn3WLHZFz_LzDoU_yBW7mhvC_mR7Be6JdMFC1A@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 10 Nov 2022 19:51:09 +0100
Message-ID: <CAA8xKjV9siB7KCs=Dn9xpoyB74T-YfJmWrq6FA=G48ZsWj4qUA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Siqi Chen <coc.cyqh@gmail.com>, qemu-devel@nongnu.org, philmd@linaro.org, 
 bin.meng@windriver.com, XRivenDell@outlook.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 9, 2022 at 5:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Nov 9, 2022 at 6:10 PM Mauro Matteo Cascella
> <mcascell@redhat.com> wrote:
> >
> > On Wed, Nov 9, 2022 at 10:45 AM Siqi Chen <coc.cyqh@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > >This reproducer does not crash my QEMU. Am I missing anything?
> > > I submitted the reproducer. Because the overflow is only one byte, it=
 may not be detected by the host's heap allocator.  Do you compile your qem=
u with sanitizer?  This is my build configuration: "./configure --target-li=
st=3Dx86_64-softmmu --enable-sanitizers"
> >
> > Right, you need to recompile QEMU with ASAN support. This is an
> > excerpt of the stack trace:
>
> Is this documented somewhere? Is fuzzing.rst the right doc for this
> feature? Looking at fuzzing.rst it says --enable-sanitizers is
> optional.

Not sure it's documented somewhere, this is how I usually compile:

$ ../configure --target-list=3Dx86_64-softmmu --enable-sanitizers
--extra-cflags=3D-g3 \
 --enable-kvm --disable-tcg --enable-debug --enable-debug-info --disable-we=
rror

Then just run the PoC using ./x86_64-softmmu/qemu-system-x86_64 should
do the trick.

> Turning on --enable-sanitizers makes the build fail:
>
> FAILED: subprojects/libvduse/libvduse.a.p/libvduse.c.o
> cc -m64 -mcx16 -Isubprojects/libvduse/libvduse.a.p
> -Isubprojects/libvduse -I../subprojects/libvduse
> -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -=
g
> -fsanitize=3Dundefined -fsanitize=3Daddress -U_FORTIFY
> _SOURCE -D_FORTIFY_SOURCE=3D2 -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E
> -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
> -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> -Wold-style-declaration -W
> old-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2
> -Wno-missing-include-dirs -Wn
> o-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -D_GNU_SOURCE -MD -MQ subprojects/libvduse/libvduse.a.p/libvduse.c.o
> -MF subprojects/libvduse/libvduse.a.p/libvduse.c.o.d -o
> subprojects/libvduse/libvduse.a
> .p/libvduse.c.o -c ../subprojects/libvduse/libvduse.c
> In file included from /usr/include/string.h:495,
> from ../subprojects/libvduse/libvduse.c:24:
> In function =E2=80=98strncpy=E2=80=99,
> inlined from =E2=80=98vduse_dev_create=E2=80=99 at ../subprojects/libvdus=
e/libvduse.c:1312:5:
> /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
> =E2=80=98__builtin_strncpy=E2=80=99 specified bound 256 equals destinatio=
n size
> [-Werror=3Dstringop-truncation]
> 106 | return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest=
));
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> I am using GCC 9.4 on Ubuntu 20.04
>
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D39159=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addre=
ss
> > 0x615000022880 at pc 0x55b023db5fe1 bp 0x7fffeeef1650 sp
> > 0x7fffeeef1648
> > WRITE of size 1 at 0x615000022880 thread T0
> >     #0 0x55b023db5fe0 in sdhci_write_dataport ../../hw/sd/sdhci.c:562
> >     #1 0x55b023dc1cc7 in sdhci_write ../../hw/sd/sdhci.c:1216
> >     #2 0x55b024521e01 in memory_region_write_accessor ../../softmmu/mem=
ory.c:492
> >     #3 0x55b0245222ab in access_with_adjusted_size ../../softmmu/memory=
.c:554
> >     #4 0x55b02452ff15 in memory_region_dispatch_write
> > ../../softmmu/memory.c:1514
> >     #5 0x55b024568c67 in flatview_write_continue ../../softmmu/physmem.=
c:2814
> >     #6 0x55b02456908d in flatview_write ../../softmmu/physmem.c:2856
> >     #7 0x55b024569a74 in address_space_write ../../softmmu/physmem.c:29=
52
> >     #8 0x55b02457a63c in qtest_process_command ../../softmmu/qtest.c:53=
8
> >     #9 0x55b02457ef97 in qtest_process_inbuf ../../softmmu/qtest.c:796
> >     #10 0x55b02457f089 in qtest_read ../../softmmu/qtest.c:808
> >     #11 0x55b0249d4372 in qemu_chr_be_write_impl ../../chardev/char.c:2=
01
> >     #12 0x55b0249d4414 in qemu_chr_be_write ../../chardev/char.c:213
> >     #13 0x55b0249db586 in fd_chr_read ../../chardev/char-fd.c:72
> >     #14 0x55b02466ba5b in qio_channel_fd_source_dispatch
> > ../../io/channel-watch.c:84
> >     #15 0x7f88093af0ae in g_main_context_dispatch
> > (/lib64/libglib-2.0.so.0+0x550ae)
> >     #16 0x55b024c5ff14 in glib_pollfds_poll ../../util/main-loop.c:297
> >     #17 0x55b024c600fa in os_host_main_loop_wait ../../util/main-loop.c=
:320
> >     #18 0x55b024c603f3 in main_loop_wait ../../util/main-loop.c:596
> >     #19 0x55b023fcca21 in qemu_main_loop ../../softmmu/runstate.c:726
> >     #20 0x55b023679735 in qemu_main ../../softmmu/main.c:36
> >     #21 0x55b023679766 in main ../../softmmu/main.c:45
> >     #22 0x7f8808728f5f in __libc_start_call_main (/lib64/libc.so.6+0x40=
f5f)
> >     #23 0x7f880872900f in __libc_start_main_impl (/lib64/libc.so.6+0x41=
00f)
> >     #24 0x55b023679644 in _start (./qemu-system-x86_64+0x20f2644)
> >
>
> Regards,
> Bin
>


--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


