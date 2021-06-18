Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3733AD53A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:32:10 +0200 (CEST)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luN20-0004yk-RH
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN0d-0004D2-BH
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:30:45 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN0Z-0008DY-G8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:30:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id v13so5425107ple.9
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dKDcmqPANCUaNT+yxxqTymyy14RE/asw+iFPuKeW9Hk=;
 b=VKTvzQQL9pKCK3FODmCkQCK0Cx/DNLvSesZHMvmSO+0hfcy3avZjWdp/SPtz7oYMdy
 pt9UofnTBSF18KzYENaJ0X0jNTJhqLTj7hYLf+2ceWk2CX+OhMpnwxSbVx8kN0kn9jbE
 8RvuIcMPNCZPBR0nVueNok2lH1Wn4+MQXtzU7iZThb6vU/bMUTvHoXIg2wVAwFieY96P
 /kIqhrNeQ0lB/ikYXBv46tsYD4F8skk4EBPmPAMayhSDBR1YinnQpQtdIWmnsoDUgSX0
 sUqInsZXOa06VL/SJNYWYh/Bk1e6VBn/QSMYKDaGNvgJWdVqOB0a92cvaY0TScbB02c5
 xw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKDcmqPANCUaNT+yxxqTymyy14RE/asw+iFPuKeW9Hk=;
 b=oBhSPCgb6IhXVH7v+aucWjpC5NiUKDZhe6fY3nqJa8JjluId8wXmQSf+xbTOJTtytk
 z7TsDQPV16gebnaWzQdHb0Jf8HhO/7nJ0rKnzR0OYcXJf+aDsIP7EccW/s0gnKVkZ1rX
 WN6Pmn27YxHTwhIyndJfaWSa6Lx8wyO4U9kLz2FWGfycEF4bhBTnfoLOR48OdrdoIwb8
 dihuE4e0/xdFPRqlKB7N+wzjE9FZUpO7pWBNwfYlzaI3ceGDZAl+4zXfVbJu7rQDb/o+
 dzkHD5XkkS22UPjHtocvFY+fqeK/cgBOdepbCX29vIGKexx6RXrryB4JwPk7mFhxC7S6
 If5Q==
X-Gm-Message-State: AOAM5302/985v9+HDRFCUacvQ/mbhU8m6viv+I68eWZsm//3GVmp3SQ0
 g7ym09bqVFMMcsSa0zgVudLgWw==
X-Google-Smtp-Source: ABdhPJzsGftOiBnblK7y6QdyHxspfcNC8lgChtICkhUCReddIoynKvLGjM7qG0Hga98rn+jieX6CUQ==
X-Received: by 2002:a17:90a:e00b:: with SMTP id
 u11mr10346723pjy.53.1624055436768; 
 Fri, 18 Jun 2021 15:30:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 12sm6458306pgq.3.2021.06.18.15.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:30:36 -0700 (PDT)
Subject: Re: [PATCH 1/9] target/mips: Do not abort on invalid instruction
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4f0eb82-eac3-01fa-61d9-24ab9328aec6@linaro.org>
Date: Fri, 18 Jun 2021 15:30:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> On real hardware an invalid instruction doesn't halt the world,
> but usually triggers a RESERVED INSTRUCTION exception.
> TCG guest code shouldn't abort QEMU anyway.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



