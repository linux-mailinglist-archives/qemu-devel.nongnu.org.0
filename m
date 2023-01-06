Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF5566069D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrlQ-0005Z2-5W; Fri, 06 Jan 2023 13:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrlJ-0005Yb-Tj
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:48:22 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrlI-00035Q-A8
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:48:17 -0500
Received: by mail-pg1-x533.google.com with SMTP id g68so637676pgc.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o08osKwm6giWWWtQD3J6c/Ll8yozOaGH23sjuFKONgM=;
 b=MrTmWH0Kr1jA6bizK39iu8uzXcoRwmQfZUyiiMj8PWUFSlZ9GgUBA2R5hqgtuFQllf
 MOIeLM5yJa6qpd6LSgKqK02qpNgn/2DGZDzgGO5waSoo3ZvhiofM7Zx6VtP+hPvaTpnf
 ktZQM4tHKgbFyWN6s715RWUWQ0O8XO2WJldsapDIbLkYdJMQqKJ5FXIhdkkm0O+OK7tm
 Cu5nOXoXUeDLe2yuvstB3iz1OWhYlzaPpwcF1qbvPt62D9Nt0NR6j70Z1zTA9ij5jR4+
 jUnmddaL8HV1gERZAsg84vRPnRrDpcOW7uH/La97ectefFyuk8udNtGqEhsi5NGtvPuq
 JBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o08osKwm6giWWWtQD3J6c/Ll8yozOaGH23sjuFKONgM=;
 b=mAiLXHYSWruzKHHln9Bq/E5/GUNPSHFyyZqJQuZScna4pojVmmF2oHA7x/YuNhvu1S
 6U3UsGdJDQc8ZrfQJIjnilNlsqFyaODhzwNZ+ZGmI8WLpmA5j8fPX7sFaCVyUuuXArAw
 9Wq3XDlHUtHGf+4K1q1PAQumigz1NjdJTSwlGCxJL45cc6dAjnt6aaVqEd4sWPPAx0f0
 FwOjI2OmCk5GtxC+QqYzHrBPZk/8ztUDQZEwzLZ5fJKnG6nDUMdst9lYuLkBX+gm4U9F
 G0LFVxQJ2CkJwgdVVjCetwNQnTXTIRufCW/u9wrIkqBMQShetPd5DyT2LlSrV6LTxTwG
 lS/w==
X-Gm-Message-State: AFqh2kpDA3ov9McWijrposuEkDRpPQVu9Rv/lDlRgr74BgL3NDUKFoVr
 BygnYZbjo8wsNGHzhLZSJlTr0w==
X-Google-Smtp-Source: AMrXdXv2pzPL7iC70UAR9IAm48i2reurKDotjL/JG3ztwE+x/T99AKd5SQM5aOPA9x0lUUElVVwh8Q==
X-Received: by 2002:a05:6a00:1747:b0:582:7d41:c8a4 with SMTP id
 j7-20020a056a00174700b005827d41c8a4mr26708355pfc.15.1673030894512; 
 Fri, 06 Jan 2023 10:48:14 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 y29-20020aa793dd000000b0056c2e497b02sm1455229pff.173.2023.01.06.10.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 10:48:14 -0800 (PST)
Message-ID: <2247d563-1442-3b20-4766-648915d8e48d@linaro.org>
Date: Fri, 6 Jan 2023 10:48:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/8] hw/pci-host/bonito: Use 'bonito_pci' for PCI function
 #0 code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> To make it easier to differentiate between the Host Bridge
> object and its PCI function #0, rename bonito* as bonito_pci*.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

