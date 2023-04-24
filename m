Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1300F6ED106
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:11:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxpc-0006cO-Lj; Mon, 24 Apr 2023 11:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqxpW-0006Yt-GY
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:10:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqxpU-0003hs-ST
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:10:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso29240125e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682349010; x=1684941010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXAlVMb1lhCdzQtjQHR4GnUMc8FI2pe3c7I+mbJVTfk=;
 b=Z+CYLB3oCx+rXHOfT9qZTwDT/pOqDDaBZumcxbotyy/e8y0U0J+ETC2KFCtqCoHazE
 HzRbX7h6nqNZMZJqVDHCkqsK97o89jXngAO06uosH78cPFB/Ze2s2uOVi4UX+JV3oXMd
 /SqPOzL0ehnzT7kTT3T0r6B9by+2E9F1gcy7Wiu69zBFSdcY0PF6Icr0Ofc3d7uVmX6k
 Mk9CDvFcsx93y3Cw+sPZxSTvn/Un7jfeMSPr6lrOZqjY7seuhJewZl7lz1GAL2I3rG7q
 eJtjMyV4BhHnApyl60VCA6Lr+Z1PfS6EXmbg1RQx7T5B5/d04OPsJME4B7O/2OlW3L11
 5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349010; x=1684941010;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXAlVMb1lhCdzQtjQHR4GnUMc8FI2pe3c7I+mbJVTfk=;
 b=dMOcisPrkph4djuZeQ469abiRZE38Fk2scg0U6PatBc684FpyQj146IWskVSkJhlb6
 RS12ZOUsPmqpcfjN3bEwBCcwLk+cCjP7nO3XmC9ljkrIzKBMVc3Ag+akUi7S0OT2Yr/m
 KMtUyZXpLg2wIg6hx6sygIAfIvrCCpEeWHUcYhwDEMOAT/abTchiqd4pgCoo6PXkLmwR
 1rz76CKdpx56kVrMUbpkAGp/yu9XgV3I638JPkY3XMcLBWIzvDaw1mDvqgWChI9eHul8
 555KCKahhfAuNYP//95QrEAd+C6pQEH+iC3Qb/jnRd5qwfHNdS2zIFH8cNh0AVuvoHE8
 HyAg==
X-Gm-Message-State: AAQBX9do+JWjNSFyg2CVa67NAr7BP7fzVaA+AYOpPWHG0YYclvx2xc5r
 ia7WUrX7ylT6sH6kuVs01hfBWrFWgrUPevErTQkqhA==
X-Google-Smtp-Source: AKy350bir5/dkbIqz/UZ1tZWfPIfpMnOD+aA90YgKea2hc5sBJaTBIbbAjyuzsypEpCdDcCkOtr7Uw==
X-Received: by 2002:a05:600c:22d4:b0:3f1:82c6:2d80 with SMTP id
 20-20020a05600c22d400b003f182c62d80mr8367089wmg.5.1682349010437; 
 Mon, 24 Apr 2023 08:10:10 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c358e00b003f188f608b9sm12917504wmq.8.2023.04.24.08.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:10:10 -0700 (PDT)
Message-ID: <7f180227-4866-e563-cc42-e04077a51044@linaro.org>
Date: Mon, 24 Apr 2023 16:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 17/44] target/loongarch: Implement vsat
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-18-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-18-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VSAT.{B/H/W/D}[U].
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |   9 ++
>   target/loongarch/helper.h                   |   9 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 101 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  12 +++
>   target/loongarch/lsx_helper.c               |  37 +++++++
>   5 files changed, 168 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

