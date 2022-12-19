Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CCB6516E0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Q1I-00013Q-On; Mon, 19 Dec 2022 18:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1H-000131-7Q
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:58:07 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1F-0004BL-3P
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:58:06 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so14758347pje.5
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5xEN+/cHPXM3dmSajuhSA3EX2xSXPvzRgub6iQeKrbQ=;
 b=nVsZTf+VzorwY0KwX+fStO8mXF0bOxMT/JEleVEby/fTDy68JrjQKo2GvB9RRd+pSJ
 pwPrnHr6nEVszd/ckOaBG1HK2cuydydrkViu0RnsMfY5SK1lJvcX/v1UZoZ+AZ2bLRJi
 DgY2f3LQ7iTQPSck2U1aogY2qzmgyUncndbDnDsabxWyb4ZqptfpA89V8xP7AQI+SOwC
 xAvzf6H8As54XSMoYKPgO0lIYxBPtjAvDUTHZXo4PmzflNawZNsqKlPFNWtf34n0r3QI
 9VkqvQa0fPBHIUtzCHrc2dQBXHy28eo9mxcDMG9VtJTQ7AHB/HhG1mzX2i0U9QwCH9dd
 KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xEN+/cHPXM3dmSajuhSA3EX2xSXPvzRgub6iQeKrbQ=;
 b=a4XGHLo+x3oQX10iHz5cB+CEYUeOS27KkMtT6l+Hjl0eoyIEtltR9QPZy1LJtMaVBc
 hb/rjc3TgH6hO8139IYt3cN1Wvv6pzboObf3qJFRqix5HDMjREpoY/iwfPvolQAQhg3g
 OYY8GPRZglZbQPEyv8Z5i21HT7tWhkjgKi1Tfi8bZT4jM8Ze8rA6xiUfOE3c09yIKEmp
 V6BdtG82ph3ZijCk9TWBFHkeAEnn86Uz8hXI99TUDouhgriE1JoRrzbz/SYDVonnOCwf
 xywex0vBnYt1ogXkKXIbJhKaJmSp/6g91LuhBRhBZOmz4LyVU+gjQ7nma1/kx0vbgH6V
 M8fQ==
X-Gm-Message-State: AFqh2kpq/MsoiS8cUrAAk8MJclps/F9dT9IIsefyYBHg3MSF/A56O04y
 0Uaf8XJqs944ssDXc9zOGrrV1g==
X-Google-Smtp-Source: AMrXdXsQO/gyEKnQdAkQkvyhfj4rnmao7f6rqs+27/YRAEefh92bwtTHizlKhyBMWExgX/oumopgWA==
X-Received: by 2002:a17:902:848e:b0:189:66dc:4af5 with SMTP id
 c14-20020a170902848e00b0018966dc4af5mr12284839plo.13.1671494283676; 
 Mon, 19 Dec 2022 15:58:03 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00178aaf6247bsm7763922pla.21.2022.12.19.15.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:58:03 -0800 (PST)
Message-ID: <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
Date: Mon, 19 Dec 2022 15:58:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Extract the QMP functions from cpu.c (which is always compiled) to
> the new 'cpu-monitor.c' unit (which is only compiled when system
> emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu-monitor.c | 37 ++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.c         | 27 -------------------------
>   target/loongarch/meson.build   |  1 +
>   3 files changed, 38 insertions(+), 27 deletions(-)
>   create mode 100644 target/loongarch/cpu-monitor.c

Why cpu-monitor.c and not monitor.c like for target/arm/?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

