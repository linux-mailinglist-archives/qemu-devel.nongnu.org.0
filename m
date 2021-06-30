Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65113B7F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:06:03 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWAU-0004tj-Ku
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyW9G-000471-HL
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lyW9E-0005iw-Fk
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625043883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7VADrFGWD0ohf4UNwNwkWETXfUiBXZEDzrQIOUidS0=;
 b=RAh2P0+hFInRzLcTZohY3sy3Dd2hYa84PsCR5++68qs7TYb6ZxW5qeann7LEs6OiLPIdD+
 XAD9xhGRvz4gBaxp26OKmaAH9vuAuIG80gYikPn5IutVFhNS5Pb7X9louUMD0UepMv4dLL
 0Fj/W+wgXNkQbE0Aic+TahZK6O/olcQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-t1ac1jGEMkmVDH53Ly8oTw-1; Wed, 30 Jun 2021 05:04:42 -0400
X-MC-Unique: t1ac1jGEMkmVDH53Ly8oTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m40-20020a05600c3b28b02901f42375a73fso182254wms.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 02:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R7VADrFGWD0ohf4UNwNwkWETXfUiBXZEDzrQIOUidS0=;
 b=nTO+UzYF6ptq7NTIynPso1ZysPJo6sicFczN5KGaUcd2wbMb2/ZOaMuL/uzV+zWx6D
 LbBCNjw9y+t3sVoSgkJFMr9Y6waDUVu5St/9B+0zb9kKmGggqu7qaURMNa53wm5MNdhG
 p8oVTeVQ9esUZ7koZoOSEjQpSCEhipyhBKS6sjtGRezvV+YFxLfeiMe+/BF0pFmPeggW
 ODmtBB9Q8S0jDRAihT3lZa/2dHO9Ybk+e9GrSakjWL1J94LXLRclAMf4tj8WkoMbcP9W
 4gxcpXRLA+ouTH4hATu/R3XA9Bboe/C/td8KCnXDah73EgeHQvj7mvdBYpOKKHaEmVdr
 QAOA==
X-Gm-Message-State: AOAM53305QiBwGsDJoA3zQQ4Ay1KCnV28RStnfiUDKeS4yxjEmjxE1mI
 YwAsz/10nTwY5eIi18ASoswI3W65vhypRlj4G+TvGK9Pe+m8yF3Woprrt93Kwe78Iu3zCuYTfPw
 x7DIcSLsh9IuId7A=
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr22828819wri.178.1625043881073; 
 Wed, 30 Jun 2021 02:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMK8wubcRWBgwOWjocZyp16NHPkLhQyUMt3L24lz72EfJ9f1ibs8uI1UfquQTYxyXSw8R13w==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr22828796wri.178.1625043880787; 
 Wed, 30 Jun 2021 02:04:40 -0700 (PDT)
Received: from [192.168.100.43] ([82.142.0.246])
 by smtp.gmail.com with ESMTPSA id i11sm5592890wmg.18.2021.06.30.02.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:04:40 -0700 (PDT)
Subject: Re: [PATCH 2/2] migration: failover: continue to wait card unplug on
 error
To: quintela@redhat.com
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-3-lvivier@redhat.com> <87im1wk1ap.fsf@secure.mitica>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <c7ec3af8-5649-4e53-ef5c-39f7adc54e2b@redhat.com>
Date: Wed, 30 Jun 2021 11:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im1wk1ap.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 19:50, Juan Quintela wrote:
> Laurent Vivier <lvivier@redhat.com> wrote:
>> If the user cancels the migration in the unplug-wait state,
>> QEMU will try to plug back the card and this fails because the card
>> is partially unplugged.
>> To avoid the problem, continue to wait the card unplug, but to
>> allow the migration to be canceled if the card never finishes to unplug
>> use a timeout.
>>
>> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>  migration/migration.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 3e92c405a2b6..3b06d43a7f42 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3679,6 +3679,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>>                 qemu_savevm_state_guest_unplug_pending()) {
>>              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>>          }
>> +        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
>> +            int timeout = 120; /* 30 seconds */
>> +            /*
>> +             * migration has been canceled
>> +             * but as we have started an unplug we must wait the end
>> +             * to be able to plug back the card
>> +             */
>> +            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
>> +                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>> +            }
>> +        }
>>  
>>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>>      } else {
> I agree with the idea.  But if we are getting out due to timeout == 0,
> shouldn't we return some error, warning, whatever?

In that case, we keep the current behaviour: guest kernel will report an error when it
will try to plug back the card that has not been unplugged. This is a corner case: if it
happens we have something really wrong with the machine. Perhaps we can remove the
timeout, but I don't like to block the user, or increase it to be sure.

Thanks,

Laurent



