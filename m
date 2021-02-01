Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6230A338
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 09:22:58 +0100 (CET)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6UU5-0005Wv-Rk
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 03:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6USx-0004qm-Sg
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6USr-0007wJ-VC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 03:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612167700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q13utacNQXPL4O0xXXNBhiLTgIBbn+GkWsKsD7HIo4c=;
 b=NddrDmH5eb3IMfJnty3J0vqitijOWOL2KkAjppmQv/Vz4T5v+8xtC12g4IgBlBwt0j9ovZ
 FSnRVG3WQ0gePp7NRUzadSYqh3bAwF0T6++/Was1o+JKNiZB2XA1FTfEDOzQE9poptaC2f
 BJA6pCZMoS0ojBTZhfolsOuqrqo1Dlc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-2jZSiCIQNqCXu3WhQTktxQ-1; Mon, 01 Feb 2021 03:21:36 -0500
X-MC-Unique: 2jZSiCIQNqCXu3WhQTktxQ-1
Received: by mail-wr1-f70.google.com with SMTP id c1so9998767wrx.2
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 00:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q13utacNQXPL4O0xXXNBhiLTgIBbn+GkWsKsD7HIo4c=;
 b=TSuPMu5kIPGLiHo7Rm5rGm6QDTYWNTDfF5TENAlSxAgWLrDrhtM/Y+cYhqZbJr2N0d
 e7d/pLBt4hxuY3L6vWKqefu3cO5XSxJYB4n23pi8PQBxFXwfp2XjEOC1StZEH/cwds3x
 YI2/NIQDaZfAFhCFvLxb8C5kDGSo6QDhvFxkgE4FqamPDeDF1GdreS4a30iRsC5Sq7RV
 w3R+khzGawulDSXjVPfadBKL/WWBwjQnPOz3a7+COC8cGmVxBdr7/nz7iZIFXgqEQbPz
 p+wWcg0ge6d/Jg/RIJ3BlMO3XaIZYwSj0FHO2nbACbl4EwWpbGdFzCTy635Qslt7qOjb
 y1iw==
X-Gm-Message-State: AOAM531XZayaLFbvpZWRZy8h31ZOvKAFI9e04Irb7bRwkrZ5s3ZEDkMi
 HPQYhJ8W5zMiDh3a6WD7TAurfhL+EcbvNvJEh9xm2XHCfJeb84T11G9iTSB/QdNAWtJnRjs1HWs
 ZOVwvB+hq2tJIaeI=
X-Received: by 2002:adf:fc88:: with SMTP id g8mr16243662wrr.259.1612167695571; 
 Mon, 01 Feb 2021 00:21:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQu7L76ybBHO3ct3rErE5SDP9hrYBJnue1eMvxiAahrfKMtGHpNRc9BlsQuZw+BxxrYiXbiw==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr16243646wrr.259.1612167695401; 
 Mon, 01 Feb 2021 00:21:35 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u14sm19799949wmq.45.2021.02.01.00.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 00:21:34 -0800 (PST)
Subject: Re: [PATCH v2] replay: fix replay of the interrupts
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161216312794.2030770.1709657858900983160.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <46d704c6-0724-b562-4279-23684d8ad7f8@redhat.com>
Date: Mon, 1 Feb 2021 09:21:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161216312794.2030770.1709657858900983160.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.079, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, cfontana@suse.de, richard.henderson@linaro.org,
 f4bug@amsat.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/02/21 08:05, Pavel Dovgalyuk wrote:
> Sometimes interrupt event comes at the same time with
> the virtual timers. In this case replay tries to proceed
> the timers, because deadline for them is zero.
> This patch allows processing interrupts and exceptions
> by entering the vCPU execution loop, when deadline is zero,
> but checkpoint associated with virtual timers is not ready
> to be replayed.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> 
> ---
> v2:
>   - changed replay mode check condition
> ---
>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index 9f45432275..8ed485db01 100644
> --- a/accel/tcg/tcg-cpus-icount.c
> +++ b/accel/tcg/tcg-cpus-icount.c
> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
>       int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>                                                     QEMU_TIMER_ATTR_ALL);
>   
> -    if (deadline == 0) {
> +    /*
> +     * Instructions, interrupts, and exceptions are processed in cpu-exec.
> +     * Don't interrupt cpu thread, when these events are waiting
> +     * (i.e., there is no checkpoint)
> +     */
> +    if (deadline == 0
> +        && (replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint())) {
>           icount_notify_aio_contexts();
>       }
>   }
> 

Queued, thnks.

Paolo


