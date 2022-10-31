Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D7612FF2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:46:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNcg-0002XU-RB; Mon, 31 Oct 2022 01:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNce-0002XD-Iu
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:08 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNcc-0005dp-KD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:08 -0400
Received: by mail-oi1-x22c.google.com with SMTP id s206so11914835oie.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRuzc7ZQplXkC99gP15+5IEAf3wzmbnd+ECbSGkqGF4=;
 b=inGfPxOcbEJ90gZ5Y1TUKumimyx8ulSLfInLPtDTs5RCkf/HnadO1xBKssLKGy3+RS
 EmdvTD95NC+FEFoSvNxLX+GgbnVwLjScyMQC9KZhFgYNwzI4XinvWgljrSry7ZkgK0g6
 r9ssj4VCkeD2zI+Ryy1SKtcU+lMg2X+9jUKE+hDD+MDqz8hnyv40NAMyGat5oKEH0Uod
 wWiPaTAVvHaT01eiGzuSqD+oagojIG7mhRZQA46IPES+SrcRUQn+U7rgK1WQq8ueH0xl
 AK1L2vxV/rc64bDFN4JTrxK59Y7Krgnkxo3iwUlpcNBijYjy+pmSs/907WyPdQZdKVre
 KyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRuzc7ZQplXkC99gP15+5IEAf3wzmbnd+ECbSGkqGF4=;
 b=DeGfWBKq4WLOjtQL+GELR2tH3Nu95al0yixqfUnb16s3dXyCTTwW2Nal1ZIFNeS5hE
 seEAHrPePWHRdRL7u3KR44rgDoqYRpidPgku6B9DCRHfjrcmj9XNfJuARHPoBdJlFvqZ
 uI6gP4rtSFbO8GxpPIxIOVdNivIl5G4QphV0MYcs46Eb5eWKxztBCkhD9ej2zirbHo5j
 9dymKlXpZMTyKOmdp0plqJAh9Fr4YAeNDoI34VJ6pO2xDy4umIS4Zv7azUUwiGux6b3M
 HIvlqluF4ZSwkkj4Ko82Va5ZtJNb8BoBs0yuyLS0oF39JmqoZx+3sfBKWMcv36ReCljO
 seZQ==
X-Gm-Message-State: ACrzQf3k5K2caav+uvGZU2EpIlcUl2rkRH6slLNB403ZOOAw4q5MeUV7
 eO2rmqP4kUgUNZ/i5SjPpmFILQ==
X-Google-Smtp-Source: AMsMyM4YDzTwETsnrwpN0V3qIYvp4GRAMQH6m1TA9Pq/gDdiCR7mVgDZZs049uQ7uo3Kamy4Yvwlbg==
X-Received: by 2002:a05:6808:1451:b0:359:6a5e:d147 with SMTP id
 x17-20020a056808145100b003596a5ed147mr13591819oiv.142.1667195165245; 
 Sun, 30 Oct 2022 22:46:05 -0700 (PDT)
Received: from [192.168.108.227] ([172.58.142.196])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a056830045600b0066210467fb1sm2469002otc.41.2022.10.30.22.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 22:46:04 -0700 (PDT)
Message-ID: <49f41916-687f-b9e5-2de7-9c658fe0d4c7@linaro.org>
Date: Mon, 31 Oct 2022 11:07:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
References: <20221030225006.43203-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221030225006.43203-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/31/22 09:50, Philippe Mathieu-Daudé wrote:
> 6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
> (see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
> ISA support in QEMU"), however today his email is bouncing:
> 
>    ** Message blocked **
> 
>    Your message tostefan.pejic@syrmia.com  has been blocked. See technical details below for more information.
> 
>    The response from the remote server was:
>    550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]
> 
> To avoid unmaintained code, I feel forced to merge this code
> back with the generic MIPS section.
> 
> Historical references:
> -https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com/
> -https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc/
> 
> Cc: Vince Del Vecchio<Vince.DelVecchio@mediatek.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

