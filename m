Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1264A4935
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:21:57 +0100 (CET)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXZ6-0001ls-9t
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:21:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEWvO-0004dq-V8
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:40:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nEWvL-0003zM-5T
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643636450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ga6DQfImEtCF+TEPCur4uVJvCNwAOacsWYGeQn0KcK4=;
 b=JpHG6eb5qbWqio7UE0su3v0/oEaT6mpbRBmWRN+IT+p1cjsebvN5oLZCiF68yvU/3BHeNG
 DhRf3kH1Wf+C5qGOGpd02INus5n4eQK0uYlxl1zKgRDtsBjP0kHkFTCxwHptMJ6ETKelzO
 HSn0Kc2J7mb6slH8ocbnbO9oEHvkDoU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-PC13XTGhOLGiEGEXCpAtGA-1; Mon, 31 Jan 2022 08:40:47 -0500
X-MC-Unique: PC13XTGhOLGiEGEXCpAtGA-1
Received: by mail-qv1-f70.google.com with SMTP id
 iw14-20020a0562140f2e00b004204be8b6baso12719201qvb.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ga6DQfImEtCF+TEPCur4uVJvCNwAOacsWYGeQn0KcK4=;
 b=4LiTpHVxmtkVEs6ACowFeFDLj/yZqn2TwFSRHBSrThY61lLxAmUZ9AnGHZf3WFft96
 7lZ0T135OA62Xz1xjQzZhg3juEXwoBiRADn7sIGfoaXoGubgQaCL0rhLuD63q9lXeh3t
 lwbQaSsAxMRQf/TVv9W2xbefBAZslRw/+qvw1WFT4y6O7iBuFawP2eUgdht92jN6wFAb
 iIP+VxTf1TK6i3UoO6mja/gXa6F585uGNqubJl1f3wOei5gF3Wlvg5+UX5xZL7ucibkq
 buBGmbyz6va3tJsqpln1NSw3MiIenabXS8ZIzWoMOIM/IPgwkFPZM5PanbCUXqJPWXaJ
 9hzA==
X-Gm-Message-State: AOAM530wtx7FLr1Q0r+D/KHg3fO78c1U+5GOmUOu8ToAtWWo8ICBbnKl
 0s0iyVIVopv5eh75if3e0iOuB/wqqORfqjx+okrElNh9HGU8rx7nbkdKxM/jCBngyT8nmPJHn7T
 i5WbavPJ7U4/OzRk=
X-Received: by 2002:a05:6214:c89:: with SMTP id
 r9mr9932441qvr.77.1643636446717; 
 Mon, 31 Jan 2022 05:40:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPhhw8i8sGPpGtQ2251+5kS1H21ujHy/nclSkQgTZa2vh0rG9ninDvJS/YzA93QobaY7IRVQ==
X-Received: by 2002:a05:6214:c89:: with SMTP id
 r9mr9932419qvr.77.1643636446481; 
 Mon, 31 Jan 2022 05:40:46 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id j3sm6560204qti.30.2022.01.31.05.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 05:40:46 -0800 (PST)
Message-ID: <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
Date: Mon, 31 Jan 2022 14:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com> <YfJ7pbLDuwP2hgnw@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YfJ7pbLDuwP2hgnw@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2022 12:01, Kevin Wolf wrote:
>> +/* Common functions that are neither I/O nor Global State */
>> +
>> +int bdrv_parse_aio(const char *mode, int *flags);
> Makes sense to me to have this here, it is just a helper function that
> parses stuff and doesn't touch any state. However, what is different
> about the following?
> 
> int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
> int bdrv_parse_discard_flags(const char *mode, int *flags);
> 
> Despite being simple helpers, you kept them as global state.
> 

I guess those two are only called by GS functions, while tihs one is
not. Anyways, you are right, I will move them to block-common.h

[...]

>>> +/* disk I/O throttling */
>> Let's remove this comment (maybe in a separate preparational patch), it
>> doesn't make any sense at all any more. It was added in commit
>> 0563e191516 to describe bdrv_io_limits_enable()/disable(), which were
>> removed in commit 97148076, but apparently I forgot to remove the
>> comment.
>> 

Done, sent as a separate patch "block.h: remove outdated comment"

[...]

>>> +void bdrv_init_with_whitelist(void);
>>> +bool bdrv_uses_whitelist(void);
>>> +int bdrv_is_whitelisted(BlockDriver *drv, bool read_only);
>> The whitelist is static and doesn't touch runtime state.

Ok I am moving all the three above in block-common.h

[...]

>>> +/* async block I/O */
>>> +void bdrv_aio_cancel(BlockAIOCB *acb);
>>> +void bdrv_invalidate_cache_all(Error **errp);
>>> +
>>> +int bdrv_inactivate_all(void);
>> The grouping is odd here. The comment refers only to bdrv_aio_cancel(),
>> while bdrv_invalidate_cache_all()/bdrv_inactivate_all() are a logically
>> related function pair.
>> 
>> Also odd: Why keep bdrv_aio_cancel() as global state, but make
>> bdrv_aio_cancel_async() an I/O function? (The latter is required, of
>> course, because virtio-scsi can call it in I/O threads.)
>> 
>> bdrv_aio_cancel() calls aio_poll(). I think this means that it actually
>> must run in the AioContext that is polled, which may or may not be the
>> main thread. Before this series, we assert running in the main thread
>> only in one if branch.

ok moving the comment + bdrv_aio_cancel in block-io.h

[...]

>>> +    BlockDriverState *bs_ = (bs);                          \
>>> +    AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
>>> +                   cond); })
>> Hmm... AIO_WAIT_WHILE() is explicitly documented to be called from I/O
>> threads. But it has to be a specific I/O thread, the home thread of the
>> AioContext of bs.
>> 
>> So it really fits neither the description for global state (it works
>> outside the main thread) nor for I/O functions (it doesn't work in any
>> arbitrary thread).

So I would say BDRV_POLL_WHILE can go in block-common? what you wrote
above is the exact definition of common functions.

[...]

>>> +
>>> +/**
>>> + * bdrv_drained_begin:
>>> + *
>>> + * Begin a quiesced section for exclusive access to the BDS, by disabling
>>> + * external request sources including NBD server, block jobs, and device model.
>>> + *
>>> + * This function can be recursive.
>>> + */
>>> +void bdrv_drained_begin(BlockDriverState *bs);
>> I don't see how the whole family of drain functions can work in any
>> arbitrary thread. They call BDRV_POLL_WHILE(), the rules for which are
>> that it has to be either in the main thread or in the AioContext of bs
>> (which currently ensures that all block nodes and their users are in the
>> same AioContext).
>> 
>> Cross-AioContext BDRV_POLL_WHILE() can cause deadlocks, as documented in
>> AIO_WAIT_WHILE().
>> 
>> Actually, the same is true for all other BDRV_POLL_WHILE() callers, too.
>> For example, every function generated by block-coroutine-wrapper.py can
>> only be thread-safe when called in coroutine context, otherwise it has
>> to be called from the node's AioContext.
>> 

Maybe not in any arbitrary thread, but an iothread can call these
function in any case. Therefore it is not a GS function for sure, so I
would leave it as I/O.

I guess you can also see I/O more as "all the ones that are not GS".


Rest of comments that I did not answer: I agree.

Emanuele


