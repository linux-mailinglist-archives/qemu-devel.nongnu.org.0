Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DD3AF4CD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 20:18:26 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvOV7-00063x-Tg
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 14:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOUF-0005Nj-CQ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:17:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvOUE-0007tn-2C
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 14:17:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id j10so4356446wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SrjtMGY3WsJ8jgb6Jztf+DEiVyKeVDk6MC4VxyZsbAM=;
 b=Wn5oGpH+Rq6LJMgYDb/qnk5gN742MD6SrFB0D4q5c8Sg6W1dSbMH0vqvsBLoCpsZj0
 xpuL6pmbKOGMWrGID4yLTTEy4qeEaFirgzjnZpZMOriZGECb1FREjMrfJb0yxAELS95Q
 nAIthWfg2VHCx7Xi7pf/pgEhIP9k0RRHfIGaaTS+udPzYuqs5X3JHrhxkCqb4LFO9AmC
 axlwYkNttx7jLqnGK1auW1FAssrH2nP/gtawmNmHeyKLerHc4LjPVGwmHnjPMfpkknPV
 rmFu2VyFp/QnT6qTf2LZHhiN/cU1Qx3zZpGQ5ENiVB8dEBcx1iGoIipNGgGtoF8Q9oDo
 lbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SrjtMGY3WsJ8jgb6Jztf+DEiVyKeVDk6MC4VxyZsbAM=;
 b=TLiDTJ7q/gDbCyfxVXZj3Xp6Nnib/fgBU6aIq+2mpINEk+h0V0CMQZ2z/lHqSanqd2
 rvSJuU9aXY1EylVlmuJ6/SM4D2nweWmeGKLwqtMbDDfiGMLcB0erGbs5j0hGRvRR+YCw
 zDxWw0gMIrMwkf+3zgcUFzQ1F4PiNv5IkLXR7P41hT7wXS+zVJSJ1Me9ap3raN8yI3Pv
 gfmKoKcHdBBhgijfOmTWJJVFSGIFt9qz6dZjuBV7MsxmOVybzQow2P0njr1Grx15yD2B
 LTTs6o5BgGwUQaWkftl3QOy/H5ipJpxBCYbRjVy1FxnaPYgNtVQG/ZfEVynL8f34FBCL
 dnSg==
X-Gm-Message-State: AOAM530Ft2zmRDQkylvEZGXenqp8KfGkjl5zZ67jSjNDsIDc8FXmet/y
 pqj+PqCFnnrLF1JCsU55Xjs=
X-Google-Smtp-Source: ABdhPJzSRpAuXXGTx6GBfAppwPdG8AQheNl4yUQ+9YlkHxQ4FT54xskCycQdVevDLvZ+cpWgJfmb1w==
X-Received: by 2002:a05:600c:4417:: with SMTP id
 u23mr14703744wmn.26.1624299448316; 
 Mon, 21 Jun 2021 11:17:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t64sm10439227wma.44.2021.06.21.11.17.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:17:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] target/avr: Add DisasContextBase to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
 <20210620215022.1510617-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <567b4cb5-0ef9-da2a-4661-1188b827aaf8@amsat.org>
Date: Mon, 21 Jun 2021 20:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210620215022.1510617-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/21 11:50 PM, Richard Henderson wrote:
> Migrate the bstate, tb and singlestep_enabled fields
> from DisasContext into the base.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 58 +++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

