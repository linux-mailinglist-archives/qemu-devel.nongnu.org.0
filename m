Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269096CCB83
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 22:33:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phG0b-0008Q7-NF; Tue, 28 Mar 2023 16:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phG0V-0008Pe-8j
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:33:27 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phG0T-0006WM-Ef
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 16:33:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id c18so12850489ple.11
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680035603;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ny1DQjojRaqluWvopVyIxSfKDbivnln7LMqO7U4LpXo=;
 b=L4+IPAjzZ9VyaE20Ur6ezhWhrVPhNRApJV7ORMkw9Tr62j5u0RMnQz+3S/B7C/q+gs
 qFl7qWGI3n39iKTMZQixi/nmZByRug3BzRuPTcZSZ8Cg1F27lGGU8rA+1y3g1BCGfmKC
 +CzasGZVEuTpGIBMG7xm2Dj+5Hma9SFWdHEfTEcvVaSQNM0WT8XXOYwQxiAv6ePbbuBT
 hS95mcCPQ54TFWY0HfPo9r8p8o3WOLFmE/QSQFiQoilAelUgF7uCJvqEhTZ5sTL7SwRw
 ZAIUSksPKSp1kJHl95PUPRhIFpP845Zy1SyxcXDjhbH/rAHvn4K4HQRxuBRkRPjdXt7Z
 7CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680035603;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ny1DQjojRaqluWvopVyIxSfKDbivnln7LMqO7U4LpXo=;
 b=25XX7A3axYTPsXPTxjTM+1i7+NpYH3uEnXEnrl1sMDzY0JtDu9HXz3OyvTmKs60WBK
 wBSlSXiOU+xxGu2/rz90EJj2YVy+3cH8l0OhlIJ62wByGQpmkDlIdnciU4yDS/MJATMy
 CKr1Hu2xoL1ODf633b+H2wQnsJ621tsYmzMqJSsl+NI6E0m0prE2Mgsm2GSKOozBeu7v
 ljQSq5QZwLmAUErJnMTKMDE0upEBIuh/8zrV25jxclkHG9XQWFRqFXqeiuJNWrIG+6Qv
 SOo0cTzoES8dQlgDsysvFpnf1gq1Mfeu7+UkEBTJRi4oGJX9QOmRE1WeSHPDePZFChaV
 lnDg==
X-Gm-Message-State: AAQBX9ebimIEAUt9n6LsErpLHXV8gNY1Hhey895u9mftFY1mdwVyQ4l8
 btiVNGQCiZ0aZ53UW9ywmYZyxA==
X-Google-Smtp-Source: AKy350YVgMuEjMDMJVNH9Y58pMqlGqHdSpi43jlckLdggGwXY1AAqZZhHHF4flFVSQEppQjfgJLCoA==
X-Received: by 2002:a17:902:e891:b0:1a2:296:9355 with SMTP id
 w17-20020a170902e89100b001a202969355mr19518672plg.16.1680035603580; 
 Tue, 28 Mar 2023 13:33:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 207-20020a6301d8000000b0050bd4bb900csm20544274pgb.71.2023.03.28.13.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 13:33:23 -0700 (PDT)
Message-ID: <6562f208-433f-f16b-405c-ab675046c417@linaro.org>
Date: Tue, 28 Mar 2023 13:33:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 13/44] target/loongarch: Implement vadda
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-14-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328030631.3117129-14-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 20:06, Song Gao wrote:
> This patch includes:
> - VADDA.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  5 ++
>   target/loongarch/helper.h                   |  5 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 53 +++++++++++++++++++++
>   target/loongarch/insns.decode               |  5 ++
>   target/loongarch/lsx_helper.c               | 19 ++++++++
>   5 files changed, 87 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

