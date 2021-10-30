Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F9440BE4
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 23:43:59 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgw8r-0002Wi-9e
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 17:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgw7k-0001UT-79
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:42:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgw7h-0007bH-Dd
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 17:42:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gn3so9673377pjb.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4lCcabLMYJoZSIM1seR7q2Olaqd/Yc0/E2ouJgGRF/o=;
 b=mP0IJ1KySqbEVDAAwiE/Q/wAe0okKVHfj/KN3h8agWmTjpasIBb3CJaL+CtiFg0IWB
 YThwys60QUt5L5XspEXngL/IHlNx46be5i8KxRWE+a3bIM6KG1fiaVzMzdt/nz55dldg
 RQRjgnYWS1XzNbAH46leLrIuwMcwNDQcnh6MmVXTmn2k8Ro3c2GgAzLknrMmwtgNLTzu
 EiCiFJMjfZHuslsneeWlcL4T21fBkN+FOlYlVqrcsRh2VWgAmwf3DHTxMEKU7xqIufYq
 XYXVU80xbPtDpyTeu3ObsICjaSM6frukIpGvEhuWIdqhFSW+Tgf4lxmxn7P84u3yYD7T
 Ug0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4lCcabLMYJoZSIM1seR7q2Olaqd/Yc0/E2ouJgGRF/o=;
 b=xHn7a9/7CzSxDcOX97Kfx1W3K+7A29agBUrT1fyce/Z6/wfzqDA2aGWSYr2szuemHh
 XqI+DKj3Y2ZBMxgJIX2fhVxE7+EWf2LvV5frCoKS2mfZxnQvlX5O57cxyGo5fXgUPpyu
 zjlEQ+EgS6iD9yK9tbFwLlU/ZNBTluDA8NceOFR8A6nEnBhUUEN17nELEXbYL/OwG8T6
 6a1iF+RW5+MAcb2Ppj2niW7980GeYBQA7T32wLmiryGe/ntpvMKw5ueM8VwLhN1cKISf
 p9VVushW5C+XJnLRKYz2aaYdke6HM7ewBd4+nUxt9F7a+CXn5oV0/bsvKkr3LGXg+/Dy
 tueQ==
X-Gm-Message-State: AOAM531LhKM5uwY3V4Nn8UAVMfFWHJdFH9hbhDnDPyInaaKo/dhNKiCl
 dx99u02m5tdV2chO4Ti+t6DzaA==
X-Google-Smtp-Source: ABdhPJxpHg/c1t1LMws1wPfVlhgw466Umm6a+gxFE2nFrFx0qNbAxiPxfgCioFDcGu4R5Cy+BW5c5g==
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr20253121pjb.224.1635630163375; 
 Sat, 30 Oct 2021 14:42:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f13sm6082987pfe.218.2021.10.30.14.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 14:42:42 -0700 (PDT)
Subject: Re: [PATCH v2 14/34] target/ppc: Implement vsldbi/vsrdbi instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-15-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <351b5fcc-07ae-0d02-32cd-dcec792c2e5a@linaro.org>
Date: Sat, 30 Oct 2021 14:42:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-15-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - tcg_gen_extract2_i64 instead of shifts and or
> ---
>   target/ppc/insn32.decode            |  8 ++++
>   target/ppc/translate/vmx-impl.c.inc | 66 +++++++++++++++++++++++++++++
>   2 files changed, 74 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

