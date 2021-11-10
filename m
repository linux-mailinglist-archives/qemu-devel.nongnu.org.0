Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718D44C504
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:30:20 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqUM-0005mP-TW
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:30:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkqTQ-00050X-0H
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mkqTM-00053T-8m
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636561754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNtSp6TBkRUOHT/fPSGKqxZsDA+B4IImjlS0bgXpm0c=;
 b=UAQIKCh2gXLTUdRfdbr/XEVEoLM/6c0sfQMBRTsNyvnjXMW7M1yG+Io+ydtGD/iBIQw+BJ
 a7X++43iyzjC7p0X6VmH7G3+7bS45qK1vGjxgKuLYaWHZRV4lt+QoyqIcmwIwL9eTu/bJk
 Y9W4sWN7dnbETjzlBY9Z+7kRavYN0i4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-roAIxvNeNjW3Ugongfl0pQ-1; Wed, 10 Nov 2021 11:29:13 -0500
X-MC-Unique: roAIxvNeNjW3Ugongfl0pQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a05640250cd00b003e35ea5357fso2821104edb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jNtSp6TBkRUOHT/fPSGKqxZsDA+B4IImjlS0bgXpm0c=;
 b=T4i0YS88NfHI1vLNdWLdv8PFlgzuS2VdnFszgtdvPgeP+B2t+GsWq4qLWqsebqjt8S
 jvW6gxJ7WTf6j2gsmnXeq1bA6WnN6K803cG98nKtGB9nkRF57EAHplrTIgS2FI0wDe7P
 577bmsLnDaW8/mZ7dFFXD2oiKT1x85NBR1J7rnTT1xxwVDLNJ1WpB4gIdtZ34/6wpmHC
 lomab/bgFiAOcGHdsWs+GGreS8MDwHt036WRst/z0FXtmLO8pgBPw92yHq8bHP02Lls0
 GwmSIpSOVcc1mb63f27kPE9Ny5UfH0Tl7BaGiEFXqqQW68+UeZcWyWDdJIyx2LC8WSPi
 //OA==
X-Gm-Message-State: AOAM533AFC/KqpFlYrJMf28Y9PQ2sN2dZYkCIV0A89O9Sr6PDfLiqfXM
 284kkdulJ4tMpH86o5aL6BxtaDprXPL/RDitMfnfCa3Fd6So+IQtm0EpZvxalwwPeidVvfCUKmn
 pgUmY+BkCn945AC0=
X-Received: by 2002:a17:906:7044:: with SMTP id
 r4mr476567ejj.256.1636561752170; 
 Wed, 10 Nov 2021 08:29:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6r7eniqAAYzLW3SSAUozzrQdEAVT2h650S7kjZJsK7dKpsFxKigw5A2Th1LH11hM64ayOxw==
X-Received: by 2002:a17:906:7044:: with SMTP id
 r4mr476534ejj.256.1636561751970; 
 Wed, 10 Nov 2021 08:29:11 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id sh30sm103194ejc.117.2021.11.10.08.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 08:29:11 -0800 (PST)
Message-ID: <3a8e8e0c-672b-ee72-3fc2-a5f4545416ea@redhat.com>
Date: Wed, 10 Nov 2021 17:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [Ping][PATCH v0] vl: flush all task from rcu queue before exiting
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211102133901.286027-1-den-plotnikov@yandex-team.ru>
 <96bfe630-fb3d-2ac8-60b8-ae23ed7b3742@yandex-team.ru>
 <5830d625-de03-7dc7-c662-e434ebeaa651@redhat.com>
 <830c8775-4d39-f91c-d223-2934d8cc1c21@yandex-team.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <830c8775-4d39-f91c-d223-2934d8cc1c21@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yc-core@yandex-team.ru, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 14:29, Denis Plotnikov wrote:
> 
> On 09.11.2021 20:46, Paolo Bonzini wrote:
>> On 11/9/21 08:23, Denis Plotnikov wrote:
>>> Ping ping!
>>
>> Looks good, but can you explain why it's okay to call it before 
>> qemu_chr_cleanup() and user_creatable_cleanup()?
>>
>> I think a better solution to the ordering problem would be:
>>
>>   qemu_chr_cleanup();
>>   user_creatable_cleanup();
>>   flush_rcu();
>>   monitor_cleanup();
> I agree, this looks better
>>
>> with something like this:
>>
>> diff --git a/chardev/char-fe.c b/chardev/char-fe.c
>> index 7789f7be9c..f0c3ea5447 100644
>> --- a/chardev/char-fe.c
>> +++ b/chardev/char-fe.c
>> @@ -195,6 +195,7 @@ bool qemu_chr_fe_init(CharBackend *b,
>>      int tag = 0;
>>
>>      if (s) {
>> +        object_ref(OBJECT(s));
>>          if (CHARDEV_IS_MUX(s)) {
>>              MuxChardev *d = MUX_CHARDEV(s);
>>
>> @@ -241,6 +242,7 @@ void qemu_chr_fe_deinit(CharBackend *b, bool del)
>>              } else {
>>                  object_unref(obj);
>>              }
>> +            object_unref(obj);
>>          }
>>          b->chr = NULL;
>>      }
>>
>> to keep the chardev live between qemu_chr_cleanup() and 
>> monitor_cleanup().
> 
> but frankly speaking I don't understand why we have to do ref/unref in 
> char-fe interface functions, instead of just ref/uref-ing monitor's char 
> device directly like this:
> 
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 21c7a68758f5..3692a8e15268 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -611,6 +611,7 @@ void monitor_data_destroy(Monitor *mon)
>   {
>       g_free(mon->mon_cpu_path);
>       qemu_chr_fe_deinit(&mon->chr, false);
> +    object_unref(OBJECT(&mon->chr));
>       if (monitor_is_qmp(mon)) {
>           monitor_data_destroy_qmp(container_of(mon, MonitorQMP, common));
>       } else {
> @@ -737,6 +738,7 @@ int monitor_init(MonitorOptions *opts, bool 
> allow_hmp, Error **errp)
>           error_propagate(errp, local_err);
>           return -1;
>       }
> +    object_ref(OBJECT(chr));
>       return 0;
>   }
> 
> May be this shows the intentions better?

Sure, that works too.  But in the end the char-fe _is_ the place where 
the extra reference is taken/dropped (in the ->chr field of 
CharBackend), so I was thinking of a more generic solution too.  Feel 
free to submit yours though, it's certainly safer for 6.2 freeze.

Paolo


