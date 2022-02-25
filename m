Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CD4C51D1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:59:24 +0100 (CET)
Received: from localhost ([::1]:38700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNjYZ-0000f5-5I
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:59:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNifN-0000FY-6n
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:02:25 -0500
Received: from [2607:f8b0:4864:20::62c] (port=40541
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNifL-0008OA-Ia
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 17:02:20 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b22so5899087pls.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0NGK0nDAcXyS1F4uL3TBpXVdAvUnTdcnxmhxT/s7pQw=;
 b=L4IqfMseIQHrBy+PDzn0Mv8ibgls1zQjM5inFyT4Nr7j2SBdnj7gTOJGvIaONAy0sr
 HlO/8oCBxrBllZn68r7XXDPhFtQ63AyvF4nnS2JoZypH46fWMg09+Vf7y5Venac96h+q
 n7lVBp9648JGvLzsoszvESPdr5HQcThtKYaCvLxQp0tWfsOcPfCJONf6ibHjKo0AJnok
 /dObJbngFk6uTF12x7q/5PfAo0PYKjvQsYQo5YzmyNRBGYXmWK7zfSg/6/XXGKx8D7V7
 dzP/lLlYlZgrHpZ4mS4is+mdTDMpAQxPZwN54CeoAQTGA6Ibcq//r937HThUX76Dm+dW
 yIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0NGK0nDAcXyS1F4uL3TBpXVdAvUnTdcnxmhxT/s7pQw=;
 b=Cdl80+1UM3Nbb7+5sz0dveL444ly8l44PMNdD+mPNmWKGZZcx8aHx+k1Nl5Y36zb4s
 T5g2S3u79R9pGGO+8yKUAYLWUj07T40Jd2jP8+N8UC18gee8aEm1AsKGuKFPyEa6O5cG
 M5suggANhM7UKanWmU5kgiK3fWFRzD80yDFPCr7qynzawTZRLbX/Zw7kgPV2lZy9xl+m
 x43ozhvc5c7r2hmqFoAZz5br1xfMaq3h5mk2C8+D3zmvDzTUWi8t7e4vW/emLPg3CY7W
 cS66huXTG5VR9k3u4fygwp8SMoEjCsWqEkCCxKIHldgHmCMS0con+UEfp7UEc5NIC6lh
 UHgw==
X-Gm-Message-State: AOAM532CnygBOzrRXe9hTnxWWeKRm0JvzsWsN/HTZUKMroHf4TUfbndd
 P8K2a8RmyBatHQ1UTLaFdmhB1w==
X-Google-Smtp-Source: ABdhPJxwucdcjpOenPMy0R0QUbskrcCQYeDWBpyYVkel8v6PvE5ccYcWKnxNDYjlhMCzpEXJdviZzg==
X-Received: by 2002:a17:902:c14d:b0:14f:f1b9:1eab with SMTP id
 13-20020a170902c14d00b0014ff1b91eabmr9178471plj.129.1645826538089; 
 Fri, 25 Feb 2022 14:02:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00218700b004e0314bc83csm4336186pfi.139.2022.02.25.14.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:02:17 -0800 (PST)
Message-ID: <154d771f-6266-da41-4e4b-bb3f76b6b97d@linaro.org>
Date: Fri, 25 Feb 2022 12:01:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 38/49] target/ppc: Implement xvtlsbb instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-39-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-39-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> changes for v5:
> - unroll for-loop as suggested by Richard Henderson
> ---
>   target/ppc/insn32.decode            |  7 +++++
>   target/ppc/translate/vsx-impl.c.inc | 40 +++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

