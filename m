Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7266B2558
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:28:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGIu-0008FA-4E; Thu, 09 Mar 2023 08:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGIs-0008Eg-4T
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:27:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGIq-0002YN-Kb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:27:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1244713wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678368447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C7lLw7dJ41EwvEPmFg8wU1+toL5qZbLuJDyxcgtsIns=;
 b=XuuWmlgu7Cixme7e/zXpPTXyzgRYY13o3XDtmYdZQY34QRXThdyF6eFUwfKhXfD9dR
 ZfHu9JR7KVH6C3rfDKR+RvqLsVnfHosUwrW8+68b0BwRoqRIBcavXNm4UcyoWFGXnH53
 sdOvEeHC0NLUP/I01reakV8M26Jak1Bbk1GeDQS7KMTibTt2CkS/Zt9QfBS/0yVwkEio
 wqA6QkB7R2/dleZaFFB7wVe/us0XeYPWP91L+K+5nTO2x4Zy8u9v4yGMUp8bU1/+tTBa
 UppqGNlOrf/QAwio4JG3lepK4vp0Eb/rFf1lu5cKHz2kHfpoK+bNmkeXCcKlvMiIyLuV
 N4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678368447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C7lLw7dJ41EwvEPmFg8wU1+toL5qZbLuJDyxcgtsIns=;
 b=GFKO+27xSbtqKjgHVHEMjuw3hfWcnsB/vrDAjGeX77AsqKck7v+QC8bTHsgieE8lSg
 lx1dAq5UIPDkZHotXaBY1Y96lSsxcg+WWrLnUMFtAWR5QHGhpVJLrkT9GY6mKbrpE3uj
 hfj34rsiUyFmnGRHnQ1tksVXzmMfVTFcnYQmtPyZJ8y9Sf+ljPXNNI6QFuFgAyOQZgDS
 St/sE1a5YcYRdUhvOVgjflZijQqgaENWwjfMNOaL43iOF69jjvxT2hKxrBQozt9t9yb3
 ERnUdHw73hSXK2InjQBSBAeO9F9iAyreILZ4vzEL1fwnV+VRDVpn+sAZtRNUOlhU06aD
 OIgQ==
X-Gm-Message-State: AO0yUKWaztm6D/6QHryiCAbB4EOQ4fPG8BIOAHe+54imZpiMzo8bj0dK
 F5982clcetxRQLMhuU7XVyKrBw==
X-Google-Smtp-Source: AK7set8ML5C+JubHBq7YvaNvC+3JW5uswJJwWDi0Y5nqVo3+jIbGpeCwZUPHinQaINk4QHPTe6o3Gw==
X-Received: by 2002:a05:600c:3553:b0:3e2:1e31:36bc with SMTP id
 i19-20020a05600c355300b003e21e3136bcmr19521872wmq.12.1678368447083; 
 Thu, 09 Mar 2023 05:27:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c218600b003eb2e685c7dsm2649288wme.9.2023.03.09.05.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:27:26 -0800 (PST)
Message-ID: <bfcdae66-b3e5-72d7-9bb7-a7f41ffd71bf@linaro.org>
Date: Thu, 9 Mar 2023 14:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 08/25] target/arm: Avoid tcg_const_* in translate-mve.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 19:34, Richard Henderson wrote:
> All uses are in the context of an accumulator conditionally
> having a zero input.  Split the rda variable to rda_{i,o},
> and set rda_i to tcg_constant_foo(0) when required.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/tcg/translate-mve.c | 54 ++++++++++++++++++----------------
>   1 file changed, 29 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


