Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31FE6509A8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CtW-0002k4-CM; Mon, 19 Dec 2022 04:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p7CtU-0002jv-TN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p7CtT-00036p-Eu
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671443830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vX6Zjp3PCdh95RAnGPyF6MN0BVW3R/sY8P+phLQ6FIA=;
 b=b3hgCDtP0jL/UNXyjZEt7iDvG9+8aryyBD9ruSCaSwpTMgAszY++4V/6qx+T3REHcrx992
 6VxOakAFgRTyd80veOceiOq1NgLHcLw4IAti0r/Mf+kLBz7/u6Lhl0hgOEqNEk6IoGQJ72
 KzqzFUcQ1IjjyEaZi8sma8fVkasqtFE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-BSYsTmxrMKyqO6Fx0jSPMA-1; Mon, 19 Dec 2022 04:57:08 -0500
X-MC-Unique: BSYsTmxrMKyqO6Fx0jSPMA-1
Received: by mail-ej1-f71.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso2247220ejc.22
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vX6Zjp3PCdh95RAnGPyF6MN0BVW3R/sY8P+phLQ6FIA=;
 b=iZ2crEuZYvsAr0b+y0aeRbYU8x30Zcr01dSid+9lErrBIpCZ7cwoS2qo/EppPJlh3C
 2Cq+6tTAEEUsGSw95I3n5JITFqKAFRqPxxnhcMrOKhHs2fkWSgKfiqE2NbYlM4/EsSTn
 mzXk8emY0CPXUqp+vKyKsdIrtigm2/4aJ621V8lXz6a5nF8jTV54v594JHP6z94HWqQO
 8uLXOXNkHNhmGqv7JHsOLNbFrkd10JYco3Z7RrKH+IxiZCOYMOzxx4SRGLNX8uHW5Ukv
 NS+xKfZcak/shxeQgMD/HsBuhzNbMQwcWlWbUmS2VP0RrBRS+nAE8pJCexTf9xgJ0qJp
 RYSg==
X-Gm-Message-State: AFqh2kqknyYzs/wUBFoggwEX2qFHw79zSUG0eKpbxaPet6VtdJ3F8JjE
 ohjT2vpkiz6k3zK2Hyg8379BpYcCWG2ZJOsSaLraZKnzq0PF87sNWnCXoIwI8/c6p5uhHz8ul9u
 VCcbGpisLhu3YWaM=
X-Received: by 2002:a17:907:8a1e:b0:81b:f617:eb99 with SMTP id
 sc30-20020a1709078a1e00b0081bf617eb99mr5386859ejc.67.1671443827345; 
 Mon, 19 Dec 2022 01:57:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvrly5s6OIDneUevczJtdkpKK8XXNo0LbJHoE05NqwC7dxXecrYnbbV/9AisPJ+vSKdy20nEA==
X-Received: by 2002:a17:907:8a1e:b0:81b:f617:eb99 with SMTP id
 sc30-20020a1709078a1e00b0081bf617eb99mr5386852ejc.67.1671443827192; 
 Mon, 19 Dec 2022 01:57:07 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 da15-20020a056402176f00b004615f7495e0sm4159654edb.8.2022.12.19.01.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:57:06 -0800 (PST)
Message-ID: <e264e466-5cff-3b7f-9850-ba203ce02828@redhat.com>
Date: Mon, 19 Dec 2022 10:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
 <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
 <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/19/22 10:55, David Hildenbrand wrote:
> On 16.12.22 14:47, Michal Prívozník wrote:
>> On 12/16/22 14:41, David Hildenbrand wrote:
>>> On 15.12.22 10:55, Michal Privoznik wrote:
>>>> If a memory-backend is configured with mode
>>>> HOST_MEM_POLICY_PREFERRED then
>>>> host_memory_backend_memory_complete() calls mbind() as:
>>>>
>>>>     mbind(..., MPOL_PREFERRED, nodemask, ...);
>>>>
>>>> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
>>>> to the .host-nodes attribute. Therefore, there can be multiple
>>>> nodes specified. However, the documentation to MPOL_PREFERRED
>>>> says:
>>>>
>>>>     MPOL_PREFERRED
>>>>       This mode sets the preferred node for allocation. ...
>>>>       If nodemask specifies more than one node ID, the first node
>>>>       in the mask will be selected as the preferred node.
>>>>
>>>> Therefore, only the first node is honored and the rest is
>>>> silently ignored. Well, with recent changes to the kernel and
>>>> numactl we can do better.
>>>>
>>>> The Linux kernel added in v5.15 via commit cfcaa66f8032
>>>> ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
>>>> support for MPOL_PREFERRED_MANY, which accepts multiple preferred
>>>> NUMA nodes instead.
>>>>
>>>> Then, numa_has_preferred_many() API was introduced to numactl
>>>> (v2.0.15~26) allowing applications to query kernel support.
>>>>
>>>> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
>>>> mbind() call instead and stop ignoring multiple nodes, silently.
>>>>
>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY
> 
> That should be HAVE_NUMA_HAS_PREFERRED_MANY, right?
> 

Oops, yes. Do you want me to send v3?

Michal


