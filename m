Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0865173C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:49:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Qo6-0004Rm-7U; Mon, 19 Dec 2022 19:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qo3-0004RQ-PK
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:48:31 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qo2-0003Fz-3x
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:48:31 -0500
Received: by mail-pl1-x635.google.com with SMTP id t2so10720223ply.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QB6oXCiLFitUoTAiicVNoohRsN6xYFqyEwzWuUGJr7w=;
 b=q3hlvQAgvIHcAXXYUZB7ivH4O3J/87uBbMQt9VF4lirTkxPTKK5K9n11c6UTH7GsWU
 0WKdrjFFF8pWVWhOcXA+gJTdQkl2FTRISJaK8cwuPCyuDeZ1eVHLlNaM5YHLFRWGN5om
 nhgu6m+Zltxq2ujkQEX8nT38ZGLaDj3vuOX4eEenAe/Ueu/LHtb8BncfD4eLAYDVVxq7
 d1WVzFpA1xrP+Uj3pEA9/DW6KcKoQxW/dPhr+yHRQs4ridODDX5GL9FibkLU0cCnb3i8
 wObx90EN/nNOfFTzx4WM2bIdgUVxaSDTi17/EVfXePvHxehyj+0bsyeoltQej76c8L0E
 8fAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QB6oXCiLFitUoTAiicVNoohRsN6xYFqyEwzWuUGJr7w=;
 b=SezrpB4ZHECzoyFOg9ViUP7wdIXfjLQNGluYpvyPVAEgL5uTiBR87nqPLq10QnAMPC
 +R2LwftsBgtrSoHQBcWzzQIAdCsHK1pF2v3W8tkWfAYeTG/m09A0pi5ndYrqQHvxXxWw
 9RIs4H6DYaZmSB7GvZleYhihg9+sSvevgLnRv8Rqxc6ERozHlHAm6Lbh1rUQ+jToGvHS
 ds7FXNkFAH3OAU/n4vPvH3ChmuDyggc6uJSxHPa52TiX44spgpQlzh7smD17O3TGJEiA
 R/CRoGtxqOsowopfZ514b6KARCUo8fEpRuoqg5h0HhQiR8miVpvdQDjmUC3o413zji9j
 0acw==
X-Gm-Message-State: AFqh2kq+K6TLM4fpo1UZdO6R0bmeOUg41subQLs0W3sJf+cAJKJt4LLh
 mxY5w8B+B4zWOU1vt+i2wPAm2g==
X-Google-Smtp-Source: AMrXdXsF7MeXqqhRUZrZzH5ASJe1Sd5LFvqABD1N1t0+pGwZM7SzMXo3fgBRIlzqZ1yYEf66w2bcEg==
X-Received: by 2002:a17:902:c942:b0:190:f537:3c45 with SMTP id
 i2-20020a170902c94200b00190f5373c45mr32133236pla.30.1671497308621; 
 Mon, 19 Dec 2022 16:48:28 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a17090311d200b00188f07c9eedsm7785043plh.176.2022.12.19.16.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:48:28 -0800 (PST)
Message-ID: <cc90bb48-487a-20b8-439f-8bf015a8d816@linaro.org>
Date: Mon, 19 Dec 2022 16:48:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 1/7] hw/mips/Kconfig: Introduce CONFIG_GT64120 to
 select gt64xxx_pci.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/mips/Kconfig     | 6 ++++++
>   hw/mips/meson.build | 3 ++-
>   2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

