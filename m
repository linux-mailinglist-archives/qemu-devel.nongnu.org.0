Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B44FF09D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 09:34:54 +0200 (CEST)
Received: from localhost ([::1]:59524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neXWe-0007Wg-UY
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 03:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neXSy-0005yP-Ht
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:31:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neXSs-0001ln-Os
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:31:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id q3so650428wrj.7
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 00:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G//O09LDAaPVZyShGfZvhEKhtZt0J3Kv7RmalT+TGco=;
 b=omT0Zn/TMioG6hiVFit54j7Bn4XJLfTQlfXeruFeKAFFBQKGnkUthHKjlUDH/WPYnS
 oorzDmUA6XISQkufrSONMXv63bUPeWiZko9YF6xjbfmWCmxL5sCDw2hxTtTP/7lU1uOz
 T+FsnF1kffVOmFg9yF76KsOCZw/NJL1sMGMMwc4+IVZGgPx5M85rLnjkKhcmWeYrnJuP
 K1Jc8yK50ZnFZyCohUE871zAS7qx51y/a4rXXIHPTuSdcoDxfiMeHEXuJF5CvnoHNTnW
 GPYg7+/X0oLT1RZcJZj+inRvDTBUTgJJETouY9wlGWcF4baQDV7VYwwNf4q4McdFRtTA
 yHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G//O09LDAaPVZyShGfZvhEKhtZt0J3Kv7RmalT+TGco=;
 b=zQ314swXwmMymu4u/FQlD3d8Kw4YD7SYzm5Nw92O5+vN2qMOwPvoQnbxgkZQB7qrIF
 Myn2IxfoRdfysiO4gEwUzTXrnXv/cDa6qSj1pRDFP4Fevd32ci5Vov1xeLL/gIKga47/
 F3ZjfUyOaZNMSR2LdiB3i1q3p3LvT+pOvYYmQiLMoOX525baDpT/Dwtbbsg5z/HTfy31
 XG+6HsT9AfRxNEJ6yHN2oJgTR01YXD9EM5nMXyhXGQ9gPFoEqhDOyrHBlyjr5Iv/Msp1
 Fgih06xR9WTwrCO713H2fYUvp/QpwMhTwvmDJ7UNSQzTcw0JKGJFaKHh7zP/5XacOCZ9
 Zukg==
X-Gm-Message-State: AOAM5328eZWCrs9KanRcr1onyRxc9ZK4EXGclP6RtGGmGeQuC0TkjBiH
 nwPGny375vedtc7kNztMkZw=
X-Google-Smtp-Source: ABdhPJwRS1aWYQetZ7G46HSSevFS26TnP6FUcIWLHPQVfcT/YgmsDj/DOwJxS5PxVQZVEwCWVWMO5A==
X-Received: by 2002:a05:6000:184d:b0:207:b013:e9 with SMTP id
 c13-20020a056000184d00b00207b01300e9mr4849826wri.496.1649835056390; 
 Wed, 13 Apr 2022 00:30:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm36671569wrc.6.2022.04.13.00.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 00:30:55 -0700 (PDT)
Message-ID: <1e43d88e-e17d-52d4-7b62-4bda34108f7f@redhat.com>
Date: Wed, 13 Apr 2022 09:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 0/8] nbd: actually make s->state thread-safe
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220412173216.308065-1-pbonzini@redhat.com>
 <70776c6a-a171-6005-4fb6-e489534ef3b4@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <70776c6a-a171-6005-4fb6-e489534ef3b4@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 20:26, Vladimir Sementsov-Ogievskiy wrote:
> 12.04.2022 20:32, Paolo Bonzini wrote:
>> The main point of this series is patch 6, which removes the dubious and
>> probably wrong use of atomics in block/nbd.c.  This in turn is enabled
>> mostly by the cleanups in patches 3-5.  Together, they introduce a
>> QemuMutex that synchronizes the NBD client coroutines, the 
>> reconnect_delay timer and nbd_cancel_in_flight() as well.
>>
>> The fixes happen to remove an incorrect use of qemu_co_queue_restart_all
>> and qemu_co_enter_next on the s->free_sema CoQueue, which was not guarded
>> by s->send_mutex.
>>
>> The rest is bugfixes, simplifying the code a bit, and extra 
>> documentation.
>>
>> Paolo Bonzini (8):
>>    nbd: actually implement reply_possible safeguard
>>    nbd: mark more coroutine_fns
>>    nbd: remove peppering of nbd_client_connected
>>    nbd: keep send_mutex/free_sema handling outside
>>      nbd_co_do_establish_connection
>>    nbd: use a QemuMutex to synchronize reconnection with coroutines
>>    nbd: move s->state under requests_lock
>>    nbd: take receive_mutex when reading requests[].receiving
>>    nbd: document what is protected by the CoMutexes
>>
>>   block/coroutines.h |   4 +-
>>   block/nbd.c        | 303 +++++++++++++++++++++++----------------------
>>   2 files changed, 157 insertions(+), 150 deletions(-)
>>
> 
> Hmm, no patches come to me except for cover-letter. Neither here: 
> https://patchew.org/QEMU/20220412173216.308065-1-pbonzini@redhat.com/

Network issue, I resent it a couple hours later (and forgot to Cc you, 
sorry about that).

Paolo


