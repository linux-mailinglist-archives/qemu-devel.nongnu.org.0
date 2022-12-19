Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883426516E2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:00:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Q2o-0002dP-RB; Mon, 19 Dec 2022 18:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q2n-0002cr-2W
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:59:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q2l-0004Is-Jo
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:59:40 -0500
Received: by mail-pj1-x1031.google.com with SMTP id gt4so10731377pjb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p12dna6la/ZrjbjsGV+3pNrOH4aMS2qAiukyG+mK6Es=;
 b=LI0wQAa2CB5cxZxTFcikKBnwumbK0QqfILI2RV6LHnNz73Pqzx4Vis4EFWWJpxYknG
 W+gDCqSi84Ij9ymmr+npnrD/Pm5/jytJiQC9nWhxMPaLVe85vtmQRU19MvxAipVif5QQ
 QLMnV+GILpqpvTPUXjllAYIZomXn8tsDWS/hZRXrXAYWovewkS0US93jc5dO8ZHT03zK
 XUT6Tcf25Bt7sZVP96R+KeWZlSUeGktqWwccH3jdYTJGA3WhpHE2KcrCuVSCJRS/U6c6
 b765OOOk5Y4Fxw7HyMT00g38GgqrA7Ea7u/MlQEg7xvfGDNCzJfC8KhGl6nQd9Qd8g2R
 gCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p12dna6la/ZrjbjsGV+3pNrOH4aMS2qAiukyG+mK6Es=;
 b=uTY7cG2at+dwBkCUWbTLRCNohHNV5yCcr7mSIHh5ysSWOM+/29W0lz7t3xvmU7o08b
 u94RzCwNCigyqjXFT1/pOP3Qwbn8P8/WjuLZ00euSW7+RiscOGeqloFmaQvgw78WyACt
 e3kTzd49cRA1GrY5o2EnCe2EpVwMcYwNQdBMQXiI+EjSWpbkoOxidZbAOIUZTVIqUB5A
 xssVGmEHvk302MQoFCJPRmVbuIq/87M6OiQEySokbulx3BYVWdWAB0D20iUi0EPPICyq
 L1tZOWny94pnNiU7m/G8bngsQCkdBLUuvgYgLmU+71IRF/1cmyuJ7+3jQkhikBQOlqkG
 uTlw==
X-Gm-Message-State: AFqh2krtEYpwXNv6Y+95gw6M4KSamyfRbVik/nMJF8SZ/AgU7cjRj+XH
 0pbMEvYNVRDypoBjZcYMre2cqQ==
X-Google-Smtp-Source: AMrXdXupudIRLqiDy3vEiOorg2+n+SbQDAvNJoItC9uppnKSLJiTLRtg3iK4ZSH2Utx3qKlk/suQ8A==
X-Received: by 2002:a17:902:b781:b0:191:117e:25d with SMTP id
 e1-20020a170902b78100b00191117e025dmr10322071pls.19.1671494377843; 
 Mon, 19 Dec 2022 15:59:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 ix6-20020a170902f80600b00190cabbe35fsm7760135plb.98.2022.12.19.15.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:59:37 -0800 (PST)
Message-ID: <b1a814ff-c3d8-51f2-d0d0-d67dc53ac415@linaro.org>
Date: Mon, 19 Dec 2022 15:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] target/ppc: Restrict 'qapi-commands-machine.h' to
 system emulation
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
 <20221219211034.70491-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
> Move the QMP functions from cpu_init.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> Note ppc_cpu_class_by_name() is used by both file units, so we expose
> its prototype in "cpu-qom.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/ppc/cpu-qom.h  |  2 ++
>   target/ppc/cpu_init.c | 48 +----------------------------------------
>   target/ppc/monitor.c  | 50 ++++++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 52 insertions(+), 48 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

