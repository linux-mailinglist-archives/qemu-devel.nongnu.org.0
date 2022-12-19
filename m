Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057866509A4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Cs9-0002Ic-Fe; Mon, 19 Dec 2022 04:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7Cs6-0002IR-HI
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p7Cs4-0002uC-Kd
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671443743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m9ciXDPMtzHc1a6Xez0Xt11D+S8w5I7oOQc+lL6AFc=;
 b=b7pgRx2gNVGvorQt+BUPtEgXdjtETwSCwNIzS2FjQEej8Xm1hBa09+jx6IF3kNJrSEdf3O
 h5bYndQkbjhnZlbd1/52EJN7CXIx7pnHBSeeagPVJkA1+fFU6DJQsmm9CR4DQsPjAb6b2g
 UPpCBApX2m1Xbq9BKWVIUqDqL//5dtI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-382-PJ-SZybKPnW-ICzCWnj2EQ-1; Mon, 19 Dec 2022 04:55:42 -0500
X-MC-Unique: PJ-SZybKPnW-ICzCWnj2EQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so6399236wmb.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9m9ciXDPMtzHc1a6Xez0Xt11D+S8w5I7oOQc+lL6AFc=;
 b=s0PgfuakZnL7uxqdA91ielttoTYJMO2SoSsYVjFt3KyU3iSfM9bKP0p7fBd3E9SPRc
 a1jyEeLmryc39obxRqL/w8lYpmsMPiCKmwhyuAcImFOLJbWpow4O1YYY2OW/ozQuXofN
 XvkOG47gNxioETOx3Gvh9PjuPHsurNrVZi06/dEUvA/d/ZMensmxlHywp+GvlkdxYFfT
 O5D8wR6Ctn0k7vrWkMrVsPcCd+nSTu6mPQb6dhuElcj5iAioqXBLawyfNbQoOFbXMjeY
 yguiJ2bnQwfYf5vbaiKwKd4ORoMmLJekc74ac7oY28ueptfeEZcGviAtDlSl6XaRMv8q
 +yRA==
X-Gm-Message-State: ANoB5pmf81KWO9i5Jk+1kSiSW/kWMBeJ04XDf3IpFgeA6jFo62dx5+Bi
 HVkjm0GoumP7E6PaYAB77Huu+jqeA5Wy56kdr4w7OyHJ1NEy1py2XwvyfpGIflHS1pXLPdojaHi
 CHURcn8tQHovTl8Y=
X-Received: by 2002:adf:f291:0:b0:242:6006:50f0 with SMTP id
 k17-20020adff291000000b00242600650f0mr24115771wro.62.1671443740869; 
 Mon, 19 Dec 2022 01:55:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7poVinxwR2Qi4hEVPdpJVQ5azScxqElDNlZCFM5iLhHqroLcXehdU53ayMrFvODQONExbp6A==
X-Received: by 2002:adf:f291:0:b0:242:6006:50f0 with SMTP id
 k17-20020adff291000000b00242600650f0mr24115764wro.62.1671443740607; 
 Mon, 19 Dec 2022 01:55:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:e900:df20:b417:7171:f748?
 (p200300cbc704e900df20b4177171f748.dip0.t-ipconnect.de.
 [2003:cb:c704:e900:df20:b417:7171:f748])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4407000000b0024245e543absm9263563wrq.88.2022.12.19.01.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:55:40 -0800 (PST)
Message-ID: <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
Date: Mon, 19 Dec 2022 10:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
Content-Language: en-US
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
 <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 16.12.22 14:47, Michal Prívozník wrote:
> On 12/16/22 14:41, David Hildenbrand wrote:
>> On 15.12.22 10:55, Michal Privoznik wrote:
>>> If a memory-backend is configured with mode
>>> HOST_MEM_POLICY_PREFERRED then
>>> host_memory_backend_memory_complete() calls mbind() as:
>>>
>>>     mbind(..., MPOL_PREFERRED, nodemask, ...);
>>>
>>> Here, 'nodemask' is a bitmap of host NUMA nodes and corresponds
>>> to the .host-nodes attribute. Therefore, there can be multiple
>>> nodes specified. However, the documentation to MPOL_PREFERRED
>>> says:
>>>
>>>     MPOL_PREFERRED
>>>       This mode sets the preferred node for allocation. ...
>>>       If nodemask specifies more than one node ID, the first node
>>>       in the mask will be selected as the preferred node.
>>>
>>> Therefore, only the first node is honored and the rest is
>>> silently ignored. Well, with recent changes to the kernel and
>>> numactl we can do better.
>>>
>>> The Linux kernel added in v5.15 via commit cfcaa66f8032
>>> ("mm/hugetlb: add support for mempolicy MPOL_PREFERRED_MANY")
>>> support for MPOL_PREFERRED_MANY, which accepts multiple preferred
>>> NUMA nodes instead.
>>>
>>> Then, numa_has_preferred_many() API was introduced to numactl
>>> (v2.0.15~26) allowing applications to query kernel support.
>>>
>>> Wiring this all together, we can pass MPOL_PREFERRED_MANY to the
>>> mbind() call instead and stop ignoring multiple nodes, silently.
>>>
>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>> ---
>>
>> [...]
>>
>>> +#ifdef HAVE_NUMA_SET_PREFERRED_MANY

That should be HAVE_NUMA_HAS_PREFERRED_MANY, right?

-- 
Thanks,

David / dhildenb


