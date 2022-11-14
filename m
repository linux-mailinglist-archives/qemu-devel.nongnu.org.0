Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D305C628DB3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:45:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinG-0007Ns-VD; Mon, 14 Nov 2022 18:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifU-0005gN-9H
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouYbo-0007Ob-OC
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 07:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668429039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xdp+CZjC1Ng3/pDBP0p3FiWxbGepNcKvyh8PFAx8V8=;
 b=Uf+j97tGRLp4J+X+Bfuioy4bAH6EUTeDW3s8duGvFRz+d7uyHYCccKNEQ0rRJyry8EmCJ5
 xNl7BRVnvQjUrQ7SZCJEjA3svy26Trelnt4/pMIt5Vu2xoZ7Mhnne4Byt/e3FDQmLlQ2Fi
 6OcfL0z8jPqA+Apxm9yrGcW0OH+YV+Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-ZtFwqPOBP0qThmPRADEkoA-1; Mon, 14 Nov 2022 07:30:36 -0500
X-MC-Unique: ZtFwqPOBP0qThmPRADEkoA-1
Received: by mail-wr1-f70.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso1952820wrc.10
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 04:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xdp+CZjC1Ng3/pDBP0p3FiWxbGepNcKvyh8PFAx8V8=;
 b=qwIqEXs0Pu2PeIFEbikiDNuVYdAbcJQh9D0gCTiNPkZPDCt/rqA6UKOcn0wDWByavX
 Gxb3gWItaAVQN2723tiSVLnrUbad5oe1pmtaAl+3scCYJhQZHoi1RRSbq52nKtgF/B05
 YMLYUcmvZGgWXnleE+Ao1j2zXABEMSw+jcX6mruBiUE9p1qpJmFndSu/cvI5v9k3aeVT
 REcPfg/P4XNBT/CJ/ZPW8mQPAP/x6cRY8SqPIvAMaljvPi1ZxJOy9ffJUY3J6gbr+uzS
 ocQs0RvkoMR3HxpRYe1gWBdZOgfLz7x/hamPGVMV7GHH/pCdSvVn7ErxoefcF1IbOIFX
 CFDA==
X-Gm-Message-State: ANoB5pmdp9J9P/2eFRjUzaayG7doZJ410JYDkL5sZSn6NVfPbx+P+iHe
 t26TUtyPteDlZpNXflo3SJe/TWcRWv3g0IJhVzSf2wa8kHxOpD6S28YdauhI2l+EeTV7PsjgA/F
 V0yxHzTr953QKNNQ=
X-Received: by 2002:a5d:61cc:0:b0:236:6f26:a0f2 with SMTP id
 q12-20020a5d61cc000000b002366f26a0f2mr7265796wrv.278.1668429034980; 
 Mon, 14 Nov 2022 04:30:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5MwS+zv9Tjp5j61GCmaFZfGNI1uvmUkPXWSZo7Z6pGoII8ErrkkAFbERJvTnzyXYblVVafyA==
X-Received: by 2002:a5d:61cc:0:b0:236:6f26:a0f2 with SMTP id
 q12-20020a5d61cc000000b002366f26a0f2mr7265780wrv.278.1668429034777; 
 Mon, 14 Nov 2022 04:30:34 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d5645000000b0022da3977ec5sm9406940wrw.113.2022.11.14.04.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 04:30:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 12/12] So we use multifd to transmit zero pages.
In-Reply-To: <2601bbd8eebdfec7bcc682632ef1480afc81feea.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Fri, 02 Sep 2022 10:27:36
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-13-quintela@redhat.com>
 <2601bbd8eebdfec7bcc682632ef1480afc81feea.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 13:30:25 +0100
Message-ID: <87wn7x4t26.fsf@secure.mitica>
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
>> Signed-off-by: Juan Quintela <quintela@redhat.com>

>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 89811619d8..54acdc004c 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -667,8 +667,8 @@ static void *multifd_send_thread(void *opaque)
>>  {
>>      MultiFDSendParams *p =3D opaque;
>>      Error *local_err =3D NULL;
>> -    /* qemu older than 7.0 don't understand zero page on multifd channe=
l */
>> -    bool use_zero_page =3D migrate_use_multifd_zero_page();
>> +    /* older qemu don't understand zero page on multifd channel */
>> +    bool use_multifd_zero_page =3D !migrate_use_main_zero_page();
>
> I understand that "use_main_zero_page", which is introduced as a new capa=
bility,
> is in fact the old behavior, and the new feature is introduced when this
> capability is disabled.
>
> But it sure looks weird reading:
>  use_multifd_zero_page =3D !migrate_use_main_zero_page();
>
> This series is fresh in my mind, but it took a few seconds to see that th=
is is
> actually not a typo.=20

We can't have it both ways.

All other capabilities are false by default.  And libvirt assumes they
are false.  So, or we are willing to change the expectations, or we need
to do it this way.

In previous versions, I had the capability named the other way around,
and I changed it due to this.

Thanks, Juan.


