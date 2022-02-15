Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678474B7404
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:17:32 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1SF-0006ov-IH
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nK1P8-0004dU-SZ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nK1Ou-00010f-6g
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644945241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrpil3pYeHZxtf30Y3njtcJuX1P3LharoXZVDzUY/II=;
 b=SUlR4BWOm7/tukU9aLDFVysRy+Ca7C03/ggnRbObA0D+zHNOOiN19ypEEHFScljTsE+147
 Qbc3uh4FEuUsqAYDthWQmYMzPnkq/KU5tlKG3uGOvSLHupcSCZMc6tHxYesx+hXhV2wd7D
 tlAn38lc6ah0fb0GmjQDPikAqrzzXJM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-PMFGXTKvMGKhXS20XibBUA-1; Tue, 15 Feb 2022 12:13:59 -0500
X-MC-Unique: PMFGXTKvMGKhXS20XibBUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sa22-20020a1709076d1600b006ce78cacb85so2724213ejc.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lrpil3pYeHZxtf30Y3njtcJuX1P3LharoXZVDzUY/II=;
 b=jxu6A08LVr9C0mzLzwxGiqADhZylNPHyNzjq63skDF+8e5Gaf1JasA8zeJ19BWKPFh
 w2TiE7VRj4FwRl/UidRx7h3spagSnzEm6EEandmHFtrYd9uOTxYlt71JkYG9apOHefVW
 O4ORNzpPiM0OvcD42B36PmlXMydvf3z2et7mFilocGlBz6DFfR2ZJuO42ZokxMtJCtCR
 Ym6yKUyuhhbtYvdMNlgsi7r6q43hqtunM+MsMdcWPEjsnsfyU1UcPtygYe0nQI1EyHJ7
 FMTLpAq+P+G+TDrsc5ZP6PRWdDjUgfntNvzmvwxM02Q/MM3XkCRJPqusYR518jmZk8Ej
 Wprg==
X-Gm-Message-State: AOAM53233eZFEfSaC6CDmjk2JLkKQ0XPdDXcCjfLXA1g+R4J6azHQlXD
 16I2pE4ApFujOGKDAxozB1U8rOGEnp/Dfvef++KeEsm0Qt07DCeBpJM0R4Rc1JSVo8+XkP+UcmM
 NFuruo8xRud0Vj+M=
X-Received: by 2002:a05:6402:35cf:: with SMTP id
 z15mr5036534edc.13.1644945238307; 
 Tue, 15 Feb 2022 09:13:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEn9Zs/ek4BfUi3YKoksUp+fT1CbL4Q96ynsIc4AN4NpJcjwillYvcwoCrNJyUWSL7fUFyew==
X-Received: by 2002:a05:6402:35cf:: with SMTP id
 z15mr5036516edc.13.1644945238130; 
 Tue, 15 Feb 2022 09:13:58 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b20sm189615ede.23.2022.02.15.09.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 09:13:57 -0800 (PST)
Message-ID: <3462d5d7-3032-421f-f2d2-d6564e9927a4@redhat.com>
Date: Tue, 15 Feb 2022 18:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: qemu-block@nongnu.org
References: <20220120142259.120189-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220120142259.120189-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

(I can take it too, if you’d like, John, but you’re listed as the only 
maintainer for hw/ide, so...  Just say the word, though!)

On 20.01.22 15:22, Hanna Reitz wrote:
> When we still have an AIOCB registered for DMA operations, we try to
> settle the respective operation by draining the BlockBackend associated
> with the IDE device.
>
> However, this assumes that every DMA operation is associated with an
> increment of the BlockBackend’s in-flight counter (e.g. through some
> ongoing I/O operation), so that draining the BB until its in-flight
> counter reaches 0 will settle all DMA operations.  That is not the case:
> For TRIM, the guest can issue a zero-length operation that will not
> result in any I/O operation forwarded to the BlockBackend, and also not
> increment the in-flight counter in any other way.  In such a case,
> blk_drain() will be a no-op if no other operations are in flight.
>
> It is clear that if blk_drain() is a no-op, the value of
> s->bus->dma->aiocb will not change between checking it in the `if`
> condition and asserting that it is NULL after blk_drain().
>
> The particular problem is that ide_issue_trim() creates a BH
> (ide_trim_bh_cb()) to settle the TRIM request: iocb->common.cb() is
> ide_dma_cb(), which will either create a new request, or find the
> transfer to be done and call ide_set_inactive(), which clears
> s->bus->dma->aiocb.  Therefore, the blk_drain() must wait for
> ide_trim_bh_cb() to run, which currently it will not always do.
>
> To fix this issue, we increment the BlockBackend's in-flight counter
> when the TRIM operation begins (in ide_issue_trim(), when the
> ide_trim_bh_cb() BH is created) and decrement it when ide_trim_bh_cb()
> is done.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2029980
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v1:
> https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html
>
> v2:
> - Increment BB’s in-flight counter while the BH is active so that
>    blk_drain() will poll until the BH is done, as suggested by Paolo
>
> (No git-backport-diff, because this patch was basically completely
> rewritten, so it wouldn’t be worth it.)
> ---
>   hw/ide/core.c | 7 +++++++
>   1 file changed, 7 insertions(+)


