Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47251C6C5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:10:53 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfwC-0005QP-VE
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfXO-0000Sk-Ss
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:45:14 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:45114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfXM-0008TK-FQ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:45:13 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so4905775fac.12
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/6kjGji0MCDChSGL5SXMF4gPTdhnqq07mbuoiL/jtuY=;
 b=d5UHpMls362ZM9fDH3M0ZFoCPB2dOQ+6dq3Z7IvSUDUdKcWxQf5INbyqg1xrOC1Vzv
 oTHU2llIqcNUpSO8KQVKL8Qv3AhwoG+6AjQu4a4NdpR9i1YJvtxH3fiZX/aubnecP0Gb
 HIc3+AvdqGfW2od/hS7RUs9CXbPTnGdNQ80ctA7DMlZtEa5fmVuqCpM7PLM+w/369Jxu
 M0+ZPivHIhlrbxrVessoZWdHFojZ4bq+qxxcqz47WiKmzWw+U4eHWhbkfK2R7RkRuIXA
 wBTUfXzjG2T+m7txtDN2JJ/F/2TAxk3Qwod6MFJAU00ks43CPGuTFBGCrkfN6OXM/V+D
 j1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/6kjGji0MCDChSGL5SXMF4gPTdhnqq07mbuoiL/jtuY=;
 b=r9eATYdbybtfi+jH8Zpv7gMhqnucST9D15VVnXyx11HFYKkQk+8/SE6t4nzFeVEMJc
 BWAH5Xdmkdv2U5EiJOn+IDkug988EShH/vkSdL9wuZ0dwGi3SVakSsVGI5x5Tp+EHjhS
 zGJI79yzTEZRtdlnxh7hgLCvu64g/i0N/J+SDHFUryd39Dj+ZiWgUBXpNv6xfDCgV245
 j77xGsMy0EtZ0pJRdAjvLmcAeN0Rgb7jnFGEmsAeyCfLu8ndZZxiieEMSjXtr18XyxLt
 a9M7x3Wl+g04OiJHMSic9itVlUDeTsfa8DvCPim029ZLYzUSkg/qg+UzgabrICdw0Ulz
 UfqA==
X-Gm-Message-State: AOAM531av8l3/2nJc/4XH+2OG2bf4TOXeDH/G5v+ZMYvg4Fnu/1sRvog
 1pjzvvWm57iSotoJ2sBNpeHnANV+FINtLA==
X-Google-Smtp-Source: ABdhPJxsT5s8+nHiBtxLNFYFfe6gzFheejX4Hk/hcNDM2oY9dcYu2rIgMDPJgue45PTFvknTeHwjOQ==
X-Received: by 2002:a05:6870:ea8d:b0:e6:135c:1a2e with SMTP id
 s13-20020a056870ea8d00b000e6135c1a2emr2814390oap.9.1651772711298; 
 Thu, 05 May 2022 10:45:11 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 x47-20020a05683040af00b0060603221245sm805982ott.21.2022.05.05.10.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:45:10 -0700 (PDT)
Message-ID: <76188a56-de47-a535-ba5f-8a61acd345f6@linaro.org>
Date: Thu, 5 May 2022 12:45:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 15/50] dino.h: add defines for DINO IRQ numbers
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-16-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This is to allow the DINO IRQs to be defined as qdev GPIOs.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

