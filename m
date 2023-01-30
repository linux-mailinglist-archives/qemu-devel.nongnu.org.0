Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11567681FBC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdfC-0002tS-AK; Mon, 30 Jan 2023 18:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdfA-0002tG-GC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:34:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdf9-0000P8-1i
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:34:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso3264754wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vnuN7RJR+iJoJsa+dCpYCIf5wPrIbWKSmNE2HlW3ouU=;
 b=TwhYFxw8aBu2SZinhXmrs/p71PW3zWmCv/+QoEzwnwO8X/rv1f1aWaFGbpomH1Rz5L
 jIoHNReg8zOqLAzh8PkpGyihfvlzK5Wm+eHyBTe45N/DF1wkV2Cy+P7qtSSxxJSy530E
 sGCuFRqdY9qdMHiETkKH1y89QXwcXBlECpFm5iUeONFNvcUf/DJhWUkrCzpgn2Ttwswz
 7jvgYqY0H3a2Hl952WeivUv56CeVK24kLnZt36mzzv+quMqNWOjXuctTI2VLa3MkCztT
 n0sAIdjwR6QJ1K4pPORJuJjc3J76viNMsLYxKZIGcgqbMZ5LDQxC+HFmGTeVvT+1t9V3
 Eb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnuN7RJR+iJoJsa+dCpYCIf5wPrIbWKSmNE2HlW3ouU=;
 b=4yPhBk2/+q3gPPi5gMAaAwkkzC1DfrYeffUecUGSlIXkWOgoCgSG+jQ2i/EteZ2TYF
 myDXGeFP850T5iHfy/kH4xV0tIMutZI928fzRkUAdmFRqzANn4HKOE/fzvIL3SsJD2Rb
 PTLgXO7HdujsDMYxcRdGJ+DnbZqJ17VW1QmxuEu75TrIyF+xhUhr6+RnPXLWl37y4JKQ
 fMRQn+V/WMrq4u3C1gbEDviQEW7VDRxYPyzEadeHzZ0ntTksQZgRswVMwezBRT8o6HLc
 +9CU6Ne45khq6UFRGtFr8KYMinjfKFDfio6vLFuhN6tpqdu5ZEgBnQoxSfS+W4RaSN7Z
 +OKw==
X-Gm-Message-State: AFqh2kqSJ9oQuNEiL30/7xd8tBipnhGXswJasg6s8KEFbBdN5VYtsoiU
 CNvuVwNXRlc2foL3joGGz5oP5Q==
X-Google-Smtp-Source: AMrXdXstsPEIUPFjQknt0xc0s3xNUmjMaYcGyG6hlm/7lcwc+H7MupmHDZVATWrgs5QlKGw8EANW8w==
X-Received: by 2002:a05:600c:1c02:b0:3d9:f85c:97ff with SMTP id
 j2-20020a05600c1c0200b003d9f85c97ffmr51605543wms.16.1675121649415; 
 Mon, 30 Jan 2023 15:34:09 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003dc4050c97bsm14352778wmq.3.2023.01.30.15.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:34:08 -0800 (PST)
Message-ID: <e64723e7-1e8e-790a-6fa8-8cb449ce5c6b@linaro.org>
Date: Tue, 31 Jan 2023 00:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 05/27] tcg: Rename TEMP_LOCAL to TEMP_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Use TEMP_TB as that is more explicit about the default
> lifetime of the data.  While "global" and "local" used
> to be contrasting, we have more lifetimes than that now.
> 
> Do not yet rename tcg_temp_local_new_*, just the enum.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 12 ++++++++----
>   tcg/optimize.c    |  2 +-
>   tcg/tcg.c         | 18 +++++++++---------
>   3 files changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


