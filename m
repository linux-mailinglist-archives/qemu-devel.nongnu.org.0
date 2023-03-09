Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED536B23A5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paF1t-000359-JG; Thu, 09 Mar 2023 07:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paF1i-000333-3Q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paF1c-0001I0-Uc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 07:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678363536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsNqCfhSZmTDHR2bJ0zfyC3xjpYY7JHuBLcfhRADRR8=;
 b=TkKbj6U9JuaiZfqaAdjPgEnBU8pRcy6H8jtcJXGfDn8wj6RCjTNdqZ+u8nnDybSBeOTb5H
 r/JB4zsUx5XhXPncIm86yJMD4YaVARfYjgWMWUf4znKysfFAlSB+lgPW1TxXV2FztElsLd
 MGwb/r1/19DAPovwzt7u8717YQF/eng=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-SDv4k8DlMWSyjl514tV7dw-1; Thu, 09 Mar 2023 07:05:34 -0500
X-MC-Unique: SDv4k8DlMWSyjl514tV7dw-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee15-20020a056402290f00b004f059728d91so2624965edb.23
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 04:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678363533;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsNqCfhSZmTDHR2bJ0zfyC3xjpYY7JHuBLcfhRADRR8=;
 b=WY00LcWgL+pW7n24WcYJfbofnq1K3KETJ6Ofl180RSstxwA6CAjcmYFivSRZ2m+uEQ
 Owehyg6NBaxXUKOYuLNKe4UjBDEWKTi+gH0a8VwwBMuNR07UEIUaV/SMDf+gMFhzcgoN
 xMSMf/dnHG3sQ5A/+vqrswGvOdew82WY91vg9w1h3o1zYwmQnvSPCX9KLDc84gO8u5au
 CviamzC0VvtgwmtIxRs0cEZ9BOuYhM8z7z+TBH919Q9Z52N6XQzdM6e0a36YGu4vpw4z
 nHYCwa0aJTiT1Gp4b6dj/NbmOHs+o7+yAI9rdQ9/lyPuOFm45QwSy4Pb6pfUfw2JOkOM
 POpQ==
X-Gm-Message-State: AO0yUKXatyMeuNYz2Kxu31JlGSs66W6RNUSRQamM2tL0xaV03RvjKikA
 tbisIx4ulvkM46MQoCO00kvWRDj6cRpLBuC7PmnzhxmehzckSX/d7uEyLUKevkJXxRpLAoeeoy3
 t565aOS3bK7oiiH8=
X-Received: by 2002:a17:906:2887:b0:8b1:2eef:154c with SMTP id
 o7-20020a170906288700b008b12eef154cmr25370006ejd.0.1678363533569; 
 Thu, 09 Mar 2023 04:05:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/9gKm7jFtStbfuO15ncbgpuKbdSQjF/a9qn0cn4uMj6HL3GVlwqxKccQiLYriSjtctKkfCtA==
X-Received: by 2002:a17:906:2887:b0:8b1:2eef:154c with SMTP id
 o7-20020a170906288700b008b12eef154cmr25369987ejd.0.1678363533282; 
 Thu, 09 Mar 2023 04:05:33 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 x33-20020a50baa4000000b004af7191fe35sm9488599ede.22.2023.03.09.04.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 04:05:32 -0800 (PST)
Message-ID: <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
Date: Thu, 9 Mar 2023 13:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230309114430.33684-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 3/9/23 12:44, Hanna Czenczek wrote:
> +     *
> +     * Note that TRIM operations call blk_aio_pdiscard() multiple
> +     * times (and finally increment s->blk's in-flight counter while
> +     * ide_trim_bh_cb() is scheduled), so we have to loop blk_drain()
> +     * until the whole operation is done.
>        */
>       if (s->bus->dma->aiocb) {
>           trace_ide_cancel_dma_sync_remaining();
> -        blk_drain(s->blk);
> -        assert(s->bus->dma->aiocb == NULL);
> +        while (s->bus->dma->aiocb) {
> +            blk_drain(s->blk);
> +        }

I think having to do this is problematic, because the blk_drain should 
leave no pending operation.

Here it seems okay because you do it in a controlled situation, but the 
main thread can also issue blk_drain(), or worse bdrv_drained_begin(), 
and there would be pending I/O operations when it returns.

Unfortunately I don't have a solution (I'm not considering the idea of 
using disable_request_queuing and having even more atomics magic in 
block/block-backend.c), but I'll read the thread.

Paolo


