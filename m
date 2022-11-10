Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134FE624D52
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otFTM-0001Vh-85; Thu, 10 Nov 2022 16:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otFTK-0001VY-7b
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:52:30 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otFTE-0006ob-M5
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:52:29 -0500
Received: by mail-pg1-x531.google.com with SMTP id q1so2823888pgl.11
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZyaHaXtmXfFzEW2z6/ictNUFKGplz7+1ptWsYw9oHYY=;
 b=NBUxpHpkZEQH646lC9/F4dp6oEWYAnpUmIG7kgZUdyJhcoinTqh4u17TIOHYG4CjV6
 O4gJPpTkb21D0kwTTYDhprGlhqtrc2tz+oNASjkHAxQDoefJcNrY8E7JmhMdzS817t9S
 e9L7IkBX0xEj+p1kX5aA2FpHEB+B9FjgBZDmYo+AHAYjRtqvaD0FA+5D3sxvOI529kpw
 pV/wwCE5FTy2pARdmLFqpLxR+R+l6wJGCcVR2vgOOMHLfYiWQnvzrgwel+l043J5A8FT
 m7LbLGCaOGZYjjlojMT+4XpsbE5sMV5EVn7kER4b+Sii8Sm26x7CuZgg6niCDyUcF3n4
 kKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyaHaXtmXfFzEW2z6/ictNUFKGplz7+1ptWsYw9oHYY=;
 b=P02wC/+oM2hRfoYX/VpqTFljGzm71TgqQrO2QrqT2FgSblcEbkn4vLb7lDYJEas5I7
 ETF+p3sZD7/cKRz7AIeljcx+cplrXOzgZzSXaSXpASxRlD1K9zhMpNeQ6Hkx4QDcWrs6
 4tcKsVOFdHOy6+zVELlBZ/mDgGH/tSd2qQUrDCNC0KXMJpdjuZAss9LCsuKoIfRG09pC
 wum2e4I//D8kyD/aDu4/4W8GWqQ2Y0GwsxSoqDHLBv8zmZoe5BAAR+srL3mNeEUH21Za
 WTXK943pXjWyfXosMdNMg1r1X8vwH1cUXAdbqFBmW/4+5IgcmLu16gk3KEd3jnNiIDI0
 zyKQ==
X-Gm-Message-State: ACrzQf1wgTw2woalmWlfa4aj7EJKLrrPp4NF5DT5EqzGaywI0IX1wth1
 ZLd/zKc2SH8NgczUZy28TWJn9g==
X-Google-Smtp-Source: AMsMyM5yyjzln2Ra3DuL/MP2+Clv5b1/8AJFd6/y/+gJgfIU/hBrMNn4mqHpJw3ENpaFrK+7y5GxHA==
X-Received: by 2002:a62:860b:0:b0:56d:a2be:ebe4 with SMTP id
 x11-20020a62860b000000b0056da2beebe4mr3602023pfd.28.1668117143064; 
 Thu, 10 Nov 2022 13:52:23 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:aef:59aa:1faf:7e61?
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 ik15-20020a170902ab0f00b00172973d3cd9sm171086plb.55.2022.11.10.13.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 13:52:22 -0800 (PST)
Message-ID: <1f2f627a-9b46-6cb5-5a16-8c751afbf960@linaro.org>
Date: Fri, 11 Nov 2022 07:52:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/2] hw/misc/mos6522: Convert TYPE_MOS6522 to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20221110143459.3833425-1-peter.maydell@linaro.org>
 <20221110143459.3833425-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221110143459.3833425-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 11/11/22 00:34, Peter Maydell wrote:
> Convert the TYPE_MOS6522 parent class to use 3-phase reset.  This is
> a prerequisite for converting its subclasses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mos6522.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

