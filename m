Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D679231F236
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 23:23:33 +0100 (CET)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCrhs-0002Ac-DR
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 17:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCrgV-0001iq-Hq
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 17:22:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCrgT-0002r8-CI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 17:22:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id w4so5042201wmi.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wITvpPei8uvEaqCw18n1S4Oval0cDRSiKzz4+dAOpgg=;
 b=AchsGM5m15ORGT5sAmyE56Y1sTwJZbHBXmW+PG0kmulLZGk30Pe8/V4g1ZMvP28NsU
 bZPSemtRBwCLNK+N4YN1wbYckfak5oJeDMjkmNcdoSHYfHuzbyKCLiAiUfCmZKLhGzYy
 U1f26udxMVDGuKqJUB9in2FzEM11z/N1RMwZm21h/KA+CxRCgDIVrgKHPRZBrJYnXorX
 dF5ANq+f+CIWh2XG1iDhUKNRkixpCo9L+VBdcxMlrid8nwydSxm2JLKhcepNPWU9rjva
 ni0LGLW9mZEx+lf0tn7QsS/uNPk+Ha4cv/NwxoY/iIBzldrab7ncncnwR7i7QBEFVPSQ
 vGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wITvpPei8uvEaqCw18n1S4Oval0cDRSiKzz4+dAOpgg=;
 b=r+a+oCI/XpVISu95rR+VPWUo2SKoagxpU0tP+JMkJXFR0N/FN7FRPUx1E83AYp7R1g
 M4EOw2r4eTGo1dM7NzlLNItVF5fJl6YP1QpQ2JXaClNutSa8iY3GC7qHcvLYzXCPw+xy
 ftjwxVrtUa+tjcAWemDafaHJqdParqDVTyaSGaASC4TpKp6myUfqiqHl2Ynsrob3nO+C
 2ZMRfXTEathZzDSF9NO3Oc9eh2vYw5BWEIrWtWKu5N8SJnS+D3Y9XSEMwOXeg3Xgufdj
 GL4FKK/gdzcaMuuauXlZEmHYzBBfyvpSI4gEnokIW+LnODft5V0a+icQyv7mNZYNUmZw
 Bt7w==
X-Gm-Message-State: AOAM5329eilVtt/LbdcHUOfPRZbX07Lph11awZht/O6+1wyuAVpnwnl5
 iLr4cvgcIpOiDNRpwFsKffo=
X-Google-Smtp-Source: ABdhPJzDBNAqmXD1NVKlgAi08F+jC/bz9jmyyBdvzQ2262IdkD/Ip77XkAH90sAmCb4soD/QEIA1Uw==
X-Received: by 2002:a1c:7206:: with SMTP id n6mr5317019wmc.33.1613686923303;
 Thu, 18 Feb 2021 14:22:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m1sm9135649wmq.36.2021.02.18.14.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 14:22:02 -0800 (PST)
Subject: Re: [PATCH v4 02/71] tcg: Split out tcg_raise_tb_overflow
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f87c89bc-16f1-0dd4-4249-f7b222eea3bb@amsat.org>
Date: Thu, 18 Feb 2021 23:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Allow other places in tcg to restart with a smaller tb.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


