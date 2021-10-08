Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92B426A7E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:12:32 +0200 (CEST)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYojn-0004J5-AZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYoMa-0000r1-5m
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:48:35 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYoMV-0001WG-3K
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:48:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so9220338pjc.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 04:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6iF8ZLh7dhrvbO2S9BJtZuLVRM1i1xzxpCOj5iRiY6c=;
 b=c9FTE6+btBcvH9UtBUTISIk0EWpnXC79ANGzwkfMJKA4KDAmAJebvTD9aLUfaTkZj3
 h9XE8TRiCPftYdsmbLpHwY6VvQgOxQKn+lOnBYpTK4IsR8StyHXl5b6pgb44IKQnJrxC
 eSEAaFyGchqxFyFMYwWnJcmHmrVENXz6OPsKzrXlGW10oQY634Wx40NpvgqAodLorFd5
 8pLBCk3edGDf/i15svWRVXyrVFLpY7l5o13XrPrmCIe28keq8s4cFrgQHWElvF7KiRN7
 KdQIu7yaDE7gY1Egxs2XTBCJ64rutciVkVC/WccLeqpemCS3Gg4V8vnElNKBe9YNMAKj
 rHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6iF8ZLh7dhrvbO2S9BJtZuLVRM1i1xzxpCOj5iRiY6c=;
 b=YBrUSix10hLjXVeY0vST2akDBiqBvVgyr49Ef+DUEnj0oGv20SxQvz9ByB0kMdfXbR
 ng70+/ZM8W/jGX3FBYVI8AvzcY4DSwMsSKM8vX2nwoGE1Y4d61rtAF8+mV2+VqAAT2NN
 5CrHH1GATAV7wcXaE4PpR2HO5Au1VZ+OwH0Lu49HoumuUz+Y2JXOhMPkxiscmtYslA1j
 E2mb2AvqDSaAcoTSWOkLHgnREs7FRAFiQuQUXuqj6hHxj/4xW+DMWN2ETAat6b3Ywa6j
 JUv355CfLNAJE3hIeuCGXp5oWorX0+fYlCmmyG805QjmbRPiYMGg6axfsUBnnshz0pyw
 WQyQ==
X-Gm-Message-State: AOAM530oY1zqiLeBNrFaArvUTr1+RacFffjFJcjZLNVOnxB6ze8uGtgy
 WI1jFzjP0y9FwLbXLUIzCMBI0Q==
X-Google-Smtp-Source: ABdhPJzJ5F1fPYJjRL9ivSOfYmsBtliCOMhBkZR2b7BXfWAhwOXn74RtVqCmWYttxh5fG11NqJvsHg==
X-Received: by 2002:a17:90a:e547:: with SMTP id
 ei7mr4810567pjb.169.1633693704455; 
 Fri, 08 Oct 2021 04:48:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id r7sm2474901pff.112.2021.10.08.04.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:48:23 -0700 (PDT)
Subject: Re: [PATCH] hvf: Determine slot count from struct layout
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20211008054616.43828-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90b37092-e00f-35e5-b509-91e1658d2855@linaro.org>
Date: Fri, 8 Oct 2021 04:48:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008054616.43828-1-agraf@csgraf.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 10:46 PM, Alexander Graf wrote:
> We can handle up to a static amount of memory slots, capped by the size of
> an internal array.
> 
> Let's make sure that array size is the only source of truth for the number
> of elements in that array.
> 
> Signed-off-by: Alexander Graf<agraf@csgraf.de>
> ---
>   accel/hvf/hvf-accel-ops.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

