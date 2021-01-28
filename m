Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671930768C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:59:56 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56tu-0006pK-R8
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=655880f0b=graf@amazon.de>)
 id 1l56si-0006L0-RB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:58:40 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:62217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=655880f0b=graf@amazon.de>)
 id 1l56sf-0005wg-TM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 07:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1611838718; x=1643374718;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=B56E1Awf7VEQPdUFQmhu23n9pP7LJrGNglTlfuHed+U=;
 b=TOCQtySzNvOPnLiOyEDSeRvahRcUH5EAHaFvdwWVRZQ9leUbjhUQQIBT
 xW9yOxwtFclPG/6SfBT/3Kx7jZ41IWW35jFlFuCHLRlmblwlQyB3TA1SQ
 uxY4Rh4yt9O2KQ1BbHTOdNVNGjo3Z+Sj/b2V6Q5nNpuNEjoqzq8vDgeNf Q=;
X-IronPort-AV: E=Sophos;i="5.79,382,1602547200"; d="scan'208";a="82178107"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Jan 2021 12:58:25 +0000
Received: from EX13MTAUWC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6DE2AC0600; Thu, 28 Jan 2021 12:58:22 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 28 Jan 2021 12:58:21 +0000
Received: from Alexanders-MacBook-Air.local (10.43.162.125) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 28 Jan 2021 12:58:14 +0000
Subject: Re: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
To: "Michael S. Tsirkin" <mst@redhat.com>, "Catangiu, Adrian Costin"
 <acatan@amazon.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <20210112074658-mutt-send-email-mst@kernel.org>
 <9952EF0C-CD1D-4EDB-BAB8-21F72C0BF90D@amazon.com>
 <20210127074549-mutt-send-email-mst@kernel.org>
Message-ID: <7bcd1cf3-d055-db46-95ea-5c023df2f184@amazon.de>
Date: Thu, 28 Jan 2021 13:58:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127074549-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.43.162.125]
X-ClientProxiedBy: EX13D02UWC002.ant.amazon.com (10.43.162.6) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Precedence: Bulk
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=655880f0b=graf@amazon.de; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason@zx2c4.com" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "avagin@gmail.com" <avagin@gmail.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "ptikhomirov@virtuozzo.com" <ptikhomirov@virtuozzo.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "jannh@google.com" <jannh@google.com>, "Weiss,
 Radu" <raduweis@amazon.com>, "asmehra@redhat.com" <asmehra@redhat.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "luto@kernel.org" <luto@kernel.org>,
 "gil@azul.com" <gil@azul.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "tytso@mit.edu" <tytso@mit.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "ovzxemul@gmail.com" <ovzxemul@gmail.com>, "w@1wt.eu" <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alexander Graf <graf@amazon.de>
From: graf--- via <qemu-devel@nongnu.org>

Hey Michael!

On 27.01.21 13:47, Michael S. Tsirkin wrote:
> =

> On Thu, Jan 21, 2021 at 10:28:16AM +0000, Catangiu, Adrian Costin wrote:
>> On 12/01/2021, 14:49, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>>      On Tue, Jan 12, 2021 at 02:15:58PM +0200, Adrian Catangiu wrote:
>>      > The first patch in the set implements a device driver which expos=
es a
>>      > read-only device /dev/sysgenid to userspace, which contains a
>>      > monotonically increasing u32 generation counter. Libraries and
>>      > applications are expected to open() the device, and then call rea=
d()
>>      > which blocks until the SysGenId changes. Following an update, rea=
d()
>>      > calls no longer block until the application acknowledges the new
>>      > SysGenId by write()ing it back to the device. Non-blocking read()=
 calls
>>      > return EAGAIN when there is no new SysGenId available. Alternativ=
ely,
>>      > libraries can mmap() the device to get a single shared page which
>>      > contains the latest SysGenId at offset 0.
>>
>>      Looking at some specifications, the gen ID might actually be located
>>      at an arbitrary address. How about instead of hard-coding the offse=
t,
>>      we expose it e.g. in sysfs?
>>
>> The functionality is split between SysGenID which exposes an internal u32
>> counter to userspace, and an (optional) VmGenID backend which drives
>> SysGenID generation changes based on hw vmgenid updates.
>>
>> The hw UUID you're referring to (vmgenid) is not mmap-ed to userspace or
>> otherwise exposed to userspace. It is only used internally by the vmgenid
>> driver to find out about VM generation changes and drive the more generic
>> SysGenID.
>>
>> The SysGenID u32 monotonic increasing counter is the one that is mmaped =
to
>> userspace, but it is a software counter. I don't see any value in using =
a dynamic
>> offset in the mmaped page. Offset 0 is fast and easy and most importantl=
y it is
>> static so no need to dynamically calculate or find it at runtime.
> =

> Well you are burning a whole page on it, using an offset the page
> can be shared with other functionality.

Currently, the SysGenID lives is one page owned by Linux that we share =

out to multiple user space clients. So yes, we burn a single page of the =

system here.

If we put more data in that same page, what data would you put there? =

Random other bits from other subsystems? At that point, we'd be =

reinventing vdso all over again, no? Probably with the same problems.

Which gets me to the second alternative: Reuse VDSO. The problem there =

is that the VDSO is an extremely architecture specific mechanism. Any =

new architecture we'd want to support would need multiple layers of =

changes in multiple layers of both kernel and libc. I'd like to avoid =

that if we can :).

So that leaves us with either wasting a page per system or not having an =

mmap() interface in the first place.

The reason we have the mmap() interface is that it's be easier to =

consume for libraries, that are not hooked into the main event loop.

So, uh, what are you suggesting? :)


Alex



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




