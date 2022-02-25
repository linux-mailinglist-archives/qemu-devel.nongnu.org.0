Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC54C4853
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:09:48 +0100 (CET)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcE7-0001BZ-Qs
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNc9C-0004oV-6Q
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:04:44 -0500
Received: from [2604:1380:4601:e00::1] (port=58810 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNc99-0004C5-PF
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:04:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD9D1B8321F
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2155C340F5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645801475;
 bh=ZJKRPeCkChS3b+pwdBenEbdeLpCSBU8v77sN2j2sad8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eM5RtP9Pq7lHELsEtW7y2xuAZgm9Vg3+RGOAAGEm8P0FDl9LZsKDXIHSJDqem7QCf
 +m/kXl3wjcR0iCaP1HkY3vvHmKZNMfWQuYbIg7wj1yqbzSun0/HG4kgClGcF0WXmOO
 EBmd2AtrZc+QfrH3fhNhyezguuvehswtGJMeFj6hXdi8PV5pVtD9/I+C+JyrmwpDx8
 bluO8/kYHW8qv3P29Q+1Cj+qsdhxVswS7w4kmF+r1lBG1KMRp1lGE0dBBzX1Gfy3qf
 OkiOtQl3fOLhm0YpQuCPElpdNtvb10t67wIbrMv5HeT9kA1tk570xf7AJVXAhUCpr2
 TCKCjkXwr6dzQ==
Received: by mail-yb1-f181.google.com with SMTP id u3so6427540ybh.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 07:04:35 -0800 (PST)
X-Gm-Message-State: AOAM53078qvFXFuw8u8+xVtWvB52/B2T7sJfqGXKQfpT/jYfGlnwk7on
 jn2eFR5AeiJl3HIKVd0a/0HpMOaeHtTS5hrjXt8=
X-Google-Smtp-Source: ABdhPJyOHJrVQscGxhKhpztFY90eGZAnFgxpO8O8cRBKklhxWquUxFwdF3VqZzUEE9fRbqcR87m05T1DIeStPWsPse4=
X-Received: by 2002:a25:4214:0:b0:624:6215:4823 with SMTP id
 p20-20020a254214000000b0062462154823mr7558374yba.432.1645801474993; Fri, 25
 Feb 2022 07:04:34 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com> <YhjRVz2184xhkZK3@kroah.com>
In-Reply-To: <YhjRVz2184xhkZK3@kroah.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Feb 2022 16:04:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH-sU5u+OcnTG0i1dOp7VuZX97336NqemhUq+apGstpXQ@mail.gmail.com>
Message-ID: <CAMj1kXH-sU5u+OcnTG0i1dOp7VuZX97336NqemhUq+apGstpXQ@mail.gmail.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=ardb@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 KY Srinivasan <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, ben@skyportsystems.com,
 Dexuan Cui <decui@microsoft.com>, Eric Biggers <ebiggers@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 adrian@parity.io, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Alexander Graf <graf@amazon.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-hyperv@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 13:53, Greg KH <gregkh@linuxfoundation.org> wrote:
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
>

With that suggestion adopted,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

