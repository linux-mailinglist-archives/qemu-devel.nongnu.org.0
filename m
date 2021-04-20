Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD7365635
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:33:07 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYngo-00048U-UX
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYnbn-00081e-UB
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYnbm-000724-9o
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618914472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwJyngEwodKR8ksLVhX0+aI4SWhZv+pqsSmQnfpwAn8=;
 b=CG5tzcdk3jrBxeg7CcJhHgKSnPrhd8VaqXVRWpjiDl1hHeQh2LsWttXTWlUQKMwYsaeNUa
 iMs67LOzhPUUrI6CSBEsnwetSEY9lSQ5qu9c0Uqle1BSUVpa/fsIZn+nd6m4YxPTZJwcdc
 +iz1gB55LcB4PP690k6td7fY2J4oKHg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Odt3ikvmMdiA6VRUDlPkog-1; Tue, 20 Apr 2021 06:27:50 -0400
X-MC-Unique: Odt3ikvmMdiA6VRUDlPkog-1
Received: by mail-wr1-f72.google.com with SMTP id
 91-20020adf92640000b02901060747826eso8880660wrj.13
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fwJyngEwodKR8ksLVhX0+aI4SWhZv+pqsSmQnfpwAn8=;
 b=h5TInBPKVTVCYspd7Ayw9mwLhVlQXPsLQqH6olUk9URgPEYz75E86iYU/aV1qPwQrf
 bj+esm3I2CjnFSvrnM/xpI6o6fbYasI9FMsSPJ33VuwO/jbddI6n+O0AbxzOmRNocqOu
 qMIWOzZIATbro0VyRIq2vecSkoNfiosc0Wd8RL/AMWHQO0Rgrzk8XpPH624jHqq/5qB+
 xr2R4aeXQ7V03WcIEVv586RUn0ypaV+fznkshAiVVcwyxxnHTT6mrN0ikVHxpfW30woi
 +/QgqjoKkQsPTU6LEt+VZXGiXKJ7W1weCAmkXRwDDmaITjvKYK2YXVw0Mkc6xFcmcspz
 Ze9Q==
X-Gm-Message-State: AOAM531srfi0ZQdjcfvtigvk2gPhu3K2BRehP+/5ldSr7AMptdKvi+V9
 84tcRpTXq3CNekf2ltRiS+qgigGcoOOnoTouGd+qInhqyABmVF8n1jv7m7WSB7sCNzc7ZpNxyL3
 3Kx+GtcnAyenFuQk=
X-Received: by 2002:adf:e491:: with SMTP id i17mr19477540wrm.314.1618914469633; 
 Tue, 20 Apr 2021 03:27:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxsjwrdkKs7F6SJlLq7Qcg1Kvwy3m8qyrPnhJ7gbWaUhil0WnYQVfBUftegCPYc6VRS5gUOA==
X-Received: by 2002:adf:e491:: with SMTP id i17mr19477513wrm.314.1618914469292; 
 Tue, 20 Apr 2021 03:27:49 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 y11sm24910638wro.37.2021.04.20.03.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:27:49 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-6-david@redhat.com>
 <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v5 05/14] softmmu/memory: Pass ram_flags to
 memory_region_init_ram_shared_nomigrate()
Message-ID: <ce266bac-0bfa-4b45-0159-af3e7b17a234@redhat.com>
Date: Tue, 20 Apr 2021 12:27:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <34931ee0-1bde-16f5-d929-1c9d9157f45a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:20, Philippe Mathieu-Daudé wrote:
> Hi David,
> 
> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>> Let's forward ram_flags instead, renaming
>> memory_region_init_ram_shared_nomigrate() into
>> memory_region_init_ram_flags_nomigrate(). Forward flags to
>> qemu_ram_alloc() and qemu_ram_alloc_internal().
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   backends/hostmem-ram.c                        |  6 +++--
>>   hw/m68k/next-cube.c                           |  4 ++--
>>   include/exec/memory.h                         | 24 +++++++++----------
>>   include/exec/ram_addr.h                       |  2 +-
>>   .../memory-region-housekeeping.cocci          |  8 +++----
>>   softmmu/memory.c                              | 20 ++++++++--------
> 
> OK up to here, but the qemu_ram_alloc_internal() changes
> in softmmu/physmem.c belong to a different patch (except
> the line adding "new_block->flags = ram_flags").
> Do you mind splitting it?
> 

Can you elaborate? Temporarily passing both "ram_flags" and "bool 
resizeable, bool share" to qemu_ram_alloc_internal()?

I don't see a big benefit in doing that besides even more effective 
changes in two individual patches. But maybe if you elaborate, i can see 
what you would like to see :)

Thanks!


-- 
Thanks,

David / dhildenb


