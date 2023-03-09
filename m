Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7C6B2611
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:00:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGnf-0003nS-Nq; Thu, 09 Mar 2023 08:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paGnd-0003nB-R7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:59:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paGnc-0000sD-03
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:59:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678370355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynWmACxz4x4cfinE6ArtHrBosu71xbBipALHdlr8/To=;
 b=FMDXSOHQwYooyfHwQNfFYLQSPdsbjq0/3gSyk7azEsTRYsI7HYpIDi8ozz7/bwymJOjbxk
 FZPdVod8zLbM+QU7hZV4Xwb9cQKOPVPxEnYtBM7TOHpcFobbgLx6fKzVrDayuPaBQa6W7Z
 i/dmnyYY3+bks0lyq5+7WNbdNrnBaNY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-qc4brOfgPJ24i9yRWPrOug-1; Thu, 09 Mar 2023 08:59:13 -0500
X-MC-Unique: qc4brOfgPJ24i9yRWPrOug-1
Received: by mail-ed1-f72.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso2997369edu.17
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678370352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ynWmACxz4x4cfinE6ArtHrBosu71xbBipALHdlr8/To=;
 b=Dv1acTz122XiDsPDIGkxc/gzPOa3oYnOMOwkNhK572ioNl9khl1H/rsFPNXlsPPAT7
 AKOcKCnM/LZ7P/ILKnuuVgT5vte4HinH8kNYlmSv3ATOKXpctaBbEkn1dViDacwxhs+3
 bg7f5XspT78FUpoxhrq9C2u/3giJ+KDQI/zXGzA1iS50sF9CB9Yd7ZiK+Yt7VBlURM1P
 T/TTQak0+3Hl3HE6SETDHKuT05i2GkwC9nd2uVpASt7NiVaOJ1XusPJo5riZsTqkCWrB
 Oj0wgV92fmT3rfHiRrpz8xv4d2v/qIFDaWW5mtR7g9bW9ATgEsKNE5VG+hL2G+6L6Smq
 7yaQ==
X-Gm-Message-State: AO0yUKXyk1gmkY4/hwlL6hRa6I8HXnvvrcsorSxHlNxS6iwuTCB6RDwb
 oi0NGLaI7ybGzm8e2Ta/q7AP8U4ti6BsnQf6+fk5e17HtqVM5KbuRPay2a/k1yhoEwBBkTgpEu7
 4ruvO+b/87HC3JsM=
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr25967262ejb.24.1678370352717; 
 Thu, 09 Mar 2023 05:59:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9FnrTAiKe5S6L415bMonOGob5dt+aQcDf6X0z6bQ1XuFXv62Ys/Sg6Ly7+887RB+s/5ZwcSQ==
X-Received: by 2002:a17:907:320a:b0:87a:ee05:f7b with SMTP id
 xg10-20020a170907320a00b0087aee050f7bmr25967239ejb.24.1678370352364; 
 Thu, 09 Mar 2023 05:59:12 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 dt9-20020a170906b78900b008dd76b67ae6sm8959286ejb.175.2023.03.09.05.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:59:11 -0800 (PST)
Message-ID: <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
Date: Thu, 9 Mar 2023 14:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/9/23 13:31, Hanna Czenczek wrote:
> On 09.03.23 13:08, Paolo Bonzini wrote:
>> On Thu, Mar 9, 2023 at 1:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> I think having to do this is problematic, because the blk_drain should
>>> leave no pending operation.
>>>
>>> Here it seems okay because you do it in a controlled situation, but the
>>> main thread can also issue blk_drain(), or worse bdrv_drained_begin(),
>>> and there would be pending I/O operations when it returns.
> 
> Not really.  We would stop in the middle of a trim that processes a list 
> of discard requests.  So I see it more like stopping in the middle of 
> anything that processes guest requests.  Once drain ends, we continue 
> processing them, and that’s not exactly pending I/O.
> 
> There is a pending object in s->bus->dma->aiocb on the IDE side, so 
> there is a pending DMA operation, but naïvely, I don’t see that as a 
> problem.

What about the bdrv_drain_all() when a VM stops, would the guest 
continue to access memory and disks after bdrv_drain() return?

Migration could also be a problem, because the partial TRIM would not be 
recorded in the s->bus->error_status field of IDEState (no surprise 
there, it's not an error).  Also, errors happening after bdrv_drain() 
might not be migrated correctly.

> Or the issue is generally that IDE uses dma_* functions, which might 
> cause I/O functions to be run from new BHs (I guess through 
> reschedule_dma()?).

Ah, you mean that you can have pending I/O operations while 
blk->in_flight is zero?  That would be a problem indeed.  We already 
have BlockDevOps for ide-cd and ide-hd, should we add a .drained_poll 
callback there?

>> Hmm, what about making blk_aio_prwv non-static and calling
>> bdrv_co_pdiscard directly from IDE?
> 
> You mean transforming ide_issue_trim_cb() into an iterative coroutine 
> (instead of being recursive and using AIO) and invoking it via 
> blk_aio_prwv()?
> 
> It doesn’t feel right to call a bdrv_* function directly from a user 
> external to the core block layer, so in this case I’d rather fall back 
> to Fiona’s idea of invoking all discards concurrently.

Yeah, honestly it doesn't feel very much right to me either.

Paolo


