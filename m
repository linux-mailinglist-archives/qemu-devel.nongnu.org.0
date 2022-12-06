Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EDD644334
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 13:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2X69-0007xL-Hk; Tue, 06 Dec 2022 07:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p2X62-0007x1-3N
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 07:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1p2X5z-0001xs-QQ
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 07:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670329845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPY5g2XaQqqZ+v4ZWuraMT/oe4wAMmJML71NLu4+p84=;
 b=h20riuICrGxL7w6Da3BwJHmOC3slV4nqvEAFGIzq26gk76VmlC19DdE5EL6EGh9Js4dzpC
 BctbIeLTX402Tne46cqtShUakK5sNxe8/KccuRFOrg3TZumatjWk9ebntet8nBqt3p8g9i
 AzxPfHImokEWFK2GnmMbmaby2/gj0Zw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-ZdkxT0qcOC2l78ADvOQNwg-1; Tue, 06 Dec 2022 07:30:44 -0500
X-MC-Unique: ZdkxT0qcOC2l78ADvOQNwg-1
Received: by mail-wr1-f72.google.com with SMTP id
 w11-20020adfbacb000000b002418a90da01so3146734wrg.16
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 04:30:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QPY5g2XaQqqZ+v4ZWuraMT/oe4wAMmJML71NLu4+p84=;
 b=TehIWDHUYglz6TRPIcyrkniG6YltXEuQVb8Tp4tYbIdL3uIzNAmXwievDbe1pjCUVf
 XhEYM7thBSoqGGgrYf8XVgea6CcOYonqkXx424hXZ07/sBfIWpuVzbmpARIk5rzgtmwl
 7/AVHdf77TEtqAkTwmsUpxc3RmYPxEVipenbVFMJXNziC+6zodOe/L2AJbdZEqvkV/mp
 XHTnjqaXwUFuWjMQgG+d29Doxdb9IM5rPe0jAL63uIJm8L8u5DlRSQ67KZm24XQH4Gul
 lOxU22ilcusLCIl+fJ4du5JKW5xxp9NEkAhHSLYikJtbSbRn5vDAVVX6GDTR6/7/iQWP
 q/RA==
X-Gm-Message-State: ANoB5plJqJAXuPVi+6UWX62U6S5fj4Ujjh3mbBfQpgDaQi5Kf+dmAQaI
 8AUCBZMsYM6cxsjjBgSSbNKA5DL/xtazpTkMebXENvcJKfdMMQutKvOZBJV6hdGU7+y/Syj22xV
 SEQm5r/yVOTQ8VfY=
X-Received: by 2002:a5d:474d:0:b0:242:209c:39c8 with SMTP id
 o13-20020a5d474d000000b00242209c39c8mr20883430wrs.676.1670329843084; 
 Tue, 06 Dec 2022 04:30:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4KINdu4jLmX3Pv0JSIx/3wMnw9ZJuN/5pPp5LcAlo3uXe4VZJu/YQ5O1TQIwx+BUdSRPD5kw==
X-Received: by 2002:a5d:474d:0:b0:242:209c:39c8 with SMTP id
 o13-20020a5d474d000000b00242209c39c8mr20883404wrs.676.1670329842785; 
 Tue, 06 Dec 2022 04:30:42 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 s1-20020adfdb01000000b002420a2cdc96sm16466677wri.70.2022.12.06.04.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 04:30:42 -0800 (PST)
Date: Tue, 6 Dec 2022 12:30:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Fabrice Bellard <fabrice@bellard.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
Message-ID: <Y4818KfGO7Y9Tsn/@work-vm>
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Philippe Mathieu-Daud=E9 (philmd@linaro.org) wrote:
> Hi,
>=20
> I'm trying to understand the x86 architecture-specific code in
> hw/display/vga.c:
>=20
>     const MemoryRegionPortio vbe_portio_list[] =3D {
>         { 0, 1, 2, .read =3D vbe_ioport_read_index,
>                    .write =3D vbe_ioport_write_index },
>     # ifdef TARGET_I386
>         { 1, 1, 2, .read =3D vbe_ioport_read_data,
>                    .write =3D vbe_ioport_write_data },
>     # endif
>         { 2, 1, 2, .read =3D vbe_ioport_read_data,
>                    .write =3D vbe_ioport_write_data },
>         PORTIO_END_OF_LIST(),
>     };
>=20
> Having:
>=20
>     typedef struct MemoryRegionPortio {
>         uint32_t offset;
>         uint32_t len;
>         unsigned size;
>         uint32_t (*read)(...);
>         void (*write)(...);
>         ...
>     } MemoryRegionPortio;
>=20
> So on x86 we can have 16-bit I/O accesses unaligned to 8-bit boundary?

Yes, like most things in x86 the requirement for alignment is a 'should'
followed by a description of what might happen if you don't:

=46rom intel arch manual 19.3:
 '..16-bit ports should be aligned to even addresses (0, 2, 4, ...) so that=
 all 16 bits can be transferred in a
  single bus cycle. Likewise, 32-bit ports should be aligned to addresses t=
hat are multiples of four (0, 4, 8, ...). The
  processor supports data transfers to unaligned ports, but there is a perf=
ormance penalty because one or more
  extra bus cycle must be used.'

I think I've even seen it suggested that a 32bit access to ffff might be
defined - although I'm not sure if that's legal.

I don't know that bit of qemu well enough to know whether the cpu part
of qemu should be splitting the unaligned accesses or not.

Dave


> Looking at git-blame we have:
>=20
> [1] 0a039dc700 ("vga: Convert to isa_register_portio_list")
> [2] 09a79b4974 ("partial big endian fixes - change VESA VBE ports for non
> i386 targets to avoid unaligned accesses")
> [3] 4fa0f5d292 ("added bochs VBE support")
>=20
>=20
> [3] added:
>=20
>   #ifdef CONFIG_BOCHS_VBE
>      s->vbe_regs[VBE_DISPI_INDEX_ID] =3D VBE_DISPI_ID0;
>      register_ioport_read(0x1ce, 1, vbe_ioport_read, 2);
>      register_ioport_read(0x1cf, 1, vbe_ioport_read, 2);
>=20
>      register_ioport_write(0x1ce, 1, vbe_ioport_write, 2);
>      register_ioport_write(0x1cf, 1, vbe_ioport_write, 2);
>   #endif
>=20
> Back then, register_ioport_read() was:
>=20
>   /* size is the word size in byte */
>   int register_ioport_read(int start, int length,
>                            IOPortReadFunc *func, int size)
>   {
>     int i, bsize;
>=20
>     if (size =3D=3D 1)
>         bsize =3D 0;
>     else if (size =3D=3D 2)
>         bsize =3D 1;
>     else if (size =3D=3D 4)
>         bsize =3D 2;
>     else
>         return -1;
>     for(i =3D start; i < start + length; i +=3D size)
>         ioport_read_table[bsize][i] =3D func;
>     return 0;
>   }
>=20
> Indeed registering a 16-bit handler at the 8-bit aligned 0x1cf I/O addres=
s.
>=20
> I wonder if this wasn't a typo, and we wanted to register two 8-bit
> VBE handlers at offsets +0 and +1. IOW the code would have been:
>=20
>   #ifdef CONFIG_BOCHS_VBE
>      s->vbe_regs[VBE_DISPI_INDEX_ID] =3D VBE_DISPI_ID0;
>      register_ioport_read(0x1ce, 1, vbe_ioport_read, 2);
>      register_ioport_read(0x1ce, 2, vbe_ioport_read, 1);
>=20
>      register_ioport_write(0x1ce, 1, vbe_ioport_write, 2);
>      register_ioport_write(0x1ce, 2, vbe_ioport_write, 1);
>   #endif
>=20
> Because in that case, along with the code added in commit [2]:
>=20
>  static uint32_t vga_mem_readw(target_phys_addr_t addr)
>  {
>      uint32_t v;
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    v =3D vga_mem_readb(addr) << 8;
> +    v |=3D vga_mem_readb(addr + 1);
> +#else
>      v =3D vga_mem_readb(addr);
>      v |=3D vga_mem_readb(addr + 1) << 8;
> +#endif
>      return v;
>  }
>=20
> The 'ifdef TARGET_I386' (still from [2], converted in [1])
> wouldn't have been necessary.
>=20
> So I _think_ today we should be good with removing the x86 line:
>=20
> -- >8 --
>  static const MemoryRegionPortio vbe_portio_list[] =3D {
>      { 0, 1, 2, .read =3D vbe_ioport_read_index, .write =3D
> vbe_ioport_write_index },
> -# ifdef TARGET_I386
> -    { 1, 1, 2, .read =3D vbe_ioport_read_data, .write =3D vbe_ioport_wri=
te_data
> },
> -# endif
>      { 2, 1, 2, .read =3D vbe_ioport_read_data, .write =3D vbe_ioport_wri=
te_data
> },
>      PORTIO_END_OF_LIST(),
>  };
> ---
>=20
> *Except* if there is some hidden magic logic on the ISA bus...
> Not per the ISA spec, but manufacturer/hardware specific.
>=20
> I.e. the Jazz machines use a RC4030 which bridge ISA to the main
> bus, and transparently handles misaligned CPU/DMA accesses to the
> ISA address space.
>=20
> This ISA topic was already mentioned before, see:
>=20
> [a]
> https://lore.kernel.org/qemu-devel/20200720185758.21280-1-f4bug@amsat.org/
> [b]
> https://lore.kernel.org/qemu-devel/20210305235414.2358144-1-f4bug@amsat.o=
rg/
>=20
> Thoughts?
>=20
> Thanks,
>=20
> Phil.
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


