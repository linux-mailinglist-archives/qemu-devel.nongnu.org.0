Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B966628B3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtJS-0000pU-2v; Mon, 09 Jan 2023 09:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtJP-0000pD-Qz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pEtJN-0003os-V5
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673275180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2LanOiT9SUOGeGFbabfuxBTLWrQTmgobAIvi3aSWR+M=;
 b=Bz3VSeNvPQ8ZLzyf5rbLTkaze2htEQ65DhQUofYlBcxlZxYzPdLIzxhpO4MO7sZk4ngs/G
 eLWYHvKQ3btZAseGAmEvaWWTMDsMyV5Ns6X7VNnVTpHT8RjnRgRybTcP0dBd9bbLYtY5LV
 LQ/DoTZtSEl1oh+ZP4DVQTpq1gPm43Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-rKzNl1TnPd6XKVJQCW9__Q-1; Mon, 09 Jan 2023 09:39:39 -0500
X-MC-Unique: rKzNl1TnPd6XKVJQCW9__Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so7363154wms.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2LanOiT9SUOGeGFbabfuxBTLWrQTmgobAIvi3aSWR+M=;
 b=6gaQ64JCAD09CJWfEOY1tpbV4n5/2GrxhdFtFit9QDMZHcTDCDAhUMaJRwr6/F87+J
 YpuMXKEo6Z+6kVX8QG6diIsEXnKk5lJPFQoeysa4/7wU4UinzAGlIpDSyyEP7nhATXYe
 OsXdPbm5/qL9oXmmO0pnbkdDD+RNGA+2uEnfsZLHg+/KEE4Q21vlek4duEc7uZ99Hc8J
 N5DEVlmcoxDYjcy3RFNY9ku0Ig9jVo/CtAd/4vb3UQBn9zGq73HEUVV8VChGsHalkPWu
 AQufl0VyXwwkyhOP1S4XR5TMAt+4Wv12Db9qLrYM2MM7x2NipsRKxZ7ZfAutAYVVzRwp
 QjDQ==
X-Gm-Message-State: AFqh2kpKouc9HGm4PNGfJ7PwYHef8JZp9SdQbeiCsR7TAgdRfu5HlVSs
 pxXc/6NQnXhc0DZmL/tNe7BbZ79GWDjfRdAPBMlP8HN6EP2l+zmj1sps5tPrwFE6dz68STEwI5r
 MA0rIpR8AOW1hqoM=
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr48668795wmi.1.1673275178191; 
 Mon, 09 Jan 2023 06:39:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyrQfUatJQs7wW3gZqIASL7rqNDVksxyhu+iiNd7dkbsaaJLewmiAYbX8ZvedRwly6SkZUSQ==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr48668779wmi.1.1673275177971; 
 Mon, 09 Jan 2023 06:39:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:8f00:ba3:7d27:204f:8e29?
 (p200300cbc7038f000ba37d27204f8e29.dip0.t-ipconnect.de.
 [2003:cb:c703:8f00:ba3:7d27:204f:8e29])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0ad200b003d9c97d82f2sm11562151wmr.8.2023.01.09.06.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 06:39:37 -0800 (PST)
Message-ID: <44b9b396-f3ae-5066-4674-4c4eac5f9b2e@redhat.com>
Date: Mon, 9 Jan 2023 15:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/6] migration: Factor out checks for advised and
 listening incomming postcopy
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
 <20221222110215.130392-4-david@redhat.com> <Y7cGdweVxbGlcvWh@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y7cGdweVxbGlcvWh@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05.01.23 18:18, Peter Xu wrote:
> On Thu, Dec 22, 2022 at 12:02:12PM +0100, David Hildenbrand wrote:
>> +bool migration_incoming_postcopy_listening(void)
>> +{
>> +    PostcopyState ps = postcopy_state_get();
>> +
>> +    return ps >= POSTCOPY_INCOMING_LISTENING && ps < POSTCOPY_INCOMING_END;
>> +}
> 
> This name is misleading, IMHO.
> 
> The code means "we passed listening phase" but the name implies "we're
> listening".  We can add the "incoming" into that if we want, though.
> 

Let me call that migration_incoming_postcopy_running(). Thanks!

-- 
Thanks,

David / dhildenb


