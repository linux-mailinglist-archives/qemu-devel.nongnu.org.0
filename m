Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C616379DEF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:49:52 +0200 (CEST)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJP5-00078D-8q
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJNs-0006A9-Ol
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgJNq-0002By-9j
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620704913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqEo5Qw9lSgAeADNlf9Um8/oIHZMJ2xDdqsbcEfsQuQ=;
 b=NIeZMs2TGjEw2gWeYGD46iYfKfbjXX+C97R/DhC4e0ORy9M7eaHWfOw7km7uod1T7t/h0l
 89y5EK/jIFKMuXcjaUxfRxI35WxhyNAzIrPUTbrcUJErf7GQ2BkI24qK5W38dayfX09Tv6
 Ik5sUSRXQsOHNxmuNBdMbS/BQm5zy5U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ZyDqfyp2OHGC_ouMdBiILQ-1; Mon, 10 May 2021 23:48:31 -0400
X-MC-Unique: ZyDqfyp2OHGC_ouMdBiILQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 zo1-20020a170906ff41b02903973107d7b5so5434262ejb.21
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 20:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IqEo5Qw9lSgAeADNlf9Um8/oIHZMJ2xDdqsbcEfsQuQ=;
 b=UN5YHXuRj3ARwXonIw07sVUYaaydC8VMvef22AsA8uDWFEYLvT74KsS/wGF2JU5Isx
 NhuxV0lwbRTvUrklkTwchYlZ1v5xk6hqFrIE2LnyyyTtTFtr+Dsw3U1OPn4LhbBYPbU4
 UFCGv22dvEymSpUixCCExS66ooBUn6h7KRigDznFu96tx4Ce3YGbt84CaziBS4Hk4JPC
 3x0G0mfiiyOstXFRJDzp0TcFvtUykikK3gTEAnsT7ohXpx1zZWsCo+lIvHgtvDYaH6Nj
 8ySFYE8RD6ukV5i1QtHa2Q7WXhlG3Jk08NzIJgs7AjDFxbmll3px8UICC+xZ/YQGOJ3b
 uwRQ==
X-Gm-Message-State: AOAM53313nGec4TvUBgj+JLQBNIbIJcT53kQ46qA3SXetAcjjKlvCaT0
 f7vGYwyfUFYyDPWYnLcTEHl1ELhp2wKeBv2QCfh/9qQoc+6dnnodaThuXJUFRwa2w2vcCJdhQUK
 n0QnzK+0rbexj80w=
X-Received: by 2002:a17:906:91d3:: with SMTP id
 b19mr29347244ejx.242.1620704909860; 
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK/C9QoZgE83kf7GQdvk+WbJOp645EFvCmUI5wNMOp5TCcqBFFDKLSQHXmo7Jn0zLXf7ZFIA==
X-Received: by 2002:a17:906:91d3:: with SMTP id
 b19mr29347229ejx.242.1620704909686; 
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n12sm13185788edw.95.2021.05.10.20.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:48:29 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210406133944.4193691-1-philmd@redhat.com>
 <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
 <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
Message-ID: <60e2df83-b2e2-e710-5abf-ab3b812e7465@redhat.com>
Date: Tue, 11 May 2021 05:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial (patch reviewed).

On 4/12/21 1:07 PM, Philippe Mathieu-Daudé wrote:
> ping?
> 
> On 4/6/21 4:39 PM, Alexander Bulekov wrote:
>> On 210406 1539, Philippe Mathieu-Daudé wrote:
>>> sparse-mem.c is added to the 'mem_ss' source set, which itself
>>> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
>>> selected.
>>> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
>>> even if CONFIG_FUZZ is selected:
>>>
>>>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>>>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>>>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
>>>
>>> Fix by adding sparse-mem.c directly to the softmmu_ss set.
>>>
>>> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Oops..
>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>
>>> ---
>>>  hw/mem/meson.build | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
>>> index ef79e046787..3c8fdef9f9e 100644
>>> --- a/hw/mem/meson.build
>>> +++ b/hw/mem/meson.build
>>> @@ -1,8 +1,9 @@
>>>  mem_ss = ss.source_set()
>>>  mem_ss.add(files('memory-device.c'))
>>> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>>>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>>>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>>>  
>>>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>>> +
>>> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>> -- 
>>> 2.26.3
>>>
>>>
>>
> 


