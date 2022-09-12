Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9635B5674
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 10:40:09 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXezA-00043P-7b
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 04:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXex8-0002ZE-0O
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:38:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXex2-0008WS-VM
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:38:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id d2so14158538wrn.1
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MYB5GgPcKs7i0RUsm7kg7raJ2vemt1ZCQbFNnLWIbq8=;
 b=OTsl9RM8KkO7nz1Z/vqdA1IbmhiDaA/Ly5T9vnFReMt5dVR/MkiZjX/b+L1kaFaMls
 aWkyyLW/Secg8ZN2eaE+SbGsvonetwQhkGUcqezSPYxh+4NEaqlKM/IomDVCoproSPRs
 G+pnDG3qYSj6we+pA4d6MjbT1zQd41BqGFT25ZXjCTyYY5JN8jVYgf91dDsBDfmu4MPJ
 PLhihO4e4vOQtHH9tClXfzGApDhLD9CLHggWMdq9l/IC49FeIAHLlI+EK+6EP0Xoxxri
 4EoNzhhP7GU9RqOsTWtmqNj7i3Unjla+DiaTKEBZxUNCNWAID9UjCZsMNdiXDeJgJ0S9
 mERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MYB5GgPcKs7i0RUsm7kg7raJ2vemt1ZCQbFNnLWIbq8=;
 b=B0JKDL7IZBpA4azalGF2DlAHLb6hBxGQvLBWyHDKaxgu/mmSjgIB3XPZlarAc1AP+v
 NxNOXiVIQnGqcoleg9S9JxtOaJcBRQ0uOmEnwZyhPS6G/saAY2FGJCsRjKXwj1cNvNK1
 NvyfItXDaDMB6lemi7wamSKlL5GQRKq7FO1okCX5+TVJaP1UabZqtdtUuflSCid3zGFb
 R0cvvYPvaWLfhoQ4kjkIXzuiyodK+ehOM2Z2Qxj+cx/B2U6x0XJi4Was84GVqRvudILk
 1hjkg7GOGY/o9eCwGH8O0d8ksRO4CeiyjvBcHipb5NyBIH8NZkg9mtUwfhOTnfYi7/v4
 /9UQ==
X-Gm-Message-State: ACgBeo1w9/lnr8YUQzlWgvltmwkHlIFc3NFLG2/oDOlhHRzUz8iAwEzF
 xiPcyt8xtN7vq21dCtIacB+G92cM+9S1yVom
X-Google-Smtp-Source: AA6agR7Lkpj1KHc+swk4Wd26ptybsMefJiuXvBWGlJ/+E/LZ8RecXfv1KcvKq6Y4XM3n8dss6lcpOg==
X-Received: by 2002:adf:f051:0:b0:228:830a:4963 with SMTP id
 t17-20020adff051000000b00228830a4963mr13764833wro.586.1662971875411; 
 Mon, 12 Sep 2022 01:37:55 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a5d4b85000000b00223b8168b15sm6649146wrt.66.2022.09.12.01.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 01:37:54 -0700 (PDT)
Message-ID: <c4b3dce6-8e75-5b84-16f8-0580d42b69c0@linaro.org>
Date: Mon, 12 Sep 2022 09:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/37] target/i386: REPZ and REPNZ are mutually exclusive
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> The later prefix wins if both are present, make it show in s->prefix too.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

