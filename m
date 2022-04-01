Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF814EE98F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 10:11:39 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naCNf-0006lt-10
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 04:11:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1naCI5-0003Wx-V8
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1naCI4-00053d-9t
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 04:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648800350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRUZMDluE8yUK+Cyts5JUrk1BdXkE/eF+mJdccg1Z/U=;
 b=GbTXqep67gndZjc9/o5BcDQBwwXAj/7cPCZe0/nCw1DNCVQ5/7IbSIZPQwHplRzjrwiUa5
 vBzD3P18TX9TsZCMdGjj3unNF1rfnMDrhSm280Tik71y587dqnnyibYeKxwArdHyA9rz+7
 8GpTumpYIRxjMrmj1cDtI9achkAfxCI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-iaZuXy7TMjWEne_iat0-mQ-1; Fri, 01 Apr 2022 04:05:47 -0400
X-MC-Unique: iaZuXy7TMjWEne_iat0-mQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 ke13-20020a056214300d00b00443901b0386so1476128qvb.14
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 01:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRUZMDluE8yUK+Cyts5JUrk1BdXkE/eF+mJdccg1Z/U=;
 b=5ZEsfYLQ5Q9krDXB1P5YEFHDWgsN4nlcOHUOAPUGyXe9Y181X+uSLCCtIkbIGU+U7k
 Xc2xTtKH97ddH79fgXZ3fQGfD4qiWAIM1IFSBpJwkcM3k5ILqNOql/ka2DZjBAtxCPnf
 ucg2qBfQn9K8Y0gDUfEDrY8Z/mztY752RingzE+VeK3fw3zG0C5t0R8WbYIUMPAhrkXM
 exdhmjADWj9j7vJjfdVwTq6qfP1iHiVIDJRyjC/GGZjn2f/ZG/O69nR08D0NstNG/oXn
 wMm3eDbocCduhciM1V45I6JbtUXJuQ0+L6Ytq0Az7kwDSs9D4NlH2wgBAwmXEubBSyTN
 9V9w==
X-Gm-Message-State: AOAM531E6rD1jfw3KZ4+0xd03XlKcgMcrBZ3NP/1h0aNErNf6crYhx3x
 bwHKp4upLZRq/6mnbU4SsRQvRFqS275Mm00Dd7LlF000x+fdBD8jlYYkPxSDaVlDqZ9XN/y3orY
 8ApNHGnPOIWAhVUc=
X-Received: by 2002:a0c:c38d:0:b0:42c:1a57:24d2 with SMTP id
 o13-20020a0cc38d000000b0042c1a5724d2mr38212087qvi.1.1648800347397; 
 Fri, 01 Apr 2022 01:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0GGHlb0LjWsRsoVE8FzVeMkTk81IoxrEBqdV3llgMxs2Lb139rsGQ6C4y0/zWsQM8xQM4gw==
X-Received: by 2002:a0c:c38d:0:b0:42c:1a57:24d2 with SMTP id
 o13-20020a0cc38d000000b0042c1a5724d2mr38212075qvi.1.1648800347146; 
 Fri, 01 Apr 2022 01:05:47 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a05620a16b500b0067b1205878esm890477qkj.7.2022.04.01.01.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 01:05:46 -0700 (PDT)
Message-ID: <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
Date: Fri, 1 Apr 2022 10:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 31/03/2022 um 18:40 schrieb Paolo Bonzini:
> On 3/31/22 15:51, Emanuele Giuseppe Esposito wrote:
>>
>> bdrv_graph_list_wrlock <-> start_exclusive
>> bdrv_graph_list_wrunlock <-> end_exclusive
>> bdrv_graph_list_rdlock <-> cpu_exec_start
>> bdrv_graph_list_rdunlock <-> cpu_exec_end
> 
> This wouldn't protect the list but the whole graph, i.e. the parents and
> children of all BDSes.  So the functions would be:
> 
>   bdrv_graph_wrlock <-> start_exclusive
>   bdrv_graph_wrunlock <-> end_exclusive
>   bdrv_graph_rdlock <-> cpu_exec_start
>   bdrv_graph_rdunlock <-> cpu_exec_end
> 
> 
> The list itself would be used internally to implement the write-side
> lock and unlock primitives, but it would not be protected by the above
> functions.  So there would be a couple additional functions:
> 
>   bdrv_graph_list_lock <-> cpu_list_lock
>   bdrv_graph_list_unlock <-> cpu_list_unlock

The list would be graph_bdrv_states, why do we need to protect it with a
lock? Currently it is protected by BQL, and theoretically only
bdrv_graph_wrlock iterates on it. And as we defined in the assertion
below, wrlock is always in the main loop too.

> 
>> +void bdrv_graph_list_rdlock(BlockDriverState *bs);
>> +void bdrv_graph_list_rdunlock(BlockDriverState *bs);
> 
> Apart from the naming change, these two would be coroutine_fn.
> 
>> +#define BS_GRAPH_READER(bs) /* in main loop OR bs->reading_graph */
>> +#define BS_GRAPH_WRITER(bs) /* in main loop AND bs->bs_graph_pending_op
> 
> bs_graph_pending_op is not part of bs->, it is a global variable
> (corresponding to pending_cpus in cpus-common.c).  I would call it
> bs_graph_pending_reader since you have "has_writer" below.

Hmm maybe it is better to go with has_waiter and pending_op. This is
because as "pending" we always have 1 write and zero or more reads.

Rest makes sense.

Emanuele
> 
> Also, this second #define does not need an argument, and is really the
> same as assert_bdrv_graph_writable(bs).  So perhaps you can rename the
> first one to assert_bdrv_graph_readable(bs).
> 
>>
>> +    /*
>> +     * If true, the main loop is modifying the graph.
>> +     * bs cannot read the graph.
>> +     * Protected by bs_graph_list_lock.
>> +     */
>> +    bool has_writer;
> 
> Note that it's "has_waiter" in cpus-common.c. :)  has_writer is fine too.
> 
> Paolo
> 


