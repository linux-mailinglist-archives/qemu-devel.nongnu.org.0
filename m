Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA5F3F0DD4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:00:44 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTc3-0004kS-LQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTaH-0002XG-6U
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:58:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTaF-0002Cy-R2
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:58:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x12so5718080wrr.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W91k2/T4zBN+i5iXM8oRRsyFdEo/GbDMUqU+PW2vN6A=;
 b=mZTCIVU3OAoCvdIOlSJQpPSQ/AK0psEW6Xxa73/IiIZwE/4bzWxjcl3dpwmM1osDc/
 RqbaYPeRp8BpS+pOUsn8orBpZRwPNcdwtdz8gdPDNHImpRON4PFRY+xGpkYe1p+TzbRD
 s+RIvnZqxu3ytAYe3HJu+m4BNRnZTfWD6JdpL540Sa8YR5VoahfhKJd03Z13FWWoOsUG
 qwcsuwJupo4lp2IrRhusdjE2xyIq36ujoRAJOiWfhmJFf2to0ROgG2bQ+70pJd02rePU
 ZXC06AQEMFy/o9vsZfSFO9BAbZZ/XohSmtArW1yTQWNgY9kJ+0NaiFkkkduggZKZ4vcf
 lzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W91k2/T4zBN+i5iXM8oRRsyFdEo/GbDMUqU+PW2vN6A=;
 b=XvA6bYbUamteDuWHP6e1d/UHPcXGOP22MipWqBLN3a1fXhpUknF2Aw9S3Jj3vEFZel
 A0B6bVfNOz24HKuYkF7UnVAiytGcFLp5rX9kXPUAPaVWezqxTNb5gLKmf9p42IuLsx/Z
 Qzt+iFXzGGnZDQeFDwVS9oqi2iroYbY+ktqtm9HzGEQQGxyoDJtJd8yX6RQJpuHnapm2
 WVgVUSPQYEIZ9R6STafLTSz03RibQTznOo7gsTw/wrma9HRaeIS/806DjU8EcoDkQFkV
 6Ofz5wfllsxZZ/dOxEf4rECt9rsCjp5TXNdRn4zx5j8trwm6Hx/rNmh0aHOPR9jXnSUq
 mOSQ==
X-Gm-Message-State: AOAM531IgcuCd/J7DpwnPNL6ViaG9H/AsyBjNGNwkcYDBPlf6RH1HyXG
 p4TmX2kEpKAmEllrRmpbs+VGrOIDB4k=
X-Google-Smtp-Source: ABdhPJyW6k0orsS2p+sngMWoAgbSL6hrF4Ltw0/9QMT4r0Hnd7NpQNySU1nVub7pn4U1Ne5iTuRt7Q==
X-Received: by 2002:a5d:6642:: with SMTP id f2mr12805686wrw.278.1629323930218; 
 Wed, 18 Aug 2021 14:58:50 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h11sm7275666wmc.23.2021.08.18.14.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:58:49 -0700 (PDT)
Subject: Re: [PATCH v3 02/14] tcg/arm: Standardize on
 tcg_out_<branch>_{reg,imm}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b48b0239-2909-60f1-5c9f-72b057f63bf1@amsat.org>
Date: Wed, 18 Aug 2021 23:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818212912.396794-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:29 PM, Richard Henderson wrote:
> Some of the functions specified _reg, some _imm, and some
> left it blank.  Make it clearer to which we are referring.
> 
> Split tcg_out_b_reg from tcg_out_bx_reg, to indicate when
> we do not actually require BX semantics.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)

Appreciated cleanup :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

