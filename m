Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDCD66906C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:16:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFDA-0005XU-AB; Fri, 13 Jan 2023 03:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFD8-0005Wn-4O
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:14:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFD6-0007ai-Gt
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:14:49 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so482765wmc.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MUYBfkZyCqzAaTs3uRFQBHgEU7AlmqraeJAoulNkxqw=;
 b=VoB3fxv5MJ53ZSk6rMteex0M5kIJ4ncVaI5qluRrAzJfQB6DIAea1EDvbFV+ANpyRQ
 9Su0TLVNhewgwrp0+c0gHrDkCBe4mmC4opOl8m7edNScLan9AxFyK2zZpizCo75m9vnZ
 asyPsstHyDT5AuLA7Rr9lTIPHt+5XqZSkCI/s7EkvFTqLwNzZLUEVdp6DaaR7lBZNr5D
 7MVnlj6B0ZTitY+VSCJTOa4PrYlEsojif4COCgPiY1rk9NqHzfSo0d85Wffz8Bc20slH
 04OCAjqkIJiHMlKeuLx25+CnU5vIp5v144DlukIkG+LGJitfKgEebSJ165f2dfAXrwiH
 UlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUYBfkZyCqzAaTs3uRFQBHgEU7AlmqraeJAoulNkxqw=;
 b=bExDkDZJN3SZgkAbkjl/qi+aY8/Zj97PFxl8WHsRktrxYFytVN0MWTIH8tnH8o/gnn
 rGQ71y/ixOBeU6hT6dwy5gmbJXqU53xDpi9Ozjc3p1+/lXjgc9p4VRyoTOUO5AMRbVJv
 5bVmaAS8vuT9ktDyqCJnYsvoSko7Uw6oVPNs1e3oxGiOBWQfcxRgaJO5NjJI0qBkV0Rj
 I12xXrzL89FdCP0/kYbiRCVfwcoeLIOhK8W6vO0n8f0WSm/EmQPVlWbqaTx1dLLCX4uc
 /u3CtrwddUO1Z+tx6iGhL3sDpkH0sQ6IQdLeik07AAGi291eLUmwPIFQ/x+1gzdXurQ3
 7TPg==
X-Gm-Message-State: AFqh2krG99M0ANUpuFOz6Tqk07RtL8v9tEGkLuCeva71XVQsrO1T4s4A
 ZuyQ72JNwi0gg7lt9oA4X2kUS+++jqypZvkR
X-Google-Smtp-Source: AMrXdXue0lVWlhdCP2Ct10wYMff90VQJMe4iez2j1pmr5s04ZrgLxIN8rajz3GS9EMLKoEbfiwIL9A==
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id
 r7-20020a05600c35c700b003d35d0f6dfcmr57432771wmq.30.1673597685334; 
 Fri, 13 Jan 2023 00:14:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p5-20020a1c5445000000b003b4fe03c881sm3203353wmi.48.2023.01.13.00.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:14:44 -0800 (PST)
Message-ID: <ed781861-f053-08e5-2459-1c5cb75a762e@linaro.org>
Date: Fri, 13 Jan 2023 09:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v2 1/5] target/arm: Restrict
 'qapi-commands-machine.h' to system emulation
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Markus Armbruster
 <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
 <20221220111122.8966-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220111122.8966-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Peter,

On 20/12/22 12:11, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Move the QMP functions from helper.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.c   | 29 -----------------------------
>   target/arm/m_helper.c |  1 -
>   target/arm/monitor.c  | 28 ++++++++++++++++++++++++++++
>   3 files changed, 28 insertions(+), 30 deletions(-)

Could you take this patch via your ARM tree?

Thanks,

Phil.

