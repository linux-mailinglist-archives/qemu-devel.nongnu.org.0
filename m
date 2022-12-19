Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7C650E18
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7HVD-0003c1-NW; Mon, 19 Dec 2022 09:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1p7HV9-0003a5-Rg
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:52:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1p7HV7-0005E9-HL
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:52:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso6597251wmp.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 06:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TmvDEkdrOVJ418IEXGxRUXtKSBw4KJWgCgo19vVoYs0=;
 b=C9LB3aPIDo52KK4pIRtzBGhnVoKvCnccObPPq0HXLs7xJ3XAjK0bhNKAyoW/rXWSvs
 W1SLnwi3DVS07bnORNh/WAhr8wQaCbpAw3rxAV7TKZMrf9VGlqIi9k38mRMtUoJE7nt7
 9q3NtcBj5T7F48Nv66c1ta3Zuf3Cuy/gwcholI9BwSShWoO8E2uIUYTTyaUkGzz3WODZ
 27xqBAO9rtZ98wlFVeOyDRdoiciXe0qZ5bSayrFLqq97i1wH6Ztx9VbBNlrsK0LYvcRw
 qMUR5lj1NrMDVv0KIAgMblCsx9eA7/WR4Fhrg6NYSwOnL9AkTOIlZZEWDgGR482+wIgJ
 V0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TmvDEkdrOVJ418IEXGxRUXtKSBw4KJWgCgo19vVoYs0=;
 b=OT06ip4Gu1UeQgqOIqN2UNDC/pvfu4RWvVAtCbiYhkcP6hPyTyMKM7SZftHyOtANxe
 pNAj4DRabmAvh7nqjFADLDKfU2w1w3SW/fdV9tbIoxRSaNWQY71wTHDuIDDC6CA88n/8
 j2JARyV3Rd0LPsLx86qdKMoiBOzqJP8Xy1rxSaMIYiRrsxjtvJCXeKb7nqEfyc1FL0ZO
 H76P0HjO9ZGH1/fmZUz+3DLZvlcA7nA3bbkQi1zKRR3oQAAiVo+vy1u3iGB5ENKAMjOQ
 7jWjfZbr9llOe8YK/cILySKogePZDFY6NcwyD/bMKGNTMWyoIPu7+Im/Qx43+s2LZOgD
 cA4Q==
X-Gm-Message-State: ANoB5pmiY7yzKiCvNsDHo19x87pNjve9f9Yrqx9Ss8l5eaqruTySod95
 EK/O9zmsrPL8KlQ8fR7bHUA=
X-Google-Smtp-Source: AA0mqf6iAbo2HeUHSlzq3EUi/V4KYRmizjeb0KEuymlmtZcbyq4rFpFmEKR3cf4TkDq3ILf80YWbtw==
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id
 g14-20020a05600c310e00b003cfa39feb2amr32718025wmo.11.1671461537201; 
 Mon, 19 Dec 2022 06:52:17 -0800 (PST)
Received: from [192.168.0.162] (bzq-109-64-198-226.red.bezeqint.net.
 [109.64.198.226]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c4f5000b003d358beab9dsm3888092wmq.47.2022.12.19.06.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 06:52:16 -0800 (PST)
Message-ID: <5cb4db99-02c6-02a4-76a0-8761fd66a7fc@gmail.com>
Date: Mon, 19 Dec 2022 16:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/11] contrib/gitdm: add Idan to IBM's group map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-11-alex.bennee@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
In-Reply-To: <20221219121914.851488-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 19/12/2022 14:19, Alex Bennée wrote:
> According to LinkedIn Idan works at IBM. Please confirm if you want
> these contributions counted under IBM or as personal contributions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>  contrib/gitdm/group-map-ibm | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/group-map-ibm b/contrib/gitdm/group-map-ibm
> index da62fa3f44..24d8dc1b86 100644
> --- a/contrib/gitdm/group-map-ibm
> +++ b/contrib/gitdm/group-map-ibm
> @@ -12,3 +12,4 @@ jcfaracco@gmail.com
>  joel@jms.id.au
>  sjitindarsingh@gmail.com
>  tommusta@gmail.com
> +idan.horowitz@gmail.com

Most of the contributions are related to IBM, so I'm fine with counting
them under there.

Acked-by: Idan Horowitz <idan.horowitz@gmail.com>

