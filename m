Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4283A1B33
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:48:58 +0200 (CEST)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1Nx-0004GY-Da
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1MI-0003FG-UI
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:47:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr1MH-0002Gs-8r
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:47:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v11so4362685ply.6
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hg+UBHSjR1LO2+nYU8XCwmOt44z0AXlJ+Sw/JJAneW0=;
 b=mQDV1ecmkYxIWMXGRQdEZenhROmAOUaazI+IuapYG/QNxLB5xz9FNGYs8cXGHIJgKk
 jGcXnJHUq55d/ZQT/fWqR0tkiC9Fys3zDbmqfmjcYQuOBzuyvkJh8U/FPxJ827NCd7TA
 +j00tjsREETCC2kYd+2B3qJ7nB8TQ++9UkT3XD7TcSBCH6pSjv62MCmoswRPbmTZZudr
 zYWUhKR7JtvnDKLpnugp6Ue1pryD8Fkw/EImpIfrhdXQaRXj39ZlNO2cSCqupsdifEsU
 3I0rFs7P2BFGmd0i8+KhHIlhAqRA/6S4TxXTXaCI5hypvyd83XwNU9KIWGetiLega7Nm
 wV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hg+UBHSjR1LO2+nYU8XCwmOt44z0AXlJ+Sw/JJAneW0=;
 b=EdpMg16PKVi1SgOj0ZqXSl7JfIB1txwXCIqiZQfd4hhX6YdcezUkl1p4mlt20CXe8f
 VmCxJ0G6wajeQj/IsJ9vtkMCTT4Zvp755TUBCSijNY6WKXm5OLbt/ko+9wql5q5IV5+7
 8eZ233lwc0wDxsiyVhl6G9QCrBL84PgyCSeIRGVHfP0a7ousOfccjyPXM8Cf3Jr49afV
 KAgG9rG53JIMRAG9t2LyB6mA+4javSDEXfIr43UT1Bqd8Aiso00hwFd4+lDHm+aIDNes
 pOBtCf1OW/wG1SorZ7yeAdWy7lqCas31b0Lgs+mAW/33WC7mjHMHvWOhciwjGr+146F9
 DLJg==
X-Gm-Message-State: AOAM532VNuvg616TyMNs8v6RVub58gNL2p6hm948/A/RH6UrJvHJvHUi
 Z9/ojvmMPjfEpaYG/eRQrG8I6Q1eY6y3LQ==
X-Google-Smtp-Source: ABdhPJwR5ihfzIIn8+vkSoKd6o6CDte0WgkuImYy7pizgL+DXhXKkh9RrXz+uim6q226rDX9W8W6OQ==
X-Received: by 2002:a17:90a:fe12:: with SMTP id
 ck18mr427317pjb.27.1623257231660; 
 Wed, 09 Jun 2021 09:47:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 fw16sm5512213pjb.30.2021.06.09.09.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 09:47:11 -0700 (PDT)
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
 <YL/RJUcRTCzlLq2y@redhat.com>
 <c5386a2c-a3b4-0354-5cde-dcbecc587ca9@linaro.org>
 <YMDkOv/bkV5cWLp2@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54a2f6fd-64af-77f9-7e70-bbb335bdfdb9@linaro.org>
Date: Wed, 9 Jun 2021 09:47:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMDkOv/bkV5cWLp2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 8:57 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 09, 2021 at 08:46:22AM -0700, Richard Henderson wrote:
>> If not have_system, there's no point in looking for pam *at all* regardless
>> of get_option().
> 
> In theory we can simplify to
> 
>     if have_system
>        pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
>                              required: get_option('auth_pam'),
>    	   		  ...)
> 
> and this will be fine for builds with system emulators. The only
> caveat is that if someone disables system emulators while also
> passing  -Dpam=enabled, we won't check for pam. That is a
> nonsense combination of course, so probably doesn't matter
...
> feature==disabled does not map to required: false
> 
>    https://mesonbuild.com/Build-options.html#features
> 
> [quote]
>      enabled is the same as passing required : true.
>      auto is the same as passing required : false.
>      disabled do not look for the dependency and always return 'not-found'.
> [/quote]

Ah, thanks.  Documentation is all over the place with meson.  Anyway, I would 
very much prefer the "if have_system" test above.


r~

