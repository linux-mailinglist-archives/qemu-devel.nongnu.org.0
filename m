Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67E5B593A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:24:35 +0200 (CEST)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhYI-0001K5-Nu
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhJS-0007NI-HY
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:09:16 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:35523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhJN-0006gm-A5
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:09:11 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1225219ee46so22392838fac.2
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1RFCTr1oQtm9BoKvRAaHwEN0nLvCGB20Oikxhm8Qr+A=;
 b=d1t4su2RKK/qOSv+QxQlDh+OsUMSH0avIaMo7ikssAgCzOoenemCMyqgFkxxwlHK+Q
 lukpv6YVXuhSVcfVQMA4yQgc5dnz0K3VsJUBJzHGmUqA8ZGrcrWwt3xe+NXRpCZZoQB2
 +EIYT2LHyeBM8ofrkbx3d16th0ACZPlo9c2kr/BtByk6VhU8ouhruXl2tse1b62/1qaw
 dm7/oV3p2ExxqN6s1t39QS/ywX3cKBQsQjbY2hU1JKI3BxyDzKMqOi+e8fN7AGsQriv6
 7D4KNmAiyBv68WmBjlh1LirBCRVC0qkJUtXMYUK54kXWqZkKDDdgrWTanqRTQzo7qwP0
 haNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1RFCTr1oQtm9BoKvRAaHwEN0nLvCGB20Oikxhm8Qr+A=;
 b=kuKv5bVFHmVa9kdSlOgNWfaNByhHxO12Lhja1Lx2UVzRr3ubyIYgkhOQhLvt8yTyV2
 NmKYLVXGHCOFzdEDBg1d5vdJnNP5DQmBArjPOdT3Ml+Wu7dmM6w6eaEjYMhn7vq/D8d6
 a53j1JjWIco9Hq/tqcF5LMLBIPv+t/sPsmHmSzV3EdsE8ElOmMArrM0V38NmVxOAU05p
 VwAKNlJ/t1tpwoy87A2LLRoCThNQLVDzm4c26z3fbDf9ElfK7VySDOEAVLlXDa0J6hED
 2eRRq0Pa5ND0pxpSxOGelIg4ZCZk99+DtlX6KfROIUBf1yGF3KKa5H7+UVhi4nmPeK5X
 T+yw==
X-Gm-Message-State: ACgBeo0K8ypLOQplq7Jmv4C+XS1Sb2TSLtTzy+kekSKrCaNjtMK0+hyI
 dHq/WDqCxj7WP5nqIvTIrWulyw==
X-Google-Smtp-Source: AA6agR5EssJ3L54j1y8DZ9lkijoCsLIGigZsQRNYDlYgz56xpx9m+dy8vFt28KEN8GFhmmxkg0g67A==
X-Received: by 2002:aca:3808:0:b0:34e:80fa:75d with SMTP id
 f8-20020aca3808000000b0034e80fa075dmr5719310oia.286.1662980947919; 
 Mon, 12 Sep 2022 04:09:07 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 z36-20020a056870d6a400b0012b2b0b6281sm5321969oap.9.2022.09.12.04.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:09:07 -0700 (PDT)
Message-ID: <32f0b5a6-3805-d700-8362-7724264af755@linaro.org>
Date: Mon, 12 Sep 2022 12:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 13/37] target/i386: remove scalar VEX instructions from
 old decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-14-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-14-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> This is all dead code, since the VEX prefix goes straight to the new decoder.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 243 ------------------------------------
>   1 file changed, 243 deletions(-)

Could be squashed with previous, but...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

