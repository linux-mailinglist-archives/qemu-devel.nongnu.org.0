Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934A6EF276
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:44:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZN-0001qA-KA; Wed, 26 Apr 2023 06:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prcZK-0001jc-1G
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1prcZH-0003gX-QD
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682505609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZrWAxw5fQaC7cSYT/zt/7he3gpCpMnVQMGMUcDp41o=;
 b=OLOMhhCawUuFcVqoDrVmyEj8S4OosGqicp2LIhB+5AUVesZyAbTz2P/lFQpgXSQIcDtKqq
 5ieRtUoNlZFcisUE/JSiw0+Q0pFJ/4Z0gcWj714luBuyZPrTfATfJOJ/8SDDlTGMwIejG7
 ZeuMUHYsrOlAqmGjLY74TtKPO8QENt8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-ED7fEYprM66tWQuS-dKJjQ-1; Wed, 26 Apr 2023 06:40:08 -0400
X-MC-Unique: ED7fEYprM66tWQuS-dKJjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f170a1fbe7so41415265e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505607; x=1685097607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZrWAxw5fQaC7cSYT/zt/7he3gpCpMnVQMGMUcDp41o=;
 b=iXsXFa5wpg2+kiqMajqKuEvH+AeU2S/fSoMFJCit/gcmCIsqvHJeXaBXQJBuSmhIzQ
 018/1BYroKpnNCn4CujSy9Vchp23PFJKitiyffSxQb1rA/a5C/Ib1HZRylzo9u+pgBI4
 QUYRQIsEu/Rh7Yykts/6oeGP65FXYjWn1RSD2wX4IaSYbXlJ8wa11hjfn0pLKMef5gIG
 XFKhfB2paWFKNz4lu8jypHBWKPHEj5LmmDAwjrmK2qwDHdJIBW2S8t/o0t689XNsHBAc
 tQ++ONbtzjAW94kTBXAaz3w19+rIxd/yRG+tz73bTz29C7eXBSbCZuMFYxFHLVRCYMOI
 zmlQ==
X-Gm-Message-State: AAQBX9eDUq0chH4Ilt8eGtxVgFXNux1HM9iRV6lRrUItGUbGE1EwhGnq
 oOEY25BVYI74WyZCIgpoxccf/Y7k+3/MjPyVhgOSdBIs0SAVRVoEcKLOS1eKB+OLw2VltJuzM0B
 tAo08XjyDLkUxVmg=
X-Received: by 2002:a05:600c:22d4:b0:3f1:9134:f277 with SMTP id
 20-20020a05600c22d400b003f19134f277mr14105087wmg.8.1682505607125; 
 Wed, 26 Apr 2023 03:40:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZaXg4HTsK5DVyjrG1qjVqdGVA4NM3jJ5WqFa+GfsWuV+qYS56xODdhG+sOkSJLAcyc8sbl3A==
X-Received: by 2002:a05:600c:22d4:b0:3f1:9134:f277 with SMTP id
 20-20020a05600c22d400b003f19134f277mr14105069wmg.8.1682505606814; 
 Wed, 26 Apr 2023 03:40:06 -0700 (PDT)
Received: from [192.168.149.117]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b003f18992079dsm18221089wmo.42.2023.04.26.03.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 03:40:06 -0700 (PDT)
Message-ID: <87e795fd-b611-8e66-977f-775778832b26@redhat.com>
Date: Wed, 26 Apr 2023 12:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] tests/unit/test-blockjob: Re-enable complete_in_standby
 test
Content-Language: de-CH
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Czenczek
 <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230426081601.2567990-1-eesposit@redhat.com>
 <a11743c0-5f9b-fa8c-14d9-8e724bf4cee0@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <a11743c0-5f9b-fa8c-14d9-8e724bf4cee0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 26/04/2023 um 10:45 schrieb Thomas Huth:
> On 26/04/2023 10.16, Emanuele Giuseppe Esposito wrote:
>> Pause the job while draining so that pause_count will be
>> increased and bdrv_drain_all_end() won't reset it to 0, so the
>> job will not continue.
>>
>> With this fix, the test is not flaky anymore.
>>
>> Additionally remove useless aiocontext lock around bdrv_drain_all_end()
>> in test_complete_in_standby().
>>
>> Fixes: b6903cbe3a2 "tests/unit/test-blockjob: Disable
>> complete_in_standby test"
>> Suggested-by: Hanna Czenczek <hreitz@redhat.com>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   tests/unit/test-blockjob.c | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/unit/test-blockjob.c b/tests/unit/test-blockjob.c
>> index a130f6fefb..46d720aeee 100644
>> --- a/tests/unit/test-blockjob.c
>> +++ b/tests/unit/test-blockjob.c
>> @@ -488,11 +488,15 @@ static void test_complete_in_standby(void)
>>       bdrv_drain_all_begin();
>>       assert_job_status_is(job, JOB_STATUS_STANDBY);
>>   +    /*
>> +     * Increase pause_count so that the counter is
>> +     * unbalanced and job won't resume
>> +     */
>> +    job_pause(job);
>> +
>>       /* Lock the IO thread to prevent the job from being run */
> 
> I guess the above comment should now be removed, too?
> 
>> -    aio_context_acquire(ctx);
>>       /* This will schedule the job to resume it */
>>       bdrv_drain_all_end();
>> -    aio_context_release(ctx);
> 
>  Thomas
> 
Makes sense, resending

Emanuele


