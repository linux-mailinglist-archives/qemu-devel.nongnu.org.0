Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929DD4C46A7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:36:52 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNam8-0001pj-NT
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNa9Y-0003J2-Nd
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:56:56 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNa9V-0000oz-Uc
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:56:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12DB061C03
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394C9C340E8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:56:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="enMYkBkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645793808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XssgunSt6iK78jyshO3hMq9+wDKO/OCGHO1mFFLrZQQ=;
 b=enMYkBkIudB/0krPIVVLhzRClwGqp92bzymz3GlaPY/CynpKIXYX03wKBGZ52ZVCe9Eujn
 kgPdqeLrCuQURxB1lO3tnKlABuuou7tz8M7L/27vzfUSx9/E+GZStDwJkrdcK/PldDBDFn
 5MO5bLzFBsxUJCj89tpuB1ncnSfIF98=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b88a2751
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 25 Feb 2022 12:56:48 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id e140so5677760ybh.9
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:56:47 -0800 (PST)
X-Gm-Message-State: AOAM531UC1YFAB7lU4+UZXMqufW0H/ZxZoSrGSjpvkgvvHhFeuyeuP65
 cmxGTuyiaecHpgOhU/zMi7Zbs4FTAPUS0y8BzYI=
X-Google-Smtp-Source: ABdhPJy+bf9nC/iTENWy4XIXFN5EQ0KO9hqlk22myA/sDhwpstQSK4hOUUQQu7RToXFr7rymY6Q0NMRfSY8co9VWFh4=
X-Received: by 2002:a25:d116:0:b0:61d:e8c9:531e with SMTP id
 i22-20020a25d116000000b0061de8c9531emr7032586ybg.637.1645793805904; Fri, 25
 Feb 2022 04:56:45 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com> <YhjRVz2184xhkZK3@kroah.com>
In-Reply-To: <YhjRVz2184xhkZK3@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Feb 2022 13:56:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9pGuPEWjr+RLFQi-kKcRuPxmCYyzAJOJtgx+5phwmkZ6Q@mail.gmail.com>
Message-ID: <CAHmME9pGuPEWjr+RLFQi-kKcRuPxmCYyzAJOJtgx+5phwmkZ6Q@mail.gmail.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "K . Y . Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 ben@skyportsystems.com, Dexuan Cui <decui@microsoft.com>,
 Eric Biggers <ebiggers@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, adrian@parity.io,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Alexander Graf <graf@amazon.com>, Theodore Ts'o <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 1:53 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Feb 25, 2022 at 01:48:48PM +0100, Jason A. Donenfeld wrote:
> > +static struct acpi_driver acpi_driver = {
> > +     .name = "vmgenid",
> > +     .ids = vmgenid_ids,
> > +     .owner = THIS_MODULE,
> > +     .ops = {
> > +             .add = vmgenid_acpi_add,
> > +             .notify = vmgenid_acpi_notify,
> > +     }
> > +};
> > +
> > +static int __init vmgenid_init(void)
> > +{
> > +     return acpi_bus_register_driver(&acpi_driver);
> > +}
> > +
> > +static void __exit vmgenid_exit(void)
> > +{
> > +     acpi_bus_unregister_driver(&acpi_driver);
> > +}
> > +
> > +module_init(vmgenid_init);
> > +module_exit(vmgenid_exit);
>
> Nit, you could use module_acpi_driver() to make this even smaller if you
> want to.

Nice! Will do.

Jason

