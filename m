Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8767971C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHu8-0004W3-4A; Tue, 24 Jan 2023 06:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKHu4-0004VT-Me
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:55:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKHu3-00016H-5z
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:55:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so10735534wms.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K9nGfY0WRUUQdPwnTNpoeQlNagLmQVYGJa9Dvnp2Q8M=;
 b=zJ6pokNdAQwVq6Eyr3NCDjqbg5VOf8YvQJ0XLsMg9BzKn7JyrrfK7Z2vDBiKq3ehJ9
 hraby34AgQGsoOHDuOeeV+3fcCdpIKOxarQpIKROIH0ySpun1I6KW0Wlbr0gTw79yw+4
 31YKW9k2IUQvmqXH1KiSHMbSsQuzUrkUpFYcT93RGmqM85sxtkAk+i+KNFCeRG6ArdoS
 YVJE0ExhCR4gelzcaxt7DWVzO8XOHC8jLJsnubNYSl8QUbsFtiSvrZVej+UzsRjopv0o
 qHD3KSwsfUPu0P3uo2d7/W1K6T3ptvkAT1ZI8ZjoXW51dPgMklP3p/+yD0x59cvyps7U
 W11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9nGfY0WRUUQdPwnTNpoeQlNagLmQVYGJa9Dvnp2Q8M=;
 b=f6opLFkE27/HAnJRvAn6UBoVCa5fwHOhRulxJSmxvXMd6/9mUxRlNGn2eAM5r61lmR
 A/+cWDMIbx+qzuJnxPGoL2QU3i3O3FBisp6H48s3LsZ90AYImYZWme8ZO1i97fitMgfo
 i+HYEAY6tQ6mWgD9WU/xXWIE3R6fl76PvIRwvQnaOYbyHpY2hrD2iwy8X0U3ATg47esH
 DneX+1YjOUy5aoyzh7/9WMiqt3IDQsXp//Bs1xN7Pm2PHCutU9bm+t0Jsg3tApf2hm5F
 GeNSIHBlP8LkliqEkgC+pbzeplOtmhixV3wmPvLTeQt5HC/H7JQLJICf5kJ/9rxXD4N1
 PWtA==
X-Gm-Message-State: AO0yUKWbGbxaIuOqwjzrZCgS7aZpM62deEQVyQDeZeRlmmI7ctEUWGvw
 ZmGWnpJPMpni9copNXtKai/aeg==
X-Google-Smtp-Source: AK7set+c4rykQG4wL1602RDx4r0mCZqs+tWgmUKs6w+tL6K5ZEjAnqeP9M07DeP6SzJSF3E/+T5qEw==
X-Received: by 2002:a05:600c:198d:b0:3dc:1031:14c4 with SMTP id
 t13-20020a05600c198d00b003dc103114c4mr2259371wmq.14.1674561349558; 
 Tue, 24 Jan 2023 03:55:49 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 x1-20020a05600c188100b003b3307fb98fsm1728848wmp.24.2023.01.24.03.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 03:55:49 -0800 (PST)
Message-ID: <b8836ee2-5d01-84ef-0dd3-1e7e1c7f80e5@linaro.org>
Date: Tue, 24 Jan 2023 12:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] aspeed/sdmc: Drop unnecessary scu include
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230124062022.298230-1-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124062022.298230-1-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/1/23 07:20, Joel Stanley wrote:
> The model includes aspeed_scu.h but doesn't appear to require it.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/misc/aspeed_sdmc.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



