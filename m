Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FD3DA383
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:57:16 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95b9-0001KC-Bf
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m95TG-0007SY-US
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m95TF-0000AR-8O
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627562944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yC4/zBDY8QMNvM8ZxjVJNwEtxk0cvUbhU5dWR+Ub3pc=;
 b=d5d1aRa9qPErh4f4AgEGESsczrKa3B9rbwoF7HQjv0yNSN7QMmwXqVGKim+n12AKEA2XIF
 fV+MiAtrNPM0jm5MFDx1ZSpHetKwtMu2mC9n1f7S7OU7EjP1Cy92nsG0BIIlEA28NLSAx6
 pN2M6hbPPepWcgEi/JgftH/gjyvbMIM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-x3YfryKqMKWS3k3euHfw_A-1; Thu, 29 Jul 2021 08:49:00 -0400
X-MC-Unique: x3YfryKqMKWS3k3euHfw_A-1
Received: by mail-wr1-f72.google.com with SMTP id
 d13-20020adfc3cd0000b02901531b0b7c89so2206933wrg.23
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yC4/zBDY8QMNvM8ZxjVJNwEtxk0cvUbhU5dWR+Ub3pc=;
 b=naFGF9RiW50a4cVp7WSev4BkedtX2ueNmm9krW53NjqLOwMb2yOKaO8E5ENKYaw2Zt
 om2iEuJjmTSVKZa+9v/nVS0TIt10RqtR3MSv+lhF7NCb7erbqMHcnuAd1p5868SBGx+E
 IYnCIbgfTi0Ch56GQiI13qmQ8GENNZrVTf8PBX7MBoQJqvOYC7xEatlZfm2wxl3BYHRF
 AW+DkSKr5OUvgjNFmUSRv7Hq5Rn3k2gbMFUNh2xVJtI3wGXRr0buujS9VhpX9VECBvNA
 oTTZM5p5/0JHBIOIl5JEtdkAM0AEDgFgJ5vC+5SRKgW6HlEKYdtv1CQSYN9GNapaJrME
 jzKQ==
X-Gm-Message-State: AOAM530t05vnUXvMrftwuoMGDjcrGsRPEF+3LgIUI3NHQOj5eA1eeR+l
 FOEM+gywOUCi513r6Sgl/jcR0XtAxFzQpDgf3Eigz3+Agy+FLA284dMrTxIDMKXA2YHaPnfAb4m
 0wQcS55CnVW7rTQk=
X-Received: by 2002:a5d:5905:: with SMTP id v5mr4671110wrd.205.1627562939658; 
 Thu, 29 Jul 2021 05:48:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi+Yu2T1LWXwsPIiLDIE657QqnNXgo3hLXh7gWuj6N5VIusYRJwF0LFvAaiYrMGor+wt90Ag==
X-Received: by 2002:a5d:5905:: with SMTP id v5mr4671090wrd.205.1627562939525; 
 Thu, 29 Jul 2021 05:48:59 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w13sm4182490wru.72.2021.07.29.05.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 05:48:59 -0700 (PDT)
Subject: Re: [PATCH v2] hw/net/can: sja1000 fix buff2frame_bas and
 buff2frame_pel when dlc is out of std CAN 8 bytes
To: Pavel Pisa <pisa@cmp.felk.cvut.cz>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Qiang Ning <ningqiang1@huawei.com>
References: <20210729123327.14650-1-pisa@cmp.felk.cvut.cz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5e493064-30d8-17b5-7760-bdf143ddf9a7@redhat.com>
Date: Thu, 29 Jul 2021 14:48:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729123327.14650-1-pisa@cmp.felk.cvut.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jan Charvat <charvj10@fel.cvut.cz>, Jin-Yang <jinyang.sia@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"hw/net/can: sja1000 fix buff2frame* when dlc is out of std CAN 8 bytes"

On 7/29/21 2:33 PM, Pavel Pisa wrote:
> Problem reported by openEuler fuzz-sig group.
> 
> The buff2frame_bas function (hw\net\can\can_sja1000.c)
> infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).

Cc: qemu-stable@nongnu.org

> Reported-by: Qiang Ning <ningqiang1@huawei.com>
> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/net/can/can_sja1000.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index 42d2f99dfb..34eea684ce 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -275,6 +275,10 @@ static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
>      }
>      frame->can_dlc = buff[0] & 0x0f;
>  
> +    if (frame->can_dlc > 8) {
> +        frame->can_dlc = 8;
> +    }
> +
>      if (buff[0] & 0x80) { /* Extended */
>          frame->can_id |= QEMU_CAN_EFF_FLAG;
>          frame->can_id |= buff[1] << 21; /* ID.28~ID.21 */
> @@ -311,6 +315,10 @@ static void buff2frame_bas(const uint8_t *buff, qemu_can_frame *frame)
>      }
>      frame->can_dlc = buff[1] & 0x0f;
>  
> +    if (frame->can_dlc > 8) {
> +        frame->can_dlc = 8;
> +    }
> +
>      for (i = 0; i < frame->can_dlc; i++) {
>          frame->data[i] = buff[2 + i];
>      }
> 


