Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D350C846
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 10:41:17 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niBKO-0002Lo-Nm
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 04:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBHb-0000lq-97
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:38:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBHZ-0001cG-Km
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:38:23 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e30so9476795eda.0
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S/u/ZPl/VuA8e4PHjXp5TujdLDEpUlH4ousQySqPM4Y=;
 b=iC9Il94HFKmLJPgkyB2RcBOq98s9MLsbdoOKIR2U9K62NAMuC283DRHxUcEpXbLQ7w
 5pNudvTubFAjlHqrg5zN5Uxv2YcYm+w72LlymqLvXyDcpf+Eq9LqhaW1ZfXeEs0kNJdz
 tDECpwMGdCpa5J+4zJu8qVj/LTHMVVBHntSGSgDpVHgIcPXXaPCrwsQlQBU6ZKxllhms
 iHyXtMLxSy2PLb7Kk/e+SpPW1qao/dDu3S0bzCdkaHVW7HHi/SHKUitQpx5WuLOmYxQO
 OJsIEYU/EIn66Eru2Qxs6/FVbw0Vc8yFQaswcWcYcIREBQmxsWK2eb0ipVHKyUhoArdD
 xfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S/u/ZPl/VuA8e4PHjXp5TujdLDEpUlH4ousQySqPM4Y=;
 b=4WKAFggrExL7I5ULDaUKAzCyPbqTApsWkNMOpL8G+gkPG7um/I3PbYRH0Lzy/2C6R6
 JOFTqqZL1naHkWtrMu6LvDRw1WrmwAAiQ5pVrd64n4ayi50iPaF/Wtgt2kaBU2qsn60u
 jPrM9l2AdEc5hd5Uyciifgx8ZXk00M0tLe2ayLpH3amR8uEhR1tdpk3+mmSSbWr+ubmP
 fEczLP9s19Wgp89V7wgpOJm83cvsMCG2IhslsiATkd+AOFOzge1qZCgsDXEdJpC22gVh
 oijlbdeFPTaGD81DCKh6VNUXkbm0muANWZ+x/3p4Ch9808oz1VlWDVW4jAsMmirGm2TC
 XKgw==
X-Gm-Message-State: AOAM532NyE6/YI2+XZsBWNmzqEsdYv+ex0McH6I6Sze9toqQwbPuOxMb
 hllpeAh88oK2Bx7Eext2P/o=
X-Google-Smtp-Source: ABdhPJxosNfWQErtEJ4rNsBAhTZfodA6fEyS3/xERSyEVkZ/3Adh5Ozx/heETEpA53uOZ05sPmOYWQ==
X-Received: by 2002:a05:6402:7d3:b0:41d:9152:cad with SMTP id
 u19-20020a05640207d300b0041d91520cadmr9358421edy.370.1650703099803; 
 Sat, 23 Apr 2022 01:38:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n16-20020a05640204d000b0042062f9f0e1sm1879890edw.15.2022.04.23.01.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:38:19 -0700 (PDT)
Message-ID: <3345d12b-f7be-4899-9d19-d8109e6f49ae@redhat.com>
Date: Sat, 23 Apr 2022 10:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 for-7.1 6/9] nbd: code motion and function renaming
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-7-pbonzini@redhat.com>
 <2fe67c67-bffa-078c-d16a-a63d2736ba7d@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2fe67c67-bffa-078c-d16a-a63d2736ba7d@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 14:37, Vladimir Sementsov-Ogievskiy wrote:
> 14.04.2022 20:57, Paolo Bonzini wrote:
>> Prepare for the next patch, so that the diff is less confusing.
>>
>> nbd_client_connecting is moved closer to the definition point.
> 
> Amm. To usage-point you mean?
> The original idea was to keep simple state-reading helpers definitions 
> together :)

Yes and it makes sense.  The new idea is to keep requests_lock functions 
together instead. :)

Paolo


>>
>> nbd_client_connecting_wait() is kept only for the reconnection
>> logic; when it is used to check if a request has to be reissued,
>> use the renamed function nbd_client_will_reconnect().  In the
>> next patch, the two cases will have different locking requirements.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
>> ---
>>   block/nbd.c | 24 ++++++++++++++----------
>>   1 file changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index a2414566d1..37d466e435 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -254,18 +254,15 @@ static void open_timer_init(BDRVNBDState *s, 
>> uint64_t expire_time_ns)
>>       timer_mod(s->open_timer, expire_time_ns);
>>   }
>> -static bool nbd_client_connecting(BDRVNBDState *s)
>> -{
>> -    NBDClientState state = qatomic_load_acquire(&s->state);
>> -    return state == NBD_CLIENT_CONNECTING_WAIT ||
>> -        state == NBD_CLIENT_CONNECTING_NOWAIT;
>> -}
>> -
>>   static bool nbd_client_connecting_wait(BDRVNBDState *s)
>>   {
>>       return qatomic_load_acquire(&s->state) == 
>> NBD_CLIENT_CONNECTING_WAIT;
>>   }
>> +static bool nbd_client_will_reconnect(BDRVNBDState *s)
>> +{
>> +    return qatomic_load_acquire(&s->state) == 
>> NBD_CLIENT_CONNECTING_WAIT;
>> +}
>>   /*
>>    * Update @bs with information learned during a completed 
>> negotiation process.
>>    * Return failure if the server's advertised options are 
>> incompatible with the
>> @@ -355,6 +352,13 @@ int coroutine_fn 
>> nbd_co_do_establish_connection(BlockDriverState *bs,
>>       return 0;
>>   }
>> +static bool nbd_client_connecting(BDRVNBDState *s)
>> +{
>> +    NBDClientState state = qatomic_load_acquire(&s->state);
>> +    return state == NBD_CLIENT_CONNECTING_WAIT ||
>> +        state == NBD_CLIENT_CONNECTING_NOWAIT;
>> +}
>> +
>>   /* Called with s->requests_lock taken.  */
>>   static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
>>   {
>> @@ -1190,7 +1194,7 @@ static int coroutine_fn 
>> nbd_co_request(BlockDriverState *bs, NBDRequest *request
>>               error_free(local_err);
>>               local_err = NULL;
>>           }
>> -    } while (ret < 0 && nbd_client_connecting_wait(s));
>> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>>       return ret ? ret : request_ret;
>>   }
>> @@ -1249,7 +1253,7 @@ static int coroutine_fn 
>> nbd_client_co_preadv(BlockDriverState *bs, int64_t offse
>>               error_free(local_err);
>>               local_err = NULL;
>>           }
>> -    } while (ret < 0 && nbd_client_connecting_wait(s));
>> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>>       return ret ? ret : request_ret;
>>   }
>> @@ -1407,7 +1411,7 @@ static int coroutine_fn nbd_client_co_block_status(
>>               error_free(local_err);
>>               local_err = NULL;
>>           }
>> -    } while (ret < 0 && nbd_client_connecting_wait(s));
>> +    } while (ret < 0 && nbd_client_will_reconnect(s));
>>       if (ret < 0 || request_ret < 0) {
>>           return ret ? ret : request_ret;
> 
> 


