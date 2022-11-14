Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF808628EC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:58:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouilI-0005yX-Vk; Mon, 14 Nov 2022 18:21:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifY-0005mI-W5
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouYRk-0002Zp-Li
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668428414;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXksFFNqekAjLmIqLGi4i2jGTj/7KAmbHj0/CbPskaw=;
 b=fE/3dlJRiH34jWsEexvzCqp9he7XxisF3ZEmI5dqXeQBZl92s5hCt3XN6tNydmOFYjuJz0
 X9UCjMDlYPYHq8M//z+452cKhw1K2gMQiLMbyrJnCZpqdbLgTkzOUvPRLTsK3gy9L/nwQg
 8kRv6nLfoLJ144HuUo1/JOksuq2cCvw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-pKssxB74MOirdV0RF29sUQ-1; Mon, 14 Nov 2022 07:20:12 -0500
X-MC-Unique: pKssxB74MOirdV0RF29sUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i12-20020adfaacc000000b0023cd08e3b56so1936750wrc.12
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXksFFNqekAjLmIqLGi4i2jGTj/7KAmbHj0/CbPskaw=;
 b=jLwmrILiZowxCoFpl+lTFMp8j0sTbrnsfgTV+Vbuw3OUgkGCREnZf4T3kAjlzuEjzG
 F7081vJEbxHUoLbBEf3XA86477x4o2pkMJlZahpQEKBRY6crfC3gglB3gRshBuM07eZl
 twcSNFT33g4F+NOnvZZWpvamB+Irby6ssCEcb3oJXIj6jhNCGKSafrkC4Y7+WL2KgeyL
 rR7wIVrJ5kAwdDM6jJJT2VecoM3ACfo4hmClgf+4iniDe17ZY1uLpPnE2YZoBoPn0/ro
 JNjo2NQ3kJ8KKPfkxJH2yGK2Vx7tqyOi6FJkkpv279hxykYmHci//BKkHkdhhNjEh70+
 apqQ==
X-Gm-Message-State: ANoB5pn0PkZ0sPXyYC9HpFlEWVTzr8hgdqiLo+vd+WiRwk7M4mUPoFnH
 kB+I2onDy5YDqYZeNjqoHcrX0kjTiRo8NbEStAxlKsdtFFsbf07EH4XSHvtf3xkzNLDoQj9kk4R
 5QqmOALEfqvOeVHU=
X-Received: by 2002:a05:600c:1d9a:b0:3cf:6a83:bd19 with SMTP id
 p26-20020a05600c1d9a00b003cf6a83bd19mr7668687wms.29.1668428411783; 
 Mon, 14 Nov 2022 04:20:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4k+KYOpDaC5MGr2VhwbBl7hmy+xHrAS8lx5kXwZKl0I4VWm67YMg/pMeEVBVV29Y2m94867g==
X-Received: by 2002:a05:600c:1d9a:b0:3cf:6a83:bd19 with SMTP id
 p26-20020a05600c1d9a00b003cf6a83bd19mr7668668wms.29.1668428411481; 
 Mon, 14 Nov 2022 04:20:11 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 c7-20020a1c3507000000b003c6f1732f65sm17125095wma.38.2022.11.14.04.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:20:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 11/12] multifd: Zero pages transmission
In-Reply-To: <a422638b88db67dc0bc26526578ee5be3880b6a8.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Fri, 02 Sep 2022 10:27:32
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-12-quintela@redhat.com>
 <a422638b88db67dc0bc26526578ee5be3880b6a8.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 13:20:07 +0100
Message-ID: <878rkd683s.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
>> This implements the zero page dection and handling.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>

>> @@ -358,6 +365,18 @@ static int multifd_recv_unfill_packet(MultiFDRecvPa=
rams *p, Error **errp)
>>          p->normal[i] =3D offset;
>>      }
>>=20=20
>> +    for (i =3D 0; i < p->zero_num; i++) {
>> +        uint64_t offset =3D be64_to_cpu(packet->offset[p->normal_num + =
i]);
>> +
>> +        if (offset > (block->used_length - p->page_size)) {
>> +            error_setg(errp, "multifd: offset too long %" PRIu64
>> +                       " (max " RAM_ADDR_FMT ")",
>> +                       offset, block->used_length);
>> +            return -1;
>> +        }
>> +        p->zero[i] =3D offset;
>> +    }
>> +
>>      return 0;
>>  }
>
> IIUC ram_addr_t is supposed to be the address size for the architecture, =
mainly
> being 32 or 64 bits. So packet->offset[i] is always u64, and p->zero[i] p=
ossibly
> being u32 or u64.
>
> Since both local variables and packet->offset[i] are 64-bit, there is no =
issue.
>
> But on=C2=A0'p->zero[i] =3D offset' we can have 'u32 =3D u64', and this s=
hould raise a
> warning (or am I missing something?).

I don't really know what to do here.
The problem is only theoretical (in the long, long past, we have
supported migrating between different architectures, but we aren't
testing anymore).

And because it was a pain in the ass, we define it as:

/* address in the RAM (different from a physical address) */
#if defined(CONFIG_XEN_BACKEND)
typedef uint64_t ram_addr_t;
#  define RAM_ADDR_MAX UINT64_MAX
#  define RAM_ADDR_FMT "%" PRIx64
#else
typedef uintptr_t ram_addr_t;
#  define RAM_ADDR_MAX UINTPTR_MAX
#  define RAM_ADDR_FMT "%" PRIxPTR
#endif

So I am pretty sure that almost nothing uses 32bits for it now (I
haven't checked lately, but I guess that nobody is really using/testing
xen on 32 bits).

I don't really know.  But it could only happens when you are migrating
from Xen 64 bits to Xen 32 bits, I don't really know if that even work.

I will give it a try to change normal/zero to u64.

Thanks, Juan.


