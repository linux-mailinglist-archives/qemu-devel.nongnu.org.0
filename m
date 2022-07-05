Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322F566508
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:30:36 +0200 (CEST)
Received: from localhost ([::1]:39766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dx5-0005Ie-9c
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8dkw-0005cP-Tr
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o8dks-0001f4-Cy
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657009073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46IIPVm4mesaBB39evD4dNfJjhYmYwXyy6ubIeTceak=;
 b=L0UgX3aqIcRPSu5ohhhyneayWZk4klhvnTxfr9BNYaMhC+jQzH+JMx7MKEHpsGfIAGgVRM
 rw0MrECOfYxpnCGkZDI5SzTqkJZMolRkVfs4EUoaDQLaa/IeLhKBifjDEqHK3PyGnzpcSN
 bsViNAgcL/0HOv58Arx8e4GlsMMeqD0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-suLSSayKPoG9C4y6_PfKnw-1; Tue, 05 Jul 2022 04:17:52 -0400
X-MC-Unique: suLSSayKPoG9C4y6_PfKnw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h29-20020adfaa9d000000b0021d67fc0b4aso967895wrc.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=46IIPVm4mesaBB39evD4dNfJjhYmYwXyy6ubIeTceak=;
 b=iuOl16aupijkqSJJUxlOcngUAZRXr0FkQMG5Vvi4K4vWq4YYkg+ufgKxBLhQAwx/xi
 kxeJSKESHYbJhyeg0fYXGtfsQjJuYGI3GNn4SpHq/9duTl7plz/qOY3ErG5072mvCixF
 kHGik8miFLHgHTw3O0/h8SivNm39/KyKcxgYK58/fmfYIZH2nOByN8hPwJP7y0C0nGB/
 bg3+zBIyATnSVXrchVVtam1t8tx3jIljX4oTJ9JEFuOilUOZ1i3Mv0Yp7TnGeJXKnW1P
 7cp7TCZLEC1ygEO37U2ymekFSFiaacXgGN5fByNDPZhT0xUw/Kn88IpWY6V1YoEaKToV
 qeWw==
X-Gm-Message-State: AJIora/JL9v/chA+idvfpN059BUQUXDKKf4Wi3zYCXJsEatOdmty73F8
 r9a8z6IWSTF4y/rFXf8QiMTmE2WJbj0imHtiw/Mefrz58IKfS9l32yp+O0Zeb+5tIrXp1v1WXSO
 a4IqI55hNWfhnn7w=
X-Received: by 2002:adf:d0c7:0:b0:21d:764b:12d5 with SMTP id
 z7-20020adfd0c7000000b0021d764b12d5mr845387wrh.516.1657009071395; 
 Tue, 05 Jul 2022 01:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHN0lA4QsymtsqNrMOA+lJ+3ZTtHqTfw+Jz1Qjg5q/joN27QeK/Eqoenuzb5r7SUAyO8PcsA==
X-Received: by 2002:adf:d0c7:0:b0:21d:764b:12d5 with SMTP id
 z7-20020adfd0c7000000b0021d764b12d5mr845367wrh.516.1657009071200; 
 Tue, 05 Jul 2022 01:17:51 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a05600c4e5600b003973435c517sm22531862wmq.0.2022.07.05.01.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:17:50 -0700 (PDT)
Message-ID: <85eb06db-15ab-1451-c420-ec4956febe98@redhat.com>
Date: Tue, 5 Jul 2022 10:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 13/20] jobs: group together API calls under the same
 job lock
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-14-eesposit@redhat.com>
 <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YsPyzyOItXg9Y4c0@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 05/07/2022 um 10:14 schrieb Stefan Hajnoczi:
> On Wed, Jun 29, 2022 at 10:15:31AM -0400, Emanuele Giuseppe Esposito wrote:
>> diff --git a/blockdev.c b/blockdev.c
>> index 71f793c4ab..5b79093155 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -150,12 +150,15 @@ void blockdev_mark_auto_del(BlockBackend *blk)
>>          return;
>>      }
>>  
>> -    for (job = block_job_next(NULL); job; job = block_job_next(job)) {
>> +    JOB_LOCK_GUARD();
>> +
>> +    for (job = block_job_next_locked(NULL); job;
>> +         job = block_job_next_locked(job)) {
>>          if (block_job_has_bdrv(job, blk_bs(blk))) {
>>              AioContext *aio_context = job->job.aio_context;
>>              aio_context_acquire(aio_context);
> 
> Is there a lock ordering rule for job_mutex and the AioContext lock? I
> haven't audited the code, but there might be ABBA lock ordering issues.

Doesn't really matter here, as lock is nop. To be honest I forgot which
one should go first, probably job_lock because the aiocontext lock can
be taken and released in callbacks.

Should I resend with ordering fixed? Just to have a consistent logic

> 
>> diff --git a/qemu-img.c b/qemu-img.c
>> index 4cf4d2423d..289d88a156 100644
>> --- a/qemu-img.c
>> +++ b/qemu-img.c
>> @@ -912,25 +912,30 @@ static void run_block_job(BlockJob *job, Error **errp)
>>      int ret = 0;
>>  
>>      aio_context_acquire(aio_context);
>> -    job_ref(&job->job);
>> -    do {
>> -        float progress = 0.0f;
>> -        aio_poll(aio_context, true);
>> +    WITH_JOB_LOCK_GUARD() {
> 
> Here the lock order is the opposite of above.
> 


