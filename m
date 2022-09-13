Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98CA5B6BAB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:33:10 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3E6-0002Ag-4f
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY39c-0006H8-JW
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:28:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY39a-0005kV-SY
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:28:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z14-20020a05600c0a0e00b003b486df42a3so4074026wmp.2
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dyPVRlNPO2NXqolyzLHXaWYEDyrtGj6/YK/zBOOY9iM=;
 b=CGD7UaaNTdyuRrBNhbuNUV2UPJFgUwRs0lkzMtVGd5XMLAAOKUo5ZTnJpD1FOtQCVF
 xZU3d+klQJ62zMbVj8ApH1pInZqPFV5NlKwIpF/qZDEuo7lDjAArKDjaZt3q71SORG5i
 PvMNBFsOufHubmJbTl6QRu6d5zajafKVYYwEWjAMIJlzdeZ7KkQUmdr9ZIkB1Qt8E4uo
 ExjFZ6XpUeDarfu+WIHFCwe7NfRO9sXndF3qBgW5jPraa1tb5gGcjZLv6SgaHiSD0luj
 30PStTy/cnAC3lLLhdt5QOqKqcct7gVog/dXMoX4MHG2TOIWa3WW2M93/3HXWfbZ+YqB
 2m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dyPVRlNPO2NXqolyzLHXaWYEDyrtGj6/YK/zBOOY9iM=;
 b=bItIaMopferw/9Bd1JQxbxxGHOHDGaMxRm0oD1Bqqpecv6zIFw6sB1SZQISsZ+Bw/V
 i27w6oa/SxVBmNiYBYsym77OuVUScpGyLll3hPL9GZGGtl16jwnW7oloD9neSfPJFYKo
 +hLo2KEOlMR4YvaP+Sv38DeNanjxcKeeuZ6iAV0EBhqQkuCSzH9QUjUb5UXMXjwm8ArX
 LTJncgbA59e0e61Ozb0yTWVoT66aL4LGi7TP7umr/TaBbxPvpGinYps02oMhl/7TqmsD
 MVB9jvUVawXC3+NNHXzF1WVdrGOSctGgVVi2JvLL0Ofnat0tEU1jfVZi5FwP7B+YYsPb
 VUDA==
X-Gm-Message-State: ACgBeo09D9ykqRa+I9Scwv7Xx2Gmtr4exUKX62+DIIWFz4HPPZ5o6WO1
 B8NJdIHy/3CcFHk0xbxeCJ0vvQ==
X-Google-Smtp-Source: AA6agR5qI/a1d1mo3k3b4orG+LSATsPUVfE4csUqHrquFSsTF/FDFrxb2VVRRL/QJ0NFVS5qtZU9Uw==
X-Received: by 2002:a05:600c:1f06:b0:3b4:86e8:bd21 with SMTP id
 bd6-20020a05600c1f0600b003b486e8bd21mr1907426wmb.7.1663064909412; 
 Tue, 13 Sep 2022 03:28:29 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c33a500b003a5bd5ea215sm11961357wmp.37.2022.09.13.03.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:28:29 -0700 (PDT)
Message-ID: <991ffbda-6833-4706-88bd-ec409ee237d5@linaro.org>
Date: Tue, 13 Sep 2022 11:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 33/37] target/i386: Enable AVX cpuid bits when using TCG
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-34-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-34-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Include AVX, AVX2 and VAES in the guest cpuid features supported by TCG.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-40-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

