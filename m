Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AB5AD1D9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:53:21 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAfH-0007Ws-H8
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA3u-000291-IN
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA3s-0006gS-Sk
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e20so10866014wri.13
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+JFDWS2LoTpIQlr1ts8PxnDTVFvmMXGBt5wNO6yKTKQ=;
 b=uJasF1XdnMIjkkPF8/7KaEgmpoRzmLRT5zvlHCle/YKnj1qS5ea7B/cfCx99wG7fa3
 ivBs3fyp6kgMdIbupB54gv4G3fzveJ2pWgO9qLORfs65j3ZTRAx0KMJ52naGJJ4DjUo1
 1leUYcGkn93SrFMmvr8WRU65rmdNhJ5o8Sutxh1/2TaLgJINc/hAN0y9Roj+HzpkQhec
 HCYUea3HLKXKOXpFocWF2cGMWk5hJnr2+uBD5x3vP90/5deJijcbUqGgg47ouFIW3et+
 87D5/xxO//ADRxnjrzQBsJuivN6n+Ysj2n6uxqW/IMzPRny8LqLJvLn5+onpWjF9XHJL
 1rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+JFDWS2LoTpIQlr1ts8PxnDTVFvmMXGBt5wNO6yKTKQ=;
 b=pwYoL1hvyFLDE07dnYkdijG+Lk4BN/0sf0FiTCr30x0uRuJBK4dzJ4kWgETyrQ7Cd/
 fzcnM5z7JWRnCIOMLljfjFEa0WabA99WvlZbGfL/AZmzXux9+qAxWoHBgqqTLLSTOCAN
 PqYP5EPrbu84j8wRefghfutqznYPCkisx2NUpkf/8poeleAJZxCi3MlfrcHWquvUhGHN
 Ov13plD4j2RvV6IHbEpsBVlu4YYtTjLig5rTSJa6K0SAXaf+0Rjj3MLgg1rwVtm6KASa
 HQK0B/lp0sY/7Gi6GXD3zSot+IhF9gwY0zbOElWNibayy6hUeE/YsgGt7+sQKL2l+/4p
 2JzA==
X-Gm-Message-State: ACgBeo0v0jmyMQc6VxLRBD28jyOJjD0Yd7gLEIp1On0USRMykSYroOzw
 fL7cEv8z2zr7NJZ3xwHWfobTkg==
X-Google-Smtp-Source: AA6agR5u1O9Pb1t57U4buXOlAoaMsvUlhLmxkqRpuw+b3VQAd/XlAYAvAdbhqejYATL7kl7kSpu9Zg==
X-Received: by 2002:adf:bc13:0:b0:228:6d28:d2cb with SMTP id
 s19-20020adfbc13000000b002286d28d2cbmr3238767wrg.375.1662376479247; 
 Mon, 05 Sep 2022 04:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4e41000000b00228bf773b1fsm1233129wrt.7.2022.09.05.04.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:14:38 -0700 (PDT)
Message-ID: <5333f61a-308c-f81f-5927-880d23f2d124@linaro.org>
Date: Mon, 5 Sep 2022 12:14:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/20] disas/nanomips: Delete nanomips.h
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-11-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-11-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Header file nanomips.h has been deleted for the nanomips disassembler to
> stay consistent with the rest of the disassemblers which don't include
> extra header files.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   disas/nanomips.h | 26 --------------------------
>   1 file changed, 26 deletions(-)
>   delete mode 100644 disas/nanomips.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

