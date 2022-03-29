Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D74EACB4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:53:24 +0200 (CEST)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZAPb-0002ba-UC
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:53:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZALQ-0005nK-B6
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:49:04 -0400
Received: from [2607:f8b0:4864:20::22c] (port=37408
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZALO-0004cE-SI
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:49:04 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q129so18756069oif.4
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1gsALDJglMWr7pr/thyqJZVv1lrWHcMCMYjrdHVXuCU=;
 b=hANylQ71yNXQZ2JT0yhzRqCbTZ5QvAyVTMWyEeb80mQInLknA1YRxq58d0Ul5vieQt
 23joIX0fgE3rZCzzKWHsPPMZJ7eDBgLsFUXsrbxlAHymwcOPJXQehOd/IUJs7Hl40agx
 bcvyOj1JnC7G7nQBv9PWSmMRoZhOQSbULdPVW/nx8UujMCshZ+KmPlIK6v29wvddmGgm
 SLcthR7CvswnPCloz4ZWz/xv6j/UpjSLTTsW7NEYWFcPmxmfh+KuaWK2DQ3Cn1ntnxH3
 xHz8J0k703fBvrA8wRvsCevUaq7bSqwLJJ72MpKoEuY5atrqor128/MhupAZ5RqleCwN
 AL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1gsALDJglMWr7pr/thyqJZVv1lrWHcMCMYjrdHVXuCU=;
 b=PF/43AQ/5/Js3cEADwAXin63fCWPUmBP3OeO7vCB7LMxifU8oJqUVN2Gcd27fvHuAg
 4GUVDIISM2WFXBJyRFvfodjvTz8iiDX7+IVf99LaqJuFhYxpILQRssaHl1DdJGF8Dajz
 0bNjOJhlgZTdfRN0hB/1qy5N9hC2Cx52/3+dFJHc7suruwMYxlBcjuwSdRAoMVGKu3eS
 ln0M0P8UXMWwpYZgdqTYq4YyTbF+S+tGOl8jpEjj6/vShuvvSpPRVKgjO/y5Uj69bQ5O
 Wk8m6Q0IJrpETHce0D/x5R+mv7yk4v9loVAE7l6cEDz+nRAFdLfsKL7O3CSx3Jb8/Bzs
 3/Ig==
X-Gm-Message-State: AOAM531d1c8V0levQ5rwhp5sKx1H0d+EmaelZYVx6Loc+X3e3GJ5OB5Y
 8t0kV/ZHv5GLqRLP/4Cdh1THFg==
X-Google-Smtp-Source: ABdhPJx2Qkt/tN+R6+w26bpULuubH+c2TIDw2Viu6ppO1AWLGF363hyFrjsSCnNuEwBzp6P9saVbRQ==
X-Received: by 2002:a05:6808:2328:b0:2ef:9271:aa1c with SMTP id
 bn40-20020a056808232800b002ef9271aa1cmr1009073oib.273.1648554541560; 
 Tue, 29 Mar 2022 04:49:01 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 89-20020a9d0be2000000b005ae194ec5absm8655990oth.15.2022.03.29.04.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 04:49:01 -0700 (PDT)
Message-ID: <730f57d8-9743-e624-68c0-88580ae66e96@linaro.org>
Date: Tue, 29 Mar 2022 05:48:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 3/6] softfloat: add float*_to_uint128 conversion
 methods
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> +static uint64_t partsN(float_to_uint2)(FloatPartsN *p, FloatRoundMode rmode,
> +                                       int scale, float_status *s, uint64_t *lo)
> +{
> +    int flags = 0;
> +    uint64_t hi;

I think most of this would read cleaner with 'lo' as a local variable, assigned to *plo at 
the end (or, at the end, combined into the Int128 return value).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

