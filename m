Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DA628F68
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:39:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouio4-00007J-5c; Mon, 14 Nov 2022 18:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifU-0004Q9-Ja
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouYZA-0005rn-Rf
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668428875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaXBAdOAsTx3kRw40YZNytxPdh6IenbSt6zZUTFWaAE=;
 b=DDy9WkfO4GHw5tow2yrLIR4jPZTNehazVyowS0V6kqcHSc9GlpOi8fI0eN0JnYht3j8Aqm
 WvGQwRnJGF4B9p9xbwgqtSF42m0fBJJZ61S5G+qNaKvfiVgMB0EH5dJO9iQwpLaGJ49nmy
 Fiar79J3+Z4zqDdmwSXDqBFCXqX66HI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-DzxCtzJVOeyqCJu9wMPieA-1; Mon, 14 Nov 2022 07:27:54 -0500
X-MC-Unique: DzxCtzJVOeyqCJu9wMPieA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso6707030wmh.2
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WaXBAdOAsTx3kRw40YZNytxPdh6IenbSt6zZUTFWaAE=;
 b=d4Q03104KyT/0uWOsCyjM3gkKZzax5p2CIqoSh5k9Ej/WZONaC1ZgU0edH240L17iQ
 12JnObdGEz5MF+wUJecbocwBqldUEB5JK/tzouLMpXuvEy7p3ziFq0E3F+C9d9dvToaJ
 fC74LT/RZGglh4JWdxsAC3dxaibsIbWKzdxQA3hdRNIPTgp8efqi6X40CYNkf8lRpRX0
 E99qwq971mV3L2epTFPrctPsiorS599er2rcB+AGTNrI2iTEYsu+PTA4f77qxzjesugR
 HGjH/bkdXiU0YW5CZ8l8MuwX6OggupRqp5Oceu59jVkJURfNLllINVaegfJDbCLg8aYt
 ZhDA==
X-Gm-Message-State: ANoB5pkk6FZRdoIfKMhUMP6yJWNEo6axPQFSSA3nzQqB1l2VufrgASLy
 yV4cxXra0VxT90yYHGuF/scZM5s/cfQaqtZ1kM6wQwjVcEsdJIc+2oSlX+aa/nR58Sog4DZduG5
 2O4rdDzgKyZiHzZI=
X-Received: by 2002:adf:cf05:0:b0:236:da43:2ef1 with SMTP id
 o5-20020adfcf05000000b00236da432ef1mr7443197wrj.697.1668428873536; 
 Mon, 14 Nov 2022 04:27:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6okP45PBbZ176z7WlgTlAuUoRbcWnhhNiNXZBfuax+j52WY33/lVw9tmRKnPfKsqHArZS0cg==
X-Received: by 2002:adf:cf05:0:b0:236:da43:2ef1 with SMTP id
 o5-20020adfcf05000000b00236da432ef1mr7443166wrj.697.1668428873140; 
 Mon, 14 Nov 2022 04:27:53 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4cc2000000b0023655e51c14sm9341340wrt.32.2022.11.14.04.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:27:52 -0800 (PST)
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
Date: Mon, 14 Nov 2022 13:27:48 +0100
Message-ID: <874jv167qz.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi

on further investigation, I see why it can't be a problem.


>>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **err=
p)
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

We are checked that we are inside the RAM block.  You can't have a
bigger that 32bit offset when you have 32bits of RAM.


>> @@ -688,8 +710,16 @@ static void *multifd_send_thread(void *opaque)
>>              }
>>=20=20
>>              for (int i =3D 0; i < p->pages->num; i++) {
>> -                p->normal[p->normal_num] =3D p->pages->offset[i];
>> -                p->normal_num++;
>> +                uint64_t offset =3D p->pages->offset[i];

We are reading the offset here.
p->pages->offset is ram_addr_t, so no prolbem here.

>> +                if (use_zero_page &&
>> +                    buffer_is_zero(rb->host + offset, p->page_size)) {
>> +                    p->zero[p->zero_num] =3D offset;
>
> Same here.

This and next case are exactly the same, we are doing:

ram_addr_t offset1;
u64 foo =3D offset1;
ram_addr_t offest2 =3D foo;

So, it should be right.  Everything is unsigned here.

>> +                    p->zero_num++;
>> +                    ram_release_page(rb->idstr, offset);
>> +                } else {
>> +                    p->normal[p->normal_num] =3D offset;
>
> Same here? (p->normal[i] can also be u32)

Thanks, Juan.


