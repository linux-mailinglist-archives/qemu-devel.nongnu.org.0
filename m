Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298703DBBDA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:14:40 +0200 (CEST)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UDf-0002ja-85
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9UCQ-0001KN-1Z
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:13:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9UCN-00060R-Sr
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627657999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ksgbG3maQMZih6yHaK+bz4sOnJjK65PPER6x27kiWQ=;
 b=Ri7ehxHUfldvH5jfWJ94Um3w0NYWz1y2Z9WeNErO/0lKfeHAJAAxNovPQxhimLYvveIeev
 NzSynFLOe85nwGJ47ZKCw1qh1rdC1Znt5oY1ZJq4CSWVwvgI55uSkosF9sgzxLlCO9HIXL
 SP03ehHv6Be60WT/rvMbsC14+ewOzVc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-AMSOZvTmMfC8xizfa7a1IA-1; Fri, 30 Jul 2021 11:13:17 -0400
X-MC-Unique: AMSOZvTmMfC8xizfa7a1IA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l12-20020a05600c1d0cb029024e389bb7f1so2716796wms.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0ksgbG3maQMZih6yHaK+bz4sOnJjK65PPER6x27kiWQ=;
 b=UrAMYe5avBSQhSArWm2yHhLVBBir/+kLRRNi752TJ6ew/ipUVKn5xlxggetmdRKAIY
 2Mr+cJgsvfJ9sf61KT+8nKP1/GVdi7Kf34rm4jyT0ukRwgcxTD1EGDKRca7kvBwFMCU2
 uA64roR0KLDTnOujqLWHEi1W7HaAps2r+vkPQ/pS67uThw653hDk7cfeV/A+eqkj6ZD/
 WrQFmZRqQmce2wxrDD0GFkUF9x1N1oO0MoreGFYa2AI86vPj2sApHVWDzuveMarV9z8G
 c0VtA5unDWmUJwWgZl/daWBLKZcYzDTSJ0WldaIjge1vH6DF0LDuW/5lfMdP0L6LzPhG
 GJsQ==
X-Gm-Message-State: AOAM532ObqyTPJDbq+Dzcwq+6pzpgwj8GbsL0X71tDtrREwXBcy+pLIR
 3sIdlBHz/cfu9TpKaALVazK2T1nuAMeZSdqMRaBY5PJrzh7Y8lA1EPQ0hyB8Qr8Rid606oYCR0p
 Lzr4iHU5HGqgoR+g=
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr3532278wmj.155.1627657996764; 
 Fri, 30 Jul 2021 08:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyc670LnROMNgru/V5QW0fn+0AZGUHZ0ZK9ZR9ybeoFJPY50XUrUHpnJPe6h+K8uiLb8OSBw==
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr3532251wmj.155.1627657996545; 
 Fri, 30 Jul 2021 08:13:16 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id d15sm2158915wri.39.2021.07.30.08.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 08:13:15 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-5-david@redhat.com> <YQBYpfgfUa8c9q0G@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f03bd552-1e0d-2152-eda5-188a4aa28ff6@redhat.com>
Date: Fri, 30 Jul 2021 17:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQBYpfgfUa8c9q0G@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.07.21 21:04, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> Let's simplify the case when we only want a single thread and don't have
>> to mess with signal handlers.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   util/oslib-posix.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>> index a1d309d495..1483e985c6 100644
>> --- a/util/oslib-posix.c
>> +++ b/util/oslib-posix.c
>> @@ -568,6 +568,14 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>>       }
>>   
>>       if (use_madv_populate_write) {
>> +        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
>> +        if (context.num_threads == 1) {
>> +            if (qemu_madvise(area, hpagesize * numpages,
>> +                             QEMU_MADV_POPULATE_WRITE)) {
> 
> Do you never have to fall back if this particular memory region is the
> one that can't do madv?

We sense upfront, when detecting use_madv_populate_write, whether it's 
supported on this very memory type. So, no need to fallback here.

> 
> Dave

-- 
Thanks,

David / dhildenb


