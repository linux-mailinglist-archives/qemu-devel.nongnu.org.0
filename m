Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA74C25EB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 09:26:33 +0100 (CET)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN9SJ-000211-Pd
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 03:26:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nN9PO-0001HQ-C9
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nN9PJ-0004yy-8W
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 03:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645691004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIw6thHsE5mKcntqaPXG9e+eptGC30Zi7cXPp7mndxI=;
 b=Z4EqFzzDGxCpXeswZZFV9Q8f7SHkLVWPpWC15J4I1bEmXBxEmaEVv1j2FL4q3bouxMBSEK
 QZrLnFajwFycYWtM1kGQ3fgPCDTPt2BAi2qFMbZxD43w/ZuKcimvmYVqaJ8XTfeW88XhFw
 CRTGUB6Nj9NxFApGGYK64+NUJJz+mYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-xY8ajeExNjqKwLBHAp-9EQ-1; Thu, 24 Feb 2022 03:23:20 -0500
X-MC-Unique: xY8ajeExNjqKwLBHAp-9EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 991471854E26;
 Thu, 24 Feb 2022 08:23:17 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.194.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C47FB7AB5F;
 Thu, 24 Feb 2022 08:22:52 +0000 (UTC)
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>,
 linux-s390@vger.kernel.org, adrian@parity.io
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
Date: Thu, 24 Feb 2022 09:22:50 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Theodore Ts'o <tytso@mit.edu>, ehabkost@redhat.com, ben@skyportsystems.com,
 Jann Horn <jannh@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Igor Mammedov <imammedo@redhat.com>, Colm MacCarthaigh <colmmacc@amazon.com>,
 "Singh, Balbir" <sblbir@amazon.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(+Daniel, +Rich)

On 02/23/22 17:08, Jason A. Donenfeld wrote:
> On Wed, Feb 23, 2022 at 2:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> second patch is the reason this is just an RFC: it's a cleanup of the
>> ACPI driver from last year, and I don't really have much experience
>> writing, testing, debugging, or maintaining these types of drivers.
>> Ideally this thread would yield somebody saying, "I see the intent of
>> this; I'm happy to take over ownership of this part." That way, I can
>> focus on the RNG part, and whoever steps up for the paravirt ACPI part
>> can focus on that.
> 
> I actually managed to test this in QEMU, and it seems to work quite well. Steps:
> 
> $ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
> (qemu) savevm blah
> (qemu) quit
> $ qemu-system-x86_64 ... -device vmgenid,guid=auto -monitor stdio
> (qemu) loadvm blah
> 
> Doing this successfully triggers the function to reinitialize the RNG
> with the new GUID.

QEMU's related design is documented in
<https://git.qemu.org/?p=qemu.git;a=blob;f=docs/specs/vmgenid.txt>.

The Microsoft specification referenced therein,
<http://go.microsoft.com/fwlink/?LinkId=260709>, contains the following
statement:

"they can also use the data provided in the 128-bit identifier as a high
entropy random data source"

So reinitializing an RNG from it is an express purpose.

More info in the libvirt docs (see "genid"):

https://libvirt.org/formatdomain.html#general-metadata

QEMU's interpretation of the VMGENID specifically as a UUID (which I
believe comes from me) has received (valid) criticism since:

https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-id-across-hypervisors.txt

(This document also investigates VMGENID on other hypervisors, which I
think pertains to your other message.)

> (It appears there's a bug in QEMU which prevents
> the GUID from being reinitialized when running `loadvm` without
> quitting first; I suppose this should be discussed with QEMU
> upstream.)

That's not (necessarily) a bug; see the end of the above-linked QEMU
document:

"There are no known use cases for changing the GUID once QEMU is
running, and adding this capability would greatly increase the complexity."

> 
> So that's very positive. But I would appreciate hearing from some
> ACPI/Virt/Amazon people about this.

I've only made some random comments; I didn't see a question so I
couldn't attempt to answer :)

Thanks
Laszlo


