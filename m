Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EDB53CDC7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 19:09:17 +0200 (CEST)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAnT-00012I-6o
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 13:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAks-0006h7-0d
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 13:06:34 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAkq-0007XK-Gy
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 13:06:33 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y196so7608468pfb.6
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zpuRVH6tn528rYHfzVEZj4tyUj1KQQAZgikPCbFnAtw=;
 b=uH6SEeVlDuaRQAQtzudgNkSMb9+LSfg9txUe1xPwiVHbT1yR9I3vLhUgSVqR5mLoXv
 IqEd5gglz6lYUWAvA1dHOseGXiFhJ3z3gtV5F2G1x42YYidv1iJ5Sx2rux0e0jMLLNpg
 hl3XRxY8HY0fi52+b3Q/igl376MpGD3Te3jVM3GEm7OZD/u/JzYzjo4u25fHyCGlFT1G
 1oLXLH1OZfc9EbTVt2pcSnOyLDIUToOft7fGFfE3ko3+tnjE60lWYA5scjFmPz3hfhtd
 6GHmQI+9WNUeoaFfS6eD8Sj0CeFTuBkIAa2I1YK7VbLMx/Q/iZ7g8WD3NXBrrZU3zlmy
 zLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zpuRVH6tn528rYHfzVEZj4tyUj1KQQAZgikPCbFnAtw=;
 b=N6uteKdYr7RmpmTPiCmh0BkjEjB3N92OKPfbME/B83pwLnLE3fsXAg31Y3jaM713M/
 aqi/IEud1dqy2r6ozSKVgWBD5S3Cn1O+qrsjhn/DZEDKnLsJmTAY4SGr6qncWLsSeFQM
 XzX2/q0E/MjwXvrGuh88f0epfKPN4UeNu11igxAjSAqMp2o+8wR7bUXlhNKR10tbqcmG
 Q2mbUjLwxK8zHHixI4onpROV2NYjyQ4KfHNnD19/fmc1yO4T4jjaCb2fltXh19nyXrp9
 fIbZWn6GsLmxW/aGxIL8uLaovHvxxYNywGH2csOdbUtgWGWvywjfc2bbv4IbIA/ztQSV
 yqAA==
X-Gm-Message-State: AOAM530E4skC9Wh5bE1e/PaZF1lDTeU2tavlkV2kQbmatD9Nji1b9iKc
 mSIE1rN7svjhLTtT0PFj0tSHQQ==
X-Google-Smtp-Source: ABdhPJyKMeC6ZJ4hRdiY+TR8LNz78kCwerK7LZIArLjYJwVTJF0Su7e9sNfXtzw6hb6zuxBih8Td7Q==
X-Received: by 2002:a63:788:0:b0:3fc:6922:704 with SMTP id
 130-20020a630788000000b003fc69220704mr9788338pgh.6.1654275990678; 
 Fri, 03 Jun 2022 10:06:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm5741440pfc.52.2022.06.03.10.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 10:06:29 -0700 (PDT)
Message-ID: <8da904f7-0d80-c272-5a6f-8a080099ea6d@linaro.org>
Date: Fri, 3 Jun 2022 10:06:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220603164249.112459-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220603164249.112459-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 6/3/22 09:42, Thomas Huth wrote:
> The disassembly via capstone should be superiour to our old vixl
> sources nowadays, so let's finally cut this old disassembler out
> of the QEMU source tree.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   See also the discussions here:
>   - https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg00428.html
>   - https://lists.nongnu.org/archive/html/qemu-devel/2018-05/msg03416.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~

