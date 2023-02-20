Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBC969D3EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBaH-00009A-T2; Mon, 20 Feb 2023 14:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBaF-000076-9R
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:12:19 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBaC-0002Jc-Uv
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:12:18 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so2282346pjx.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MZg7kphB6NxsRthZ6vK9evXMxZLsSGwg+k3j4APHjT0=;
 b=R+XBqYaUWli01rGCPNMdLw098ee34GrNoBg61JNWgMe4J/Ncs/EhzX+hZ6QNzrrdkR
 g3Tx7bmyTvx/NrWJ3TmYalQDIC9ezaCGilIYep7xP7mJzeqlSDzPRwxc1DqD2X+5bLH7
 c8YSiYlNNvxzvIvV7Cv+/iAzX3QXQ0yVYN49LQPjzo7hcI1CxJSxdWAC7l4QVUPVSslG
 3W7OqGtLpJwS/dgWRqi0NbZbQQnUgTWY4wnxqQwEmjjzk0egyRX3ZWN1ne0UBR7hDAf3
 ujSokvA/ln5kzbHH6bNL43FhVzE540S42/XPaKhSzeroJAKgHxrLryTcXIvahxg2fpmU
 nkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MZg7kphB6NxsRthZ6vK9evXMxZLsSGwg+k3j4APHjT0=;
 b=QvXFY4NB3MNm5583RJ8zEeuShHPkBFJdQ4L78bcCyFE90PPixdfOpo4VbQAcFsAfg5
 Gn4oEHMgi2100bY63v7FcKtWCNlb5gMoWpQxAElAZVXlDBrlKHUIImyz6KIQYG5fAyv3
 R6LnMd/L/DK2xrEdlhODYbgaMvR98hHtJPCHISjByvepPUsDdb405uu+LdhmEyRa8uNX
 HoLQbNRInGor6x9hr6Ebo0T6Ki0VLjI8jNZhNnRt8XhkFJ3keJdlZvMAFCrFkPOKvFZf
 J0hLqapLtenhT2S/WUSQUs5A8KBn37uyYV9wWeiTOVc1S/YiZwIRwY+fNBKc+gQLIIom
 mWFQ==
X-Gm-Message-State: AO0yUKU0X+mAhf/IJGNQGdE14418EPIdORErLNxbqcRBeWJQv3/LT+Gz
 x2IOIVnEOvX3W/Hj8czHnNwFuA==
X-Google-Smtp-Source: AK7set/szvGXYTxiMzOH+2PONHm4IqaenyZjmFpb7uqIXJfjEoMHkvw9dUcOPpqGirvrt86Rceea7g==
X-Received: by 2002:a17:902:e5d0:b0:19a:80e6:2a21 with SMTP id
 u16-20020a170902e5d000b0019a80e62a21mr5928880plf.33.1676920335406; 
 Mon, 20 Feb 2023 11:12:15 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902b60c00b0019472226769sm1702681pls.251.2023.02.20.11.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:12:14 -0800 (PST)
Message-ID: <9a05a5f1-5c44-1bc8-4600-07a9380abdf3@linaro.org>
Date: Mon, 20 Feb 2023 09:12:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] hw/usb/hcd-xhci-nec: Declare QOM macros for NEC_XHCI
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> NEC_XHCI is a QOM object type. Declare its macros /
> typedefs using OBJECT_DECLARE_SIMPLE_TYPE().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/hcd-xhci-nec.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

