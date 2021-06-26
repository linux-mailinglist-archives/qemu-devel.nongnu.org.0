Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992813B4DD0
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 11:34:15 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx4ha-00010V-M3
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 05:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4gL-00009R-DV; Sat, 26 Jun 2021 05:32:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4gK-0005I4-2d; Sat, 26 Jun 2021 05:32:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id n23so7776916wms.2;
 Sat, 26 Jun 2021 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X1p95nab33IiBhn7HEBl21bhsOt1D88nHomFMn0DeRg=;
 b=lTsJP7vC9tac4z/sx73I4CEc8h5DLcRahYDHHGdYYarj7+QEXAWkU0RMF3H2dUpsWd
 sDD0vWmwmFgPk2W2QDyc5sTtV6ETGcOuLnHR6dNvQWEFKomdpa/TGqpJZ6sB0uRMp/Ni
 BbGJguAtCQPJJ2GqWF92HxKofJgThK7EIlbbD4rya334bPQGpqLcuFa/hSbXmJjuzddy
 wjGE3ghSgot0YyrsMVj6NNrtNnOyJwf1jR3QozIVx3/p9wNuusIMUPVd9gKLMirh2067
 rxvp5PwhANIbxhUYZzxqR228488aTFRh+Ko/x6NLlKOHBcH07dqO447r1Ujm1XrTK+1L
 OKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1p95nab33IiBhn7HEBl21bhsOt1D88nHomFMn0DeRg=;
 b=hALpYLb4JAMeUU9uUTYLt673YLi9pxT+sYCKux/YTsJIV9RmixRqyQECWast3luxlK
 oiWwiH8mfjZXRJzkOgt4t+yTAJgt/D73PenosnlQVG02cb/mAAoh9aXq6C5rtBEcz7Db
 4MLoQyohyPgCpSq4Ljg1oAR/WofQi/oMxkFehIEBwzznFzaWU4nExpRMh2o8LxC8TV4N
 T20fUe+LqrJWjOiJEE6exKTfMJWu5XnTiBHSIgHZ21wHlKwE6LzdDVIieZOCRcmq5tMS
 BvWs+LjXBJBB0wngb47FAI/NsoX7vpsnrONuA4y/ltrVPwG11hyPXmCDi4P8x7ch/vlV
 wrFw==
X-Gm-Message-State: AOAM533hQ8aE5M49c6pr7wWAaA1EbS5dZh8cPujZcwV1jcusmUUb16NK
 UYiS0oTZTNMv/N9xNoSl5T22ebIKwdc3+w==
X-Google-Smtp-Source: ABdhPJyzQJX9FZoCtJJnogoPA/vry7uDxxdjBKGpkakHqwZ1pe85eXu94I9fmEeWXomESFkDC/BJmg==
X-Received: by 2002:a1c:541d:: with SMTP id i29mr15606679wmb.41.1624699974195; 
 Sat, 26 Jun 2021 02:32:54 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e15sm8610927wrm.60.2021.06.26.02.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:32:53 -0700 (PDT)
Subject: Re: [PATCH v3 11/29] tcg/ppc: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14ca3cff-7507-8a8c-3419-f1dc31d52b4e@amsat.org>
Date: Sat, 26 Jun 2021 11:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626063631.2411938-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/21 8:36 AM, Richard Henderson wrote:
> For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
> output does not need extension within the host 64-bit register.
> 
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

