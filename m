Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BB599B04
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:37:32 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP0Jf-0005ni-68
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oP0Eh-0002hp-2s
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:32:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oP0Ed-0007Du-BZ
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660908735;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbTOlLP7/dU1JyrGfMDLSWhlZpMUStIr1dfpuvoaEUY=;
 b=WUOCdxf/a2f3BXKnZq19hhoWRc6VG9GpfmLYVo6T/L0egLzNkkQiq7ky3tXzJCf/Ki4UJo
 LLmDKVnzZ99hxN31hqbCePi08Hke1sc7scMvJpWOcsh2owujSdUXec3Y7B+OuTtKYaqcCG
 W//JtPVqzNPhHfNpYV6LQWfdZYlHHCI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-6WF1a0VUNwmrc1tOpU8vug-1; Fri, 19 Aug 2022 07:32:14 -0400
X-MC-Unique: 6WF1a0VUNwmrc1tOpU8vug-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a1c3b07000000b003a534ec2570so2684821wma.7
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=wbTOlLP7/dU1JyrGfMDLSWhlZpMUStIr1dfpuvoaEUY=;
 b=sQMvt+cT7iycgAjgQ28oXLfooRxfBs38W7yUwUaK8ZsdAIqguPtyKpSFAFzPD+p0s2
 eemlyYQicHefXr5utcNUaCGUv7Cdhr7nZhVSrvN7+Tiq427HBptr/QbTgIgBIk2gm9A6
 325ZBgauRJPJZsfcqh+yOQ+Kt6tumESs8Alr2YY0zzpAKfwieg8liWTwCXlJrxVhzR6R
 wNXBUcuhkNu7ke+hTaaxAVUwWUwpv2HYzR5mqtm/IPXEFj0pksP8BZhhOiNP1K4msnxQ
 Ae+j88eppl/1lLOyx2deYX19NHYXUpPWIMs/7dq4p+/h0P+jQC5KM1eWrpZuu6NRSkjn
 3sbg==
X-Gm-Message-State: ACgBeo1qaRimEC0Rol9Y9uA+lomSS5XBMkGSbo674+7SPI6GJ55pUj8K
 GndhDOqA7ggs6Kaqe2LfNkVLDZ4zG5+hYTGs15EBU8PsLXJ3J73IhsInNUH/n59ydU51vjqymbk
 i91TtI9FWvsGB+6k=
X-Received: by 2002:adf:dc8d:0:b0:225:2f5e:732d with SMTP id
 r13-20020adfdc8d000000b002252f5e732dmr3808900wrj.646.1660908732886; 
 Fri, 19 Aug 2022 04:32:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6PwmRtDqlWshLYSh7KWiaCeVyRqxw68jbJQZvnZxytUL52McM8hV71bWR+VndF6I9nhSpeGQ==
X-Received: by 2002:adf:dc8d:0:b0:225:2f5e:732d with SMTP id
 r13-20020adfdc8d000000b002252f5e732dmr3808882wrj.646.1660908732652; 
 Fri, 19 Aug 2022 04:32:12 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 u1-20020a7bcb01000000b003a502c23f2asm8584681wmj.16.2022.08.19.04.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:32:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 07/12] multifd: Prepare to send a packet without the
 mutex held
In-Reply-To: <b46a95640229beaabf8bc7af1254f9a95d23fbfb.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 06:16:28
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-8-quintela@redhat.com>
 <b46a95640229beaabf8bc7af1254f9a95d23fbfb.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 19 Aug 2022 13:32:11 +0200
Message-ID: <878rnk1nb8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
>> We do the send_prepare() and the fill of the head packet without the
>> mutex held.  It will help a lot for compression and later in the
>> series for zero pages.
>>=20
>> Notice that we can use p->pages without holding p->mutex because
>> p->pending_job =3D=3D 1.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h |  2 ++
>>  migration/multifd.c | 11 ++++++-----
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index a67cefc0a2..cd389d18d2 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -109,7 +109,9 @@ typedef struct {
>>      /* array of pages to sent.
>>       * The owner of 'pages' depends of 'pending_job' value:
>>       * pending_job =3D=3D 0 -> migration_thread can use it.
>> +     *                     No need for mutex lock.
>>       * pending_job !=3D 0 -> multifd_channel can use it.
>> +     *                     No need for mutex lock.
>>       */
>>      MultiFDPages_t *pages;
>>=20=20
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index 09a40a9135..68fc9f8e88 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -663,6 +663,8 @@ static void *multifd_send_thread(void *opaque)
>>                  p->flags |=3D MULTIFD_FLAG_SYNC;
>>                  p->sync_needed =3D false;
>>              }
>> +            qemu_mutex_unlock(&p->mutex);
>> +
>
> If it unlocks here, we will have unprotected:
> for (int i =3D 0; i < p->pages->num; i++) {
>     p->normal[p->normal_num] =3D p->pages->offset[i];
>     p->normal_num++;
> }
>
> And p->pages seems to be in the mutex-protected area.
> Should it be ok?

From the documentation:

    /* array of pages to sent.
     * The owner of 'pages' depends of 'pending_job' value:
     * pending_job =3D=3D 0 -> migration_thread can use it.
     *                     No need for mutex lock.
     * pending_job !=3D 0 -> multifd_channel can use it.
     *                     No need for mutex lock.
     */
    MultiFDPages_t *pages;

So, it is right.

> Also, under that we have:
>             if (p->normal_num) {
>                 ret =3D multifd_send_state->ops->send_prepare(p, &local_e=
rr);
>                 if (ret !=3D 0) {
>                     qemu_mutex_unlock(&p->mutex);
>                     break;
>                 }
>             }
>
> Calling mutex_unlock() here, even though the unlock already happened befo=
re,
> could cause any issue?

Good catch.  Never got an error there.

Removing that bit.

> Best regards,


Thanks, Juan.


