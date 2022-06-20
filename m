Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F585524D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:50:55 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NQE-0000zx-6p
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NMg-0007BO-DU
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:47:15 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NMU-0002WZ-5Z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:47:13 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d17so2138929pfq.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nIAO/Zins5qj40jY9GfY1sOP0ZTJqTr7V4CHn2opwgQ=;
 b=mdUeQ+MSeHjFgdmgeOaFGFv3KycLkmaYS1P0LtTh0AkB1YP22ahS5cCE8Csqn//0U3
 XJ9Dx7eBFozJjTP2PGcJ/6FYcTeLMvMBX78CO+RCjT5YuMMC9lZzYSdMUeUEnG0vLAVT
 bhTImlaCDK1bgzoR1p1zIHAAiFOVXJCwui8LvNJ/E3P60YHpfaoFnv24GpYgwEMa9IfS
 BeTJAmThuyZBNqXmuTIf6LuUQBUx3f88So/AHNcH1K3jp4S9BtmS+6Rgwssi7oUmVzah
 NrJQiEUki9Y5DrUs7k1w+7LYTSlxlPtCz8XVpbq6XRuNIQI0EvmKlXR+dkrGb2hfTeZ8
 gIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nIAO/Zins5qj40jY9GfY1sOP0ZTJqTr7V4CHn2opwgQ=;
 b=VzLvAj1ohCle5N6BrTLOqP7voPyMqky4RA8aa7cz6BHVrkCn7lTqE1hnemTd55323s
 bM89oquS1lUzpQ566reYdVqRwEwZIDyalFWtOjB05olPA1FSTaG/ag5p++gUzz4m+C3D
 BB8ZDRcCWUQdtIMp84lUsWjWNjg/LxDQrTyovLKPVSTihaO+KRAF9nK4V+V4INGp1yug
 1nBsEFrzdi8+zTeV88pKXIUngLlhCW9C6A1Aq4lI/9yZURpNLywcV1G2/1V/MojgmvvD
 4TflFHV0EK5WD8sGjFT8uqXDDwU7HlbKR6nliWCpXFF76Jp+0TKpz6i5wZaQ+Kk1XM5b
 aztg==
X-Gm-Message-State: AJIora+7jkcgMCYkQYZmCB3TxmgPF8YrHquPxRLbC7WU5jnuQLAuFTq7
 /8OTZJHTM1KcaNq/sDuczFkIiQ==
X-Google-Smtp-Source: AGRyM1v5FnQ3YqyAX+V+70OqQ2gSD+nDbQhT6T1AWFIleIQcRNQU+S/dYq5v91lN5XTE2gxQPo3gKQ==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id
 d19-20020a056a0010d300b004fe005d75c8mr25894410pfu.6.1655754420723; 
 Mon, 20 Jun 2022 12:47:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a17090aae0900b001ec8c53544esm4692219pjq.46.2022.06.20.12.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:47:00 -0700 (PDT)
Message-ID: <096ea244-04b2-571b-dbd7-4b5b51eabd08@linaro.org>
Date: Mon, 20 Jun 2022 12:46:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620192242.70573-1-agraf@csgraf.de>
 <20220620192242.70573-2-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620192242.70573-2-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/20/22 12:22, Alexander Graf wrote:
> Some features such as running in EL3 or running M profile code are
> incompatible with virtualization as QEMU implements it today. To prevent
> users from picking invalid configurations on other virt solutions like
> Hvf, let's run the same checks there too.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1073
> Signed-off-by: Alexander Graf<agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>    - Use current_accel_name()
>    - Use !tcg_enabled()
> ---
>   target/arm/cpu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

