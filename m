Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599F702B5E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:24:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyWIt-0007Y1-EC; Mon, 15 May 2023 07:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWIp-0007VO-BI
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:23:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyWIn-0002I3-He
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684149820;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fd0GrrK3Nat6wJhnJbTQKaHlJgsHg91+Y5TyYv7kstY=;
 b=caUSdYypWwkQ73YMFyqHpC36Szl0y9lYqg+Bpcw/3jWht4MbcNSJLX1iCoQGhCVRcgRpHA
 GyrDYxbaCstOLlf3hTZwWFTuDiDwEqizDlJeXpPb8MYiTfxkteHWslbXpPsVNvaw7+yPfr
 BIAF0XZI1Tche4JnSY3WtF/FxjwhUIM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-RV6dPGE4MDumZRQzmxkd7Q-1; Mon, 15 May 2023 07:23:39 -0400
X-MC-Unique: RV6dPGE4MDumZRQzmxkd7Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f420ec766dso58549845e9.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684149818; x=1686741818;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fd0GrrK3Nat6wJhnJbTQKaHlJgsHg91+Y5TyYv7kstY=;
 b=e7PCpTjxPZ5T7HNUnUE8xy6LNRyGErsrMqygqjTLj3J0XGcJf1v223xXQkqutifsmL
 ea0tJa2tCvyyfKc2aDuAJ4IaeT4HJM/ypFVddzzFzUpx7nHmUwpTDb3+OvbS9SzoLtGD
 ipOV6BZ6BYMdkMf8iwFwrmrqaU2Kxg0wCl++8lkWkJ+FDMAfOB7lvumUGmoQSM2oBFTH
 ifElRL3N/9iB1tv5Uy105U7I0i3+MijvcOT41LOHAGCh1B8Bbha8xp7iIjDyJJ2SigFC
 06N02AQqnIG3vmegYk09hCKyYMByHJvb68fHODBy5jtv+WBf7eRecdEsXnqVoosNEgYb
 73IA==
X-Gm-Message-State: AC+VfDyX4GAg8ga4WGIpkitZe2iPsv13isFxj8yOmJK1nwjAtuj25yDm
 DMinh1KpoWnNPdnTd9ghOM0KWWpM0LeAv5hbZaKKGhPP+o9ik+fhoMb1/Jq9mJ6VzfDTmaOwZiT
 IzdYGPPxbt8ii2MI=
X-Received: by 2002:adf:df0c:0:b0:2f9:cee4:b7d with SMTP id
 y12-20020adfdf0c000000b002f9cee40b7dmr20745986wrl.70.1684149817989; 
 Mon, 15 May 2023 04:23:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5R6mL1cgDdM9E5n+AE34BL1b5MrW/ad6rtr/SpLbsORvDablA5E0HgHeKmr4/N0HbKSYMj6w==
X-Received: by 2002:adf:df0c:0:b0:2f9:cee4:b7d with SMTP id
 y12-20020adfdf0c000000b002f9cee40b7dmr20745960wrl.70.1684149817661; 
 Mon, 15 May 2023 04:23:37 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003f1738d0d13sm28102545wms.1.2023.05.15.04.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 04:23:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  <qemu-block@nongnu.org>,  Eric
 Blake <eblake@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  John Snow <jsnow@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Eric Farman <farman@linux.ibm.com>,  Greg Kurz
 <groug@kaod.org>,  <qemu-ppc@nongnu.org>,  <qemu-s390x@nongnu.org>,  Fam
 Zheng <fam@euphon.net>,  Thomas Huth <thuth@redhat.com>,  Leonardo Bras
 <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 08/21] migration: Move setup_time to mig_stats
In-Reply-To: <f977b30c-448a-6791-affe-6c74b7d64fc4@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 15 May 2023 12:35:26 +0200")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-9-quintela@redhat.com>
 <f977b30c-448a-6791-affe-6c74b7d64fc4@kaod.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 13:23:36 +0200
Message-ID: <87353x25zb.fsf@secure.mitica>
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

C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 5/8/23 15:08, Juan Quintela wrote:
>> It is a time that needs to be cleaned each time cancel migration.
>> Once there ccreate calculate_time_since() to calculate how time since
>> a time in the past.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/migration-stats.c |  7 +++++++
>>   migration/migration-stats.h | 14 ++++++++++++++
>>   migration/migration.c       |  9 ++++-----
>>   migration/migration.h       |  1 -
>>   4 files changed, 25 insertions(+), 6 deletions(-)
>> diff --git a/migration/migration-stats.c
>> b/migration/migration-stats.c
>> index 2f2cea965c..5278c6c821 100644
>> --- a/migration/migration-stats.c
>> +++ b/migration/migration-stats.c
>> @@ -12,6 +12,13 @@
>>     #include "qemu/osdep.h"
>>   #include "qemu/stats64.h"
>> +#include "qemu/timer.h"
>>   #include "migration-stats.h"
>>     MigrationAtomicStats mig_stats;
>> +
>> +void calculate_time_since(Stat64 *val, int64_t since)
>> +{
>> +    int64_t now =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
>> +    stat64_set(val, now - since);
>> +}
>> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
>> index cf8a4f0410..73c73d75b9 100644
>> --- a/migration/migration-stats.h
>> +++ b/migration/migration-stats.h
>> @@ -69,6 +69,10 @@ typedef struct {
>>        * Number of bytes sent during precopy stage.
>>        */
>>       Stat64 precopy_bytes;
>> +    /*
>> +     * How long has the setup stage took.
>> +     */
>> +    Stat64 setup_time;
>>       /*
>>        * Total number of bytes transferred.
>>        */
>> @@ -81,4 +85,14 @@ typedef struct {
>>     extern MigrationAtomicStats mig_stats;
>>   +/**
>> + * calculate_time_since: Calculate how much time has passed
>> + *
>> + * @val: stat64 where to store the time
>> + * @since: reference time since we want to calculate
>> + *
>> + * Returns: Nothing.  The time is stored in val.
>> + */
>> +
>> +void calculate_time_since(Stat64 *val, int64_t since);
>
> Since this routine is in the "migration" namespace, I would rename it to
>
>   void migration_time_since(Stat64 *val, int64_t since);
>
> of even
>
>   void migration_time_since(MigrationAtomicStats *stat, int64_t since);
>
> Do you need it elsewhere than in migration.c ?

Not yet.

I can change to this and later change if needed.

Thanks, Juan.


