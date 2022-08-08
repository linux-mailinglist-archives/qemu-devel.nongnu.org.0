Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C458C4DE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 10:24:48 +0200 (CEST)
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKy3x-0007yW-Mb
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 04:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1E-0005xh-49
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1A-0004pW-HX
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 04:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659946903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=AdTVd0fy73uaQE04ggOI8TaMFe5vpWPp3kJklFUrHVMQs124Vzoh756x9GOVZDSjFvEmjF
 fFh6kohhmS5TcLGBl7GUlAHNBVPp+PIiiSCTgQBRfS+kNnTqku/CyuJZBK7Beg6tfW60V8
 DNawtH8+ren0GLsjl75CSy04bwZht5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-jTqP-56vOROJuTlt9dfB_w-1; Mon, 08 Aug 2022 04:21:41 -0400
X-MC-Unique: jTqP-56vOROJuTlt9dfB_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso758817wmq.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 01:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=SzdSmm+MVJerx1jFFE+oW7mnXMKS4hyS05+MCqlHN0VRzgmxeFFr4K9BSqfTWRfOi6
 rEaetxjUw5QslWoYFRfukwcpOKJ47GE0xkHn3T7dK0dhZgZVyj8zBzWeOFPINLk3jkoh
 KAZqxkKHaD+mp+GRtCXwqaZSGPXR7yJzx1glxRojgGDwfQJXybmt062qfv29P1nrwAvQ
 ahh62xqA1OOnM1BbOXS/CwpflryQhVIg8YybooPNAIdhlfekSHHOAoFUh8e2YzfmUHC6
 DKE7oVp9w40VLWDl+V2XpadJoJw4EWB252QndrpF5yYYOeFidNH/Odl9dyzcxipWnwoP
 jaDg==
X-Gm-Message-State: ACgBeo0S6IO04+AFt9AfpLEfHpsnxG06Suxkn/IDVHUSgUN2LiZOHN1t
 NMesA0XYr9z9+NvYBhNxGHdCOXbqmLw9S/QWkZIdbLXI0km+dYI+7qTpxNqDp9/Xs+s61qEdXfi
 MAG9jYw3MfofW0dw=
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620376wri.381.1659946899988; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LaCN9RQKmZJuGbC8qx8Y4UXa77lx2nOeRtJQY3wr4w9qMjLt6a9/L3tVzAFge3ZTAlVQxew==
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620361wri.381.1659946899700; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c240b00b003a331c6bffdsm13277511wmp.47.2022.08.08.01.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Message-ID: <3f913138-4746-c8ec-6b54-4bc2d0f49cdf@redhat.com>
Date: Mon, 8 Aug 2022 10:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220808080116.2184881-1-cyruscyliu@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220808080116.2184881-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/08/2022 10.01, Qiang Liu wrote:
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
> 
> This patch removes this abort and drops this operation.
> 
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>           qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>           break;
>       default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
> +        return;
>       }
>   
>       s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;

Reviewed-by: Thomas Huth <thuth@redhat.com>


