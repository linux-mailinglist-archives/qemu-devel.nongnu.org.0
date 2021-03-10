Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA82333A84
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:46:39 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwMQ-00024J-Up
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJw4G-0000ko-Ca
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJw4E-0007a9-2g
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615372069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sZVLAh3BFFzcld+blEspBApKbK4CdFhuHrYJ5ShPRI0=;
 b=dBP+y3ndzKwTIVY1UgVzfbNslaAkvlkT4A2FrkHwv5z3anuw+tNVp2t/mtL3wybp0CfGiH
 VnXE6gRSkjWIJxA0VoidAAgof8QmN/zaZfcqxxiacZU+Ao7GbEHe6uCN4aGyw+GfnSxPTu
 N8eX/Omju/N17f7MqQmRGvYhFsuNHE8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-eKqGvTr1OrirVoPknMIsgA-1; Wed, 10 Mar 2021 05:27:47 -0500
X-MC-Unique: eKqGvTr1OrirVoPknMIsgA-1
Received: by mail-wm1-f69.google.com with SMTP id c7so2459750wml.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sZVLAh3BFFzcld+blEspBApKbK4CdFhuHrYJ5ShPRI0=;
 b=m5zjHwOx2XAWQ43waN7Zz1rgQMKUbQzlElKl5Hy6gKD4Mt30UBroMvGA0LfjbZxiJ+
 qcRdsmlP3AKBXu+aT1sUeQWE+LmMXME0LVqCj4wTBhOQqskqrW2XacUMAZKmOV6wZ1FC
 kkuuL4YlpCrkFlQ5ok2aMXXJTsHYfekaZGOMy1j85U7+9Rm1QunBrlWTC5OIgfeeqOlA
 85yopCVfyFmR6ucUrgJj/NAxkG/ecrWT8cePZYeQKRehD/Hxhw//JU48LymH/VWa569J
 XqDnE0g8OjmasEjSZKy7xGPgtLmoWYPBaRw0xUAhBaXRU3y08FT4GxqPV2TuHHcRfGBN
 53sA==
X-Gm-Message-State: AOAM533TM3JovuPn92aml9Hrjn/s1nMQVn6+wlkRTCkMpUEgMCZxfG8t
 9abk61uzGA9tFXyb7LEct0TrpG27OtgpEHjRgINjq9zZ7gaUGwz8GF55GWoUxUULdYiatpUGqSL
 rkf2fZzfHCy3g4f8=
X-Received: by 2002:a05:6000:23c:: with SMTP id
 l28mr2826735wrz.251.1615372066559; 
 Wed, 10 Mar 2021 02:27:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYHMQ6qc+vxhhuV5882sAF22w7yD5Q6/59JJr+W8i2v/FnI8lsdIkMZNv7PZo+tUFcumsHRA==
X-Received: by 2002:a05:6000:23c:: with SMTP id
 l28mr2826723wrz.251.1615372066406; 
 Wed, 10 Mar 2021 02:27:46 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v7sm8668373wme.47.2021.03.10.02.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 02:27:45 -0800 (PST)
Subject: Re: [PATCH] hw/i8254: fix vmstate load
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c69851d-1582-f3ab-1ee5-c5883bf2d370@redhat.com>
Date: Wed, 10 Mar 2021 11:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161537170060.6654.9430112746749476215.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 11:21, Pavel Dovgalyuk wrote:
> QEMU timer of channel 0 in i8254 is used to raise irq
> at the specified moment of time. This irq can be disabled
> with irq_disabled flag. But when vmstate of the pit is
> loaded, timer may be rearmed despite the disabled interrupts.
> This patch adds irq_disabled flag check to fix that.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/timer/i8254.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> index c01ee2c72a..c8388ea432 100644
> --- a/hw/timer/i8254.c
> +++ b/hw/timer/i8254.c
> @@ -324,7 +324,7 @@ static void pit_post_load(PITCommonState *s)
>   {
>       PITChannelState *sc = &s->channels[0];
>   
> -    if (sc->next_transition_time != -1) {
> +    if (sc->next_transition_time != -1 && !sc->irq_disabled) {
>           timer_mod(sc->irq_timer, sc->next_transition_time);
>       } else {
>           timer_del(sc->irq_timer);
> 

Queued, thanks.

Paolo


