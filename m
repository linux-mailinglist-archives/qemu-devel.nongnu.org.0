Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271DA6A6B22
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 11:56:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXK82-0003YU-Mz; Wed, 01 Mar 2023 05:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXK80-0003YJ-8x
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:56:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXK7y-0005ic-G7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 05:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677668165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JO688mASvF8zUltmxtDGmX0SZdvH2ky9gucbNUbLWsQ=;
 b=BU3S/8RdoV4Rb5PX8lmCCSzawWzgEiQ3dVVzotXudW/A9n7LapPFieZUl0+wv1OL+JmQLK
 e9ffMAvVS/Zahvooj7JV9SpjtjMuDptqE0CdWYeVXhLLbSWtKX29pyCyv/ZNz+6kTOdk+m
 j3O26zxLajRrkFlb/rS71DNwlJrSEJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-AtRNtH8jNv6SNA1beRdrpQ-1; Wed, 01 Mar 2023 05:56:04 -0500
X-MC-Unique: AtRNtH8jNv6SNA1beRdrpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so5171644wmj.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 02:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JO688mASvF8zUltmxtDGmX0SZdvH2ky9gucbNUbLWsQ=;
 b=CDNyLKlLtpF6joHEdviACXk4u/R3QNgg3yFZjConisIeirvq9qHLEXaFBj/ZR82Mip
 0JWHbCWqt5On1gWnMi5XLdnMs82aiVvM6XWZINDUEX+AoYnubAhVG/tbTTI7379OfhSb
 g3GhPA7A4qN0em8YpF0ZhwmCL3Iq1Ds4KvFJFaIk2KRi/q9+i7CpNL02+ZeCgcBIeT1B
 b1nqfaxML2X1I7tXcykbQv3/8pS67VLpOt0QvCsxl27U2P2FbV0Z7q98WVDLyJIFSS3V
 XGvvtGe3sNVHkDhG8uk/FKf2BC8bYIWK7fLAJ+Pnp91BoDmGQ6WvgOSMVnJCQIq8nYHa
 Faqg==
X-Gm-Message-State: AO0yUKUODWUlrMH+LXEHMTgKFG9ZHbfWddehGMHjZVOsIV8vpHHkDSE9
 LhPydo9XjQDmOMOhzNxCEPG+RD/8WTZeumVDp0tvii0n7lSzSYShRteOjASZyDuEvmYcudx/qZy
 aONy9IkyKdX+pjfw=
X-Received: by 2002:a05:600c:3c87:b0:3eb:598d:6494 with SMTP id
 bg7-20020a05600c3c8700b003eb598d6494mr1092721wmb.16.1677668163519; 
 Wed, 01 Mar 2023 02:56:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+8znA698a1dZaMrq9qPYs+qe2CFO+otM/pWNPqaDE0t880zJAdcYWqbAIAeN3ZWGSqh0zXtQ==
X-Received: by 2002:a05:600c:3c87:b0:3eb:598d:6494 with SMTP id
 bg7-20020a05600c3c8700b003eb598d6494mr1092711wmb.16.1677668163244; 
 Wed, 01 Mar 2023 02:56:03 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003e208cec49bsm1793397wms.3.2023.03.01.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 02:56:02 -0800 (PST)
Message-ID: <81af679f-e0bf-a3a4-16ba-1d63647de625@redhat.com>
Date: Wed, 1 Mar 2023 11:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Content-Language: en-US
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, alxndr@bu.edu, pbonzini@redhat.com,
 bsd@redhat.com, stefanha@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, fam@euphon.net, lvivier@redhat.com,
 berrange@redhat.com
References: <20230227174019.1164205-1-rjones@redhat.com>
 <6e28af8e-3e71-9888-8832-786550b81983@redhat.com>
 <20230301105214.GZ7636@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230301105214.GZ7636@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/03/2023 11.52, Richard W.M. Jones wrote:
> On Tue, Feb 28, 2023 at 09:30:56PM +0100, Thomas Huth wrote:
>> On 27/02/2023 18.40, Richard W.M. Jones wrote:
>>> These two tests were failing with this error:
>>>
>>>    stderr:
>>>    TAP parsing error: version number must be on the first line
>>>    [...]
>>>    Unknown TAP version. The first line MUST be `TAP version <int>`. Assuming version 12.
>>>
>>> This can be fixed by ensuring we always call g_test_init first in the
>>> body of main.
>>>
>>> Thanks: Daniel Berrange, for diagnosing the problem
>>> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
>>> ---
>>>   tests/qtest/fuzz-lsi53c895a-test.c | 4 ++--
>>>   tests/qtest/rtl8139-test.c         | 5 +++--
>>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
>>> index a9254b455d..2012bd54b7 100644
>>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>>> @@ -112,12 +112,12 @@ static void test_lsi_do_dma_empty_queue(void)
>>>   int main(int argc, char **argv)
>>>   {
>>> +    g_test_init(&argc, &argv, NULL);
>>> +
>>>       if (!qtest_has_device("lsi53c895a")) {
>>>           return 0;
>>
>> Could you please double-check that the !lsi53c895a case works fine,
>> too? (just temporarily change it into a "if (1) { ..." statement)
>> ... I'm a little bit afraid that the TAP protocol might be
>> incomplete without the g_test_run() at the end otherwise. If so, you
>> might now need a "goto out" instead of the "return 0" here...
> 
> Applying ...
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 2012bd54b7..e0c902aac4 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -114,7 +114,7 @@ int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
>   
> -    if (!qtest_has_device("lsi53c895a")) {
> +    if (1) {
>           return 0;
>       }
>   
> ... and rerunning the tests, everything still passes.
> 
> The stdout of the test after this change is:
> 
> TAP version 13
> # random seed: R02S1c1f371a09fbfdf0dd747f898d55fe97
> 
> but apparently this version of TAP doesn't care (perhaps because the
> number of tests "1..2" is never printed?)
> 
> Anyway it doesn't appear to be a problem.

Ok, thanks for checking! I just also checked 
https://testanything.org/tap-version-13-specification.html and it says "The 
plan is optional", so this should be fine.

Reviewed-by: Thomas Huth <thuth@redhat.com>



