Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE5320046
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:22:34 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDEP-0007Ki-LI
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lDDCn-0006sF-4B
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lDDCj-0004HB-W3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613769649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrBgzWPGzFad5ELDBkCrKEzQSGF/ANViKafPs8JG40k=;
 b=abeDgxj2HN5OYHrZCfSp04Qwe9wLioJHstKl4Ig8xsO2sw/zHY6VmZTW3Yalok4pIX/+Fp
 SqXr7YXS7EVr+2NYwvhFw/oDDTGXGoyngs5LgLMhSHCDFNv3iqUgy52SovABe1q/P/OqEG
 3SB21VdkmIpDqiTrKbgCaEmFV8ZiI1c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-YvS04AZIMCW2lCMgDaATHw-1; Fri, 19 Feb 2021 16:20:47 -0500
X-MC-Unique: YvS04AZIMCW2lCMgDaATHw-1
Received: by mail-ed1-f72.google.com with SMTP id p12so3414490edw.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 13:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=qKo6v6/kaIIOTfZBlclAszZDB//+NMlF+bNES9g8Jm4=;
 b=i0p/QmLc2CqyPmH4VocbCsnBxydRi0gFABWZXs5hmEWP4PVKxQjwh2olNEpYBur8Mr
 paltthHQvfk/nalZXE9POAEajkAjl+niHKSb+XsHaMmklGkcAZyjCbGgiGnsG428J5CT
 dCicYaprZaMPY8YJQaD6K4lj8b8XYJuSLi+h0hdH8JoPWXJ7xKaaBr/JDicKML4aPoqO
 /RPuB7c6BmLSShm2NHSQ0ZjtaRwMVhLephHjdImGCxJ++apltQ3WXnr01PBson2Xh54l
 FkdAwXnGwaITCNcfYLQEPkae9urHF3vakiARMhnZJC02JXl/wdUyW4kOLRZnTQBJuR2a
 kKGA==
X-Gm-Message-State: AOAM530kXdthPGMz6qN8UzjkCFP6wCA6L64r5LwHDpR1MjAvhEDVV6kG
 Sqvp2w8AiMJjJ6GsNcQZZwEQFJr3c6H7ozwymSflLPu2gYEUCaf1Vbi806y6Ju/zGFAeKgdrgQ/
 ES9csKgEtZxULpeU=
X-Received: by 2002:a17:906:3881:: with SMTP id
 q1mr10509758ejd.490.1613769646129; 
 Fri, 19 Feb 2021 13:20:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyJYXc1ZdKF2XJjdZNsep6pZhAkjGQ1QnHBrqH1tjw0+5GUZ3HWNOKlXUwrH2LCdzKKxGIIw==
X-Received: by 2002:a17:906:3881:: with SMTP id
 q1mr10509740ejd.490.1613769645936; 
 Fri, 19 Feb 2021 13:20:45 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6c93.dip0.t-ipconnect.de. [91.12.108.147])
 by smtp.gmail.com with ESMTPSA id r9sm5159468eju.74.2021.02.19.13.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 13:20:45 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Date: Fri, 19 Feb 2021 22:20:42 +0100
Message-Id: <3D93AD71-A570-481C-BFE9-0DFA8C30F148@redhat.com>
References: <B2724848-DDA8-442B-A252-E84C56752D7E@redhat.com>
In-Reply-To: <B2724848-DDA8-442B-A252-E84C56752D7E@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


> Am 19.02.2021 um 22:14 schrieb David Hildenbrand <dhildenb@redhat.com>:
>=20
> =EF=BB=BF
>>> Am 19.02.2021 um 22:10 schrieb Peter Xu <peterx@redhat.com>:
>>>=20
>>> =EF=BB=BFOn Fri, Feb 19, 2021 at 03:50:52PM -0500, Peter Xu wrote:
>>> Andrey,
>>>=20
>>>> On Fri, Feb 19, 2021 at 09:57:37AM +0300, Andrey Gruzdev wrote:
>>>> For the discards that happen before snapshot is started, I need to dig=
 into Linux and QEMU virtio-baloon
>>>> code more to get clear with it.
>>>=20
>>> Yes it's very tricky on how the error could trigger.
>>>=20
>>> Let's think of below sequence:
>>>=20
>>> - Start a guest with init_on_free=3D1 set and also a virtio-balloon dev=
ice
>>>=20
>>> - Guest frees a page P and zeroed it (since init_on_free=3D1). Now P co=
ntains
>>>   all zeros.
>>>=20
>>> - Virtio-balloon reports this page to host, MADV_DONTNEED sent, then th=
is
>>>   page is dropped on the host.
>>>=20
>>> - Start live snapshot, wr-protect all pages (but not including page P b=
ecause
>>>   it's currently missing).  Let's call it $SNAPSHOT1.
>>>=20
>>> - Guest does alloc_page(__GFP_ZERO), accidentally fetching this page P =
and
>>>   returned
>>>=20
>>> - So far, page P is still all zero (which is good!), then guest uses pa=
ge P
>>>   and writes data to it (say, now P has data P1 rather than all zeros).
>>>=20
>>> - Live snapshot saves page P, which content P1 rather than all zeros.
>>>=20
>>> - Live snapshot completed.  Saved as $SNAPSHOT1.
>>>=20
>>> Then when load snapshot $SNAPSHOT1, we'll have P contains data P1.  Aft=
er
>>> snapshot loaded, when guest allocate again with alloc_page(__GFP_ZERO) =
on this
>>> page P, since guest kernel "thought" this page is all-zero already so m=
emzero()
>>> is skipped even if __GFP_ZERO is provided.  Then this page P (with cont=
ent P1)
>>> got returned for the alloc_page(__GFP_ZERO) even if __GFP_ZERO set.  Th=
at could
>>> break the caller of alloc_page().
>>>=20
>>>> Anyhow I'm quite sure that adding global MISSING handler for snapshott=
ing
>>>> is too heavy and not really needed.
>>>=20
>>> UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  Ther=
e'll
>>> definitely be overhead, but it may not be that huge as imagined.  Live =
snapshot
>>> is great in that we have point-in-time image of guest without stopping =
the
>>> guest, so taking slightly longer time won't be a huge loss to us too.
>>>=20
>>> Actually we can also think of other ways to work around it.  One way is=
 we can
>>> pre-fault all guest pages before wr-protect.  Note that we don't need t=
o write
>>> to the guest page because read would suffice, since uffd-wp would also =
work
>>> with zero pfn.  It's just that this workaround won't help on saving sna=
pshot
>>> disk space, but it seems working.  It would be great if you have other
>>> workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.
>>=20
>> Wait.. it actually seems to also solve the disk usage issue.. :)
>>=20
>> We should just need to make sure to prohibit balloon before staring to
>> pre-fault read on all guest ram.  Seems awkward, but also seems working.=
. Hmm..
>=20
> A shiver just went down my spine. Please don=E2=80=98t just for the sake =
of creating a snapshot.
>=20
> (Just imagine you don=E2=80=98t have a shared zeropage...)

... and I just remembered we read all memory either way. Gah.

I have some patches to make snapshots fly with virtio-mem so exactly that w=
on=E2=80=98t happen. But they depend on vfio support, so it might take a wh=
ile.


