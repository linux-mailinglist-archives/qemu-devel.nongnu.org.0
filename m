Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E9E333058
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:56:55 +0100 (CET)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjPS-0003RA-AM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJiwq-00027B-1b
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:27:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJiwm-0000My-OY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615321635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TemRZz7vjIz9Z32CW2EqwhpXIJAGBE2eZmziBGsdzvY=;
 b=QDEn0uYuIoTed3JiF/81Vr0SsWE/QFyXEYMlolr7ZdEfjLMh/dJgj8je2Z/IeE8Ag1JSab
 Frx8ppFCrrNy5Y+WpKjZU+j7hcsLQa8GjELzjF14IwMZlhj6WKUtBss+vxOMgfdN9KOvb2
 4S/OzkFhG4wLzcxh6Mw3V/JJjCQj4iI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-ITTHl8zkNLuR2gvvQMhI6g-1; Tue, 09 Mar 2021 15:27:13 -0500
X-MC-Unique: ITTHl8zkNLuR2gvvQMhI6g-1
Received: by mail-ej1-f72.google.com with SMTP id e13so6163616ejd.21
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 12:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=OnWzzN4k9Usy2Nukk1rkDwku9luNVOKUGHgZBSY+/Tc=;
 b=n7pjfhkCxIJHB8Pi52gT4Qx41dH/MFWsbHXuc0aN4jtu8X8YVTj1rbmXA8HYAGmzRf
 su2H/9Y2crsIMRv0JUaRlb0hszO1KaPqHIHxNFx4YQWSHwXo6PZWrs8BiOKv538tZxCW
 5wCI0j0aj0Mu4ROPPokm3rRjtrf2YX55cfGjRH3gI3mGxkoJWXJTTBdC8cA/ats7v8IH
 CXOPWXggLLmOJVWXGUrO/ddHYjdvlGIXzdkEWxx3uFuO/UseZJjf+nLOniLf49gEGOJc
 BJyglI3qEyXvr9T3FB/zdUmorqYFNumcKHO+KTu4ta5i1/nw04QBXHvTJgB/6Bl+EZ1s
 HFUA==
X-Gm-Message-State: AOAM531t40VSFkErkYVeqhwtVEvHgin2w3pPzNE7e6IpWHoaZb+Qa7zZ
 Dh511+c/ZOAmJ7XmIV7wuHLeORipO09mkePBjreSYDRbwjnUZ5F6Nq0I/Zle0ZNAKdMWdtKmb+L
 uYaCwYmgljEm/HnU=
X-Received: by 2002:a05:6402:34d:: with SMTP id
 r13mr6349542edw.64.1615321632653; 
 Tue, 09 Mar 2021 12:27:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuV5cvaZ0N9c8jWhPyEYQhtoOs72Zyy/9moi12FJEQU8P7tTqdtae0y/CObc3kvdQZpL1KGw==
X-Received: by 2002:a05:6402:34d:: with SMTP id
 r13mr6349514edw.64.1615321632389; 
 Tue, 09 Mar 2021 12:27:12 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6a5f.dip0.t-ipconnect.de. [91.12.106.95])
 by smtp.gmail.com with ESMTPSA id
 bi26sm8894215ejb.120.2021.03.09.12.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 12:27:12 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Date: Tue, 9 Mar 2021 21:27:10 +0100
Message-Id: <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
References: <20210309200451.GF763132@xz-x1>
In-Reply-To: <20210309200451.GF763132@xz-x1>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 09.03.2021 um 21:04 schrieb Peter Xu <peterx@redhat.com>:
>=20
> =EF=BB=BFOn Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrot=
e:
>> Let's introduce a new set of flags that abstract mmap logic and replace
>> our current set of bools, to prepare for another flag.
>>=20
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>> include/qemu/mmap-alloc.h | 17 +++++++++++------
>> softmmu/physmem.c         |  8 +++++---
>> util/mmap-alloc.c         | 14 +++++++-------
>> util/oslib-posix.c        |  3 ++-
>> 4 files changed, 25 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
>> index 456ff87df1..55664ea9f3 100644
>> --- a/include/qemu/mmap-alloc.h
>> +++ b/include/qemu/mmap-alloc.h
>> @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
>>=20
>> size_t qemu_mempath_getpagesize(const char *mem_path);
>>=20
>> +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
>> +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
>> +
>> +/* Map MAP_SHARED instead of MAP_PRIVATE. */
>> +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
>> +
>> +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn othe=
rwise. */
>> +#define QEMU_RAM_MMAP_PMEM          (1 << 2)
>=20
> Sorry to speak late - I just noticed that is_pmem can actually be convert=
ed too
> with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA=
 for
> use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
> directly using MAP_*, I think?
>=20

No problem :) I don=E2=80=98t think passing in random MAP_ flags is a good =
interface (we would at least need an allow list).

 I like the abstraction / explicit semenatics of QEMU_RAM_MMAP_PMEM as spel=
led out in the comment. Doing the fallback when passing in the mmap flags i=
s a little ugly. We could do the fallback in the caller, I think I remember=
 there is only a single call site.

PROT_READ won=E2=80=98t be covered as well, not sure if passing in protecti=
ons improves the interface.

Long story short, I like the abstraction provided by these flags, only expo=
rting what we actually support/abstracting it, and setting some MAP_ flags =
automatically (MAP_PRIVATE, MAP_ANON) instead of having to spell that put i=
n the caller.


> --=20
> Peter Xu
>=20


