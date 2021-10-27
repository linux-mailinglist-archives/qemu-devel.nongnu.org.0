Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DADA43CD2D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:11:49 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkai-0004Ge-NI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfjXp-0000PK-ET
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfjXk-0005Km-Cl
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635343476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YN/bLTk9W4jFoqX1MmfKo8264P/GPmaZJoxCKcTGJ7Q=;
 b=dgiD7E9TL4xr7Udan54iMO2ZCHqgyZLe7soZmlGbbSl2kkMZ6xN60xNMxQr6SnjsgdK8MC
 vXtMahDWypsz645RyBknoAbUsuIr8tsa9WsTvBdU7EaafURfPUEbSRlwwoRO8C3NUTL+1t
 E8KUG0WXLPXki4LemiWm+rC6alYt6iE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Gh3VTSCKMu2Cwlh0TFBr1w-1; Wed, 27 Oct 2021 10:04:33 -0400
X-MC-Unique: Gh3VTSCKMu2Cwlh0TFBr1w-1
Received: by mail-wr1-f70.google.com with SMTP id
 i8-20020a5d6308000000b001742659b50eso286815wru.23
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YN/bLTk9W4jFoqX1MmfKo8264P/GPmaZJoxCKcTGJ7Q=;
 b=OsDblifKunXlJQy2o7GwB/TL6r7A02ecilrS/Q58DQKRapZLTMGDcaCWiO1bD8eiVM
 q520WIoyv/BdsiA9Vb+X5HKyjU4LlPTL3huZ/M9QUofRQLBQwtgj46y/flmR9FiiJ13v
 wutm3R09QCeUKRytatcN2GeIn8SxqiJHDrL7a1PFBKtsqhnLi5HFigq1QFiVi3HNLhzL
 Ec2axdIa8J3Syhpr2IyO+ZBiaj4VXmOQCXKSPQMLdRuYgpkKUd9xcTkA1DChr94yPBYb
 Mhdr8Vj1MGJBwdQYwCFQbYpvlF6cnaTjrB7HGqSl3nmBTtehGAfNucPK/4EZiK9J//A8
 bxfQ==
X-Gm-Message-State: AOAM530qP7gptCJy1LiktZ1JzQzzbczKTbazrSkBRmLcEpyk6eWve6Ma
 gTBD/4QtWCp6r3W5C65scINdoCVYlriIHXpuBd9uzaKA0QrFmyTlL/kZ0o3TqOqPBOOauH1oeUx
 yB5+1kirXc7QjHKE=
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr39135215wri.359.1635343472026; 
 Wed, 27 Oct 2021 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMG5hMHU+fqjF6OiSm16HnX+RXpo9rofMs4qTZ/GsQ4SgoEFZ97KLsPkMhH1j+K05s+YoZkQ==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr39135082wri.359.1635343471021; 
 Wed, 27 Oct 2021 07:04:31 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23d76.dip0.t-ipconnect.de. [79.242.61.118])
 by smtp.gmail.com with ESMTPSA id 126sm3461950wmz.28.2021.10.27.07.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 07:04:29 -0700 (PDT)
Message-ID: <7f1ee7ea-0100-a7ac-4322-316ccc75d85f@redhat.com>
Date: Wed, 27 Oct 2021 16:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 02/12] vhost: Return number of free memslots
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-3-david@redhat.com>
 <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <4ce74e8f-080d-9a0d-1b5b-6f7a7203e2ab@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.10.21 15:36, Philippe Mathieu-Daudé wrote:
> On 10/27/21 14:45, David Hildenbrand wrote:
>> Let's return the number of free slots instead of only checking if there
>> is a free slot. Required to support memory devices that consume multiple
>> memslots.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  hw/mem/memory-device.c    | 2 +-
>>  hw/virtio/vhost-stub.c    | 2 +-
>>  hw/virtio/vhost.c         | 4 ++--
>>  include/hw/virtio/vhost.h | 2 +-
>>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
>> --- a/hw/virtio/vhost-stub.c
>> +++ b/hw/virtio/vhost-stub.c
>> @@ -2,7 +2,7 @@
>>  #include "hw/virtio/vhost.h"
>>  #include "hw/virtio/vhost-user.h"
>>  
>> -bool vhost_has_free_slot(void)
>> +unsigned int vhost_get_free_memslots(void)
>>  {
>>      return true;
> 
>        return 0;

Oh wait, no. This actually has to be

"return ~0U;" (see real vhost_get_free_memslots())

... because there is no vhost and consequently no limit applies.

-- 
Thanks,

David / dhildenb


