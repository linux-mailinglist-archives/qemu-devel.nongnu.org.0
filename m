Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784B3D4D9A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:11:41 +0200 (CEST)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7duu-0005cK-HQ
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dtV-0004Ah-T1
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:10:15 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dtU-0001zJ-E4
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:10:13 -0400
Received: by mail-pl1-x632.google.com with SMTP id n10so797443plc.2
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V4q6e4ACYH/JZUuaKYAGtT7gSm9qujqNnE+APF3xxB0=;
 b=YNucRdfbJQZWOXTgZRsPZ/RE6mbNSHEHhLHrO6EbDEZuXnjZhX/dGIKxwXPdmWnsWH
 zAfULpm84k2w8NqY7xJgAEZJjbrv6jxC8LWAhe4YjiipXoLxHY4M03ew1v4EaobCMUyy
 BOGmlokjNPuUW9zYLyl6iYNj0H2/VwEzHzc52PO6loCN+sE3sxuU6bm8U2NlxDM7ZfGU
 oLEQE0FZSXSTPQBrIjvOS1bl3mcJ6VnZfpD74+t0uIEYJz5KGGhd+zwtC9sWwy31MiTj
 ZWVqe441QWrBuUIwqw7b1bakeQNW2jMNP6IUXG+nenK3MoqsorvYkz2Y2lvpUODmb8j9
 i8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4q6e4ACYH/JZUuaKYAGtT7gSm9qujqNnE+APF3xxB0=;
 b=lQO/ZMxiVRFE6yJJEVsZc2waM9dj88ODzKBXe2IlltrKogoTUFCXS3O3qcbrXLPVSD
 cSCe4365Byygvf7Nvne4KOy+WIXsNEZ2xr0Syt2ZhO653yvAQK6BNvqAVaatC52GWEcK
 h8/RLH5Ngic4xEcAecz34TkmR7Q5of5HhKUukJAh6VjmAeeI+iFdlTq4Kx6AzvlVVEB8
 lVMr2d+ESboufVLkkrRWJktCDBPT4mKdr7Ry8f2ibCNKxovq+lCal3tgjlo5SBSUywUZ
 Yjban3MZbtynjlfCKNzuaq3yqovC0J/gJrXsqLu8n/+cTO2lxPNrOXM00QJApRji2ybo
 DZHA==
X-Gm-Message-State: AOAM530u+N3qghkHq2GmKM/UjZXrQ8wYjeRVBkwSQDAOomA+IG7RQH3u
 3854G6j8Mb2ZB/3oXWnAGFro8Q==
X-Google-Smtp-Source: ABdhPJwybWrq/0vbwuz8d0GSJJLaFgXzIq19Ge/Rmh+1VAMHEWaPmp08dssZu+r5rUnZzOOqP+Zv7A==
X-Received: by 2002:a17:902:ba90:b029:12c:acd:88f3 with SMTP id
 k16-20020a170902ba90b029012c0acd88f3mr3550615pls.3.1627218610974; 
 Sun, 25 Jul 2021 06:10:10 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id 125sm14314419pge.34.2021.07.25.06.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:10:10 -0700 (PDT)
Subject: Re: [PATCH 03/20] Hexagon HVX (target/hexagon) register names
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-4-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52b415e9-4cad-8fd1-4f85-1e4998de71aa@linaro.org>
Date: Sun, 25 Jul 2021 03:10:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-4-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/hex_regs.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h
> index f291911..e1b3149 100644
> --- a/target/hexagon/hex_regs.h
> +++ b/target/hexagon/hex_regs.h
> @@ -76,6 +76,7 @@ enum {
>       /* Use reserved control registers for qemu execution counts */
>       HEX_REG_QEMU_PKT_CNT      = 52,
>       HEX_REG_QEMU_INSN_CNT     = 53,
> +    HEX_REG_QEMU_HVX_CNT      = 54,
>       HEX_REG_UTIMERLO          = 62,
>       HEX_REG_UTIMERHI          = 63,
>   };

Maybe move the hunk in patch 2 adjusting hexagon_regnames to here?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

