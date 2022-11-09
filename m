Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA5262281C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osi2e-0001BX-Df; Wed, 09 Nov 2022 05:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osi2Y-0001Ae-U6
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osi2W-0003aH-PG
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667988634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBkRbxtVHNfHGgj+91NKkTrvbXEzfS2ACLrEOa7wGZE=;
 b=E73Fv0VPIajGK4lwSnuH3RIsHKDPCc2/B66iF1Vc0guXWN1flwzHGV2Azj/nE7sLtxP25O
 y06f9btzkc0sJrZaH1EFXSDKKJcQehwu51m8XuOzTrYlI/yd0Jmfmb3smuDheqOpJhniy7
 55loPzYveKFo1zP9N/JMmtEWYMDTPDU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-301-vCkGfk9KMZG5Mma_FaWOTQ-1; Wed, 09 Nov 2022 05:10:33 -0500
X-MC-Unique: vCkGfk9KMZG5Mma_FaWOTQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso11399844qvs.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 02:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBkRbxtVHNfHGgj+91NKkTrvbXEzfS2ACLrEOa7wGZE=;
 b=Fi8R8B/ooWOBILGDRTM4dbgRGSOv0pO0NjCkwBRRxze12VvgMF3J0d/PV6OTZFRc4R
 HWVkfzughjQz8mha6pHiuJXX6g3HJDix68N5YfDZQPwOOwC7R78dB2pbVcgWJWI03RcU
 i77O8314yHP7UZ5EIo2GHKFiyIeLdWpG7cmZt0N0L4CEFmwzk60IeJulive0C9bPY/kp
 u3z2eeIYpGAG0ihNILTnUOREJXlRO41d/BHcO0lQmbB9RR6LOjhDiA96I0kI3Jbd0Q73
 PV8XwhkMVu+q8K3VxTIVnqzpbl3RoBzuu5KSf90VNUwFXmZT9abZQZ1shZXNnv72WFXk
 ESag==
X-Gm-Message-State: ACrzQf1yR4QlDvCqxo4ajxp6LCacfW5kEyIR7i/LT9GDwFil2YUeK+HO
 G9Fzbdb9D/S/JSEBmZxyJ0+3a8l998tqi2z61KshToaSQvyUdTWJ/Bc6JKPhRIpkRtbW22kEf/x
 OxH0WBPzc0qCYTbLep/FB1FDEzrP8qbU=
X-Received: by 2002:ac8:6bc5:0:b0:3a5:1ecb:157 with SMTP id
 b5-20020ac86bc5000000b003a51ecb0157mr43063252qtt.503.1667988632492; 
 Wed, 09 Nov 2022 02:10:32 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5u/wrkO8GINimRxN8T0NBUU0Pdbd9Z/7A1dWYA+8QOTBB5PK22hF3TrrD8NGFvvyad2WOcw81jZ9zrODDKNeo=
X-Received: by 2002:ac8:6bc5:0:b0:3a5:1ecb:157 with SMTP id
 b5-20020ac86bc5000000b003a51ecb0157mr43063240qtt.503.1667988632228; Wed, 09
 Nov 2022 02:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
 <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
 <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
In-Reply-To: <CAJwEsV=kb3Cpnq=2ozpxBs7KGo916zOa64B5T1J_3uLjODNFwA@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Wed, 9 Nov 2022 11:10:21 +0100
Message-ID: <CAA8xKjW0JR-zs+YY5ui+KDhp9yY3AhzmwDaRrCY0GS7kaE2Z+w@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Siqi Chen <coc.cyqh@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, philmd@linaro.org, 
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

On Wed, Nov 9, 2022 at 10:45 AM Siqi Chen <coc.cyqh@gmail.com> wrote:
>
> Hi,
>
> >This reproducer does not crash my QEMU. Am I missing anything?
> I submitted the reproducer. Because the overflow is only one byte, it may=
 not be detected by the host's heap allocator.  Do you compile your qemu wi=
th sanitizer?  This is my build configuration: "./configure --target-list=
=3Dx86_64-softmmu --enable-sanitizers"

Right, you need to recompile QEMU with ASAN support. This is an
excerpt of the stack trace:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D39159=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on address
0x615000022880 at pc 0x55b023db5fe1 bp 0x7fffeeef1650 sp
0x7fffeeef1648
WRITE of size 1 at 0x615000022880 thread T0
    #0 0x55b023db5fe0 in sdhci_write_dataport ../../hw/sd/sdhci.c:562
    #1 0x55b023dc1cc7 in sdhci_write ../../hw/sd/sdhci.c:1216
    #2 0x55b024521e01 in memory_region_write_accessor ../../softmmu/memory.=
c:492
    #3 0x55b0245222ab in access_with_adjusted_size ../../softmmu/memory.c:5=
54
    #4 0x55b02452ff15 in memory_region_dispatch_write
../../softmmu/memory.c:1514
    #5 0x55b024568c67 in flatview_write_continue ../../softmmu/physmem.c:28=
14
    #6 0x55b02456908d in flatview_write ../../softmmu/physmem.c:2856
    #7 0x55b024569a74 in address_space_write ../../softmmu/physmem.c:2952
    #8 0x55b02457a63c in qtest_process_command ../../softmmu/qtest.c:538
    #9 0x55b02457ef97 in qtest_process_inbuf ../../softmmu/qtest.c:796
    #10 0x55b02457f089 in qtest_read ../../softmmu/qtest.c:808
    #11 0x55b0249d4372 in qemu_chr_be_write_impl ../../chardev/char.c:201
    #12 0x55b0249d4414 in qemu_chr_be_write ../../chardev/char.c:213
    #13 0x55b0249db586 in fd_chr_read ../../chardev/char-fd.c:72
    #14 0x55b02466ba5b in qio_channel_fd_source_dispatch
../../io/channel-watch.c:84
    #15 0x7f88093af0ae in g_main_context_dispatch
(/lib64/libglib-2.0.so.0+0x550ae)
    #16 0x55b024c5ff14 in glib_pollfds_poll ../../util/main-loop.c:297
    #17 0x55b024c600fa in os_host_main_loop_wait ../../util/main-loop.c:320
    #18 0x55b024c603f3 in main_loop_wait ../../util/main-loop.c:596
    #19 0x55b023fcca21 in qemu_main_loop ../../softmmu/runstate.c:726
    #20 0x55b023679735 in qemu_main ../../softmmu/main.c:36
    #21 0x55b023679766 in main ../../softmmu/main.c:45
    #22 0x7f8808728f5f in __libc_start_call_main (/lib64/libc.so.6+0x40f5f)
    #23 0x7f880872900f in __libc_start_main_impl (/lib64/libc.so.6+0x4100f)
    #24 0x55b023679644 in _start (./qemu-system-x86_64+0x20f2644)

> Thanks,
> Siqi Chen.
>
>
>
> Bin Meng <bmeng.cn@gmail.com> =E4=BA=8E2022=E5=B9=B411=E6=9C=889=E6=97=A5=
=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi,
>>
>> On Mon, Nov 7, 2022 at 7:08 PM Mauro Matteo Cascella
>> <mcascell@redhat.com> wrote:
>> >
>> > On Mon, Nov 7, 2022 at 11:35 AM Mauro Matteo Cascella
>> > <mcascell@redhat.com> wrote:
>> > >
>> > > Make sure to reset data_count if it's equal to (or exceeds) block_si=
ze.
>> > > This prevents an off-by-one read / write when accessing s->fifo_buff=
er
>> > > in sdhci_read_dataport / sdhci_write_dataport, both called right aft=
er
>> > > sdhci_buff_access_is_sequential.
>> > >
>> > > Fixes: CVE-2022-3872
>> > > Reported-by: RivenDell <XRivenDell@outlook.com>
>> > > Reported-by: Siqi Chen <coc.cyqh@gmail.com>
>> > > Reported-by: ningqiang <ningqiang1@huawei.com>
>> > > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> > > ---
>> > >  hw/sd/sdhci.c | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> > > index 306070c872..aa2fd79df2 100644
>> > > --- a/hw/sd/sdhci.c
>> > > +++ b/hw/sd/sdhci.c
>> > > @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState =
*s)
>> > >  static inline bool
>> > >  sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
>> > >  {
>> > > +    if (s->data_count >=3D (s->blksize & BLOCK_SIZE_MASK)) {
>> > > +        s->data_count =3D 0;
>> > > +    }
>> > > +
>> > >      if ((s->data_count & 0x3) !=3D byte_num) {
>> > >          trace_sdhci_error("Non-sequential access to Buffer Data Por=
t register"
>> > >                            "is prohibited\n");
>> > > --
>> > > 2.38.1
>> > >
>> >
>> > Reproducer:
>> >
>> > cat << EOF | ./qemu-system-x86_64 -machine accel=3Dqtest \
>> > -nodefaults -drive if=3Dnone,index=3D0,file=3Dnull-co://,format=3Draw,=
id=3Dmydrive \
>> > -device sdhci-pci -device sd-card,drive=3Dmydrive -nographic -qtest st=
dio
>> > outl 0xcf8 0x80001004
>> > outl 0xcfc 0x107
>> > outl 0xcf8 0x80001010
>> > outl 0xcfc 0xfebf1000
>> > writel 0xfebf102c 0x7
>> > writel 0xfebf1004 0x10200
>> > writel 0xfebf100c 0x200000
>> > writel 0xfebf1028 0x10000
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1020 0xdeadbeef
>> > writel 0xfebf1004 0x200
>> > writel 0xfebf100c 0x20
>> > writel 0xfebf1028 0x20000
>> > writel 0x00100000 0xfebf1021
>> > writel 0xfebf1058 0x00100000
>> > writel 0xfebf1028 0x8
>> > writel 0xfebf100c 0x200011
>> > writel 0xfebf1020 0xaabbccdd
>> > EOF
>> >
>>
>> This reproducer does not crash my QEMU. Am I missing anything?
>>
>> Regards,
>> Bin



--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


