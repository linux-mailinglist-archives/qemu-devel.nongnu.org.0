Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D36B3F62D6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:41:00 +0200 (CEST)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZTv-000723-1I
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZSG-0004g0-Ih
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:39:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIZSF-0005JC-35
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:39:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id f5so32188823wrm.13
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NWTxOObhkEYvEFlFna6eDcxvCwjoMIVlg+wJm+eOZXg=;
 b=GhJ2wd5GP+Ev0a0bFIKbF13DqzeBNwm7qaUYh6Fv0iBgflgLwT4Dhj6Rf0vLoFfkUA
 2iWHdH4+taZkcpKhAdeRYEe1/Ma/Y+ARcg9sMyNT+chyyLno395bQ6mcmBSfJIRC//4N
 caJes8pQuHq+wbP3oA+463xpAZ8kfD3mSaRrP0LF8YAxQ5/5vZjMBcBqK4c8Va7qScQ1
 MpHfCIHd7simG/g5E6HMfpB5HMgWxIEnRxSUDLG17H5WT+SeEXRsUYiU/J0Pb0uv2RMr
 LvX2UW6hy0Erz1Rg0S2NmSgpYuap0nU5H8LqIxHb7NUxdgSVsF6uwmnF5fn3EcH9YmVe
 HigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NWTxOObhkEYvEFlFna6eDcxvCwjoMIVlg+wJm+eOZXg=;
 b=gC7jQ6sWsh/uTrw+fb3XdHPSfUtN8O0X8DxlBL2/6TAsi8n8r8WCPuCiC5gNaMTLpX
 vJR45RlQH8qkFYNEnVgAaiwCZlVy57/dV6v0OwnpGdaJ1P632kJzMdckgxs1AruIXCdO
 vVyo+uPDQmt7gTssOyc8D50DdysjtgqMRhW3A/gkgZB1rI8F66/wwDwrep4VppgYHkr0
 DVXRgsVpTbHtLM2rcM1wgVx0SBTijlKW4zZjq29anxj3BGmwzI1O11cKFbxsDWk04seJ
 Ub0VdOx45j9cwDzTVSwSxLodvW706DwcujWCeSACVRfhRPW5JRYBzu3NxKjoEzDdZd4R
 kIYA==
X-Gm-Message-State: AOAM531sMMHA4sM0OyIiVEz24vmxphApSVs95gIb/IYLTvf96QQXGC4H
 FuTFyHVb3ghKkUhP2zRK/bo=
X-Google-Smtp-Source: ABdhPJyiv9dbJrfVGkHBwuEvMm6E0jmnEWIoQwdBFX+XTfNzxbpqhlGo5t9OGYZQ388CPqLt7Am6VQ==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr10948375wri.227.1629823153953; 
 Tue, 24 Aug 2021 09:39:13 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p14sm2751762wmc.16.2021.08.24.09.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 09:39:13 -0700 (PDT)
Subject: Re: [PATCH v2 08/30] linux-user/aarch64: Use force_sig_fault()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <57ddbbc0-12cd-83c4-fc6c-70eefd11f893@amsat.org>
Date: Tue, 24 Aug 2021 18:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822035537.283193-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.305,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:55 AM, Richard Henderson wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> Use the new force_sig_fault() function instead of setting up
> a target_siginfo_t and calling queue_signal().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20210813131809.28655-8-peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 34 +++++++++-------------------------
>  1 file changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

