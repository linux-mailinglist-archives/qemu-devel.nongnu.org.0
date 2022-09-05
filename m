Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19465AD292
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:29:40 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBEQ-00054q-OD
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAaC-0003Ii-LA
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:48:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAaA-0004Rr-T6
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:48:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c131-20020a1c3589000000b003a84b160addso6949002wma.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Y68Ja2HGaQ8MwYHbvAa9f2cdDciyv5fgml9RKnp1NH4=;
 b=hUcZCQYqenXQ6cJbBBfopGeYx58fX4p+DhLqKt4+3onUOG4m7y03WOu3BbDz6Gzz/x
 y5QJnDEtalzoU6S3HEwwgDmP9yM8u+/lcF2T6mvxsUDiNFjIsKMev3iJ9zbT9Xb8PzH5
 iKa5wb+VHtNGoliRr23LGLiiKD7nxWsxaT5tLEACxbxRY6UV4Wmz6vxCX/NYOEfB8CVS
 PYi26lN9jaauvS69NvPeZAqm2doicl7AAbX6D0iDhu0pXDl+TmMHA6pYwhqrZFxUb/np
 Apns9OmjDNiQGNaRQ75mWWD8sMWmQJG9TiZ/TnozxvQB04ofNlzBiVeXHIsfUyC0JbAY
 HXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Y68Ja2HGaQ8MwYHbvAa9f2cdDciyv5fgml9RKnp1NH4=;
 b=xA8CuXhBqUlJR8W/9b9yenJkuZzq0yFlWP6gYlr0ZWwHogWkEppxHogd8F/ZOQ1v3Q
 LNvKFH+9ORa1tz7AW9F/xOLqDQvQ3TObarEFsprEy9ZafhnHtdRcIGizCADtN77ZBp99
 77pptJHYksNV3MRddViJ/toaWv3PqdxuHP+rZU8MdHZX9vkF3uw7QaiUf0n64iVwmbpM
 7FICGFuCphSJL1kjuaOGLRNWAsAbbmNGNFgbCCXyUzZHfABdmp9zoWuCqGemCYJ8VWFn
 Fm2Mw+fv019dw0zncU+DIj2EqSMnFyEgYDEqLHxGsiZXBzXVkZRfOlXaWgMzK0mPITxb
 x3rw==
X-Gm-Message-State: ACgBeo2h19TDQ1CtnO95UbS2B/jR3xwuJ+0STYfvLiVmrZzqHg5ufeXf
 v3CyxBv4o0Pfr7RxqXSj4/GNow==
X-Google-Smtp-Source: AA6agR4NzDSIErgkLjmf0OdDb/l3SLS12VMlAhaQA8OGlFU8Y6mADemsL/xKYfEMGEmeJnGlXLGvHQ==
X-Received: by 2002:a05:600c:5114:b0:3a5:cb1f:6bf3 with SMTP id
 o20-20020a05600c511400b003a5cb1f6bf3mr10667755wms.65.1662378480540; 
 Mon, 05 Sep 2022 04:48:00 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adffb92000000b002237fd66585sm8314826wrr.92.2022.09.05.04.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:47:59 -0700 (PDT)
Message-ID: <f839c3b0-b252-f345-d48b-3d57aee44ea5@linaro.org>
Date: Mon, 5 Sep 2022 12:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 17/20] disas/nanomips: Replace Cpp enums for C enums
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-18-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-18-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Change enums to typedef enums to keep naming clear.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   disas/nanomips.cpp | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

