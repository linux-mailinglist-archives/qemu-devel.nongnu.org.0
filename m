Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA34D46B8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:21:27 +0100 (CET)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHnL-00087T-16
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHag-000396-7u
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:08:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHaa-0006Jv-7A
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646914088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xoAQXBIgopRobGAp7FKjQGSS+Wyd98f12F4NuYe5XM=;
 b=fhGk7jw7qt/Y6Lq/afFtMaKWBSPqFBnbPuBrhuHk7Bo1vpdpCpuss56mMSLzHNoRG/ACwx
 IsezsYiH5t5Gsa30p6vHBhLAirf7fL83yUSTjaoo4IbfroXS7wuKFzsHS2oA8IosCILlvI
 USSi7NNNFsI3JyWug+ESZQx888+yYvw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-vV6oQSeoMhaUTEKGenIwtw-1; Thu, 10 Mar 2022 07:08:05 -0500
X-MC-Unique: vV6oQSeoMhaUTEKGenIwtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a26-20020a7bc1da000000b003857205ec7cso2219692wmj.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+xoAQXBIgopRobGAp7FKjQGSS+Wyd98f12F4NuYe5XM=;
 b=y871d1ef3NEqBCCLtFvWz63aKU0OEwgdOJkCFjbmXOmWdwoSQmYEUszO3+w3jqFK5r
 9cPWmJ6gJE5JdTcu+g5S1OfkzPDInaytRzyrTjvpS4f2gNoZOFOLMWJyN0u8qMQd6z7v
 KplJ7/CazSnLk5u4StN2tsRQBZ/6Dl1dvQKffSXeAOj6Y3g4Z3E5CHp+tLCtfP2r4GVG
 WC9/ZDNWX8PE4eNYgTyxjogeCDn0TQ62AX87S/b3d8JkyEyRXWAp5/WAm6eGWuT5EqoR
 PQYufsrEtlKcRf/bWFA2wON+EmvtjpkXmvkgpLlLomfcg445fM/5+ntvkPQ7ibI8zTpV
 DYug==
X-Gm-Message-State: AOAM532rs/5VW2zWt9uz1cLgLgOf2dpgK/JY04BdQ460XCIba6fy19CD
 jhdff3a+pQDDpCxj7KTNETT0YStWNXP63DA0QsK9TBj6oBWtKFWjsbdRidvxzCHEvCL3/zCr1XM
 DJEghRjcrO6jmxTs=
X-Received: by 2002:a5d:424e:0:b0:1f0:3430:ffc8 with SMTP id
 s14-20020a5d424e000000b001f03430ffc8mr3199480wrr.672.1646914083828; 
 Thu, 10 Mar 2022 04:08:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWWVgn7MyP2+pIgdiw0Uj8swzUHZ93g8mK8jSLrE55mgpOda05RHlpi5VgwKVEM6L1/6Zc+g==
X-Received: by 2002:a5d:424e:0:b0:1f0:3430:ffc8 with SMTP id
 s14-20020a5d424e000000b001f03430ffc8mr3199449wrr.672.1646914083520; 
 Thu, 10 Mar 2022 04:08:03 -0800 (PST)
Received: from [192.168.42.76] (tmo-097-147.customers.d1-online.com.
 [80.187.97.147]) by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b001f1e16f3c53sm4116587wrc.51.2022.03.10.04.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 04:08:02 -0800 (PST)
Message-ID: <16fdac9f-0e44-f84b-6c34-518ca77762aa@redhat.com>
Date: Thu, 10 Mar 2022 13:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com> <YiWra21XaVV9Fdv/@xz-m1.local>
 <YiXZLzqenrNT/uKg@redhat.com>
 <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
 <YinZLBo77h9X9kvX@redhat.com>
 <CAJ+F1CLhb-svEFTR4ehzu69a2PnJn0ZT-=TTRZ_FQedkODAW6g@mail.gmail.com>
 <Yinieq97rqFqfjK4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yinieq97rqFqfjK4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 12.35, Daniel P. Berrangé wrote:
> On Thu, Mar 10, 2022 at 03:11:08PM +0400, Marc-André Lureau wrote:
>> Hi
>>
>> On Thu, Mar 10, 2022 at 2:56 PM Daniel P. Berrangé <berrange@redhat.com>
>> wrote:
>>
>>> On Mon, Mar 07, 2022 at 11:09:37AM +0100, Thomas Huth wrote:
>>>> On 07/03/2022 11.06, Daniel P. Berrangé wrote:
>>>>> On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
>>>>>> On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
>>>>>>> The QMP commands have a trailing newline, but the response does
>>> not.
>>>>>>> This makes the qtest logs hard to follow as the next QMP command
>>>>>>> appears in the same line as the previous QMP response.
>>>>>>>
>>>>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>>>> ---
>>>>>>>    tests/qtest/libqtest.c | 3 +++
>>>>>>>    1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>>>>>> index a85f8a6d05..79c3edcf4b 100644
>>>>>>> --- a/tests/qtest/libqtest.c
>>>>>>> +++ b/tests/qtest/libqtest.c
>>>>>>> @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
>>>>>>>            }
>>>>>>>            json_message_parser_feed(&qmp.parser, &c, 1);
>>>>>>>        }
>>>>>>> +    if (log) {
>>>>>>> +        g_assert(write(2, "\n", 1) == 1);
>>>>>>> +    }
>>>>>>
>>>>>> Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
>>>>>
>>>>> You need to check the return value of write() otherwise you'll get a
>>>>> compile failure due to a warn_unused_result attribute annotation.
>>>>>
>>>>> I don't think G_DISABLE_ASSERT is a problem as we're not defining
>>>>> that in our code.
>>>>
>>>> You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT.
>>>
>>> I don't think we need to do that, per existing common practice:
>>>
>>> $ git grep '\bg_assert('  | wc -l
>>> 2912
>>>
>>> $ git grep '\bg_assert(' tests | wc -l
>>> 2296

I said, you *could* do that, not that you *must* do that ;-)

Since we require compiling without G_DISABLE_ASSERT in the QEMU code base, 
it doesn't really matter for us. But if you're involved in other projects, 
too, where GI_DISABLE_ASSERT might be allowed, it might be good habit to do 
it "right", i.e. use g_assert_true() in case the expression has side effects 
and must never be disabled.

>>>
>> On the topic of assert() usage, it would be nice to state clearly when to
>> assert() or g_assert().
>>
>> g_assert() behaviour is claimed to be more consistent than assert() across
>> platforms.
>>
>> Also -DNDEBUG is less obvious than -DG_DISABLE_CHECKS or -DG_DISABLE_ASSERT.
> 
> Personally I would make QEMU build error if NDEBUG or G_DISABLE_ASSERT
> was defined, as running with asserts disabled will lead to unsafe code.
> We rely on asserts firing to avoid compromise of QEMU when faced with
> malicious data.

We already do that, see osdep.h:

#ifdef NDEBUG
#error building with NDEBUG is not supported
#endif
#ifdef G_DISABLE_ASSERT
#error building with G_DISABLE_ASSERT is not supported
#endif


>> I would remove assert.h and prevent from using it back, but I might be
>> missing some reasons to still use it.

I guess it's just grown historically.

First step would be to add an entry to our coding styles, I think.

Then, if we don't care about the code churn, this would be a nice 
BiteSizeTask for new contributors, I think (GSoC etc.), so we could create 
some tickets in the Gitlab issue tracker for this (e.g. split up by subsystem).

  Thomas


