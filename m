Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA737F5C4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:40:37 +0200 (CEST)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8lg-00063Q-Oc
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8if-0003Da-Sc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:37:29 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh8ic-0005JE-TL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:37:29 -0400
Received: by mail-qt1-x82a.google.com with SMTP id f8so15214201qth.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rWWTXtXIVMJ+9DWyOG4UmeYfpeX3l5uHpPWY0oe9iTg=;
 b=voRhRXn7rz4jCUbfUfOlkHuds+7mpFIA5qZsRHUaYONYtVJ3Uyddfbu4Edm9DEuzCk
 7cPVBffdNK67Q8zvktaePk8dpEwsZDsmCyHIDSiXuBZEcLb6XXfFbuGHFh+c5GJ8/NSk
 xO6QxrXAEXXZurUno6AKC4TRbb7MiCn1fjJtl90cNLkN+KKURYWvZ70K43UKLKeXoHXH
 4NuJVAXdSJ35dfIptEuDmwcjAo2yNGhpBj7sIigwFBJfDnsEnI7qG6AA2lD9jY5ftAti
 XRvcTXXjk4wnq470q8x/Chy59+qBZOQ3d8ath27r7CAFMGJrvNmXAmDO4h+sphBKUqDh
 gCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rWWTXtXIVMJ+9DWyOG4UmeYfpeX3l5uHpPWY0oe9iTg=;
 b=ckcMeqHYbpkov8TEQyQvQQKtK4XzmiMHVg/djAfoLyzCH1sd28BXMoroRNfRS52Osp
 TifWnENRjjkHzovw6npQDaSryFtAUcp6KgSSRtEL1qXCTAxr7B8anTo4WdaRkoUv/6ao
 g1pOcdtBGSSDFkDJmZola4lPp91tn6NJ1AKtb6Tw4A1nfGNvLlpaLmPvUSP6oQm2Ml5V
 G9lw6lFcXVC+wlE8M8xCJGRrq0I9wA0KdMultlKTnVQt2xUk7CKR0D4LIVKjkQERJKU3
 rscRSGWYMh5Cr0vsI0ljP9feIJPstfa9TAN1geIF7fcEGPsavp5kLf+b6ofdsQPj2feC
 RLmw==
X-Gm-Message-State: AOAM531beSXl+evn5phWM7jdJcDPP+1WMx+FwT3Cs5rexDTRNyrcjwJE
 zOAxGBrsKprWOHr/L5PGljr2eg==
X-Google-Smtp-Source: ABdhPJxN52h8UQ1+SGrhOpPeZa/WuW2PiskK8GpnB+r9E/mMluJPO2Upg65upwZhmadOi0ch0w57cg==
X-Received: by 2002:ac8:7647:: with SMTP id i7mr38767801qtr.142.1620902245656; 
 Thu, 13 May 2021 03:37:25 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id r186sm2108961qke.97.2021.05.13.03.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:37:25 -0700 (PDT)
Subject: Re: [PATCH v4 22/31] target/ppc: Implement PNOP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-23-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f18c772-bac6-430b-a345-7aed50225ae0@linaro.org>
Date: Thu, 13 May 2021 05:37:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-23-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> +### Prefixed No-operation Instruction
> +
> +&PNOP           invalid_suffix:bool
> +@PNOP           000001 11 0000-- 000000000000000000     \
> +                ................................        &PNOP
> +
> +{
> +  ## Invalid suffixes: Branch instruction
> +  # bc[l][a]
> +  PNOP            ................................      \
> +                  010000--------------------------      @PNOP invalid_suffix=1

For other cpus it has often turned out to be helpful to have a trans_INVALID or 
UNDEF or RESERVED or suchlike to use for cases like this.  That way you don't 
need a special argument set, nor to set a flag as you do for each of these.

Also, the invalid suffixes themselves do not overlap, so you can get a slightly 
better decode via nested [], like so:

{
   [
     INVALID ...
     INVALID ...
     ...
   ]
   NOP ...
}


r~

