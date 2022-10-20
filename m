Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85150606B38
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:24:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldxV-0002sy-Fp
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:24:13 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldnH-0002Rp-Kr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldn8-0002Pk-5O
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:13:31 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldn3-0003X3-P8
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:13:29 -0400
Received: by mail-pj1-x1035.google.com with SMTP id pq16so723132pjb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ttuUiH2MDhBVejgrn4UYv/HL6Fsse1XemcvWQ1VIfEs=;
 b=m4aj9j4hqmgRuzKbpRv4DzS8kI9AC8R0WgIT1ViLAuNnNmHdM48oy19fFBAHRS2uPq
 iuI5bLMfhnjl4gr/JoSuB9ZQwtiofkPlVi5vdsf3Ro9PBBtQCtNbvAFgdPYV2Kg03vTa
 KewYJGsA7QSC2RFV3EphR61nDzSmm7/TXZwDHT/JlPVfGNuUbERYVSUI7cusVAKQsojj
 F2cZNstXKuJb5sakinwmRAlPIdc+s/m4pNBkCr375MvGXMMrQtZzeoX+7YmFnDefRL5o
 0UGlyX19Ehwo0l6Mco7/g+pFPD/d0MOAssrkra13/o0ZXa3klT0bkDCqfP2goLxqj8HQ
 7uwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ttuUiH2MDhBVejgrn4UYv/HL6Fsse1XemcvWQ1VIfEs=;
 b=2sTDqJAXsvMo24eDKT8a66s6XbDccb5A0CpVG459RvpcsL4i2KA5iE9X6QGiKn7l8/
 xkM7fg+JnzmPlhau096qozZF2Lnzzo0zhBkz+xGH4s4CwKmpET20/kal4BWpng3cTHUx
 yNjged5cO51519DTonnKMyIERJe7XXN5dMSd7dGHyW4WHxJOGFR7vGCmb1ZxitVhS20X
 vXzn2ZrJPx227aIFdt7iDbGyW2PWS0oCuo4k7cdEjqvMnycngHDJxvonlvOxYG+gsdoQ
 V1axZlDZA+AAoe8SlnmFNqCFrSZP2o8cwTzs0u0QTN5zoQ4/2Q/oleLknOSyYeaUdqwC
 3x1w==
X-Gm-Message-State: ACrzQf2z5l/Gi+Y7JK1CVN1ANlS7sypxbfIwACHtbG4wMB7fj+DL7eK2
 pLSFM50pHlPd+8Ot0Qox2+ZLXA==
X-Google-Smtp-Source: AMsMyM6HifX/rZ7sxQm3zy1W6UzmANU5ZVQhXBDII6JUBkMlA7HLVjiWmdXRo+NxAwi4pv49XeXm5g==
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id
 u6-20020a170902bf4600b00179eba590bamr16084599pls.16.1666304002984; 
 Thu, 20 Oct 2022 15:13:22 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 a24-20020aa795b8000000b005627b3788b8sm13738511pfk.181.2022.10.20.15.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:13:22 -0700 (PDT)
Message-ID: <b9d1a510-8104-e92c-fa9d-03feaafc33ca@linaro.org>
Date: Fri, 21 Oct 2022 08:13:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 09/26] semihosting/arm-compat-semi: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Bin Meng <bin.meng@windriver.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> From: Bin Meng<bin.meng@windriver.com>
> 
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng<bin.meng@windriver.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20221006151927.2079583-2-bmeng.cn@gmail.com>
> ---
>   semihosting/arm-compat-semi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

