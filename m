Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BC3194B8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:48:39 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAItB-0007wl-IX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAIp6-0005X7-96
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lAIp1-0007K3-NC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613076253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2N/yZML81a++9+uiczeWwmZfoosO6RUyGtW8ijJlLg=;
 b=MdSvSn4u8imVtdsvHKBjnUPSrGs4oW6mUNlmwpV4kymf6PiVr3hAa5gKX/CCZjbdIJ9Xug
 wUwnTN6yUZzt+74et2Q4OYrrmX1Tzt9uyGcW3YxLu7l4eRflzQPGv779PfjzyAZzSCkiry
 +ELi+kp7SKCdZKM/ck1ot/dVKAkf5yY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-oPSEQwcPMjWZbb7qjkIbNg-1; Thu, 11 Feb 2021 15:44:11 -0500
X-MC-Unique: oPSEQwcPMjWZbb7qjkIbNg-1
Received: by mail-wm1-f70.google.com with SMTP id p8so3713084wmq.7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=gA7qC5r+gRPVakhWSPHU4HjO+P5wfhg7ug4wT8z0Bvk=;
 b=IsL/NmMn9SLdbdaGHmqKANB/GVXYsYKn6xe0PIeWhq9w1A5WkexHY26jEHvWhR76X7
 YmPxs58Gfxf2UljXJpmb8/wI6I7cEEVyWM1CscP5j0dt4gH08PhHqZBLWjHkv8Hw+GHu
 KOCBTJCmj+nzhUCuQ5308e62L/N9NLAegFnXXkqWYTy8vsIt/iLCHMPcNGXwfiuZFi6T
 /Dr7PbTRR7WF+c6CIhXd5Wbna+pkqjpRNAIl1pWYFDFqFCKDl6OsrayzNCw7/eCA/W/A
 1zCL0cpwz1Fv+DMsTvOQdGr5lCY1XD7cBSBfkxYCBc0YiZZ4kuyIKIH7yI+GoGUonz0L
 zfAw==
X-Gm-Message-State: AOAM530+OdBjaBWqiLVmoDLOurFUM4Gvyie3fnVBGHImQh+BZfvYmtDc
 bOzdMTtPmLLGEoG7ZIAQBzeKe28WzwVlCgoMCkp8RKw+JtIJuPlU2INjT+yBIdHe0g9109OO/cz
 3HVQT53vzqwI+sW8=
X-Received: by 2002:adf:f58f:: with SMTP id f15mr7359444wro.21.1613076250328; 
 Thu, 11 Feb 2021 12:44:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyzNPIaBJBGY4w7P2akDVXlHWdIh0fXxkmdLMW3boUGs4gjt3JfZaFG6uN7C32gPBytjFKKA==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr7359420wro.21.1613076250009; 
 Thu, 11 Feb 2021 12:44:10 -0800 (PST)
Received: from [192.168.3.108] (p5b0c62a9.dip0.t-ipconnect.de. [91.12.98.169])
 by smtp.gmail.com with ESMTPSA id
 n3sm6380860wrv.22.2021.02.11.12.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 12:44:09 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Thu, 11 Feb 2021 21:44:07 +0100
Message-Id: <764B3931-54B7-426F-9872-5B71EED60947@redhat.com>
References: <20210211203115.GD157159@xz-x1>
In-Reply-To: <20210211203115.GD157159@xz-x1>
To: Peter Xu <peterx@redhat.com>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Alexander Duyck <alexander.duyck@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Den Lunev <den@openvz.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 11.02.2021 um 21:31 schrieb Peter Xu <peterx@redhat.com>:
>=20
> =EF=BB=BFOn Thu, Feb 11, 2021 at 08:01:29PM +0100, David Hildenbrand wrot=
e:
>>> On 11.02.21 19:28, Andrey Gruzdev wrote:
>>> On 11.02.2021 20:32, Peter Xu wrote:
>>>> On Thu, Feb 11, 2021 at 07:19:47PM +0300, Andrey Gruzdev wrote:
>>>>> On 09.02.2021 22:06, David Hildenbrand wrote:
>>>>>>>> Hi,
>>>>>>>>=20
>>>>>>>> just stumbled over this, quick question:
>>>>>>>>=20
>>>>>>>> I recently played with UFFD_WP and notices that write protection i=
s
>>>>>>>> only effective on pages/ranges that have already pages populated (=
IOW:
>>>>>>>> !pte_none() in the kernel).
>>>>>>>>=20
>>>>>>>> In case memory was never populated (or was discarded using e.g.,
>>>>>>>> madvice(DONTNEED)), write-protection will be skipped silently and =
you
>>>>>>>> won't get WP events for applicable pages.
>>>>>>>>=20
>>>>>>>> So if someone writes to a yet unpoupulated page ("zero"), you won'=
t
>>>>>>>> get WP events.
>>>>>>>>=20
>>>>>>>> I can spot that you do a single uffd_change_protection() on the wh=
ole
>>>>>>>> RAMBlock.
>>>>>>>>=20
>>>>>>>> How are you handling that scenario, or why don't you have to handl=
e
>>>>>>>> that scenario?
>>>>>>>>=20
>>>>>>> Hi David,
>>>>>>>=20
>>>>>>> I really wonder if such a problem exists.. If we are talking about =
a
>>>>>> I immediately ran into this issue with my simplest test cases. :)
>>>>>>=20
>>>>>>> write to an unpopulated page, we should get first page fault on
>>>>>>> non-present page and populate it with protection bits from
>>>>>>> respective vma.
>>>>>>> For UFFD_WP vma's  page will be populated non-writable. So we'll ge=
t
>>>>>>> another page fault on present but read-only page and go to
>>>>>>> handle_userfault.
>>>>>> See the attached test program. Triggers for me on 5.11.0-rc6+ and
>>>>>> 5.9.13-200.fc33
>>>>>>=20
>>>>>> gcc -lpthread uffdio_wp.c -o uffdio_wp
>>>>>> ./uffdio_wp
>>>>>> WP did not fire
>>>>>>=20
>>>>>> Uncomment the placement of the zeropage just before registering to m=
ake
>>>>>> the WP actually trigger. If there is no PTE, there is nothing to
>>>>>> protect.
>>>>>>=20
>>>>>>=20
>>>>>> And it makes sense: How should the fault handler know which ranges y=
ou
>>>>>> wp-ed, if there is no place to store that information (the PTEs!). T=
he
>>>>>> VMA cannot tell that story, it only knows that someone registered
>>>>>> UFFD_WP to selectively wp some parts.
>>>>>>=20
>>>>>> You might have to register also for MISSING faults and place zero pa=
ges.
>>>>>>=20
>>>>> Looked at the kernel code, agree that we miss WP events for unpopulat=
ed
>>>>> pages, UFFD_WP softbit won't be set in this case. But it doesn't make=
 saved
>>>>> snapshot inconsistent or introduce security issues. The only side eff=
ect is
>>>>> that we may save updated page instead of zeroed, just increasing snap=
shot
>>>>> size. However this guest-physical page has never been touched from th=
e point
>>>>> of view of saved vCPU/device state and is not a concern.
>>>> Oh I just remembered one thing, that Linux should be zeroing pages whe=
n
>>>> allocating, so even if the page has legacy content it'll be cleared wi=
th
>>>> __GFP_ZERO allocations.  So yeah it would be harder to have issue at l=
east with
>>>> a sensible OS.  I'm not sure about Windows or others, but it could be =
a common
>>>> case.  Then the only overhead is the extra pages we kept in the live s=
napshot,
>>>> which takes some more disk space.
>>>>=20
>>>> Or there could be firmware running without OS at all, but it should re=
ally not
>>>> read unallocated pages assuming there must be zero.  It's not a sane b=
ehavior
>>>> even for a firmware.
>>>>=20
>>>>> Often (at least on desktop Windows guests) only a small part of RAM h=
as ever
>>>>> been allocated by guest. Migration code needs to read each guest-phys=
ical
>>>>> page, so we'll have a lot of additional UFFD events, much more MISSIN=
G
>>>>> events then WP-faults.
>>>>>=20
>>>>> And the main problem is that adding MISSING handler is impossible in =
current
>>>>> single-threaded snapshot code. We'll get an immediate deadlock on ite=
rative
>>>>> page read.
>>>> Right.  We'll need to rework the design but just for saving a bunch of=
 snapshot
>>>> image disk size.  So now I agree with you, let's keep this in mind, bu=
t maybe
>>>> it isn't worth a fix for now, at least until we figure something reall=
y broken.
>>>>=20
>>>> Andrey, do you think we should still mention this issue into the todo =
list of
>>>> the wiki page of live snapshot?
>>>>=20
>>>> Thanks,
>>>>=20
>>> Yes, even if the page happens to be overwritten, it's overwritten by th=
e same VM so
>>> no security boundaries are crossed. And no machine code can assume that=
 RAM content
>>> is zeroed on power-on or reset so our snapshot state stays quite consis=
tent.
>>>=20
>>> Agree we should keep it in mind, but IMHO adding MISSING handler and ru=
nning separate
>>> thread would make performance worse.. So I doubt it's worth adding this=
 to TODO list..
>>>=20
>>=20
>> So, here is what happens: your snapshot will contain garbage at places w=
here
>> it should contain zero.
>>=20
>> This happens when your guest starts using an unpopulated page after
>> snapshotting started and the page has not been copied to the snapshot ye=
t.
>> You won't get a WP event, therefore you cannot copy "zero" to the snapsh=
ot
>> before content gets overridden.
>>=20
>> If you load your snapshot, it contains garbage at places that are suppos=
ed
>> to contain zero.
>>=20
>>=20
>> There is a feature in virtio-balloon that *depends* on previously discar=
ded
>> pages from staying unmodified in some cases: free page reporting.
>>=20
>> The guest will report pages (that might have been initialized to zero) t=
o
>> the hypervisor). The hypervisor will discard page content if the content=
 was
>> initialized to zero. After that, the guest is free to reuse the pages
>> anytime with the guarantee that content has not been modified (-> still =
is
>> zero).
>>=20
>>=20
>> See QEMU hw/virtio/virtio-balloon.c: virtio_balloon_handle_report()
>>=20
>> "When we discard the page it has the effect of removing the page from th=
e
>> hypervisor itself and causing it to be zeroed when it is returned to us.=
 So
>> we must not discard the page [...] if the guest is expecting it to retai=
n a
>> non-zero value."
>>=20
>> And Linux drivers/virtio/virtio_balloon.c: virtballoon_validate()
>>=20
>> "Inform the hypervisor that our pages are poisoned or initialized. If we
>> cannot do that then we should disable page reporting as it could potenti=
ally
>> change the contents of our free pages."
>>=20
>>=20
>> It's as simple as having a Linux guest with init_on_free and
>> free-page-reporting active via virtio-balloon.
>>=20
>> Long story short, your feature might break guests (when continuing the
>> snapshot) when free page reporting is active. I agree that MISSING event=
s
>> might be too heavy, so you should disable snapshots if free page reporti=
ng
>> is active.
>=20
> When the page is reported with poison_val set, it is written already by t=
he
> guest, right (either all zeros, or some special marks)?  If so, why it wo=
n't be
> wr-protected by uffd?

Let=E2=80=98s take a look at init-on-free.

The guest zeroes a page and puts it onto a buddy freelist. Free page report=
ing code takes it off that list and reports it to the hypervisor. The hyper=
visor discards the physical page and tells the guest he=E2=80=98s done proc=
essing the page. The guest re-places the page onto the free page list.

From that point on, the page can be re-allocated inside the guest and is as=
sumed to be zero. On access, a fresh (zeroed) page is populated by the hype=
rvisor. The guest won=E2=80=98t re-zero the page, as it has the guarantee (=
from free page reporting) that the page remained zero.

Write-protecting the unpopulated page won=E2=80=98t work as discussed.

>=20
> --=20
> Peter Xu
>=20


