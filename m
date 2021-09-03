Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82004400539
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:45:51 +0200 (CEST)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMECE-000285-5N
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEAh-0001Pn-Rb
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:44:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEAg-0006Pp-AH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:44:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id b10so77525wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gCNlA+PaIivbti3pmNIpIeSQ2CD5CQoAALCc23OZak0=;
 b=yDB2gl82GWO2qoHKL1OqHUXy5PTGjaJHBfJN1GlsQYMaNYq2HP5mg8Ul6Dg2Ekwfof
 lUrFCRnI3bUcROlL7ODnkQHq8C6QmLLoJ1oLq1g5nuhJxqdgm2fEfGLDKRvdFHPNA6fz
 p9gIjgJt1KcMAwbIJHu8h1lZBwpLr/iby9AHp4Fi55iPHAdtNalHnO8+rjnJrbY0OaJ9
 D1tLfsp/wQOz2/sonZ2eneNVIS72lQwD88ysLGx2rMDcEiwlaompr48n5Y+in2PdAY/D
 SxFA0BZ67VODAamc22U/rJfIBBq6txMDyXb1zd1Krs+k7dNBAJp+x6BXBXph0ozEmCMQ
 hItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gCNlA+PaIivbti3pmNIpIeSQ2CD5CQoAALCc23OZak0=;
 b=UAPCIUbwzkskAW8SMtR9VNKU7C8pxm/pVfWwuqeeLN2LhYkyqSPovcgVyz2BTbReoJ
 kVFC5Z1Ex4Ct6qHJUwJqYqclJjRjbXaVTDIcgmkFNqzlhlP3Gckpc4wkFpdXx3AWiMnt
 xQNyDHMYZHsdT8/AvyUo58O4e6h4Gyg+UUg18Ef8sJ3mQodliGEhbXW4+kSd/H6aiLro
 NbJXahsxZzItC/byrCmOrK3IhFeRmGPi9YKLoRpA3W6OSFx9c4CO5Oo4QwJ36NDuigvO
 WDHbjSJYmFnFXNe4u03B34Y/gP9M1GTBLys+SxdrVbi+woI8Dnl6VFFAsMvuv105dAZH
 QTAg==
X-Gm-Message-State: AOAM531T9H8YD/mRMzy/9PggI05ZLWF4zDp9ZnC3CigQ9amAF/2HOL1s
 Re/DIopBh7XdwR2KVTPvHL2qJw==
X-Google-Smtp-Source: ABdhPJxpxIzNCrqJvI2DuelaFiX7/AyWb52VaTAUehBvqG3HdF6GibO2sD3UFQjxI5xVKLVGuZSY5w==
X-Received: by 2002:adf:b741:: with SMTP id n1mr522353wre.120.1630694652253;
 Fri, 03 Sep 2021 11:44:12 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y24sm228474wma.9.2021.09.03.11.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:44:11 -0700 (PDT)
Subject: Re: [PATCH v9 02/14] target/riscv: Reassign instructions to the
 Zba-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
 <20210903170100.2529121-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72149469-c2f7-b235-b99a-7502dab5783a@linaro.org>
Date: Fri, 3 Sep 2021 20:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903170100.2529121-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 7:00 PM, Philipp Tomsich wrote:
> @@ -624,14 +630,16 @@ GEN_TRANS_SHADD_UW(3)
>   
>   static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
>   {
> -    tcg_gen_ext32u_tl(arg1, arg1);
> -    tcg_gen_add_tl(ret, arg1, arg2);
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext32u_tl(t, arg1);
> +    tcg_gen_add_tl(ret, t, arg2);
> +    tcg_temp_free(t);
>   }

Good fix, but unrelated to $SUBJECT.  Split it out.


r~

