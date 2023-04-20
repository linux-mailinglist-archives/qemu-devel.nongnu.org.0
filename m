Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21646E95E3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 15:33:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUOh-0004PL-38; Thu, 20 Apr 2023 09:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUOb-0004NH-Mk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppUOZ-0002qz-8m
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681997537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zhPweI+2TUkuSMHZg7b5r2+kgwXimM2BCj0g4xPXGLE=;
 b=cMpN+RkP7aLsCfLOQbvn3+HvGHjJso888dzoITx/FfsJ8/jgCA2Z9qWsCYOSOpnEZDi/e0
 Ae3ZZQZ04CbZhyIwUh2ePF5A+NpMtLyiooXrRSRuASxH59vSo6JaE80RP3FrkD+ruCYHMT
 NB+2YkeCWIYTjHfF1p6FgEMIJ0BZHtc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-WvZfOqLyNfG6tejBO-2jRg-1; Thu, 20 Apr 2023 09:32:16 -0400
X-MC-Unique: WvZfOqLyNfG6tejBO-2jRg-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg10-20020a05600c3c8a00b003ef7b61e2fdso601578wmb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681997535; x=1684589535;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zhPweI+2TUkuSMHZg7b5r2+kgwXimM2BCj0g4xPXGLE=;
 b=bBYU6cxUfqwAMHEFjanvfpfsD2JxmUezmLaX0zYCIVgoCB3Sf/RaHi+RUVadsFG89w
 6I30lkMWT3gH3rWF04YLBdNEFvCEU1yt9fIhrhklLvZL14bz4EiuEYXda6TNR7fta7Ez
 yvC5NgTgjYyMdXw1gtkHxkIVo7UtkcRccV/cGIuv0pSeQFCIVAA0jFe2QlaHUHxuOzkC
 exH7fdSQJbwZnTvAwLAT3KF1am9LMo8ndaLLpOrlMR9HMyE79nb7tJF1PjyRgPGja2Hh
 WtWLAL6tBxAPHfhy45Sw6Q/iQHu2OjcOwoqaNvlsWvFyu6Y2QLL96ArkUQe/0pVXtuTF
 HoTg==
X-Gm-Message-State: AAQBX9f6YvBxSCaV1szA+UQ4rzr4ioFHM5E8NO7M/fiOnVjTP62Wtzd9
 EvVQDc6pLhMRUwZRP45raz3XVQIceZdQFevZfdh2ut/EWB8NEs2kYmeNEKnxUtC3T8cpPlg+45+
 Z+mz6bYE6dAed6UQ=
X-Received: by 2002:a1c:7706:0:b0:3f1:70d5:1bee with SMTP id
 t6-20020a1c7706000000b003f170d51beemr1352093wmi.29.1681997534957; 
 Thu, 20 Apr 2023 06:32:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350aXQ6NtdLXWIUG1653E/J6f14cXQvBKdiS6D5Gb8TZf9LJUb7bqrAHw6De+ovSdQ/AIpTuiFw==
X-Received: by 2002:a1c:7706:0:b0:3f1:70d5:1bee with SMTP id
 t6-20020a1c7706000000b003f170d51beemr1352074wmi.29.1681997534652; 
 Thu, 20 Apr 2023 06:32:14 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b003f0ad8d1c69sm5301368wmb.25.2023.04.20.06.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:32:14 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  David Hildenbrand <david@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Hailiang Zhang <zhanghailiang@xfusion.com>,  Fam
 Zheng <fam@euphon.net>,  "Michael S. Tsirkin" <mst@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 06/43] migration: Move migrate_use_compression() to
 options.c
In-Reply-To: <4fc019c2-98c1-929a-a0c1-dcf441fda0c1@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 20 Apr 2023 15:58:26 +0300")
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-7-quintela@redhat.com>
 <4fc019c2-98c1-929a-a0c1-dcf441fda0c1@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 15:32:13 +0200
Message-ID: <87jzy6wug2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> On 02.03.23 19:33, Juan Quintela wrote:
>> Once that we are there, we rename the function to migrate_compress()
>> to be consistent with all other capabilities.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>> ---
>>   migration/migration.h |  1 -
>>   migration/options.h   |  1 +
>>   migration/migration.c | 11 +----------
>>   migration/options.c   |  9 +++++++++
>
> [..]
>
>> --- a/migration/options.c
>> +++ b/migration/options.c
>> @@ -41,6 +41,15 @@ bool migrate_colo(void)
>>       return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
>>   }
>>   +bool migrate_compress(void)
>> +{
>> +    MigrationState *s;
>> +
>> +    s = migrate_get_current();
>> +
>> +    return s->capabilities[MIGRATION_CAPABILITY_COMPRESS];
>> +}
>
> Probably, we could generate these functions automatically, or at least
> have a helper, so that all such functions are one-line wrappers on
> that helper.

Markus, or any other qapi guru, I would be happy if this could be
managed automagically O:-)

Later, Juan.


