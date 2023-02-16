Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C73698C56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7W-0003kD-Qj; Thu, 16 Feb 2023 00:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7U-0003k3-Ku
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:47:49 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7S-0004KA-Mn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:47:48 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 bt4-20020a17090af00400b002341621377cso4750713pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nmkTX/7uI848l7h8nzj2/q1V1Vw4rjQvjUurRDZ9txc=;
 b=YofjBWy1b+1lPhXxMXPDMJmCOVEuaH6mFvxabLyYAuYVtCt+bJ/KwvOJEK2AKl+pvx
 hT87qaZaNYDw7WIr95Fskpoo2sCoVPeHfzrTG3im+pcORpnSBiWaja5Js4BJmOs3yrB1
 fcVv226UbJBhCjF7HtbzTcTCQo66HynenXNr810KZDIQBK7vP4DrQtnsEje5QcH28n/w
 XUbDaXGKjdTMU6NP7AL9Rs5PHBhI70D33fGJKxgdKqQjBIZv8zD5Oe9rmAiPSTUukOTY
 e/6PEIoZ+7CtSTZxadeTdGlB9LdX9oZDcsk6RAyHtuiJGwheZnchK4qhGw/ITySeNlIO
 7oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nmkTX/7uI848l7h8nzj2/q1V1Vw4rjQvjUurRDZ9txc=;
 b=O+GRR+VCc0sotFM1A1bQvKtQDPqQaRU82hu80EBrE/nz1dbkKhtPKjo+HcdBETAguP
 9jiIlvXq6j4yMpr+zj8XizroIG+gRkdZxVm0lfq6LNJnzcgKoikJTu08D06NxicFC+rD
 yFDe2cUEV3jx3WHjKyA6PGx9WoKthl4lrSPgWM5v6YBhaCwIkHsEIT+9L+1A8tjJvZv1
 5FG6jyog9SHL/cS7aibYOEoIohpdk5Uy4IaidNSsjGvcMoOEtu4vNw2tKx8+jcL1kn1g
 T9pBm/pERM/ufbzL4h9C63COAIpNXYehQmshM64p0xdxByHTTV+H174/0J2K9B6ncD6c
 wXHA==
X-Gm-Message-State: AO0yUKWtLkAlQsAx+vWYVEDmL5QL6vZA1+nQJrVBRtcUujnnDjcvYgOT
 JPGGVlMostiqOz7GuHNCCcVW/Q==
X-Google-Smtp-Source: AK7set8a7vz59wDshUbc4nQWtcXOI1g7jy1fc7fg5252mJPjPA50A1xTsTaIAikh9BPhlJMDPasMsw==
X-Received: by 2002:a17:902:ce8e:b0:19a:df76:ddd2 with SMTP id
 f14-20020a170902ce8e00b0019adf76ddd2mr2475087plg.36.1676526465143; 
 Wed, 15 Feb 2023 21:47:45 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jf5-20020a170903268500b00196807b5189sm308507plb.292.2023.02.15.21.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 21:47:44 -0800 (PST)
Message-ID: <1a7bd72b-d369-38d1-cdf0-de6253945a5c@linaro.org>
Date: Wed, 15 Feb 2023 19:47:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Adding ability to change disassembler syntax in TCG
 plugins
Content-Language: en-US
To: Mikhail Tyutin <m.tyutin@yadro.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Cc: "erdnaxe@crans.org" <erdnaxe@crans.org>,
 "ma.mandourr@gmail.com" <ma.mandourr@gmail.com>
References: <7d17f0cbb5ed4c90bbadd3992429006f@yadro.com>
 <be45264f-03d5-e6d1-f12e-c92b0ef7b557@yadro.com>
 <4d474968-dce8-0d69-3e52-2c42a6398e4c@linaro.org>
 <1a19cfd11fd94e658224144d94663330@yadro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1a19cfd11fd94e658224144d94663330@yadro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 19:04, Mikhail Tyutin wrote:
>> On 2/15/23 18:17, Mikhail Tyutin wrote:
>>> ping
>>>
>>> patchew link:
>>> https://patchew.org/QEMU/7d17f0cbb5ed4c90bbadd3992429006f@yadro.com/
>>>
>>> 10.02.2023 18:24, Mikhail Tyutin wrote:
>>>> This patch adds new function qemu_plugin_insn_disas_with_syntax() that allows TCG
>>>> plugins to get disassembler string with non-default syntax if it wants to.
>>>>
>>>> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
>>
>> Why?
>>
>> It's certainly not very generic, exposing a disassembly quirk for exactly one guest
>> architecture.  I mean, you could just as easily link your plugin directly to libcapstone
>> via qemu_plugin_insn_data().
>>
>>
>> r~
>   
> I agree it can be done outside of Qemu using another disassembler library. However,
> there are few reasons to do it in Qemu from architecture standpoint:
> 
> 1. To have a single place of instruction decoding logic. TCG has to decode guest instructions
> anyway. If plugins add another decoder, it causes double work and prone to errors (however
> current implementation does double decode work anyway). For example, TCG might support
> new instruction which is not available in external decoder yet.
> 
> 2. Under the hood Qemu uses different implementations of decoder (in addition to capstone)
> which is not exposed in public interface. If there is a need to configure its output, proposed
> API allows that as well.
> 
> 3. If multiple plugins want to use another disassembler syntax, they have to share
> implementation as utility function.

What's all this got to do with preferring intel over at&t syntax?
I still think it's a generally useless switch.


r~

