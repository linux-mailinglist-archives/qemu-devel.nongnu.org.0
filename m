Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE1595C75
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:56:30 +0200 (CEST)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNw7R-0000aK-SG
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNw4u-0004ta-Dz
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oNw4s-0005iR-SH
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660654430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bX1y+u/KSpFPUg0CiLSr1hMkBsLujb0RBkGY8XG/Nwg=;
 b=IblshAoPLebzazycAYZxLUeInVlR4C1ZES1lziQUfmxVNmQWgV1EOoecGUMWeH/z4oGmfS
 mDIkqyWICKacRuEmqYKafjg70UVCEtv9hcv3knbWZl2ViTVF9UgQ00xAw2jcQBBVZKm+wZ
 xrgaFJ2zmXFv+8l1prCNN2ukfDGo0D0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-drvE2No7NlOnY8LI48LasA-1; Tue, 16 Aug 2022 08:53:49 -0400
X-MC-Unique: drvE2No7NlOnY8LI48LasA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f18-20020a05600c4e9200b003a5f81299caso1779769wmq.7
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=bX1y+u/KSpFPUg0CiLSr1hMkBsLujb0RBkGY8XG/Nwg=;
 b=oB6LcNed2dS9EwaekfxbBxLkMYoWI9O9WF3BboGl9z3654t9cEohIFyhDA3jXcrBfK
 yxag5hF+DKtIXDh78gW9Y+Sku1ZNdxCi/W+b8wxe8uGDmgJxK/mIqV/YrmSPITKZ97ro
 o9+rtOh9Wx6+6z2PuG45SLYeodA4ZiFpFaIQRSYnsrWL2Maq4sh6PDIEQkw9HydM5t9H
 h0dPlHQbBV0hjXKQTKm1Hshdz8CHEPUNMy59pjP1GCjWazyXPW2ib/Qbn9l8Gg16zDte
 3F10vV/sAnHdDaRKwV0UHHIwRUkTtgq04G7DZlaZzjH42BqGGucoIcs+GMRQFMNMtlpt
 WxqA==
X-Gm-Message-State: ACgBeo1E9vTrftqgOnVJL3v208KTNoFG6sWbKwqnc/A6pBNOjMYet3yF
 XOZ4Rtg7/1cA9AhnuGeK2GJeeNpkXeSEItWZxZbutwDZa+0gKTr73u4fsWQOU8TOkf83x7zsA5i
 0N24knBbXcebxI2I=
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr18929551wmq.202.1660654428176; 
 Tue, 16 Aug 2022 05:53:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5/7NqZAQJOKbRaM3xK9ND1jCmV0HQtYIH2zvNAweH75avyCoQ+qM7prxGQFWQyqQnwSOohhw==
X-Received: by 2002:a05:600c:a47:b0:39e:f953:84e2 with SMTP id
 c7-20020a05600c0a4700b0039ef95384e2mr18929543wmq.202.1660654428025; 
 Tue, 16 Aug 2022 05:53:48 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d6386000000b002251c75c09csm1324228wru.90.2022.08.16.05.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Aug 2022 05:53:47 -0700 (PDT)
Message-ID: <3404f913-ea2b-b429-f382-2f20b917b953@redhat.com>
Date: Tue, 16 Aug 2022 14:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
 <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 27/07/2022 um 17:53 schrieb Vladimir Sementsov-Ogievskiy:
>>    * job_lock:
>> @@ -672,7 +673,7 @@ void job_user_cancel_locked(Job *job, bool force,
>> Error **errp);
>>    * Returns the return value from the job if the job actually completed
>>    * during the call, or -ECANCELED if it was canceled.
>>    *
>> - * Callers must hold the AioContext lock of job->aio_context.
>> + * Called with job_lock held.
> 
> That's wrong, it should be called with job_lock not held :)
> 
>>    */
>>   int job_cancel_sync(Job *job, bool force);
>>   @@ -697,8 +698,7 @@ void job_cancel_sync_all(void);
>>    * function).
>>    *
>>    * Returns the return value from the job.
>> - *
>> - * Callers must hold the AioContext lock of job->aio_context.
>> + * Called with job_lock held.
> 
> and this,
> 
>>    */
>>   int job_complete_sync(Job *job, Error **errp);
>>   @@ -734,7 +734,7 @@ void job_dismiss_locked(Job **job, Error **errp);
>>    * Returns 0 if the job is successfully completed, -ECANCELED if the
>> job was
>>    * cancelled before completing, and -errno in other error cases.
>>    *
>> - * Callers must hold the AioContext lock of job->aio_context.
>> + * Called with job_lock held.
> 
> and this.

Well, except for this part here :) You're right here.


