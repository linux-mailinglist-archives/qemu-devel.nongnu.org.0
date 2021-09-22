Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3F414943
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:44:02 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1bV-0002x7-3m
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT1TB-0001HI-T7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT1T9-000351-QV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632314123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufhmS9ukIx+xbewyJIPRZK8PnOWAnSuixS+uiqnE8LU=;
 b=MDYxR1rtsM7GbQ9dziX/DCiJAjQr1pk/pXSFoIhfXylJl/Twcq6MHVUcUqJZ1MfWZqkce4
 6AOtDynzHPbedxSnGDPPK14z4Higr4ZOJp39AQLV0/2eWkhgwyXa4GaCnrYKiMCjBW8wi8
 Kp8SdsdYR/apl30a+PRwozLm1Fz/tV8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-kbohXpSAOM2bWb6Yo-CNPA-1; Wed, 22 Sep 2021 08:35:22 -0400
X-MC-Unique: kbohXpSAOM2bWb6Yo-CNPA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso1992878wrw.22
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ufhmS9ukIx+xbewyJIPRZK8PnOWAnSuixS+uiqnE8LU=;
 b=QrUVk8bVq/uOiz5tPQSa5zzhWS7Hmr1qGxWI3hQxZErrYC+8pQI5ldL7LM3VtsMXUF
 OswCF7Gts+zH93nUfYLcmIfPEc8+ND0V+mrIvJXWnjf4DDmYxg6g8yz8ScXFpv6yUPLx
 9/+13HXiPrtpmMjTh1RAycXGBm/NmF4ezlfhhWYA80EJ+o1KgZC7eJw/EE+gcD4qWswq
 gWUgpfb3gkX6TM5eNPJfOWDK3Z65D83vQs00gB4lx1vifVsl7ldCzH9UUqtbIzuuF8Wv
 tMBjeod9sW/v2mFQL7Rk2Rk5qgzdldjr5Rvh2Wrye2WdAww0Ehp+3kh9hXTUMNW+6Efc
 o2HQ==
X-Gm-Message-State: AOAM530b6D7SF00HEW6w/FwLfVQLPhRFhHqCqEDVYOVsyeGsoQ4uob0j
 yQWZu/+tQSKxTTPSupZPwjoaasCNnQj7sFKVnRihowCuKWA2hATKxGBvG5GUk/JJ/VOdxz/JhJN
 x+wB98oKW8wqjQUA=
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr10240799wmc.128.1632314120826; 
 Wed, 22 Sep 2021 05:35:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx77ApU1rhzAfbpV3pmbEsdjopvEBTjziQezdKKf3JHCzZHjoQWs6YlXzyGfZkWI1Imy1Ultg==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr10240775wmc.128.1632314120587; 
 Wed, 22 Sep 2021 05:35:20 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z133sm7609442wmc.45.2021.09.22.05.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:35:20 -0700 (PDT)
Message-ID: <1429cd8b-508f-2ec8-310a-65dd173d2a68@redhat.com>
Date: Wed, 22 Sep 2021 14:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
To: Greg Kurz <groug@kaod.org>
References: <20210921194347.52347-1-danielhb413@gmail.com>
 <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
 <20210922135250.31a2d4d4@bahia.huguette>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210922135250.31a2d4d4@bahia.huguette>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 13:52, Greg Kurz wrote:
> On Wed, 22 Sep 2021 13:17:32 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 9/21/21 21:43, Daniel Henrique Barboza wrote:
>>> This patch has a handful of modifications for the recent added
>>> FORM2 support:
>>>
>>> - there is no particular reason for both 'lookup_index_table' and
>>> 'distance_table' to be allocated in the heap, since their sizes are
>>> known right at the start of the function. Use static allocation in
>>> them to spare a couple of g_new0() calls;
>>>
>>> - to not allocate more than the necessary size in 'distance_table'. At
>>> this moment the array is oversized due to allocating uint32_t for all
>>> elements, when most of them fits in an uint8_t;
>>>
>>> - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
>>> distance value.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>    hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
>>>    1 file changed, 19 insertions(+), 16 deletions(-)

>>>    /*
>>>     * Retrieves max_dist_ref_points of the current NUMA affinity.
>>>     */
>>> @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>        MachineState *ms = MACHINE(spapr);
>>>        NodeInfo *numa_info = ms->numa_state->nodes;
>>>        int nb_numa_nodes = ms->numa_state->num_nodes;
>>> +    /* Lookup index table has an extra uint32_t with its length */
>>> +    uint32_t lookup_index_table[nb_numa_nodes + 1];
>>>        int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
>>> -    g_autofree uint32_t *lookup_index_table = NULL;
>>> -    g_autofree uint32_t *distance_table = NULL;
>>> -    int src, dst, i, distance_table_size;
>>> -    uint8_t *node_distances;
>>
>> This should have be of ptrdiff_t type.
>>
> 
> Why ? I don't see pointer subtraction in the code.

Oops, you are right.


