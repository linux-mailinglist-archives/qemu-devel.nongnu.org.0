Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A86ED2AA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:40:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqzDs-00067T-0B; Mon, 24 Apr 2023 12:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqzDq-000670-7H
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqzDo-0007i6-Gq
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682354363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIrPqDKNckrm9rRNnpAer5v7LLkXQnVJgY+hTsr4RqM=;
 b=eIup6fWllD9/NmGoWOY7G/ceWGjtw1nrAtyvIrHq0N924hrQilHN05QoSTqVpwfqvosf/n
 AXictHUxqAL0S/Wh9Spteht2NJJI6GZ3pxZOyFngq62bYu+uMMNCjYbucnFJ47LdDyg1ft
 6MeGhoyvCQV6Nw+TJAFWtDIPjVnqUWU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-JKYb5-l2OJiJslU_xcuclg-1; Mon, 24 Apr 2023 12:39:19 -0400
X-MC-Unique: JKYb5-l2OJiJslU_xcuclg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2fcec825133so1448174f8f.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682354358; x=1684946358;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIrPqDKNckrm9rRNnpAer5v7LLkXQnVJgY+hTsr4RqM=;
 b=RxQPewdhFlUmDx4+BIi2r4U/W7AdXW8306MWC2hoN7NIc/0tOEMJYYrKfPg/K5RXrb
 g+S62Y6sKbtErDHEi5eoGF1Fswt/pN1sjQB6v6F+/a2zaRdsFP0PcivppVkBotDO1S8c
 +wP8gsA6qgIDurjrmsagjSf47oz9uD/PZp0MWBlwIDuc/1darm1g7CqqwOxHFx5fx70i
 Xs4OsONZ67TMIEAAN+yazBcO0lmmcnIJCOJ2pXUOTip3Gq4rgaFQ4iB2qODE+8gxnQH3
 1C0YqgjlSl6E2Kg9klEwhG6gZUNfNkqiQZkASgTVTROoc057lLjy1PFVuNlQI+H0JoUL
 rmxQ==
X-Gm-Message-State: AAQBX9f5Ll94ALROfK3YPcMbGmH3zvX9/i5KMao/J/A32vr55A9seWu4
 M5gc8qHIk2v6qG+Xq3rf4z/gWjHFFdt1KAnDwzjkthtjJA6IKQgAEZjB0V0A+iJUTrCxHwvmpQJ
 6lwlYmrExkRcvQEc=
X-Received: by 2002:a5d:6352:0:b0:2ff:f37:9d19 with SMTP id
 b18-20020a5d6352000000b002ff0f379d19mr9572365wrw.54.1682354358443; 
 Mon, 24 Apr 2023 09:39:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YXH7DIWwRGycRJvCmHFGVfzxrgy/6LgMG3ZIr4fK98kNB1S0AwlJiz13PAHC+a9cp34yvylQ==
X-Received: by 2002:a5d:6352:0:b0:2ff:f37:9d19 with SMTP id
 b18-20020a5d6352000000b002ff0f379d19mr9572351wrw.54.1682354358155; 
 Mon, 24 Apr 2023 09:39:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003f18372d540sm12443983wmc.14.2023.04.24.09.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:39:17 -0700 (PDT)
Message-ID: <755fb6e3-1f2c-00d0-139c-7275825fbe69@redhat.com>
Date: Mon, 24 Apr 2023 18:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230424152833.1334136-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424152833.1334136-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/04/2023 17.28, Peter Maydell wrote:
> The Allwinner PIC model uses set_bit() and clear_bit() to update the
> values in its irq_pending[] array when an interrupt arrives.  However
> it is using these functions wrongly: they work on an array of type
> 'long', and it is passing an array of type 'uint32_t'.  Because the
> code manually figures out the right array element, this works on
> little-endian hosts and on 32-bit big-endian hosts, where bits 0..31
> in a 'long' are in the same place as they are in a 'uint32_t'.
> However it breaks on 64-bit big-endian hosts.
> 
> Remove the use of set_bit() and clear_bit() in favour of using
> deposit32() on the array element.  This fixes a bug where on
> big-endian 64-bit hosts the guest kernel would hang early on in
> bootup.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/allwinner-a10-pic.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
> index 8cca1248073..4875e68ba6a 100644
> --- a/hw/intc/allwinner-a10-pic.c
> +++ b/hw/intc/allwinner-a10-pic.c
> @@ -49,12 +49,9 @@ static void aw_a10_pic_update(AwA10PICState *s)
>   static void aw_a10_pic_set_irq(void *opaque, int irq, int level)
>   {
>       AwA10PICState *s = opaque;
> +    uint32_t *pending_reg = &s->irq_pending[irq / 32];
>   
> -    if (level) {
> -        set_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
> -    } else {
> -        clear_bit(irq % 32, (void *)&s->irq_pending[irq / 32]);
> -    }
> +    *pending_reg = deposit32(*pending_reg, irq % 32, 1, level);
>       aw_a10_pic_update(s);
>   }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


