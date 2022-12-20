Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD8465173B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:49:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7QoJ-0004UR-QX; Mon, 19 Dec 2022 19:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QoG-0004U3-6C
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:48:44 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7QoE-0003Hh-Ju
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:48:43 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so10527221pjo.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2e6aCeFSOQ5mXpCjKXUQ7Jdw1Cz5lkg7uhcJ19ihjBA=;
 b=h+kwvF7Vch+tKFoaZ/CrgQmKHwCfzYQNedwsQhai0Gxexhz7m121VBSlFNYrtSQ9Pp
 J5hiNktlYRWVgKQEUnPugZXUbHl6pUQ9XIFaaZyshsAOR0J2pRmGs4AfrtzgdeY2f52j
 LItWsq1ghxhkZgwpl7eNdyPUwKTDXbVeP+itSFikWHEstnwfu4x20mNq642ar+vlpFBq
 s5Nsw41qqXC12Gcy3UL4qaYW5cNPsKUaIuJZ84yJXQRmq/G3BnX+AUvzvBRMJ4kJQ66K
 JPRRC12mRPTqg5kJajjcYMARCWXmrs9FoxlSS/OD9/stfQW/VXLOIdhVJMqO2hOc6T20
 s3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2e6aCeFSOQ5mXpCjKXUQ7Jdw1Cz5lkg7uhcJ19ihjBA=;
 b=fRGFHLPnyl4Rmfevl0doVUr8QoQBN7g0I6u5KuQZqZMk5M7PcQLiDletrAebMqB3G8
 VUTM6Zj+ZWQS9UfL5MnQ2vOuop8qUNEOVq1jJN5TAnRN2nxACWg0Fwz6ZQb1G6lzy3rX
 UznavR4QsNJlciVVxK0PxzGBPvjFiRhaGRo08XiQEY/IatSUHQqNt7ps926Wq+EjCe4C
 ZXe0GDuXBFoKhLYupo72klkMY62nRXEElwU/77R7Y+UGCGQ03zdPUq3tByDRMjvq0FTA
 zjw2zljD+JgNo9OsPefuz3h37F2jQhkrcm7WzD5sCKpi9meCTG6zVrGa6TZg0lqsQLlF
 pAiQ==
X-Gm-Message-State: AFqh2ko4PpV395scRs8WOC7CGm0ZTDHlCdehuizYRoCYBcPW0FaBSxOK
 5O12d8G0AR8UAcTZj61fkWu/oA==
X-Google-Smtp-Source: AMrXdXuQmCPoffN/cfcAwjlep/8T4uDy5IgenEx1w05dVwfSjED8erwfBZe0Xe8x9mPHBe+rpZnKVQ==
X-Received: by 2002:a17:90a:d147:b0:223:4308:1ab4 with SMTP id
 t7-20020a17090ad14700b0022343081ab4mr20103239pjw.46.1671497321324; 
 Mon, 19 Dec 2022 16:48:41 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 gt18-20020a17090af2d200b00218b32f6a9esm6628782pjb.18.2022.12.19.16.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:48:40 -0800 (PST)
Message-ID: <6aeae54d-86bc-e72b-ce0e-4ba8511b125e@linaro.org>
Date: Mon, 19 Dec 2022 16:48:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 2/7] hw/mips/gt64xxx_pci: Let the GT64120 manage
 the lower 512MiB hole
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Per the comment in the Malta board, the [0x0000.0000-0x2000.0000]
> range is decoded by the GT64120, so move the "empty_slot" there.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   configs/devices/mips-softmmu/common.mak | 1 -
>   hw/mips/Kconfig                         | 1 +
>   hw/mips/gt64xxx_pci.c                   | 8 ++++++++
>   hw/mips/malta.c                         | 7 -------
>   4 files changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

