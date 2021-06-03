Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0139A5D3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:36:24 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqKV-0001au-6H
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopoR-0008I3-OI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lopoP-0000tU-Rt
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622736192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNQ9GO+r+Ifv3LX6eKFy4aT+m23gX9n/GFw7hfP81GQ=;
 b=VlNteJj0zMGXU693gXIpZSSB1Rr5jcssopXzFxFwY/n3ymmuK0DiL4BrV/+Svjgdr0h8GV
 Pfo5T7oO7wGHZGzLxTj3C1S5BN1Mtlfux3aOIUWQGmIk1GCY73DmHXRcvRfQOJUj2SdECS
 RMzzn0taRV5PveKVve/8jLt3pLZguNM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-M25fxI0bM6uXm0z4kcO3nw-1; Thu, 03 Jun 2021 12:03:11 -0400
X-MC-Unique: M25fxI0bM6uXm0z4kcO3nw-1
Received: by mail-ej1-f71.google.com with SMTP id
 mp38-20020a1709071b26b02903df8ccd76fbso2119935ejc.23
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QNQ9GO+r+Ifv3LX6eKFy4aT+m23gX9n/GFw7hfP81GQ=;
 b=T6QitcLPS7lRSlWtyEm301Jyyku14Xs57dm69cgh0yIQLa+sk+3U3/tyhSnfMzgQwZ
 OfNNEyT89aYIChu4T3v/Kie0zycwtuULFdFFsXHU861hqnRPHoOOexK4fUS0JnD4xUtC
 fbVka2kGCxnCKuh9yLgf4X/+GN/2KJS4k7jLme9DuyA14fxC6lKKEwZwo/EhP9Qi6xu9
 +Oju9fHEO/SJpwVGD7MLZW6GE+8mqwz+cg3FvTdoHTQPtUsUoS4UZdV60V7y/YN4rtv6
 d/A2XMqhiWOuktxSqC4dDvnHGp9KwV/EI5k7jQLVxiXBAML0gHlXzMVrylj8cESPkMzZ
 I34g==
X-Gm-Message-State: AOAM533eHBVztxGGAk3DKTI7gHtPO7X0Y0oT243jeFmj9Xs4XBroSXHi
 +9JydQMI9fULxZnWlkR6JVCO63yMMlv7m5XYnwpZjQSpyQoME15ohQLtAjZROgnToQosJVnd6vN
 lJsim85jKA5jOGnw=
X-Received: by 2002:a17:906:a110:: with SMTP id
 t16mr98198ejy.360.1622736190022; 
 Thu, 03 Jun 2021 09:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGtC1SxDC0xcQARkTTyiOCivd2on5zJV+rxpkOXOilHJsvVs1T/iEFSSALi7DCqdX9oy9x8Q==
X-Received: by 2002:a17:906:a110:: with SMTP id
 t16mr98178ejy.360.1622736189850; 
 Thu, 03 Jun 2021 09:03:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b22sm1971544eds.71.2021.06.03.09.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 09:03:09 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Fix decode of cr8
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210602035511.96834-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <de489310-d793-bd08-27ab-02932735d29e@redhat.com>
Date: Thu, 3 Jun 2021 18:03:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602035511.96834-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/21 05:55, Richard Henderson wrote:
> A recent cleanup did not recognize that there are two ways
> to encode cr8: one via the LOCK and the other via REX.
> 
> Fixes: 7eff2e7c
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/380
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 834186bcae..a7f5c0c8f2 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -8091,6 +8091,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           case 2:
>           case 3:
>           case 4:
> +        case 8:
>               break;
>           default:
>               goto unknown_op;
> 

Queued, thanks.

Paolo


