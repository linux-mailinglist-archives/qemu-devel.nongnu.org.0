Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D546A952B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:28:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2df-0007YF-W2; Fri, 03 Mar 2023 05:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2dd-0007Xl-EX
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:27:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2dZ-0004yT-LH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677839261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DB7wWm6tGPcU2IGliVAS1qGy2En+lUiplgHZacexQFw=;
 b=Py7gRv9nnbB31SMTYie2YcxaE+72zOa12Dd8pz5rw2OfJkVysweLepcH57jAOk7Cug8LRi
 BlFteQJiJ3e0hJO7hZmjyj6q2y0uN9gJS+IH8R4cYCY8ShhAKaL/VBmwg5X4ejzSQRKe7a
 Lnr25xmWaXOTF7oFsvZYU12ZhmcnRsk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-c_ZWDoEmO7O0gP_FFGUFYA-1; Fri, 03 Mar 2023 05:27:37 -0500
X-MC-Unique: c_ZWDoEmO7O0gP_FFGUFYA-1
Received: by mail-wm1-f69.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so771612wmj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DB7wWm6tGPcU2IGliVAS1qGy2En+lUiplgHZacexQFw=;
 b=cvOeSnrnKkpyNDs6SM9jxQLN90C03mMXnAmfehc1BWcK1ZnwQu30JFuLFHI1SrxSYh
 VxAkhKD+Mf+vAAsEF/HBZdnOnJJAb052eq22O9EeSvVdarbKkT672FUFN3hNvTTqYFOn
 zkQ2BBm7y30Fib5C5Z48RUtw3biDQGiFCRxC+rPUV0yUcQZq2ls/olkSWVelm79WwEQg
 RPwRFQveUxvz1nJ8Ulh9rYE9/A/UF4RFIfEeAYFGbwlJEx9f365wfYf8w1nsiSFC14Vx
 S2Pqh1Z/Ru4zNwd9BgqIIv/zbmKO953kkjScpdaYeGMLKO/ED83p8ZL2aghwUM1FbRUV
 k02w==
X-Gm-Message-State: AO0yUKUOPl7AqkBWajVzON7m5f1VJzjfqp2tqIKjd985XkoEOXkeCWL9
 bv5zXst06ugTadhVzfK98OL4XV8AdQDqWnimy4AqmCBPDiR7QpiPBokYYkaD4RdILeLK4pTxMla
 h/3VML00XaHkVn9M=
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr1141641wms.2.1677839256820; 
 Fri, 03 Mar 2023 02:27:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/BmDSP+LYgQRnY7lLNoMj3yXMt9/ilsN1/xEA29z6iwbmZ2MfsUdqDssRBkaR2KhFHPSnmMQ==
X-Received: by 2002:a05:600c:5127:b0:3ea:dbdd:66df with SMTP id
 o39-20020a05600c512700b003eadbdd66dfmr1141629wms.2.1677839256529; 
 Fri, 03 Mar 2023 02:27:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de.
 [109.43.176.203]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4103000000b002c55521903bsm1773571wrp.51.2023.03.03.02.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:27:35 -0800 (PST)
Message-ID: <29717625-6af2-89df-cbc9-d004b7ecf6f1@redhat.com>
Date: Fri, 3 Mar 2023 11:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/5] iotests: make meson aware of individual I/O tests
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230302184606.418541-1-berrange@redhat.com>
 <44d571e7-05b6-b2a1-7eb7-44bf2912ec69@redhat.com>
 <ZAG1jLsR8vZJprJ4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAG1jLsR8vZJprJ4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/03/2023 09.53, Daniel P. Berrangé wrote:
> On Fri, Mar 03, 2023 at 09:30:39AM +0100, Thomas Huth wrote:
>> On 02/03/2023 19.46, Daniel P. Berrangé wrote:
>>> To just repeat the patch 5 description...
>>>
>>> Currently meson registers a single test that invokes an entire group of
>>> I/O tests, hiding the test granularity from meson. There are various
>>> downsides of doing this
>>>
>>>    * You cannot ask 'meson test' to invoke a single I/O test
>>>    * The meson test timeout can't be applied to the individual
>>>      tests
>>>    * Meson only gets a pass/fail for the overall I/O test group
>>>      not individual tests
>>>    * If a CI job gets killed by the GitLab timeout, we don't
>>>      get visibility into how far through the I/O tests
>>>      execution got.
>>>
>>> This is not really specific to the I/O tests, the problem is common
>>> to any case of us running a test which is in fact another test
>>> harness which runs many tests. It would be nice to have meson have
>>> the full view of all tests run. Adapting the I/O tests is as easy
>>> win in this respect.
>>>
>>> This switches meson to perform test discovery by invoking 'check' in
>>> dry-run mode. It then registers one meson test case for each I/O
>>> test. Parallel execution remains disabled since the I/O tests do not
>>> use self contained execution environments and thus conflict with
>>> each other.
>>
>> Great to see some movement in this area again!
>>
>> Some questions/remarks:
>>
>> 1) Could you remove tests/check-block.sh now? See also:
>>     https://lore.kernel.org/all/20220209101530.3442837-9-thuth@redhat.com/
> 
> Possibly, I wasn't sure if that was wanted as a general entry
> point for humans, or was solely for meson ?

I think this script was only ever used for "make check-block", I never heard 
of anybody really using this script directly in a regular fashion. Humans 
rather run the tests/qemu-iotests/check script directly. Also see its origins:

  https://gitlab.com/qemu-project/qemu/-/commit/b8c6f29eb84cd3ccbbf

  HTH,
   Thomas


