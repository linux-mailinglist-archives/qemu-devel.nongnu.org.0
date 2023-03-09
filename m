Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE86B2433
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFQt-0001C0-Pt; Thu, 09 Mar 2023 07:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paFQs-0001Bg-5A
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:31:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1paFQq-0007ig-HW
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678365099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRRa3m4Z3w5ncZQ61jrszTdZWIhCh0/K0XJCOKC6y8Q=;
 b=JYemWxxY2XiTyRHBbDQ66PinYnvqJRWcezwvQ+PCPIBZc9NdTv6ocVSGxsnMw9Ft30c9TF
 IDjGn2wTT8DltIohLdrvYagCEXDrUzY8x/6+/qYVfRuMsUXUpcvUlMsrG7JRpXH2Lu5Ne9
 J7Ae30bmiEIexD4d0eq8b0QBpAI6UxU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-CZJ6sD22NNCgoECuyjVomA-1; Thu, 09 Mar 2023 07:31:38 -0500
X-MC-Unique: CZJ6sD22NNCgoECuyjVomA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so730110wmr.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 04:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678365097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MRRa3m4Z3w5ncZQ61jrszTdZWIhCh0/K0XJCOKC6y8Q=;
 b=MeiA86/sDKlpiD1FbhWNG8MgZ7o4ALsSWZ1MYPfK0WuTwPhDa1IdQpHmmuG5i6u3tM
 ATM/SxBA6SoUfOrETITDrgennd5bKhjIp+80jPC8NFdvkoa9kzBrmmiO2KI+rTjWLkwv
 JJSFgQfw0N61AHsuVL38hD9JRkKsgYbAb+TMglD6VCZWMH+1FboRSfE+eAtWYb0pWron
 rzy6KlZZnQkTPNmXVnNi5BVDVH3OXT1CswG7VMz1tMwRWpeZTE5YyIvveqHcmmtM/ssI
 CklEd51jeCTuuI8999nRZY36qSK07t4O7Q8ylu1jVhRgxAl1BnTzWLoi3bjsRfNOY+qa
 jxWg==
X-Gm-Message-State: AO0yUKU2MAknAMfgZDCdG2XsGpCW1HnhRMlJRpsZszO2DubVXNm2qOz/
 8062Y4rbnz9LAiQh/C9hjPuGE/8YQteJZV2pyt1sNuVqr9di95ejy5Kj5m3E/uH8hfO1+SvixUY
 PTlP8pDpCzhcezFs=
X-Received: by 2002:adf:fa8d:0:b0:2ce:8223:59d3 with SMTP id
 h13-20020adffa8d000000b002ce822359d3mr4040978wrr.45.1678365097259; 
 Thu, 09 Mar 2023 04:31:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+ddzTVqIgoYDISRBeHSU04b9PwrEAOERey4/7nMRVB7kbewWxWmuri3e1hrS8DlzY9f/dq5w==
X-Received: by 2002:adf:fa8d:0:b0:2ce:8223:59d3 with SMTP id
 h13-20020adffa8d000000b002ce822359d3mr4040959wrr.45.1678365096903; 
 Thu, 09 Mar 2023 04:31:36 -0800 (PST)
Received: from ?IPV6:2003:cf:d729:7d22:58d:9cdf:192f:c786?
 (p200300cfd7297d22058d9cdf192fc786.dip0.t-ipconnect.de.
 [2003:cf:d729:7d22:58d:9cdf:192f:c786])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bca55000000b003dd1bd0b915sm2480725wml.22.2023.03.09.04.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 04:31:36 -0800 (PST)
Message-ID: <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
Date: Thu, 9 Mar 2023 13:31:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 09.03.23 13:08, Paolo Bonzini wrote:
> On Thu, Mar 9, 2023 at 1:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> I think having to do this is problematic, because the blk_drain should
>> leave no pending operation.
>>
>> Here it seems okay because you do it in a controlled situation, but the
>> main thread can also issue blk_drain(), or worse bdrv_drained_begin(),
>> and there would be pending I/O operations when it returns.

Not really.  We would stop in the middle of a trim that processes a list 
of discard requests.  So I see it more like stopping in the middle of 
anything that processes guest requests.  Once drain ends, we continue 
processing them, and that’s not exactly pending I/O.

There is a pending object in s->bus->dma->aiocb on the IDE side, so 
there is a pending DMA operation, but naïvely, I don’t see that as a 
problem.

>> Unfortunately I don't have a solution (I'm not considering the idea of
>> using disable_request_queuing and having even more atomics magic in
>> block/block-backend.c), but I'll read the thread.

I wouldn’t disable request queuing, because its introducing commit 
message (cf3129323f900ef5ddbccbe86e4fa801e88c566e) specifically says it 
fixes IDE.  I suppose the reason might actually be this problem here, in 
that before request queuing, it was possible that IDE would continue 
issuing discard requests even while drained, because processing the list 
didn’t stop.  Maybe.

Or the issue is generally that IDE uses dma_* functions, which might 
cause I/O functions to be run from new BHs (I guess through 
reschedule_dma()?).

> Hmm, what about making blk_aio_prwv non-static and calling
> bdrv_co_pdiscard directly from IDE?

You mean transforming ide_issue_trim_cb() into an iterative coroutine 
(instead of being recursive and using AIO) and invoking it via 
blk_aio_prwv()?

It doesn’t feel right to call a bdrv_* function directly from a user 
external to the core block layer, so in this case I’d rather fall back 
to Fiona’s idea of invoking all discards concurrently.

Hanna


