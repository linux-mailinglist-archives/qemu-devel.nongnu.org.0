Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817815D8E9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 15:02:43 +0100 (CET)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2bYI-0000Um-9D
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 09:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j2bWp-0007ek-Rv
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:01:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j2bWo-0005eh-I7
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:01:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42372
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j2bWo-0005an-Ci
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 09:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581688869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iNkwTKtk3raQGouzblvpXOpzSVNvJLx5KzIK5pI0Y7U=;
 b=Ozk6XmjBg4fRol1JfSVDoFay2m8aFRPVxFFGf84BJc0yoy5iw17+LyuhjtKuOVEjLC92o9
 vdYL+CvR/5G2uvis8zE5YB5LLBnxsuNTenkJ/pnVuYD3JtevlEUAnMm/5yqcMNHEjlGEfb
 uG9ESk4pHC4xRoq1/5eKQtVr2wOvL80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-QQCahC9cPgWFcdvhEo0ffQ-1; Fri, 14 Feb 2020 09:01:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958378010EB;
 Fri, 14 Feb 2020 14:01:03 +0000 (UTC)
Received: from [10.36.118.137] (unknown [10.36.118.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8E101001B28;
 Fri, 14 Feb 2020 14:00:57 +0000 (UTC)
Subject: Re: [PATCH RFC] memory: Don't allow to resize RAM while migrating
To: quintela@redhat.com
References: <20200213172016.196609-1-david@redhat.com>
 <20200214102514.GB3283@work-vm>
 <30a66b1d-184e-a684-d0d2-c3921366b478@redhat.com>
 <20200214104230.GC3283@work-vm>
 <cd295e35-72ca-e335-35be-f38bb9026e48@redhat.com>
 <20200214110226.GD3283@work-vm>
 <9a15fd0e-77d1-b3a0-4824-665f85f79c71@redhat.com>
 <bb33b209-2b15-4bbd-7fe9-3aa813e4c194@redhat.com>
 <87k14pgwud.fsf@secure.laptop>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMFCQlmAYAGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl3pImkCGQEACgkQTd4Q
 9wD/g1o+VA//SFvIHUAvul05u6wKv/pIR6aICPdpF9EIgEU448g+7FfDgQwcEny1pbEzAmiw
 zAXIQ9H0NZh96lcq+yDLtONnXk/bEYWHHUA014A1wqcYNRY8RvY1+eVHb0uu0KYQoXkzvu+s
 Dncuguk470XPnscL27hs8PgOP6QjG4jt75K2LfZ0eAqTOUCZTJxA8A7E9+XTYuU0hs7QVrWJ
 jQdFxQbRMrYz7uP8KmTK9/Cnvqehgl4EzyRaZppshruKMeyheBgvgJd5On1wWq4ZUV5PFM4x
 II3QbD3EJfWbaJMR55jI9dMFa+vK7MFz3rhWOkEx/QR959lfdRSTXdxs8V3zDvChcmRVGN8U
 Vo93d1YNtWnA9w6oCW1dnDZ4kgQZZSBIjp6iHcA08apzh7DPi08jL7M9UQByeYGr8KuR4i6e
 RZI6xhlZerUScVzn35ONwOC91VdYiQgjemiVLq1WDDZ3B7DIzUZ4RQTOaIWdtXBWb8zWakt/
 ztGhsx0e39Gvt3391O1PgcA7ilhvqrBPemJrlb9xSPPRbaNAW39P8ws/UJnzSJqnHMVxbRZC
 Am4add/SM+OCP0w3xYss1jy9T+XdZa0lhUvJfLy7tNcjVG/sxkBXOaSC24MFPuwnoC9WvCVQ
 ZBxouph3kqc4Dt5X1EeXVLeba+466P1fe1rC8MbcwDkoUo65Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAiUEGAECAA8FAlXLn5ECGwwFCQlmAYAACgkQTd4Q
 9wD/g1qA6w/+M+ggFv+JdVsz5+ZIc6MSyGUozASX+bmIuPeIecc9UsFRatc91LuJCKMkD9Uv
 GOcWSeFpLrSGRQ1Z7EMzFVU//qVs6uzhsNk0RYMyS0B6oloW3FpyQ+zOVylFWQCzoyyf227y
 GW8HnXunJSC+4PtlL2AY4yZjAVAPLK2l6mhgClVXTQ/S7cBoTQKP+jvVJOoYkpnFxWE9pn4t
 H5QIFk7Ip8TKr5k3fXVWk4lnUi9MTF/5L/mWqdyIO1s7cjharQCstfWCzWrVeVctpVoDfJWp
 4LwTuQ5yEM2KcPeElLg5fR7WB2zH97oI6/Ko2DlovmfQqXh9xWozQt0iGy5tWzh6I0JrlcxJ
 ileZWLccC4XKD1037Hy2FLAjzfoWgwBLA6ULu0exOOdIa58H4PsXtkFPrUF980EEibUp0zFz
 GotRVekFAceUaRvAj7dh76cToeZkfsjAvBVb4COXuhgX6N4pofgNkW2AtgYu1nUsPAo+NftU
 CxrhjHtLn4QEBpkbErnXQyMjHpIatlYGutVMS91XTQXYydCh5crMPs7hYVsvnmGHIaB9ZMfB
 njnuI31KBiLUks+paRkHQlFcgS2N3gkRBzH7xSZ+t7Re3jvXdXEzKBbQ+dC3lpJB0wPnyMcX
 FOTT3aZT7IgePkt5iC/BKBk3hqKteTnJFeVIT7EC+a6YUFg=
Organization: Red Hat GmbH
Message-ID: <60ddcc66-2744-c131-f876-5a7e27a04ba8@redhat.com>
Date: Fri, 14 Feb 2020 15:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87k14pgwud.fsf@secure.laptop>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: QQCahC9cPgWFcdvhEo0ffQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> diff --git a/migration/ram.c b/migration/ram.c
>> index ed23ed1c7c..f86f32b453 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -52,6 +52,7 @@
>>  #include "migration/colo.h"
>>  #include "block.h"
>>  #include "sysemu/sysemu.h"
>> +#include "sysemu/runstate.h"
>>  #include "savevm.h"
>>  #include "qemu/iov.h"
>>  #include "multifd.h"
>> @@ -3710,8 +3711,49 @@ static SaveVMHandlers savevm_ram_handlers =3D {
>>      .resume_prepare =3D ram_resume_prepare,
>>  };
>> =20
>> +static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
>> +                                      size_t old_size, size_t new_size)
>> +{
>> +    /*
>> +     * We don't care about resizes triggered on incoming migration (whe=
n
>> +     * syncing ram blocks), or of course, when no migration is going on=
.
>> +     */
>> +    if (migration_is_idle() || !runstate_is_running()) {
>> +        return;
>> +    }
>> +
>> +    if (!postcopy_is_running()) {
>> +        Error *err =3D NULL;
>> +
>> +        /*
>> +         * Precopy code cannot deal with the size of ram blocks changin=
g at
>> +         * random points in time. We're still running on the source, ab=
ort
>> +         * the migration and continue running here. Make sure to wait u=
ntil
>> +         * migration was canceled.
>> +         */
>> +        error_setg(&err, "RAM resized during precopy.");
>> +        migrate_set_error(migrate_get_current(), err);
>> +        error_free(err);
>> +        migration_cancel();
>=20
> If we can't do anything else, this is reasonable.
>=20
> But as discussed before, it is still not fully clear to me _why_ are
> ramblocks changing if we have disabled add/remove memory during migration=
.


Ramblock add/remove is ties to device add/remove, which we block.

Resize, however, it not. Here, the resize happens while the guest is
booting up. The content/size of the ram block depends also on previous
guest action AFAIK. There is no way from stopping the guest from doing
that. It's required for the guest to continue booting (with ACPI).

I'm currently working on a project which reuses resizable ram blocks in
different context. There, I can simply defer/avoid resizing when
migration is active. In the ACPI case, however, we cannot avoid it.

Hope that answers your question

>=20
>> +    } else {
>> +        /*
>> +         * Postcopy code cannot deal with the size of ram blocks changi=
ng at
>> +         * random points in time. We're running on the target. Fail har=
d.
>> +         *
>> +         * TODO: How to handle this in a better way?
>> +         */
>> +        error_report("RAM resized during postcopy.");
>> +        exit(-1);
>=20
> Idea is good, but we also need to exit destination, not only source, no?

@Dave, any idea what could be the right thing to do here?

>=20
>> +    }
>> +}
>=20
>=20
>=20
>> +static RAMBlockNotifier ram_mig_ram_notifier =3D {
>> +    .ram_block_resized =3D ram_mig_ram_block_resized,
>> +};
>> +
>>  void ram_mig_init(void)
>>  {
>>      qemu_mutex_init(&XBZRLE.lock);
>>      register_savevm_live("ram", 0, 4, &savevm_ram_handlers, &ram_state)=
;
>> +    ram_block_notifier_add(&ram_mig_ram_notifier);
>>  }
>=20
> Shouldn't we remove the notifier when we finish the migration.

It's called from main() unconditionally (so not when migration starts),
so the notifier remains active the whole QEMU lifetime (which should be
fine AFAIKT).

--=20
Thanks,

David / dhildenb


