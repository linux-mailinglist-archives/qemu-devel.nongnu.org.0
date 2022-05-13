Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96822526736
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:37:47 +0200 (CEST)
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYIU-0000NT-G1
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npYGH-0006Ne-Bg
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:35:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npYGF-0000nu-HY
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:35:28 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so8259884pjm.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bHEmXiJiqdAGZZVZ2hHK0iOjejmwpHkYCeeb9zHaO3U=;
 b=paH0espMxFTw9tnq8MOIgtmz6u0egCrvdBqkygU42RFaSuT6dlxS9wbQFCLMHZR9yA
 fac7CHmjQEf1H/LAoYibs0XDuX1QAbpFsxDMiRlfAJMGUosqvrKzl2MAwLuAaeJcChV3
 QymxBlOzn13YDj6+qXZvWAP8xXxWKa0SLzv7GLy3Rpri88lyL/VvPzoQHYBAXcIFhKrc
 r8IzD/G3YdYWAxdOgsoEtXfErMEPtdq5d6TlH6CP6+YMzH6D3uPfa9zzlvz9ActEP/hY
 0fgt3+jqISnxiz4bt2s9gwLggBx4qUexE+hBK/vld4lJ4XxjZhDrdca11ZfTrkRzbiAF
 DU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bHEmXiJiqdAGZZVZ2hHK0iOjejmwpHkYCeeb9zHaO3U=;
 b=2A/7MYPiYQRfUEb72ftxgqWrtjxad2atXPO2XzJRcOamgue4NV4tX+Y4ahVFhP6Ezc
 5J2F3JXHhcIRnvf+J/wN9SkrE4V90RmB5ADflTR+FE7Yp7FWuv7uyliWI+7mg4/jca3y
 5y0Dmn8HreoxHQmX7oDRT1/0PxzH8yGNkqbq7hNku6U4zRPBBkfq4BFKOHtdPRx9lHzv
 mJpZKKe2+iZkLSutEySuDmHYZxL4lQU8XGrc5KeIXylIMfbKPYmLZOfr5YziWNeNy4kL
 Eijta5AQGdsqZvS86B3RS1GeElynEjOkjUm8Ueokf9COJlnu8ICOTF9TtOn1QXmHBuGK
 Wp9g==
X-Gm-Message-State: AOAM530NSON9Gj4JF+uMfKrGADgssTcP3bzfcqmHVCksxWECfK5LqexJ
 xc+YoVuG+dSCrCby59HnQT0uNA==
X-Google-Smtp-Source: ABdhPJy9FxjoU8Iy+q5MSnLI8PnE8W3fBidcFUmvvYhYwnjoTmA3GzJs8J2VngaIJZKOzLFoSiVnRg==
X-Received: by 2002:a17:90a:348d:b0:1dd:1779:412f with SMTP id
 p13-20020a17090a348d00b001dd1779412fmr16746380pjb.18.1652459725779; 
 Fri, 13 May 2022 09:35:25 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 cp7-20020a170902e78700b001608bceb092sm2088214plb.124.2022.05.13.09.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 09:35:25 -0700 (PDT)
Message-ID: <9272259e-3641-207d-ef14-e4adf468b143@linaro.org>
Date: Fri, 13 May 2022 09:35:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] configure: remove another dead variable
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220513161109.1125222-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513161109.1125222-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/13/22 09:11, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index c8b5b99532..dda25f05bf 100755
> --- a/configure
> +++ b/configure
> @@ -1992,7 +1992,6 @@ fi
>   if test "$static" = "yes" ; then
>     echo "CONFIG_STATIC=y" >> $config_host_mak
>   fi
> -qemu_version=$(head $source_path/VERSION)
>   echo "SRC_PATH=$source_path" >> $config_host_mak
>   echo "TARGET_DIRS=$target_list" >> $config_host_mak
>   if test "$modules" = "yes"; then

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

