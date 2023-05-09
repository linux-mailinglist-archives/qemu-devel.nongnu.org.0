Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943996FC8F4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:27:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOJ9-0002Cb-1n; Tue, 09 May 2023 10:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOIr-00024u-C3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:26:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOIp-0005Vx-Qa
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:26:57 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f4000ec6ecso59676885e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642414; x=1686234414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=57QG+zDHMepkrmnymVj8E6KY+lrLCZL3UlUw+EW4kkk=;
 b=OKM7fJLnQlBOble1NfxvpF4PYISEpar7uGn+qMYPSkkCW/7/zWkkCh54t10KItbff2
 wDOf8BEhQNTxwo5R5RQD8eNgNUzVtiLzysYysTQGQYt7hsPiv0qT5UcESrqMQCbm/g4j
 NENI3Pu2sjD/d4fm6z0L//nlsOGYoN5TtNuysvmwrd94R3aqiZSm/rT7nrBjU7lwYh9K
 EKTIVBNQ/hha132wyXWKKukvnb3umpqSuVFBTKbyeKjwuhoGK1R8scFgPiX5WWuDl1jt
 3IkfFzyrrQp0lj4IivxHu8LjPuJsWJfzlktXcH2K/h7yG0H7nMCYPy1432oDbWRbSJJr
 Z3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642414; x=1686234414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=57QG+zDHMepkrmnymVj8E6KY+lrLCZL3UlUw+EW4kkk=;
 b=gwx3zUe9rFSBaFkuW+34obI3ybyixy6cXdYATfIXR+bsDPrwzcC5OmaQLA0iLBCFUU
 SPaNZfshIQJsbewe2axf7eQ+xCBeoT9OuiVlxQm6kk2fNyVT/yeQG9NEEVHLtyQilmaN
 b4zeKXgKPB7U2Pt2H5ksh1A6O0AnW45ffhZJCvJfILZRzExGi87C/+KRjOE8LgI5KmWq
 DCylqdPSd8U8LFDS6c2nPrR711KrIHDAfnXoYm6z8dZb18nBrFFTjT1cb/zzThy4Czim
 2kiaF+19PitS6AMojdKVvHBQQKq94IIgWlfCuD/W9JY3+LdnaNiFVN+deEXYN8ePu0J4
 LG8g==
X-Gm-Message-State: AC+VfDw0MjcgbcoHQTtjzFM/WG9bfVVhTQ40rXl6HrjdZnQ04XXFRdcF
 lSm2jQs6iEr91MENNIglMYqjBw==
X-Google-Smtp-Source: ACHHUZ7UBBYbTUnSt6XZQyqEnCoXPKGOOAqZsRQrzdW8X4fzZAD+pw8/KHgUXC3nt7WsDW2VkPftHg==
X-Received: by 2002:a1c:7c0a:0:b0:3ef:561d:255d with SMTP id
 x10-20020a1c7c0a000000b003ef561d255dmr8794966wmc.41.1683642413932; 
 Tue, 09 May 2023 07:26:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm19988241wmq.26.2023.05.09.07.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:26:53 -0700 (PDT)
Message-ID: <47a73c1c-bfbc-752a-c52a-0262b6554a5a@linaro.org>
Date: Tue, 9 May 2023 16:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 0/2] target/arm: Move more files to tcg/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/5/23 13:04, Richard Henderson wrote:
> Move 7 files to tcg/.
> 
> r~
> 
> 
> Richard Henderson (2):
>    target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
>      tcg/
>    target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


