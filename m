Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CE30178E
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:18:28 +0100 (CET)
Received: from localhost ([::1]:60190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NUR-0003G3-Tm
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NRk-0001gG-FE
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:15:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NRi-0000XH-6u
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGJBIJ1zWij4o7XL78ZfLNk00jovjl/JFPxW83rw358=;
 b=SAIgElnJVgQURFvCdmdGgGkrHl7aaglGA6iNb8ENiJnB6DPqDGSy+YmGFOJFUlFTAt3zc0
 PNo/RVTnWMhX2b4dH7XgqRaHx4TRVzPWieSNaigi4UogIkGLko5kOu8rpkZ9fgg61kN+Cz
 nfSeOpz+A7Z8k7kq4WPrdzh1Q1uKq4E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-0gdKGLtxNlu2wZvkpXn0kQ-1; Sat, 23 Jan 2021 13:15:35 -0500
X-MC-Unique: 0gdKGLtxNlu2wZvkpXn0kQ-1
Received: by mail-ed1-f70.google.com with SMTP id j12so4806423edq.10
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UGJBIJ1zWij4o7XL78ZfLNk00jovjl/JFPxW83rw358=;
 b=OEhCMtUkujDrRNiHYyxqj8KbaXqmdu0LFd3QEVziJpFUeGfxegPPfY94aN3y8+Se3O
 vWubzBVgpRRPZanF7lhwP76T2UPkjX1g46oK3X3LWsthi5EZs3nNsB3wrWqnsS7z/7xK
 dSshfQECSAaybU2aJRmyLQcRwyXuv/iCIsju229X+n71wUEzYUOE5elQ5AH9TTnxFJC7
 2na2EXMuA2CBniPBgnlygAPU//Z2G14uWCS+2HAjtgblyQcCUn4rpvvBp1yZMt7XDgyu
 fC0ryoD8i7SywSbMWSanejGD1CCy9OS0GsSuxnHX+stCJDRYB8vyYuymWAIiDQg2papB
 2rDA==
X-Gm-Message-State: AOAM531z299Bv03MQfgj4r1vwmTBl9/Irc7P1ct6FVOCrbseCvZYD9JX
 cU4uLycp1LjuVXblKAQ8CBm99FIlRqqYrF2qLAPTq4ado4MZ6yUf5kFqz7iFJ59NIPulKNhgc11
 b5lYAQFnsrqQKIyA=
X-Received: by 2002:aa7:d1d7:: with SMTP id g23mr62397edp.6.1611425734593;
 Sat, 23 Jan 2021 10:15:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1T7RMBkWA0Qf2wX7HDUDgT2k4SjnI+xIWG0VpsWiT6OJpFnXb4dI12BJyIIW6FPyWOX17CA==
X-Received: by 2002:aa7:d1d7:: with SMTP id g23mr62390edp.6.1611425734472;
 Sat, 23 Jan 2021 10:15:34 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i18sm7488335edr.2.2021.01.23.10.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:15:33 -0800 (PST)
Subject: Re: [PATCH] replay: fix replay of the interrupts
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
Date: Sat, 23 Jan 2021 19:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 13:39, Pavel Dovgalyuk wrote:
> Sometimes interrupt event comes at the same time with
> the virtual timers. In this case replay tries to proceed
> the timers, because deadline for them is zero.
> This patch allows processing interrupts and exceptions
> by entering the vCPU execution loop, when deadline is zero,
> but checkpoint associated with virtual timers is not ready
> to be replayed.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index 9f45432275..a6d2bb8a88 100644
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
> +        && (replay_mode == REPLAY_MODE_RECORD || replay_has_checkpoint())) {

Should this be replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint()?

Paolo

>           icount_notify_aio_contexts();
>       }
>   }
> 


