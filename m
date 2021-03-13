Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0923633A09B
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:49:05 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAFz-0005ax-UL
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEf-0004co-PW
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:47:42 -0500
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAEe-0006OV-AK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:47:41 -0500
Received: by mail-qk1-x732.google.com with SMTP id g185so27939996qkf.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pgqlVMFohaF7iRRtOqmZSpltiWSkM5vINFATy7vMnzA=;
 b=Adho7pXl8fZJ3UYAUlXfkxLk5bx7fMf1X3SHJGmCQUR80TninQGrhVbhIG0A2m4C/j
 Aci8IODGUJvg41YBqsa/UEXcZ3DyFRnbL7wIUo9E5Rf9TiGxxrNSDm0TUrTv+Ox56yNa
 ON6u70PvzixGWg5zO8ktpe40p6tsR1x0TWwC8M0IgFoyRF97BuWUBObFRSTKsW2cJ6zw
 F//8s514zvylJMfTiOyrj3iUh1ogSRTMtL8VB2XCTYEZ9JvmMvmQlCVO1GYmpnlzBT16
 ZNTg007iUS9S0lHy0nSfxTXmngxKZDtufPeZOuBj3ocvA9ts1PcPhm2QkikuTguGSM/6
 aeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pgqlVMFohaF7iRRtOqmZSpltiWSkM5vINFATy7vMnzA=;
 b=SKVhl+8k3JTeO/BLXF/2bELYdDOQROWv8eRC8D7nAeEXEUW57bCYsCURWIuCiQ8eUv
 FwMyg2//2IpntaILpT9hXTNKrukzJIkZNlqxhAN2+X+DiHmiJq2gEnH4nYtBg2lOSIfd
 h0woiZOCvXX93Dj4Ni+LdZtMYaYP1S98sdzRwQ2RpRJ0cGBJG7m8jJp0RfY4any9awFv
 +fHRQo9+RZbb3hmz6/cXJRPRxCxSo3TYMITPqz8a2YZexekqr9ItkV9ls0qkg5c2628n
 IkphaodPjQVrUFN/odXt9WN4c1b+YFYBVQVUCz7WluY69xd7mqNp61db2d9rlnoT/OV3
 To3A==
X-Gm-Message-State: AOAM531wmtOKAiH9jSOvRKYZN5fxaMJ9PEjhzgy6SGoH7gr/RaKlQpcG
 ox3EAXn5eN9uq45qIvnRP6aPQw==
X-Google-Smtp-Source: ABdhPJyd7KtXiNcYPZE8IpDGrJJS9WZZnEVeYyrBAsLYwWEnr+AvuBquHS9rRtDtbvGRSDUSdH8ucw==
X-Received: by 2002:a37:7ac3:: with SMTP id
 v186mr18006763qkc.211.1615664859501; 
 Sat, 13 Mar 2021 11:47:39 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z196sm7478507qka.70.2021.03.13.11.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:47:39 -0800 (PST)
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313170131.2116837-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <895860ad-914d-c10f-73c7-7ae2bd356d8b@linaro.org>
Date: Sat, 13 Mar 2021 13:47:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313170131.2116837-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 11:01 AM, Philippe Mathieu-Daudé wrote:
> When QDev objects have their DeviceReset handler set, they
> shouldn't worry about calling it at realization stage (it
> is handled by hw/core/qdev.c::device_set_realized).
> 
> Remove the pointless/confusing bcm2835_fb_reset() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

