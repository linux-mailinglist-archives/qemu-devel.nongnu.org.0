Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E5452EDD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:17:39 +0100 (CET)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvX0-0004bl-JK
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmvVS-0003EB-4u
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmvVQ-0007VU-D9
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637057759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXO69/mnLjwKziffRlbYIk0KK3rlS6Yk2+D5nvzGhSo=;
 b=PKutMR1cf4tSzZYSGdi3Hc5BeSdE6FmbZY49CNV70RNZIg5+EW51ezYeyeiS+XKFB19Vbn
 DC1QxBN11YFDtmZZEQIA9cayBpng6do8vPxUjP5wAX4m7B3cUAel/e+ycKL+I4HpWx5YCj
 e8+3ba8xdXZoSQcco8ix8ZOjl6Olj5Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-9PariMuYPaShkMmZ1j82DA-1; Tue, 16 Nov 2021 05:15:58 -0500
X-MC-Unique: 9PariMuYPaShkMmZ1j82DA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1245169wms.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MXO69/mnLjwKziffRlbYIk0KK3rlS6Yk2+D5nvzGhSo=;
 b=KuWDp+EwMAlrx2QOrZDINnpI7ng2S64jjvotkr3OgPtPD+Jx34wQlHGun+Z/63s1ol
 97Y4ZZZFtou3qMQX3y34+TQh6Vm4HkPw9Ru//0W1IFRA5bOYRKuApM0KO2ZvY/8fCCFi
 Uwlr38JBtLHnCVcVDoIf9cPwtJkBCdyGXPb/TAfMWm3oJA5jURuM1QTAxVoRRb2MDw/p
 tIhHQSZMiIiINC6qjvuFCfhA8aVihoF44V9ggDIJEFR0wMkrss9wEDx0qv8HB7pMaF7h
 w1SxwJ0ay57ivkoCtq3q99i9yEHQOfCr65Di6bIBc79NBYb1k/Vb0svAnnPOZu5kWKN2
 9lGw==
X-Gm-Message-State: AOAM530l3Pwd1u65a5M598aof+aUvKCVUnfkd8iV8Tf9dmYYDb6aeYvj
 dcr47iKuoF1vMQeUzgvNAH3NxxctG5QoIRg8/ySUJ7AiBxDXTJq/kfe0OWOL6/NishEWjtAJ2lT
 Ngv6RrqKZns2HTVY=
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr7873480wrm.79.1637057757321;
 Tue, 16 Nov 2021 02:15:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+CHnZhNXQ7+CH0PQ4OGZaQDleUo2epqsNhk/M263Fen0Qc6m10ilWfiYDqXakituQQkQojw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr7873430wrm.79.1637057757055;
 Tue, 16 Nov 2021 02:15:57 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id k37sm2111513wms.21.2021.11.16.02.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:15:56 -0800 (PST)
Message-ID: <2b1cef04-8ef8-dce2-f873-c4586046d1d7@redhat.com>
Date: Tue, 16 Nov 2021 11:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 05/25] block/block-backend.c: assertions for
 block-backend
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-6-eesposit@redhat.com>
 <af4875d8-33aa-1ba2-0559-3ecdc963d3bf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <af4875d8-33aa-1ba2-0559-3ecdc963d3bf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/11/2021 12:01, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> All the global state (GS) API functions will check that
>> qemu_in_main_thread() returns true. If not, it means
>> that the safety of BQL cannot be guaranteed, and
>> they need to be moved to I/O.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block/block-backend.c  | 90 +++++++++++++++++++++++++++++++++++++++++-
>>   softmmu/qdev-monitor.c |  2 +
>>   2 files changed, 91 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 0afc03fd66..ed45576007 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
> 
> [...]
> 
>> @@ -1550,6 +1596,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, 
>> int64_t offset,
>>   void blk_aio_cancel(BlockAIOCB *acb)
>>   {
>> +    assert(qemu_in_main_thread());
>>       bdrv_aio_cancel(acb);
>>   }
> 
> This function is in block-backend-io.h, though.

I am confused a little on the {blk/bdrv}_aio functions, namely
blk_aio_cancel
bdrv_aio_cancel
blk_aio_cancel_async
bdrv_aio_cancel_async

Do you think they should be I/O? The assertion seems to hold though.

I agree with the rest of the comments.

Thank you,
Emanuele


