Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0767731B22D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 20:09:04 +0100 (CET)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMlS-0000ZY-SW
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 14:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBM0q-00059o-E7
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:20:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBM0p-00076w-1U
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:20:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so6170327wrx.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yQlTFcXnk6/lkCFvsji2i/Ap6E0V4JaZAclKInyy0zI=;
 b=oRA8Z+ttrLdi5UZeq2KMuQbQ4OiouCOMtaQHaQCeFWsKT1E33NvfwJx7CsS6vYmnxS
 nwPxQQfAilXAv2NzErJpnoomsVI/WaEZ85AridMUIs1R1k1Nz+rqotoHLlZ+6SmE4C9r
 JEMDTOq0zxN675w/CVuvOxVIZ9jwEHU3kKQfKLCPdFQShEUF2oKmlI+DOAH6SmR0OzZe
 1VaIF9UX5UdzSzNREr5PrxB9TIlbBBugoc1lsSBHZGKDDXNwiW1n8xFXgBaeiKGaRE1k
 sJkJvpjo0I86I6K8B7I363rWVWv9p4vqc+bjnf88OKR6MQrAHZsV+YswxtMi+Alnu22I
 oiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQlTFcXnk6/lkCFvsji2i/Ap6E0V4JaZAclKInyy0zI=;
 b=YQf76Gl3n6KEzsZKuM/QGHUpUcnIlk80WYF/2X86qoUEeIhSibEVaRPQyuq6Q0PxNO
 qID5efWb0xo/4kwX5QF1G274xComN38b6VtxDrCZ++5NUlrXWGKD43EW8ASq73TL7Oyb
 DwE6eC21xQTDyY/a5dwB+MJQJoxZ+VrdLfy+282PccByd5Nn+5Upd0FKSFVaGgM75ziQ
 0wwXVQJuJnmqu1/WQbn38cTcsw6rIcrraCfUsG1EWrFkscW/oRN9KAyeJMh8w2a0pMLU
 i4iY2RUE2T3LBeSj+ZKlCyPR+gNfaCEcwpnovZiDN9mKwhuy2RkHHCk4oyfCSznLRwd6
 5njw==
X-Gm-Message-State: AOAM533s51BcyEfmGSDDt2CbDr+nbUQCQSugEMxMx5CAZh/4hKtipAW3
 rMS4w8I4FkTtLqeNLR7a59s=
X-Google-Smtp-Source: ABdhPJyqREfHfLMnn74bHHvlF8L66KpHAjTA9rcUUAlq2v9REnK1Q8sdf/L+lvmbGw05bKBtgBWEyw==
X-Received: by 2002:a5d:4bce:: with SMTP id l14mr14822404wrt.256.1613326849728; 
 Sun, 14 Feb 2021 10:20:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm16473325wra.82.2021.02.14.10.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:20:49 -0800 (PST)
Subject: Re: [RFC PATCH 10/15] softfloat: Inline float_raise
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1ac9fc5-1f94-e77c-2b57-24e66b5298b0@amsat.org>
Date: Sun, 14 Feb 2021 19:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201021045149.1582203-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/20 6:51 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/fpu/softfloat.h        |  5 ++++-
>  fpu/softfloat-specialize.c.inc | 12 ------------
>  2 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

