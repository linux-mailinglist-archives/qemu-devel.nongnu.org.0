Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47B4EB3F1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 21:11:23 +0200 (CEST)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZHFS-00018F-4W
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 15:11:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZHDL-0008Qc-ST
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:09:11 -0400
Received: from [2607:f8b0:4864:20::c30] (port=44692
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZHDJ-0002cN-Fu
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:09:11 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 i8-20020a4a6f48000000b00324ada4b9d9so3238469oof.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dkuNbdaIhm7hXV5Oi/5XxRLycq98hG8PyVfiR8Idfss=;
 b=dHJG/EDdiu/K2Izl2tPNHiSp2kpiI/LnXSr8zf5248eflp8I6SvlAQoNpwNN7XH9V+
 y9wfQjcIPgT8+JNY7MYsMkoe7cE/KynZ1f0yyDSqj7pcNcLb/4m487OJ6/yMyQUEbqJj
 kpW18almHORC4Nq/DoEqwM8N3DyMTLzXkt2qHvoufRPbTkFFBmFj6MVQVKF2iBhXbB2s
 VSv6pbAptim/dBya+bAAyrHr5JaJzMEMt3QNgXigbq7ztbqCpwSH14WAVQiQcRu0aw4J
 vVawSKYwRLiy42b1vjQAIVCBlQ8fpfLcM/mXpJx2hREj2vZUoARQH+Y0JwNFBT0efidK
 kM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dkuNbdaIhm7hXV5Oi/5XxRLycq98hG8PyVfiR8Idfss=;
 b=rzDdXNuaeppprYOhRe8ruoI++GXezvNMtcss9f0O2NgKO78C+lRn1A3rMpombAU/Yx
 nwRXb64NfaLo38UNut2zVFq7Ol1/3/tY06fMCCxTjtzWI8vLvQRtlUs8aijcZiT82Fbb
 kTsiJiifqKCpcTIUjrxQgCEg9SBugBFwhBF7Q5YA8tNvn+ZUf9PHu18srI9p/Qjza5aT
 cB4iFyn5NPDXSpIqGuCTC4XsQHIHB2pee8TkvN26bIuayJjcIaeRcTDGHfyqDtLXQ6vQ
 VRgTm1KISFMDde4ts75N/lyIXZXUpVmpO0LhHvd2lOJfyu2Udp3f7jwLuVJHRIPjyXvM
 6m9w==
X-Gm-Message-State: AOAM53283FABqVg8D3KxYIbpO6HVujbtIgt1dn8PcDz0lYIpbxedqQ7N
 YZSS9wlxHQK/E/4PYIYSvBnftQ==
X-Google-Smtp-Source: ABdhPJx9ORmJNFSsyqT1OEb/aMxP3TGE0veNcjxHPLH5dgukbMrd2eY0ESNEV1LYJOJEVyM9ZK1gDQ==
X-Received: by 2002:a4a:968e:0:b0:324:22c6:1a31 with SMTP id
 s14-20020a4a968e000000b0032422c61a31mr1602602ooi.93.1648580948223; 
 Tue, 29 Mar 2022 12:09:08 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 p14-20020a9d744e000000b005b235f5cf92sm9418743otk.65.2022.03.29.12.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 12:09:07 -0700 (PDT)
Message-ID: <ede38e3b-5207-52fe-4c02-72a4bbe1cf20@linaro.org>
Date: Tue, 29 Mar 2022 13:09:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] target/arm: Determine final stage 2 output PA space
 based on original IPA
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-4-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327093427.1548629-4-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/22 03:34, Idan Horowitz wrote:
> As per the AArch64.S2Walk() psuedo-code in the ARMv8 ARM, the final
> decision as to the output address's PA space based on the SA/SW/NSA/NSA
> bits needs to take the input IPA's PA space into account, and not the
> PA space of the result of the stage 2 walk itself.
> 
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>

I believe I follow: because the walk uses walkstate.address.paddress.paspace, the ipa 
input parameter is unchanged, and it is ipa that is passed to 
AArch64.S2NextWalkStateLast() to form the output address.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

