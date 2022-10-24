Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E160B4F1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 20:09:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1mk-0003Kd-Qp; Mon, 24 Oct 2022 14:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1mR-0003J5-Kv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:02:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1mQ-0003jC-0G
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 14:02:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id l14so10195893wrw.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cnI0PZL2OSAsjKM9L04vEJrNs2aLyWyiW4T6a1VmSiE=;
 b=ZS+08QUmNrU8W/X9ToGFOEFiH2QHAB/OFnPDwc2TAnmBKTWk83K0/NTZpBZWS6d/ah
 YRfXNznI62jQ6RA4Q/5aMNeXJJKX21oO1poWlHL/CpTzXwJ87edt37XBcrxgMlUgYNMQ
 M5jEvgYWeEowQt9pCCevRWzCN7GUjzTfQoNOCINkQ1oykGFFWtthKDLf4WJW/2le1eAr
 5tm579UCL8j9Q/N2Y8P4DWPL0xo8OaihD5VSfMgycDWqZD9h2HoGAzqKdGNI7kXd4a6n
 ZqkVbug/oA0Y9GFXedcDOvTTV2BW+QC7ZK1V1hJOH0gmyO02CvnlLRAYKcBpFi6ab+lW
 n8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cnI0PZL2OSAsjKM9L04vEJrNs2aLyWyiW4T6a1VmSiE=;
 b=VKTTrob6EvFlPLsmbeIa+oUrCYRgGiLyIOYcXpcShCXGidvrn/NqdA3Jl23ojAgIvs
 NqjeNxyvZR8tTB24x3FjCype3dECKi9okmxtb0OXBRX6inEF1bro2mdlrkrlLwiW1S9R
 G1zRV58OF13Nsu5OvJAKHyc0CTPubUNLy2ZmOSfp1xRkQTpt09sbLGDjCXBmCQDbTyOZ
 A/suqL8eLkqjPtP06Ce6yBmjKu4p+l9X3cxC00vwOU/wm9U6fdF0iDuEhj651kS/KHsr
 /8aVoDzFXf3PJy4kX69DKTGuq2FI4ZS0TDpTrrWfmr4eUQoz99WJmSgejuJa+DHVmuL7
 gPCg==
X-Gm-Message-State: ACrzQf0IZrpg2xYF7j77jtxePukn+T4L+EqhfdUO/jiVnRgoHO8cZmUG
 IfG0GqoTj+w9IQeGw25PUx5GrAqSIQ78sg==
X-Google-Smtp-Source: AMsMyM48p7SzMwTVtcFg3scQyeDOIJtmjgVe4ETKOqbgEBlJrN1fPY5kpkOYkTSOJvDhg2XsMQ5A9Q==
X-Received: by 2002:a05:6000:1841:b0:236:70db:20c9 with SMTP id
 c1-20020a056000184100b0023670db20c9mr4456025wri.671.1666634190696; 
 Mon, 24 Oct 2022 10:56:30 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a5d5507000000b00226dba960b4sm301326wrv.3.2022.10.24.10.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 10:56:30 -0700 (PDT)
Message-ID: <4d8e4c51-4db4-e8ab-df1c-093bba934a4b@linaro.org>
Date: Mon, 24 Oct 2022 19:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 15/29] target/ppc: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/cpu_init.c  | 10 ++++++++++
>   target/ppc/translate.c |  6 ------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


