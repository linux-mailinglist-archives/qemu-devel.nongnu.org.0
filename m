Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF125143AC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:11:53 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLjA-00024v-5O
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkLeG-0007sb-98
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:06:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkLeB-0000kL-8w
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651219598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WVskQDbhvK2fyGmdKwH2d6nR6U4oom6iwqjB6+e1+Wk=;
 b=WkB+ywgzRd8MUvDRaTUNB4sCjEIUMEunmeD+g7sJIz1C914Xtiv728s4Dnx+PPQkaLifY+
 goIt0PrwmUkqM4SfQ48l1uoa8MgFDkdahmt8FLK0YqCNCFW8YPCnIzbLu1M1T10q22ZyGi
 PB2+LorsXNOa1fbMtA4TtSiwFC+jb0c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-GWHBPCP_PB-Tkb_-Y-C3Ow-1; Fri, 29 Apr 2022 04:06:36 -0400
X-MC-Unique: GWHBPCP_PB-Tkb_-Y-C3Ow-1
Received: by mail-wr1-f71.google.com with SMTP id
 v13-20020adfc5cd000000b0020ad3580cd0so2771960wrg.10
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 01:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WVskQDbhvK2fyGmdKwH2d6nR6U4oom6iwqjB6+e1+Wk=;
 b=gOV7PEDWoQbg15ubx7WN8YoL/pIP2ESj+bnp+Uoh128HAPhNLY+0WsH5Pnr8/Xx2Rr
 GX/81omULTYwG3jgWywyzH/SAZvyca+sT4GWXQ450+CCQCNc/MQdDj04Ff4vfHtvixm5
 ClcvDorDG27sW5rb/q79CxXAT+RyECW1HvfN6JHxzZVgjvRDaPKhmTfw97CfwpLjPnwT
 0M5cYJfMGDfA5SFbrKjUjd04lpR0tt2uvDAGD2CmBrcWZugsIUAcWQkHhnN3QqU/kaTV
 WGJ86Rp+f8NAFUqYVZie0co9iphKrgFRG4vE0MggI9lFPRPICvwNVIYTgTU/oe8wzWTa
 Avuw==
X-Gm-Message-State: AOAM532WAXciw51s6uzhR2g5FWxt/rPupBdPYjcKk/e7iP3rAjHjRzDp
 Y3UE0xrQu1gKhW7TGvQ79znLdLsWsETzvz8tKmZZdzN7jWrI7uwAvqERupbmqzfqHKahDu1eA2I
 KULAYL9ycUYZzDH0=
X-Received: by 2002:a5d:504e:0:b0:20a:dba2:6fb3 with SMTP id
 h14-20020a5d504e000000b0020adba26fb3mr19615054wrt.541.1651219595693; 
 Fri, 29 Apr 2022 01:06:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6xUiQnY8mGBTXOgQILYmst9iXwEesYe/UFvh5O+T6X3o0lG7TpuSDkva+tF0s6wLNxKNHeA==
X-Received: by 2002:a5d:504e:0:b0:20a:dba2:6fb3 with SMTP id
 h14-20020a5d504e000000b0020adba26fb3mr19615045wrt.541.1651219595487; 
 Fri, 29 Apr 2022 01:06:35 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b00393e7cc06casm6368699wmq.3.2022.04.29.01.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:06:34 -0700 (PDT)
Message-ID: <d8ac2a96-4508-9cc3-9ca8-762851997103@redhat.com>
Date: Fri, 29 Apr 2022 10:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 1/8] aio_wait_kick: add missing memory barrier
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-2-eesposit@redhat.com>
 <Ymp12Ng5/mns+ngw@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Ymp12Ng5/mns+ngw@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 28/04/2022 um 13:09 schrieb Stefan Hajnoczi:
> On Tue, Apr 26, 2022 at 04:51:07AM -0400, Emanuele Giuseppe Esposito wrote:
>> It seems that aio_wait_kick always required a memory barrier
>> or atomic operation in the caller, but almost nobody actually
>> took care of doing it.
>>
>> Let's put the barrier in the function instead.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  util/aio-wait.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/util/aio-wait.c b/util/aio-wait.c
>> index bdb3d3af22..c0a343ac87 100644
>> --- a/util/aio-wait.c
>> +++ b/util/aio-wait.c
>> @@ -35,7 +35,8 @@ static void dummy_bh_cb(void *opaque)
>>  
>>  void aio_wait_kick(void)
>>  {
>> -    /* The barrier (or an atomic op) is in the caller.  */
>> +    smp_mb();
> 
> What is the purpose of the barrier and what does it pair with?
> 
> I guess we want to make sure that all stores before aio_wait_kick() are
> visible to the other thread's AIO_WAIT_WHILE() cond expression. that
> would require smp_wmb(). I'm not sure why it's a full smp_mb() barrier.

I think we need the full smp_mb barrier because we have a read
afterwards (num_readers) and we want to ensure ordering also for that.

Regarding pairing, yes you are right. I need to also add a smp_mb()
between the write(num_waiters) and read(condition) in AIO_WAIT_WHILE,
otherwise it won't work properly.

So we basically have

Caller:
	write(condition)
	aio_wait_kick()
		smp_mb()
		read(num_writers)

AIO_WAIT_WHILE:
	write(num_writers)
	read(condition)

Emanuele

> 
>> +
>>      if (qatomic_read(&global_aio_wait.num_waiters)) {
>>          aio_bh_schedule_oneshot(qemu_get_aio_context(), dummy_bh_cb, NULL);
>>      }
>> -- 
>> 2.31.1
>>


