Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0769D3A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBPI-0007rJ-FI; Mon, 20 Feb 2023 14:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBPC-0007jb-RP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:00:54 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBPB-0008Kn-0J
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:00:54 -0500
Received: by mail-pl1-x635.google.com with SMTP id p1so519074plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xIfRI+GFGM4GKTSnOotXTW3lZBtwTD4LMLf2CeT3MsQ=;
 b=ypwg7uyLPHYgh9/BF14YXPR8Ej/t0fzY2Gxtyaif8HW/0qJBxu10Be4kNw5ZbaAL1T
 6/YIVUAFvU9J+hYh+zDKxfFr2V/BZG3hV/dADdOq1XpRR5JBRSTwfQdKdiJnmngb3+WV
 qsMi1uw7Z1CzUIjBmk5rQaNESgDE/m06P4bFC74VY/PYdj1x/0K7if/u3eD2JAcHqwVw
 RJ3pzzTl3h/VefiDowU8oO1UDVIIshW4aFkmA0pp3K3QFydgQHMC+LkiNC70JsNHyTq6
 AirjUzF12AsewJRGTacWcjebiECRgNI9i4yYh6wNfIgj/V0gzM8O57LMeVjcloe5ARH3
 uCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIfRI+GFGM4GKTSnOotXTW3lZBtwTD4LMLf2CeT3MsQ=;
 b=aTVd/lCZNYkQ8JyjeIVdQuOsqPsJ9/0q9kwk+hB8ZqPOAR3xSLGnCGraxPkGxw86QE
 TnVnUX7H9UpSUIjJpzCLN38HRN6tqFhHN2vUONEcP110F5MVWOf+7CmTO+Kni+mhy2K+
 g+4vKc41F0esjKIvEqzazauECF4qagm46JcNUjtBPpw78E+JkEkYrYyRy7hnPjEDvumU
 iWbw+NlEZ4wQhOk2D0knMUf4K10x7MFL0payan7ov+jL+JF1wHGZpEjCY4m/Aw53OkLN
 fZBUbQ2qaB3/b7+IyyBbc++cHwbcYUuXTYtQe1cVJZrmeo7Y0QTzC3INNwP7ki26AZqQ
 Wbpg==
X-Gm-Message-State: AO0yUKUS7W5idp9NbfEmIy7ZQZf6NMpl+7LdjJQIhyt77eP4HEJN/6VW
 jyv1iKcRGcdvJFbCOfVNAWaSczaBNzKOAT5CRmI=
X-Google-Smtp-Source: AK7set9Zwux61YGWCIpLaqs1/9BUl66g/M66YfhogxhU2SJf5btOeWcBIfy5u+JN2zr+C8u9ShZAKQ==
X-Received: by 2002:a17:902:daca:b0:19c:13d2:44c6 with SMTP id
 q10-20020a170902daca00b0019c13d244c6mr3582441plx.15.1676919651482; 
 Mon, 20 Feb 2023 11:00:51 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902d68300b0019ad6451a67sm8285477ply.24.2023.02.20.11.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:00:50 -0800 (PST)
Message-ID: <ae5b04fb-0386-b266-2ae3-3b6dac831386@linaro.org>
Date: Mon, 20 Feb 2023 09:00:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] hw/audio/es1370: Avoid forward-declaring ES1370State
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230220131837.26292-1-philmd@linaro.org>
 <20230220131837.26292-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220131837.26292-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 2/20/23 03:18, Philippe Mathieu-Daudé wrote:
> To avoid forward-declaring ES1370State, declare ES1370 QOM
> definitions before its use in the chan_bits structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/es1370.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

