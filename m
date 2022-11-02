Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2572615C05
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:54:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6gx-0007iB-Jt; Wed, 02 Nov 2022 01:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6gv-0007hI-5J
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:53:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6gt-000860-NM
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:53:32 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so2663186pjh.1
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pplWpTxra2cPlV//RwFD6tjsMeeJb/3niCU0xAScLHk=;
 b=g5p15wX1wwI9MjzHqH3zJGemTVn2axaDhc1UpgiaTVpVUr6idb0uluU16rOXQOVPWl
 J8oZviLNwggYtisIiSppZnvIq/Xdmy3H7LxhSIuirJl0Ch2BGSAuU9xJC9352g89z0aj
 9Q6iCYAWURUCwoTu9PoMkuOJPOwAJHiONqAk77Oe/5TxR+9yTV+gu4ElAWPR4BRPB3NS
 s/FuxWuhA2PnR2ZYs9PpEcPxrLDHQfYQTGkeZGjMDcBsy9isFC0Y0aqkGEC12o5JugEO
 n1nvAT90bu8ZebRTPjJmwqqY2vP6i4U/+aAdJHMqOUxS2DUCCsOq+XGHArmrdQAjRyxG
 LXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pplWpTxra2cPlV//RwFD6tjsMeeJb/3niCU0xAScLHk=;
 b=uKuq+4TUnwwTUW6NgnlPr/50cJTHkmPqsR7lAIdEpalp//St6CwETpLoLHUeVO4Ur4
 maxNAeQF1QcdikNN3BYVfdHArqWq981lK0wJCFdBYcgr8FCG7KRSWlNIGAYjcB4yL6Mo
 Rc6FQx/i+Anv+OLtewugpMMMHuO/Jog6/X3mU+IUdyCyZnqMner+TCCllBt76MNzm0mS
 rd+LSdZsCQE0Fk980Xesgy8otjhOiXpj7zwmHXN0LPqCgX6/Mj1GsdkfRyyrBmesExWR
 qWVjTgcUDWx14ZTGWVvHO6Vw/Wce9s0U396Lp8aeVTDPmphdBORhVzDW/gMFeM+fxRGD
 kuzA==
X-Gm-Message-State: ACrzQf2TGz3yeuITuLsXz78fSU0G0WCq8rojKe0e6tluO7AupxkPuyQH
 E3NdcZPFbkyJslyE7psbRjBesg==
X-Google-Smtp-Source: AMsMyM6Q0Nsgr+gqkGTTzIE/QdT7/r65ePSN0iJjXmIEkoxQRCXIVWLf1nAfNICPByopCaNq62slNw==
X-Received: by 2002:a17:903:41ca:b0:186:a68e:c06d with SMTP id
 u10-20020a17090341ca00b00186a68ec06dmr22482572ple.61.1667368408987; 
 Tue, 01 Nov 2022 22:53:28 -0700 (PDT)
Received: from [10.0.0.242] (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a170902c94f00b001853e6d6179sm7440114pla.162.2022.11.01.22.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 22:53:27 -0700 (PDT)
Message-ID: <43cc5542-1833-66d6-a6f4-68a6d0b78e8b@linaro.org>
Date: Wed, 2 Nov 2022 16:53:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] target/loongarch: Add exception subcode
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, yangxiaojuan@loongson.cn,
 maobibo@loongson.cn, xen0n@gentoo.org
References: <20221101073210.3934280-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221101073210.3934280-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 18:32, Song Gao wrote:
> We need subcodes to distinguish the same excode cs->exception_indexs,
> such as EXCCODE_ADEF/EXCCODE_ADEM.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c |  7 +++--
>   target/loongarch/cpu.h | 58 ++++++++++++++++++++++--------------------
>   2 files changed, 36 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

