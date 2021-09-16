Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03DE40DC65
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:07:38 +0200 (CEST)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQs38-00018Q-0a
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mQrzP-0006PL-HR
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:03:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mQrzI-0007kk-45
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631801018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJo4rPCZMUQ7R5OJmgSbCKiseeDSfAS9K141QEt3GV0=;
 b=NoPeq7BblGnF22BexWHzmBO3XTpCL4qjOLM7tQjj+zOwSbR/Gvfw4bhcsKXJ9vQWXuicpz
 xy7EYERslXkVlC2wOAq/YswtYksT4zJNucnzfDPzBekleu36xMGpXmpvPB5XlxzaeonLSz
 RGljmyWGUfapGQt5dvAfFblNuNmD4Mc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-LC_4sw4zNXO_ozRZIGvpUw-1; Thu, 16 Sep 2021 10:03:37 -0400
X-MC-Unique: LC_4sw4zNXO_ozRZIGvpUw-1
Received: by mail-ed1-f69.google.com with SMTP id
 e7-20020aa7d7c7000000b003d3e6df477cso5500227eds.20
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SJo4rPCZMUQ7R5OJmgSbCKiseeDSfAS9K141QEt3GV0=;
 b=gvXmMwi5q12iYblNZ3juLL7a+3yJetU8szh5KCDWs2aj8WXdrSIgSSMSy4gP+JSePP
 xqZ8a02uTAV+icNeZ5YvmpHevtVO33M56y+wOz3bCWqPZeNyaYceJ/8170/5mM+YkDew
 fQIvfPCpgfskxEINU9uUfG8VomNob9/ysN/uCzesHaGKpmmfiEyduMv6Kn3YWf/2+i2H
 M2n7wvRu1twic5XI+BzG1ebXdrEE9FrT8Qjl4WB2OC/U2q1muYUENnxEJnsPnOFutcdh
 Kx3tVm7/dPOFG6j29eBpa7asDDVLXeNW1DTHVBXci8sZ95xSfaY/7v++7CF5iF2JYWRU
 1dFg==
X-Gm-Message-State: AOAM53301OM6j2vjpAjCkN202NY0zaQKbhFgsKMO9yiMD87i/ReGojXj
 +HPZgXIipUO60mmO+IgTBvLUA8D22uFpw8d3TERipsJsXIGVE85GWFLXBx/HFhHdJ9N6BnVylcd
 eH2q5kiZlBPphec8ojCfbDoSHfbvaHem2iaIw1nEpT6TqOxXEIG9NkT0wICqzRJvyAAw=
X-Received: by 2002:a17:906:7053:: with SMTP id
 r19mr6319394ejj.476.1631801015482; 
 Thu, 16 Sep 2021 07:03:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+w5W4qCpEOLq8Sut6CTaj4tDXU3V5zHc7u2NkGPn6Ohv/zWqUOyiCyqYUx2HFdigF/kLW7w==
X-Received: by 2002:a17:906:7053:: with SMTP id
 r19mr6319338ejj.476.1631801015095; 
 Thu, 16 Sep 2021 07:03:35 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 bm26sm1258722ejb.16.2021.09.16.07.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 07:03:34 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] block layer: split block APIs in graph and I/O
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <YT9NuK84J2hvMXs2@stefanha-x1.localdomain>
 <916c8456-9433-42a0-df2d-3e62ced283fd@redhat.com>
 <YUIGlyfL+SleHCAc@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <7bf39273-3349-c378-25c4-6a72129bd3fd@redhat.com>
Date: Thu, 16 Sep 2021 16:03:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YUIGlyfL+SleHCAc@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/09/2021 16:43, Stefan Hajnoczi wrote:
> On Wed, Sep 15, 2021 at 02:11:41PM +0200, Paolo Bonzini wrote:
>> On 13/09/21 15:10, Stefan Hajnoczi wrote:
>>> On Wed, Sep 08, 2021 at 09:10:17AM -0400, Emanuele Giuseppe Esposito wrote:
>>>> Currently, block layer APIs like block-backend.h contain a mix of
>>>> functions that are either running in the main loop and under the
>>>> BQL, or are thread-safe functions and run in iothreads performing I/O.
>>>> The functions running under BQL also take care of modifying the
>>>> block graph, by using drain and/or aio_context_acquire/release.
>>>> This makes it very confusing to understand where each function
>>>> runs, and what assumptions it provided with regards to thread
>>>> safety.
>>>>
>>>> We call the functions running under BQL "graph API", and
>>>> distinguish them from the thread-safe "I/O API".
>>>
>>> Maybe "BQL" is clearer than "graph" because not all functions classified
>>> as "graph" need to traverse/modify the graph.
>>
>> Bikeshedding, I like it! :)
>>
>> ... on the other hand, qemu-storage-daemon does not have a BQL (see patch
>> 1); "graph API" functions run from the main (monitor) thread.
>>
>> The characteristic of the "graph API" is that they affect global state, so
>> another possibility could be "global state API".  But is there any global
>> state apart from the BlockDriverState graph and the associated
>> BlockBackends?
> 
> I would be happy with that name too.
> 

Sounds good to me too, thanks.
One more minor cosmetic thing: should I name the header 
block-backend-global-state.h or using block-backend-gs.h is 
straightforward enough?

Thank you,
Emanuele


