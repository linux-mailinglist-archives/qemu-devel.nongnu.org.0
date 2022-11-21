Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF606328AA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox96B-00032U-2T; Mon, 21 Nov 2022 10:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox961-0002tx-Ly
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox95z-0002m3-SH
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669045951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j31DVnbrCpnoidFHcAqj20hqlDD9vz23PkuFbB0doaA=;
 b=ON+J1xg8BLUshH5Oh7/jM+0a7Ug6LATky5P+o/Q62iX0VF2hVvIC7lACORPrAiKXMuaEHd
 9mq8wryOPAn/OaVdXk0KwYEbhlZnyoVX4zy+f9VcgHZ0Cmgpx86//6hqyVkuAjUV77ALrU
 naB9QXXS/FOVWfIBXwQsXhqevg1+7KU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-D115kfYSOI2jJdQUt6ZTkw-1; Mon, 21 Nov 2022 10:52:29 -0500
X-MC-Unique: D115kfYSOI2jJdQUt6ZTkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso6701566wmh.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j31DVnbrCpnoidFHcAqj20hqlDD9vz23PkuFbB0doaA=;
 b=S2Cd/dodRHIlUH9Jr0lXpSNPMNwrOxkFfy/Ksz9dAxzKjIw3c6xxxlgirhc5Gu2aOJ
 2jeFYxhoqWXrrLZe/SxQ5Nbf6rlMyw1LdRyYBREhnvmax3iJzCYcpWflOfbxA2s+LD7V
 MoC6vbZgvpS2cVtAQK27JF6m0TncNUo5Iulv5xjKvR7dfc1hBezf5/uaI0EwY+GJqnEY
 qClZpEdCKqBJB3mz6l9jRSsBcsb9tlhyMHLg0FSRwMevQ0bXZzU8y5KQSio1G/YVzqhY
 +fO/P3q1u4zpzndUtCDoeBz4T3Gwj1uS9vTs76vLny51p4bLe+8fSDdGS12E9n5hW7Sr
 ZzQw==
X-Gm-Message-State: ANoB5plTZTvafuQA3BAOxUnewcPDmk7ZUOyDW1Zsj+uimy7CFrAhoEpA
 y0n/Lq9hacKl7sUOiYm1VkzCztBR0EFLry/n+lOZ4y9LTj8hr/edP4kkMRzyVXRQpD3OuuKiBPH
 5TAV3M6jjdTzfFhM=
X-Received: by 2002:a05:6000:4082:b0:241:cf15:b6af with SMTP id
 da2-20020a056000408200b00241cf15b6afmr5060886wrb.282.1669045948621; 
 Mon, 21 Nov 2022 07:52:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4hh3ZhaOwiISjtJlpeDytcWSOa+ic2YrbahQdsO1f3t/4p6u2VxmzY4svHOL+ZCwL8Ir0gJw==
X-Received: by 2002:a05:6000:4082:b0:241:cf15:b6af with SMTP id
 da2-20020a056000408200b00241cf15b6afmr5060870wrb.282.1669045948384; 
 Mon, 21 Nov 2022 07:52:28 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfee08000000b0024194bba380sm11484142wrn.22.2022.11.21.07.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:52:27 -0800 (PST)
Message-ID: <6660171f-2d66-7985-d545-cac1f2ef1267@redhat.com>
Date: Mon, 21 Nov 2022 16:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 05/11] block-coroutine-wrapper.py: default to main loop
 aiocontext if function does not have a BlockDriverState parameter
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-6-eesposit@redhat.com> <Y3uZfAWotAr9IMGe@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y3uZfAWotAr9IMGe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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



Am 21/11/2022 um 16:30 schrieb Kevin Wolf:
> Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
>> Basically BdrvPollCo->bs is only used by bdrv_poll_co(), and the
>> functions that it uses are both using bdrv_get_aio_context, that
>> defaults to qemu_get_aio_context() if bs is NULL.
>>
>> Therefore pass NULL to BdrvPollCo to automatically generate a function
>> that create and runs a coroutine in the main loop.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> It happens to work, but it's kind of ugly to call bdrv_coroutine_enter()
> and BDRV_POLL_WHILE() with a NULL bs.
> 
> How hard would it be to generate code that doesn't use these functions,
> but directly aio_co_enter() and AIO_WAIT_WHILE() for wrappers that are
> not related to a BDS?
> 

At this point, I would get rid of s->poll_state.bs and instead use
s->poll_state.aio_context. Then call directly aio_co_enter and
AIO_WAIT_WHILE, as you suggested but just everywhere, without
differentiating the cases.

Then we would have something similar to what it is currently done with bs:

if t == 'BlockDriverState *':
            bs = 'bdrv_get_aio_context(bs)'
        elif t == 'BdrvChild *':
            bs = 'bdrv_get_aio_context(child->bs)'
        elif t == 'BlockBackend *':
            bs = 'bdrv_get_aio_context(blk_bs(blk))'
        else:
            bs = 'qemu_get_aio_context()'

I haven't tried it yet, but it should work.

Thank you,
Emanuele


