Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDAD696CAA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzwn-0002MJ-V3; Tue, 14 Feb 2023 13:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzwm-0002MA-NS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRzwl-0007LX-4c
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676398950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KE8OrptTTV8OnzMTHNgqQy0jgcA4z+jetYmD/6Ki8AQ=;
 b=Ji7sMyTYXY7KMvsyf3jHBcTCh4WarYpdh6Bdl5CCo+Eqmy9BoVgXeEa52vh8AoZ5ARpyBk
 s1NHGWpuAkLmYHo8jZTEAI1PQsho04ufSyG+Qeci95d68p/+c0q1SqSBm6nwZFQywAI/IF
 wFnn0+IDyRBFQUyGGuSCvfEp4d5Mj5I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-4ZrSy5eHOcWCj_m8HzF4mg-1; Tue, 14 Feb 2023 13:22:26 -0500
X-MC-Unique: 4ZrSy5eHOcWCj_m8HzF4mg-1
Received: by mail-wr1-f69.google.com with SMTP id
 c14-20020a5d528e000000b002c3f54b828bso3273482wrv.21
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KE8OrptTTV8OnzMTHNgqQy0jgcA4z+jetYmD/6Ki8AQ=;
 b=CydUL7SdiA7dWsD2l+rbl6Qj7qHnseSQi2Y+n/0YSqh94palZBrULDPUJq7AjTWBgL
 McZ9Pxl87pxI8LoMgEl8z/HHmOtyrW1v/Lz74rQLvnR3wX7WzCHxFECNBk1oAnXLDTUz
 GBafZ3SkTh0lJJCOW68mr/nfdP5c+1HHCvAlgXJAvRdP03bJQeY8b4IOjmo+p6EF1tf6
 amlECW+xOQq8lGaJkEMceY35V8kIWZfx9u+DTp7dI0LcZvVVBZvVEpXHZ3AP6lPA6ikZ
 CmDxxh9rdG6XmUdLiyMESgbw0IOM6FrO20EWtoRXxvI20QfPZpHywg1fUQoSc5cDwfzP
 MaKQ==
X-Gm-Message-State: AO0yUKV0qKlu8eNwr/2ycd93eEsYm/PVqZsC/q7jYQYBorM17vxVxmtU
 Cb5dN7bkCZ0tUlI/zxO8j8sOqy78BCyIJoLXIosR/wYx2qo6EUFGIF04FDb32mzprF8dCQc0U13
 Pwmqs7hi6jqQkwWY=
X-Received: by 2002:a05:600c:4918:b0:3db:2063:425d with SMTP id
 f24-20020a05600c491800b003db2063425dmr2811981wmp.2.1676398945633; 
 Tue, 14 Feb 2023 10:22:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/6FFGFQ0YGZ501rayy/fw63ddbOvbX+/KNhLfKF6HcSTuVkG+8z07ZpliVfmozEi75uGdF5g==
X-Received: by 2002:a05:600c:4918:b0:3db:2063:425d with SMTP id
 f24-20020a05600c491800b003db2063425dmr2811952wmp.2.1676398945349; 
 Tue, 14 Feb 2023 10:22:25 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q11-20020a7bce8b000000b003dd9232f036sm20181958wmj.23.2023.02.14.10.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 10:22:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org,  Alex Williamson <alex.williamson@redhat.com>,
 Fam Zheng <fam@euphon.net>,  Eric Blake <eblake@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  David
 Hildenbrand <david@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Eric
 Farman <farman@linux.ibm.com>,  qemu-s390x@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/3] migration: Remove _only suffix for
 res_postcopy/precopy
In-Reply-To: <6a3cfdab-ff8e-d07a-dd86-ce17eb5dc623@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 14 Feb 2023 18:27:14 +0300")
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-4-quintela@redhat.com>
 <6a3cfdab-ff8e-d07a-dd86-ce17eb5dc623@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 14 Feb 2023 19:22:23 +0100
Message-ID: <87cz6c5cps.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> On 08.02.23 16:57, Juan Quintela wrote:
>> Once that res_compatible is removed, they don't make sense anymore.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   include/migration/register.h   | 18 ++++++++----------
>>   migration/savevm.h             |  8 ++++----
>>   hw/s390x/s390-stattrib.c       |  7 +++----
>>   hw/vfio/migration.c            | 10 ++++------
>>   migration/block-dirty-bitmap.c |  6 +++---
>>   migration/block.c              |  7 +++----
>>   migration/ram.c                | 18 ++++++++----------
>>   migration/savevm.c             | 24 ++++++++++--------------
>>   8 files changed, 43 insertions(+), 55 deletions(-)
>> diff --git a/include/migration/register.h
>> b/include/migration/register.h
>> index a958a92a0f..4a4a6d7174 100644
>> --- a/include/migration/register.h
>> +++ b/include/migration/register.h
>> @@ -47,22 +47,20 @@ typedef struct SaveVMHandlers {
>>       /* This runs outside the iothread lock!  */
>>       int (*save_setup)(QEMUFile *f, void *opaque);
>>       /* Note for save_live_pending:
>> -     * - res_precopy_only is for data which must be migrated in precopy phase
>> +     * - res_precopy is for data which must be migrated in precopy phase
>>        *     or in stopped state, in other words - before target vm start
>> -     * - res_postcopy_only is for data which must be migrated in postcopy phase
>> +     * - res_postcopy is for data which must be migrated in postcopy phase
>>        *     or in stopped state, in other words - after source vm stop
>
>
> That's now wrong. "postcopy" is everything except "precopy", as it
> includes "compat". Really, for RAM, it can be copied in precopy too,
> and it is copied in precopy until user run command
> migrate-start-postcopy. (In contrast: block-dirty-bitmap cannot
> migrate in precopy at all, it migrate only in stopped state or in
> postcopy).
>
> So, finally:
>
> "precopy"
>
>   definition:
>   - must be migrated in precopy or in stopped state
>   - in other words: must be migrated before target start
>   - in other words: can't be migrated in postcopy
>   - in other words: can't be migrated after target start
>
> "postcopy"
>
>   definition:
>   - can migrate in postcopy
>   - in other words: can migrate after target start
>      some properties:
>   - probably can be migrated in precopy (like RAM), or, may be not (like block-dirty-bitmap)
>   - of course, can be migrated in stopped state

What about (with latest naming)

must_precopy:
* must be migrated in precopy or in stopped state
* i.e. must be migrated before target start

can_postcopy:
* can migrate in postcopy or in stopped state
* i.e. can migrate after target start
* some can also be migrated during precopy (RAM)
* some must be migrated after source stops (block-dirty-bitmap)

> To be absolutely clear, we may rename them to "not_postcopyable" and "postcopyable".

I hate negatives when naming variables.

What about: must_precopy and can_postcopy?

Later, Juan.


