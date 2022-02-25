Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C24C48F4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:30:46 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcYP-0001vd-I1
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNcL2-0008Q6-QK
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:16:56 -0500
Received: from [2604:1380:4601:e00::1] (port=35010 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNcKy-0007fh-RX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:16:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AECF4B83253
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36866C340FB
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645802200;
 bh=1YQNkQHMUBbNKAA0f8LEOAgGI8CQhzGcPzlC986yOhc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tbHJ0Z7vCb3cizuQ+2dUc2HkRr7mrIvcDE/uLyZptZ47dxE++tQGLqOjYhNNxzjub
 zH65Ezg04zvsuAUTDazs6wlN1zoTITR8ctKgDkW1r45/0413RL8Jln7xNNRELm+8ke
 UUdHy3tQu2Hd4YvK/I95CsuQx5X7DxYOLXe6VmcPLU61Dvlv1pXcI8IiILsMRlOe55
 lEkGrrWnIpRUAuiP2TZ+IY7NIAHRUzqQ0ldsP45PQF+Asdp0iNjT8vsDO+4RJyFhMc
 x7ivfMGT3aSWfmIlRjKuHYPx4+BEHaKVT76/nl9y0GrQWLcN5w6cS1ZFZ/ePlKIUQR
 WKbfYynoRvmaA==
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2d62593ad9bso36721447b3.8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 07:16:40 -0800 (PST)
X-Gm-Message-State: AOAM532RtbJriS5z31zJ5DAic0TXR869eY0BPxbWrjRFCDhdQ2zT3b2K
 45VsXUdJoDFRBIqaw8ODtD2UhDPgrpSZsMiXDis=
X-Google-Smtp-Source: ABdhPJy24j/XlMc4iMq9F1iPQkI+P8/SeG/oYlZqoLCoQ3g6Pbs6pk5D7Xk0ab1JaS6DRZ7G96N4rg6RmaiLoYr4VK0=
X-Received: by 2002:a81:84d5:0:b0:2d1:e85:bf04 with SMTP id
 u204-20020a8184d5000000b002d10e85bf04mr8081642ywf.465.1645802199166; Fri, 25
 Feb 2022 07:16:39 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com> <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
 <YhjoyIUv2+18BwiR@zx2c4.com> <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
In-Reply-To: <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Feb 2022 16:16:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
Message-ID: <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: Alexander Graf <graf@amazon.com>
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
 Haiyang Zhang <haiyangz@microsoft.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-hyperv@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 16:12, Alexander Graf <graf@amazon.com> wrote:
>
>
> On 25.02.22 15:33, Jason A. Donenfeld wrote:
> > On Fri, Feb 25, 2022 at 03:18:43PM +0100, Alexander Graf wrote:
> >>> I recall this part of the old thread. From what I understood, using
> >>> "VMGENID" + "QEMUVGID" worked /well enough/, even if that wasn't
> >>> technically in-spec. Ard noted that relying on _CID like that is
> >>> technically an ACPI spec notification. So we're between one spec and
> >>> another, basically, and doing "VMGENID" + "QEMUVGID" requires fewer
> >>> changes, as mentioned, appears to work fine in my testing.
> >>>
> >>> However, with that said, I think supporting this via "VM_Gen_Counter"
> >>> would be a better eventual thing to do, but will require acks and
> >>> changes from the ACPI maintainers. Do you think you could prepare your
> >>> patch proposal above as something on-top of my tree [1]? And if you can
> >>> convince the ACPI maintainers that that's okay, then I'll happily take
> >>> the patch.
> >>
> >> Sure, let me send the ACPI patch stand alone. No need to include the
> >> VMGenID change in there.
> > That's fine. If the ACPI people take it for 5.18, then we can count on
> > it being there and adjust the vmgenid driver accordingly also for 5.18.
> >
> > I just booted up a Windows VM, and it looks like Hyper-V uses
> > "Hyper_V_Gen_Counter_V1", which is also quite long, so we can't really
> > HID match on that either.
>
>
> Yes, due to the same problem. I'd really prefer we sort out the ACPI
> matching before this goes mainline. Matching on _HID is explicitly
> discouraged in the VMGenID spec.
>

OK, this really sucks. Quoting the ACPI spec:

"""
A _HID object evaluates to either a numeric 32-bit compressed EISA
type ID or a string. If a string, the format must be an alphanumeric
PNP or ACPI ID with no asterisk or other leading characters.
A valid PNP ID must be of the form "AAA####" where A is an uppercase
letter and # is a hex digit.
A valid ACPI ID must be of the form "NNNN####" where N is an uppercase
letter or a digit ('0'-'9') and # is a hex digit. This specification
reserves the string "ACPI" for use only with devices defined herein.
It further reserves all strings representing 4 HEX digits for
exclusive use with PCI-assigned Vendor IDs.
"""

So now we have to implement Microsoft's fork of ACPI to be able to use
this device, even if we expose it from QEMU instead of Hyper-V? I
strongly object to that.

Instead, we can match on _HID exposed by QEMU, and cordially invite
Microsoft to align their spec with the ACPI spec.

