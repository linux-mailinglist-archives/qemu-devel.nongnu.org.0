Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136B06FC56D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:53:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwLsz-00067N-KH; Tue, 09 May 2023 07:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwLsx-00066o-5u
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwLsv-0003pT-H8
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683633120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WBmsz39Ta5feQF/zw1CymguVHmscbw1g8Tl6P2Ukpuw=;
 b=GsO8V/KXNDkqSNqPpqIKn37w9LLc63PR+t5xKP8h/cFn0+Qgo0090k/5YRTMj5NOvCqRRM
 EX5nivrNyE6Rh+TWpGJXNRFirKpKPJfySZ9DTYNX2mgzFiRvzTZahtNfHn1l0ojAWbbJqn
 KOONCDx3tIdBP3Z/C2HM0OypL3J0Ouk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-W5esIr6mM9OF4wPCwJitow-1; Tue, 09 May 2023 07:51:59 -0400
X-MC-Unique: W5esIr6mM9OF4wPCwJitow-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3063394ae41so1992999f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683633118; x=1686225118;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WBmsz39Ta5feQF/zw1CymguVHmscbw1g8Tl6P2Ukpuw=;
 b=HLhi3zcEyJGOX8feKJcsGKijeX3jf2gdGXlzFUJEdZ3M90wBV7x97em0Pt+ZaLtFpD
 /w9LkPu+Kxkz7XGVX78pC9ZFCo565JTPn1FLa/HrDDTbOOK33C9BJ2KnfJwDsPUPf1cY
 YnTI/NCFPIj6OoGyQHm7B4TCQ9GLlx3XTiWJOmElgBii0U8+so/hawXlFt1H4ciWk20/
 rd9+EhmquDcvFC7+Phb/YFuvb4IoFNC5/nKoJPmJHfmdiqRCzVJyKx/ZMm4w5FnUU3Gl
 juxgya9rcfhMDxmd8ldavrFPbTLRso4erVyXxeflVpxcInR6sxmcxg1/GhLC7qAYBxe+
 A2+g==
X-Gm-Message-State: AC+VfDxLlCGmYAY3bNVpqJEDXXOeFrzdYiMxjlMoU/EhT2sp+xAweGV+
 qHkkC6pJL4j2xbudkj6Qsepf4MaEOX5VIoH6WpV3aZs9lxjkyPDCFkgNdHtrcC6Fj5WAYc0JEtm
 gfhf1CaT/XccmJYQ=
X-Received: by 2002:a5d:5221:0:b0:2fb:703d:1915 with SMTP id
 i1-20020a5d5221000000b002fb703d1915mr8925564wra.43.1683633118145; 
 Tue, 09 May 2023 04:51:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VM1lFa1sa/XGnycY6tj8mL6juiwcapMdb7ewmnis50zDaJ++X/Ir2Ax3PjmZPhI2C/03lZg==
X-Received: by 2002:a5d:5221:0:b0:2fb:703d:1915 with SMTP id
 i1-20020a5d5221000000b002fb703d1915mr8925547wra.43.1683633117779; 
 Tue, 09 May 2023 04:51:57 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6803000000b00307a83ea722sm1039226wru.58.2023.05.09.04.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 04:51:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,  David Hildenbrand
 <david@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org,  Eric Blake <eblake@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  John Snow
 <jsnow@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Peter Xu
 <peterx@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Eric Farman
 <farman@linux.ibm.com>,  Greg Kurz <groug@kaod.org>,  qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,  Fam Zheng <fam@euphon.net>,  Thomas Huth
 <thuth@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>,  Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 02/21] migration: Don't use INT64_MAX for unlimited rate
In-Reply-To: <9ab54244-b804-e066-580f-3d4e89fb7862@linux.ibm.com> (Harsh
 Prateek Bora's message of "Tue, 9 May 2023 17:11:36 +0530")
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-3-quintela@redhat.com>
 <9ab54244-b804-e066-580f-3d4e89fb7862@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 13:51:56 +0200
Message-ID: <87cz39en8j.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Harsh Prateek Bora <harshpb@linux.ibm.com> wrote:
> On 5/8/23 18:38, Juan Quintela wrote:
>> Use 0 instead.
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/migration.c | 4 ++--
>>   migration/qemu-file.c | 3 +++
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 1192f1ebf1..3979a98949 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -2296,7 +2296,7 @@ static void migration_completion(MigrationState *s)
>>               }
>>               if (ret >= 0) {
>>                   s->block_inactive = !migrate_colo();
>> -                qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>> +                qemu_file_set_rate_limit(s->to_dst_file, 0);
>
> #define RATE_LIMIT_MAX 0
>
> How about having a macro and use that which conveys the meaning in all
> call instances wherever it is getting passed ?

I almost preffer the macro.

      qemu_file_set_rate_limit(s->to_dst_file, RATE_LIMIT_MAX);

seems quite explanatory?

Thanks, Juan.

>
>>                   ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>>                                                            s->block_inactive);
>>               }
>> @@ -3044,7 +3044,7 @@ static void *bg_migration_thread(void *opaque)
>>       rcu_register_thread();
>>       object_ref(OBJECT(s));
>>   -    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
>> +    qemu_file_set_rate_limit(s->to_dst_file, 0);
>>         setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
>>       /*
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index f4cfd05c67..745361d238 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -731,6 +731,9 @@ int qemu_file_rate_limit(QEMUFile *f)
>>       if (qemu_file_get_error(f)) {
>>           return 1;
>>       }
>> +    /*
>> +     *  rate_limit_max == 0 means no rate_limit enfoncement.
>> +     */
>>       if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
>>           return 1;
>>       }


