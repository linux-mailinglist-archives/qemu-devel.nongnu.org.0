Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F1B6978BA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 10:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDm7-0007f1-O8; Wed, 15 Feb 2023 04:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSDm4-0007dV-UM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSDm3-0007Ne-6y
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 04:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676452102;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lHUOmfC1lRRkByqhL4HdyJxZD38Ai4tFvFlBvxFbWNY=;
 b=Py6BqQNCDsrHc0JhavRkHlZghlq5ZZ6rrfIVSJvVBPZ35DPRfUF07g250p+z1JW2OoqkvP
 qe/Eiu9cZ7MXc9K49CJMcQfz4CbqdYiBC7X/8+CvEoxfVgSRYfp8fB2lL/iekVLaJpjr02
 ZIDlr/eefe6N2CNfM1jGp9nG3cd9/sg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-441-e9VzkTEKMjuSX7hPLxa_TQ-1; Wed, 15 Feb 2023 04:08:21 -0500
X-MC-Unique: e9VzkTEKMjuSX7hPLxa_TQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l21-20020a05600c4f1500b003e00be23a70so890798wmq.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 01:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lHUOmfC1lRRkByqhL4HdyJxZD38Ai4tFvFlBvxFbWNY=;
 b=jzhIOAXscgvSzFe9R8xyckXYXa+p2/F5Cmd8iISOZPl0IBzGl1QbbegdiD9RWGRNI+
 LV1jhyN4wXUNYP3kVJ/s1zqnxPaAGrYFDkhos06sGArefd2EnKaQIS3fXAy/NsspLrLu
 fz76PwDwJGJPnZ5TmAX2KJHN3v+u/YkqkAWK5qrSjLWs8+qqEOf9PDZP3KerEoM6L3Ne
 rw2ZfF1Kp62G1u+vQv3rH32sMZfJ9fR1zZ3JFCQ8QsaAz84IBKFrHip3+M0gs/MbB5xp
 jOQFgZRG5McnRjQ85cJnamahFTt+HRAB+aI6KbLFC6pSSN9sNbQHaGhysKdyMjE3nsNm
 OiDA==
X-Gm-Message-State: AO0yUKWwdAvy2B2hvBAxk//L6+S4RVPrbJ93n0r6ljfhyCpL0QLN0Z9T
 8ooYt20a3FZbL9BMZQ1cfoRv669Na5xKvKSShTlR+hBGxdbI+aRA/YJT9Y0wx7imOfiqOcV0X5g
 R0sdn1vNDkOv6M1s=
X-Received: by 2002:a5d:6a0c:0:b0:2c5:617a:5023 with SMTP id
 m12-20020a5d6a0c000000b002c5617a5023mr861970wru.71.1676452100021; 
 Wed, 15 Feb 2023 01:08:20 -0800 (PST)
X-Google-Smtp-Source: AK7set86qoWimEDBf+JfPWsM0OsrBhvynmJc7msaaInmKUHRsYxXQ2uabT1VQOO5L0vWw/7wgYR5hg==
X-Received: by 2002:a5d:6a0c:0:b0:2c5:617a:5023 with SMTP id
 m12-20020a5d6a0c000000b002c5617a5023mr861931wru.71.1676452099684; 
 Wed, 15 Feb 2023 01:08:19 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b002c5534db60bsm8764108wrn.71.2023.02.15.01.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 01:08:19 -0800 (PST)
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
Subject: Re: [PATCH 1/3] migration: In case of postcopy, the memory ends in
 res_postcopy_only
In-Reply-To: <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 9 Feb 2023 20:36:13 +0300")
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-2-quintela@redhat.com>
 <61c84841-7018-edb2-806b-921e2065f940@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 10:08:18 +0100
Message-ID: <87k00j47p9.fsf@secure.mitica>
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
>> So remove last assignation of res_compatible.
>
> I hoped for some description when asked to split it out :)
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>   migration/ram.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/migration/ram.c b/migration/ram.c
>> index b966e148c2..85ccbf88ad 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -3474,7 +3474,7 @@ static void ram_state_pending_exact(void *opaque,
>>         if (migrate_postcopy_ram()) {
>>           /* We can do postcopy, and all the data is postcopiable */
>> -        *res_compatible += remaining_size;
>> +        *res_postcopy_only += remaining_size;
>
> Actually, these "remaining_size" bytes are still compatible, i.e. we
> can migrate these pending bytes in pre-copy, and we actually do it,
> until user call migrate-start-postcopy, yes? But we exploit the fact
> that, this change don't affect any logic, just name becomes
> wrong.. Yes? Or I don't follow:/

I think of this from this different angle:
- if we are on precopy, we return on res_precopy everything (and nothing
  on res_postcopy)
- if we are on postcopy, we return on res_precopy what we _must_ sent
  through precopy, and in res_postcopy what we can sent through
  postcopy.

i.e. if we stop the guest and do the migration right now, what are we
going to send through each channel.

Later, Juan.


