Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1565FAE53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 10:23:27 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiAXt-0000ZS-OI
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 04:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oi9my-0003kn-Cj
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oi9mu-0003iI-5d
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 03:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665473689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qoNbunhjghD/GRCN6qT70uYG6bFkzKctHaVtapMYWw=;
 b=eC95I+2V92aaL+4zF7QC6uqxZkPwJPVGRW79M5+/eCGzTo/rP+biqpsfOFdRGkUS0oqUP3
 M4mbezB2+0bLc206a4wkAYt1lgMi1PmAqxxFEHfx3WH/G9F05r7ACiPBhe9wcDu6xkZvx3
 l3rIzUNP7H1usxZ5bTBcrPxHpdjscu8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-m29FpuGPPTaDr_0Sa7Zn-w-1; Tue, 11 Oct 2022 03:34:47 -0400
X-MC-Unique: m29FpuGPPTaDr_0Sa7Zn-w-1
Received: by mail-wr1-f71.google.com with SMTP id
 r4-20020adfbb04000000b0022e5ec02713so3523279wrg.18
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 00:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qoNbunhjghD/GRCN6qT70uYG6bFkzKctHaVtapMYWw=;
 b=IQVrszOujHoLpQwaEcJvc15UHPm+veQPdweCsHuTJ881cT8SAgBH0CalfjgYlp0P4K
 vzTK0l7lfSVw1nm0me0lO+UvmodEeKZ6Dv0luPbL9vFzM0ZZxY3XErbPOUzJWdm9epox
 0FpuxWMH4C2SabIGxRyhRweB07/a/YDY3zH7FUFYsAz83K9OXJMHz2ZwEE7d7BxHKA6R
 ad8J+0IooYbFWsQLB3ANmATjk4vLqXR+TkzEv4f8GUw6X1yeu6bC0Z6w45//xQfIlc0X
 KH4sjthWbGp07C2P7I1fBQDx9G35hS0mvXi1TpoBfCBJLlaCbfoiKY64J7xB5tUsgGfp
 1hHg==
X-Gm-Message-State: ACrzQf25QuAzpcvdV1Ayrdeo+RWG10Vj9REQF1W59TnkrW1jp+03kQi8
 Rf58sJTIVGJBVnbqu2rlspzdiMG4pR3or0/V8GmgcLFVVtT/LQS2RvZ4O6tM6+1i2F7GYwd+lNj
 ZUFKv/Jo1N3rTjT8=
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr13950284wrr.483.1665473686809; 
 Tue, 11 Oct 2022 00:34:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iasZttr75B53xiSJYScLf1wTwn0chCKeFTeVLhDFicP+64uSisZu1wVZsoL3eYTPqRtKhpg==
X-Received: by 2002:adf:fb10:0:b0:22a:f1d8:18d2 with SMTP id
 c16-20020adffb10000000b0022af1d818d2mr13950263wrr.483.1665473686533; 
 Tue, 11 Oct 2022 00:34:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:6900:f110:6527:aa46:a922?
 (p200300cbc7096900f1106527aa46a922.dip0.t-ipconnect.de.
 [2003:cb:c709:6900:f110:6527:aa46:a922])
 by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003b47b913901sm1616614wms.1.2022.10.11.00.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 00:34:45 -0700 (PDT)
Message-ID: <f147185e-0cf4-2ba5-0adb-a07e56fd7c63@redhat.com>
Date: Tue, 11 Oct 2022 09:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 4/7] util: Add write-only "node-affinity" property for
 ThreadContext
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-5-david@redhat.com> <8735buj3rd.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <8735buj3rd.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.007, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11.10.22 08:03, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's make it easier to pin threads created via a ThreadContext to
>> all CPUs currently belonging to a given set of NUMA nodes -- which is the
>> common case.
>>
>> "node-affinity" is simply a shortcut for setting "cpu-affinity" manually
>> to the list of CPUs belonging to the set of nodes. This property can only
>> be written.
>>
>> A simple QEMU example to set the CPU affinity to Node 1 on a system with
>> two NUMA nodes, 24 CPUs each:
>>      qemu-system-x86_64 -S \
>>        -object thread-context,id=tc1,node-affinity=1
>>
>> And we can query the cpu-affinity via HMP/QMP:
>>      (qemu) qom-get tc1 cpu-affinity
>>      [
>>          1,
>>          3,
>>          5,
>>          7,
>>          9,
>>          11,
>>          13,
>>          15,
>>          17,
>>          19,
>>          21,
>>          23,
>>          25,
>>          27,
>>          29,
>>          31,
>>          33,
>>          35,
>>          37,
>>          39,
>>          41,
>>          43,
>>          45,
>>          47
>>      ]
> 
> Double-checking my understanding: on this system, the even CPUs belong
> to NUMA node 0, and the odd ones to node 1.  Setting node-affinity=1 is
> therefore sugar for setting cpu-affinity to the set of even CPUs.
> Correct?

Yes!

# lscpu
...
NUMA:
   NUMA node(s):          2
   NUMA node0 CPU(s):     0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46
   NUMA node1 CPU(s):     1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47


> 
>> We cannot query the node-affinity:
>>      (qemu) qom-get tc1 node-affinity
>>      Error: Insufficient permission to perform this operation
> 
> The error message is somewhat misleading.  "Insufficient permission"
> suggests this could work if I had more "permission".  Not the case.  The
> message comes from object_property_get(), i.e. it's not this patch's
> fault.  I'll post a patch to improve it.
> 

I agree, thanks!

-- 
Thanks,

David / dhildenb


