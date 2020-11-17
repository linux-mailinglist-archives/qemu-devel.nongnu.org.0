Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B62B5F46
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:43:31 +0100 (CET)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0KY-0007v0-29
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kf0IN-0006lj-2r
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:41:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kf0IH-0002cA-Pt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605616863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m39lGWLS5hctctfuCEY+Es7Qj9i708zy9+LDCRHyqqk=;
 b=i3plElC6TpVRmoY+k9GtNERCDG8VetPS07BfQw4VvDRAEYBjjGmggZRQARKPgSRed9YLiZ
 PSEl5F9ZaG/Ra2DsHJl7RVOaY+t3oXTVJcpaHDmQqjBKWrsrHPnbwy93JCAhAgBFnfa6nr
 O9izwqI36YLX1FeaqhVZ0U6R1lgi628=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Y0wSOw3TPqSnQSbumaE9cQ-1; Tue, 17 Nov 2020 07:41:00 -0500
X-MC-Unique: Y0wSOw3TPqSnQSbumaE9cQ-1
Received: by mail-wm1-f70.google.com with SMTP id 3so1665312wms.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 04:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m39lGWLS5hctctfuCEY+Es7Qj9i708zy9+LDCRHyqqk=;
 b=tNXrrzD3eIoqg6CgnB7t44Ofk+ZgCpHUIp9mnWFbGhgxYqJr4E4ftr35yOZ7v3fgsm
 nkvPKv/VGNQb4e8WctBL9jdCK+055s8basKFd5VfPZIw5WKYmzr1OwIr8uY6mqOwaw6x
 keyBrcBQLkrnTiLu7VuAvm80CT41HPj00guM/HYvQfcoM06xm6y5f5s5A+d/X7k0SLGn
 9336wcPzfCwrW/EfMCmVzhJYTuvKz3keC9ebGQRs0OO1cPSgaiSOTU6g/GItL79g8PdN
 stFAkHerDB1Tzfev5uREJS5LW6d1lzehh1LGD3Z9fe6YuGWSnCWu6UQA7UE1YE/+v2Vc
 gQRQ==
X-Gm-Message-State: AOAM5319YWMRRAbtinpviaGmbiHVn9qHSTA6thMO/F99EoA7G+RYIKEp
 mlNq/yv4pH7g0wfxQ3p/EsFC8ARimhFJ7J7vIL5GuI0kMmNpqWqn+D8hmdHF6OfOehfjCi/+eNe
 u4IcmoGMs8O+NVd4=
X-Received: by 2002:a7b:c145:: with SMTP id z5mr4068222wmi.164.1605616858691; 
 Tue, 17 Nov 2020 04:40:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTy49dF0g+DhsfCenDSrHvFIf4wxUldT414C9aiWKwK9Yr27u6QqDrOXQBsJMFK6eMtojqSg==
X-Received: by 2002:a7b:c145:: with SMTP id z5mr4068201wmi.164.1605616858460; 
 Tue, 17 Nov 2020 04:40:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t9sm27461416wrr.49.2020.11.17.04.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 04:40:57 -0800 (PST)
Subject: Re: [PATCH] curl: remove compatibility code
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201117113850.64108-1-pbonzini@redhat.com>
 <20201117114659.GB135624@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <76330bff-9d47-83b6-c566-7a28bb4cf83d@redhat.com>
Date: Tue, 17 Nov 2020 13:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117114659.GB135624@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 12:46, Daniel P. Berrangé wrote:
> On Tue, Nov 17, 2020 at 12:38:50PM +0100, Paolo Bonzini wrote:
>> cURL 7.16.0 was released in October 2006.  Just remove code that is
>> in all likelihood not being used anywhere.
> 
> Rather than assuming that, we should be picking our minimum version
> and enforcing that in configure/meson.
> 
> Currently, we have a manual code compile check for curl_multi_setopt,
> after doing a pkg-config check with no min version.
> 
> We should set a min version in pkg-config and drop the compile check
> in configure.
> 
> Based on repology.org and our platform support matrix, RHEL-7 looks
> like the oldest curl that we need to care about, 7.29.0

That is complicated a bit by the fact that curl is detected with both 
pkg-config and curl-config.  That is probably unnecessary too, since we 
do not need any of the options that are exclusive to curl-config, such 
as --ca.  If we can drop curl-config, moving the detection to meson is 
much easier.

Paolo

>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/curl.c | 28 ----------------------------
>>   1 file changed, 28 deletions(-)
>>
>> diff --git a/block/curl.c b/block/curl.c
>> index 4f907c47be..b77bfe12e7 100644
>> --- a/block/curl.c
>> +++ b/block/curl.c
>> @@ -37,26 +37,6 @@
>>   
>>   // #define DEBUG_VERBOSE
>>   
>> -#if LIBCURL_VERSION_NUM >= 0x071000
>> -/* The multi interface timer callback was introduced in 7.16.0 */
>> -#define NEED_CURL_TIMER_CALLBACK
>> -#define HAVE_SOCKET_ACTION
>> -#endif
>> -
>> -#ifndef HAVE_SOCKET_ACTION
>> -/* If curl_multi_socket_action isn't available, define it statically here in
>> - * terms of curl_multi_socket. Note that ev_bitmask will be ignored, which is
>> - * less efficient but still safe. */
>> -static CURLMcode __curl_multi_socket_action(CURLM *multi_handle,
>> -                                            curl_socket_t sockfd,
>> -                                            int ev_bitmask,
>> -                                            int *running_handles)
>> -{
>> -    return curl_multi_socket(multi_handle, sockfd, running_handles);
>> -}
>> -#define curl_multi_socket_action __curl_multi_socket_action
>> -#endif
>> -
>>   #define PROTOCOLS (CURLPROTO_HTTP | CURLPROTO_HTTPS | \
>>                      CURLPROTO_FTP | CURLPROTO_FTPS)
>>   
>> @@ -140,7 +120,6 @@ typedef struct BDRVCURLState {
>>   static void curl_clean_state(CURLState *s);
>>   static void curl_multi_do(void *arg);
>>   
>> -#ifdef NEED_CURL_TIMER_CALLBACK
>>   /* Called from curl_multi_do_locked, with s->mutex held.  */
>>   static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>>   {
>> @@ -156,7 +135,6 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>>       }
>>       return 0;
>>   }
>> -#endif
>>   
>>   /* Called from curl_multi_do_locked, with s->mutex held.  */
>>   static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
>> @@ -433,7 +411,6 @@ static void curl_multi_do(void *arg)
>>   
>>   static void curl_multi_timeout_do(void *arg)
>>   {
>> -#ifdef NEED_CURL_TIMER_CALLBACK
>>       BDRVCURLState *s = (BDRVCURLState *)arg;
>>       int running;
>>   
>> @@ -446,9 +423,6 @@ static void curl_multi_timeout_do(void *arg)
>>   
>>       curl_multi_check_completion(s);
>>       qemu_mutex_unlock(&s->mutex);
>> -#else
>> -    abort();
>> -#endif
>>   }
>>   
>>   /* Called with s->mutex held.  */
>> @@ -598,10 +572,8 @@ static void curl_attach_aio_context(BlockDriverState *bs,
>>       s->multi = curl_multi_init();
>>       s->aio_context = new_context;
>>       curl_multi_setopt(s->multi, CURLMOPT_SOCKETFUNCTION, curl_sock_cb);
>> -#ifdef NEED_CURL_TIMER_CALLBACK
>>       curl_multi_setopt(s->multi, CURLMOPT_TIMERDATA, s);
>>       curl_multi_setopt(s->multi, CURLMOPT_TIMERFUNCTION, curl_timer_cb);
>> -#endif
>>   }
>>   
>>   static QemuOptsList runtime_opts = {
>> -- 
>> 2.28.0
>>
>>
> 
> Regards,
> Daniel
> 


