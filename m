Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243E5B696C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 10:22:20 +0200 (CEST)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY1BT-0004pL-Jv
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 04:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0wo-0003hb-RZ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:07:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY0wj-0000RN-HK
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 04:07:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id bj14so19395077wrb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xzZABD1frPvERQ+RKzNheendwzpgusOBhvXLlp5rTSs=;
 b=h8Dpt/6f3e3VSNd+KCJ3DCzCh7i25LkoRSOqu5c7Mps2WIGfDT43Y3LBtLf1jN0oNJ
 RBZLs+6BueHUysdLW9RnUZkTDgAD9QaF7L0dO0kSimTqX3fa9daxhq5yYItsGlxpCgLY
 jb3DaNGHST/7MYlaqZSBNFLzZcdB6oGxEnbO/+lfA8t628VgBgjPLRzVJJ/4E/QM1W0+
 TKHLejtl9uG4+g7C/BQvpPS0p4UJfP44/29XP8OZ/svXT/x0/qkZ2v0lL90u3qBdOpmS
 b+G/uQGsygtVw3gLXPXi19/JIEge5PP+zFbQ7vU090mhSBDetK8yg7vtaiG5RA6buhO/
 HAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xzZABD1frPvERQ+RKzNheendwzpgusOBhvXLlp5rTSs=;
 b=ZMqF4F/7k1vhQglIKH8nCPGtS4C5KwjFwTNkyw+w9tr9jvnf+p8/VvkhDmzWlIZaBX
 9rTPjcXtBVPDhIxU0yZ/XQXhauoidcscBVr8A61h+JpuT6tat3PZY324kmJYocjex6OH
 GR3DPtMJcIcTcoD0st6vjQdER1saXz2PrRGFH0xHblBNPU3eOwZT07nYqwZmbwIyVeGh
 c54AU8mM76dnc9G6mcP7coMEmlK+GkXWXaVmYe7vTH8XWh/Kf3LnchJKL9wHLFobkDE/
 p9LlLl+d54vfT6VJPsbLHXNcEClFz3iBX4qdur2yWHfvxBXFcGRrW5thhzF025BDqr8a
 efLA==
X-Gm-Message-State: ACgBeo1nOfGaZjO4hcKS8/In3Rycb+tZWmeM6fuDi080kkzIVITh56/I
 9EtcAeFNj82ymOzqmXK5dKC6nA==
X-Google-Smtp-Source: AA6agR58VTvliHDxjnhMPjeXTsQ63H4kWKBAqnkPKB3h/HM52DRy8gn+sIk8S9wZcdq08ayy39lPig==
X-Received: by 2002:adf:fa08:0:b0:228:c246:2a4b with SMTP id
 m8-20020adffa08000000b00228c2462a4bmr16611589wrr.630.1663056423937; 
 Tue, 13 Sep 2022 01:07:03 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c33a500b003a5bd5ea215sm11605961wmp.37.2022.09.13.01.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 01:07:02 -0700 (PDT)
Message-ID: <f19aa90f-8f89-2e2b-ac0d-c090fbda6e6e@linaro.org>
Date: Tue, 13 Sep 2022 09:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 18/24] disas/nanomips: Prevent memory leaking
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-19-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220912122635.74032-19-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 13:26, Milica Lazarevic wrote:
> g_autofree attribute is added for every dynamically allocated string to
> prevent memory leaking.
> 
> The implementation of the several functions that work with dynamically
> allocated strings is slightly changed so we can add those attributes.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 96 ++++++++++++++++++++++++----------------------
>   1 file changed, 51 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

