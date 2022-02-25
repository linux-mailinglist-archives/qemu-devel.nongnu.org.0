Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773454C4940
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:38:47 +0100 (CET)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcgA-0002XO-45
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNccI-0007BK-Ng
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:34:47 -0500
Received: from [2604:1380:4601:e00::1] (port=41862 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNccE-0006oP-II
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:34:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EFA1B8324F;
 Fri, 25 Feb 2022 15:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2B8C340E7;
 Fri, 25 Feb 2022 15:34:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EWUvxbsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645803256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWLmVQxQDsQDY8xA+iWmKjooufWe/5wC2imqu/MRZlY=;
 b=EWUvxbsv0f37oRy8gRLWgC2f9N5nllIJZsgvlWWTgwSXhwcn1SAw9ahMy2L+erFJzM3Cok
 2LgLhaVSk7Y3z5WXitc4qbOO4HNlQEIOEgKhSZKCqlv5kIMeSZSSbrRloP3h+xPoexoTbJ
 roWa02VZ8DoxU22UyCjoRq3cY9oiQgA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca8076dc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 15:34:15 +0000 (UTC)
Date: Fri, 25 Feb 2022 16:34:11 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Ard Biesheuvel <ardb@kernel.org>, adrian@parity.io
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <Yhj288aE5rW15Qpj@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com>
 <88ebdc32-2e94-ef28-37ed-1c927c12af43@amazon.com>
 <YhjoyIUv2+18BwiR@zx2c4.com>
 <9ac68552-c1fc-22c8-13e6-4f344f85a4fb@amazon.com>
 <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXEue6cDCSG0N7WGTVF=JYZx3jwE7EK4tCdhO-HzMtWwVw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>,
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 04:16:27PM +0100, Ard Biesheuvel wrote:
> > > I just booted up a Windows VM, and it looks like Hyper-V uses
> > > "Hyper_V_Gen_Counter_V1", which is also quite long, so we can't really
> > > HID match on that either.
> >
> >
> > Yes, due to the same problem. I'd really prefer we sort out the ACPI
> > matching before this goes mainline. Matching on _HID is explicitly
> > discouraged in the VMGenID spec.
> >
> 
> OK, this really sucks. Quoting the ACPI spec:
> 
> """
> A _HID object evaluates to either a numeric 32-bit compressed EISA
> type ID or a string. If a string, the format must be an alphanumeric
> PNP or ACPI ID with no asterisk or other leading characters.
> A valid PNP ID must be of the form "AAA####" where A is an uppercase
> letter and # is a hex digit.
> A valid ACPI ID must be of the form "NNNN####" where N is an uppercase
> letter or a digit ('0'-'9') and # is a hex digit. This specification
> reserves the string "ACPI" for use only with devices defined herein.
> It further reserves all strings representing 4 HEX digits for
> exclusive use with PCI-assigned Vendor IDs.
> """
> 
> So now we have to implement Microsoft's fork of ACPI to be able to use
> this device, even if we expose it from QEMU instead of Hyper-V? I
> strongly object to that.
> 
> Instead, we can match on _HID exposed by QEMU, and cordially invite
> Microsoft to align their spec with the ACPI spec.

I don't know about that... Seems a bit extreme. Hopefully Alex will be
able to sort something out with the ACPI people, and this driver will
work inside of Hyper-V.

Here's what we currently have:

  static const struct acpi_device_id vmgenid_ids[] = {
    { "VMGENID", 0 },  <------------------------------------ ???
    { "QEMUVGID", 0 }, <------------------------------------ QEMU
    { },
  };

Adrian added "VMGENID" in last year's v4, so I copied that for this new
driver here. But does anybody know which hypervisor it is for? Some
internal Amazon thing? Firecracker? VMware? In case Alex does not
succeed with the ACPI changes, it'd be nice to know which HIDs for
which hypervisors we do and do not support.

Jason

