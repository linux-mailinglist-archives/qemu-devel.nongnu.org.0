Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A7697E16
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:11:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSIUo-0000o2-5w; Wed, 15 Feb 2023 09:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSIUm-0000ne-7C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSIUk-0001pb-5M
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676470248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0z5InBDY/vtvylpG6n+8YSMLjORkAGZqbudORMLILKc=;
 b=OtFbhYwR3i2bfhPNBGlJrkrzahn9k+SpVsjC9u41AoSMBJ59ZgktufMBPxXHz69ak62eC9
 3RK1bYut6j9fdc5z8PCn8XsVUMHWB9BioV4RrRcNI/VWgnXca37dRHXTYtPq7oJpFUiYx3
 5yqkf0+vJ6jmhIsl0w8Brc6Eh0ayc8A=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-prFAfe5lMa6-JT8nH3A-XA-1; Wed, 15 Feb 2023 09:10:44 -0500
X-MC-Unique: prFAfe5lMa6-JT8nH3A-XA-1
Received: by mail-qt1-f198.google.com with SMTP id
 a24-20020ac87218000000b003bb7c7a82f7so11037250qtp.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 06:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0z5InBDY/vtvylpG6n+8YSMLjORkAGZqbudORMLILKc=;
 b=MQZR+t0e0/av0KLe2sRlBnd+CvRMGwsckoi1PDb1Zrs196OR9qa+ypongikPFJILIo
 LsgpQ6vv1emPPOzYYVSFs7Pcr1SJzlAFCyKsLxcAZ2XHUZwWLHVMWsUDnenbI/MnpE8s
 FM22GMl+waB1aMtmk/RHSC1KGyOYy7jxUP6tJfsj6WNuu72PGGIEQrTsRLVU7uTzV+4Z
 P/U6MoWWGMZfMhmlUPF3MBH7frkwKRPuOgYDoRHl65v26UzCDbe06Z1xnr9c7hoNv92N
 FXUgcGggKzLLoCENPJsr/UFocA+Q3sxQ9HWUaYRSpsDzO7cbE2171wy9J/BbsisP28k1
 Sv5g==
X-Gm-Message-State: AO0yUKUKgyT4YdsHTj0lf5KzImsL1TFsH1teNyZ39KxzgcYzB4cAacqc
 AKUao6X59NN9AcsL10/Yph1x846crP69Xv0eEj3SkAFSYJZrWYSsRBebU8s+oTD9M95UPDfdC+X
 BJILeJw0ARk6lV6E=
X-Received: by 2002:ac8:7f83:0:b0:3b8:6b1b:e378 with SMTP id
 z3-20020ac87f83000000b003b86b1be378mr4733674qtj.8.1676470244234; 
 Wed, 15 Feb 2023 06:10:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8EzW/VFxCUSHRGeoIikPVuKCXEN90KjEdGmMR053F4MMo+U+yg3V4cu0y7+ehXAAKivr86Tw==
X-Received: by 2002:ac8:7f83:0:b0:3b8:6b1b:e378 with SMTP id
 z3-20020ac87f83000000b003b86b1be378mr4733646qtj.8.1676470243956; 
 Wed, 15 Feb 2023 06:10:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-79.web.vodafone.de.
 [109.43.176.79]) by smtp.gmail.com with ESMTPSA id
 l12-20020ac8724c000000b003b8238114d9sm12901616qtp.12.2023.02.15.06.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 06:10:43 -0800 (PST)
Message-ID: <7f695bb1-73b5-fdb3-50c9-21bfa6b49e00@redhat.com>
Date: Wed, 15 Feb 2023 15:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230215124122.72037-1-thuth@redhat.com>
 <Y+zUMygZUSwiPRwG@redhat.com> <87fsb7dp6c.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/rtl8139-test: Make the test less verbose by
 default
In-Reply-To: <87fsb7dp6c.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 14.38, Fabiano Rosas wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Wed, Feb 15, 2023 at 01:41:22PM +0100, Thomas Huth wrote:
>>> We are facing the issues that some test logs in the gitlab CI are
>>> too big (and thus cut off). The rtl8139-test is one of the few qtests
>>> that prints many lines of output by default when running with V=1, so
>>> it contributes to this problem. Almost all other qtests are silent
>>> with V=1 and only print debug messages with V=2 and higher. Thus let's
>>> change the rtl8139-test to behave more like the other tests and only
>>> print the debug messages with V=2 (or higher).
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   tests/qtest/rtl8139-test.c | 15 +++++++++++++--
>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>
>>>
>>> diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
>>> index 8fa3313cc3..1beb83805c 100644
>>> --- a/tests/qtest/rtl8139-test.c
>>> +++ b/tests/qtest/rtl8139-test.c
>>> @@ -12,6 +12,8 @@
>>>   #include "libqos/pci-pc.h"
>>>   #include "qemu/timer.h"
>>>   
>>> +static int verbosity_level;
>>> +
>>>   /* Tests only initialization so far. TODO: Replace with functional tests */
>>>   static void nop(void)
>>>   {
>>> @@ -45,12 +47,16 @@ static QPCIDevice *get_device(void)
>>>   static unsigned __attribute__((unused)) in_##name(void) \
>>>   { \
>>>       unsigned res = qpci_io_read##len(dev, dev_bar, (val));     \
>>> -    g_test_message("*%s -> %x", #name, res); \
>>> +    if (verbosity_level >= 2) { \
>>> +        g_test_message("*%s -> %x", #name, res); \
>>> +    } \
>>>       return res; \
>>>   } \
>>>   static void out_##name(unsigned v) \
>>>   { \
>>> -    g_test_message("%x -> *%s", v, #name); \
>>> +    if (verbosity_level >= 2) { \
>>> +        g_test_message("%x -> *%s", v, #name); \
>>> +    } \
>>>       qpci_io_write##len(dev, dev_bar, (val), v);        \
>>>   }
>>>   
>>> @@ -195,6 +201,11 @@ static void test_init(void)
>>>   int main(int argc, char **argv)
>>>   {
>>>       int ret;
>>> +    char *v_env = getenv("V");
>>> +
>>> +    if (v_env) {
>>> +        verbosity_level = atoi(v_env);
>>> +    }
>>
>> *Not* something I'm requesting you to do now, just an observation / idea.
>>
>> We've copied this pattern into several tests.
>>
>> It is starting to feel like we should have a header with a
>> 'qtests_env_setup()' method we call as first thing in main,
>> and exporting 'verbosity_level' from the header.
>>
>> Perhaps also with a  'qtest_verbose(...)' macro that wraps
>>
>>    if (verbosity_level >= 2) {
>>       g_test_message(...)
>>    }

Agree, we could generalize this stuff somehow ... maybe also simply adding a 
qtest_log(int level, char *format, ...) function that does the getenv() 
checking on the first invocation, or something like that.

> Could we maybe play with g_test_verbose and g_test_quiet? The docs say
> "The default is neither g_test_verbose() nor g_test_quiet()."  So
> perhaps:
> 
> V=    --quiet, g_test_quiet
> V=1 no option, default verbosity
> V=2 --verbose, g_test_verbose
> 
> Then test g_test_quiet|verbose instead of reading from env directly.

Sounds like an option, too ... but we would not have a V=3 level that way 
(which is already used in qom-test.c - not sure whether we really need it, 
though, we could use V=2 for all debug messages, too).

  Thomas




