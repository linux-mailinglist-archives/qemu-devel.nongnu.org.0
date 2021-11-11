Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F344D5C8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:29:12 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8GU-0003FM-FV
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ET-0001Qu-H4
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:27:05 -0500
Received: from [2a00:1450:4864:20::435] (port=36732
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8ER-0005Dh-FX
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:27:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id s13so9254049wrb.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mxzg/cd0237JziZKPuJcbCm9F/Vo4ppJ5typv5ljVMU=;
 b=PwuTF5EHQTxp+X/X+Eyn+q95VS2kxMXWwKmuNpOrCvG7L3/ylkBcCmzCOnHQFhg7Z2
 oxtH26qQCDlYFM3LdGW9ZSpOJCRaBQdT0X/PN9cNtYN72mi/MsQxufo/jG0tQiWTrb6p
 ua9zgx1iXXXaklGaoYM7M42A0IznYkMFbDnqcBqVDV/ml9eujZoa325dgSgVs9+ROAhC
 v+dcW+nlS9z2InvmIzXnuzye2KgiXfGyPWDHfH2BM1fTPt4h6AsXnMLntDXCRFlAPwnu
 r+m3OJA2h4rdWhXRN4PB7q6+rdIgG7W7ulzR6jCkr/Gex1ZwaBbsVu1068IuB/lwO8iO
 g+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxzg/cd0237JziZKPuJcbCm9F/Vo4ppJ5typv5ljVMU=;
 b=w3iatTOCXeSD+jqtD1BFwRooRx7DBQzMzSlIJ/MwFkMvMsWMpUDS2r2za0WGk80MVt
 EyczTknbQz5lgXtqrL7/s1/coNmcQnsKYf/GjWhZCRLkOTD2eEzbICBWmqBG8HN+R+rg
 PLKSFgFyPXBkD/Y6ihZzKvc3BncZqS2hROXCRLg5R97MKj+3V5RjIzfENmkSz6PmpGMQ
 GwlHkKeQqscBNrPtBuxfiyx54xniBgbilpRepbfclsSQFzEQQl8EhIFCgFgXatKsHhDO
 4VKB0Wy9u8NEPDugmO1+uFCtbFg8Y0406Wvx2llsforyAO1hHPNN5dOGZ3PUhijazrr2
 5lkQ==
X-Gm-Message-State: AOAM532qcIVXNYTEPVTj1yzo2W24cjH/u3mpFG6SJogXlCHRt7Y7gINd
 HvknFmq8dpa0vjvw/hvisGK0Qg==
X-Google-Smtp-Source: ABdhPJy7klzVFNzdZyPOhYE3CbOGNcrQs0NT/mUYH6GB76GBS0mml3eqb1++RyDKEMYClu8E5FI/Rw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr8165963wrq.94.1636630021743; 
 Thu, 11 Nov 2021 03:27:01 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id a10sm4388539wmq.27.2021.11.11.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:27:01 -0800 (PST)
Subject: Re: [PATCH v3 09/20] target/riscv: Alloc tcg global for
 cur_pm[mask|base]
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51fde17b-9ff1-9d71-1192-b254e9512223@linaro.org>
Date: Thu, 11 Nov 2021 12:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Replace the array of pm_mask/pm_base with scalar variables.
> Remove the cached array value in DisasContext.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/translate.c | 32 ++++++++------------------------
>   1 file changed, 8 insertions(+), 24 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

