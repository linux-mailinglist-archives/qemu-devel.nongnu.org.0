Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC736636F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:44:20 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1ud-0002z7-7S
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1qu-00011W-VU
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:40:28 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1qs-0001XR-SQ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:40:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id w6so12586480pfc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eWyOvO04i2E0Q5QcYRx7Uii+TpCWQ8qarpxIHixiXqU=;
 b=bDiNot0j3dzqwbMsrgQ0NJDySvMKI5Xh3cPsRgEetGw7N53JeGAs1S0vfV89DTHj2r
 3JgEQgd4BfdKPaxfajJg47dPpnxbNuUMAA0f9b+4rWH1Ec90EnK3j/SZr8XUDMrwAUIo
 AAdLUtrxOfPmAGDhClcD4USX1M8+KzGoZMYiV6J6y4VdpvcaOSeFhQTkfFzcFklxPnLW
 5EKexrHIYUs25gtll7jyUlEcEjas7jUBvnfzM7XuMX0dnoF2MBU3ZhJ/B4L9bG+r26WP
 SvTB1lCOoGSHuTfhsJ0KgRBKEaRFlIjZYjvxweSlPAo0Glg74K0KfsHxryjdwaL8L58m
 X1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eWyOvO04i2E0Q5QcYRx7Uii+TpCWQ8qarpxIHixiXqU=;
 b=E+ooduxZUOXqC8hU7CC2ilfGySuIh5YkEhBGbswQKW56Qek26UAyO1vo5pjgpUrkYo
 8mb4Mp+m85SDJAotOyj4FzKaPSi2xdZ6b4CvhB+tIRMGADV3oOuMV885bejJ0i8EdbPL
 mVP91ZW0UUa5djfnlVfYqQMAObjzkMvvQP/NLvsZq1uYITVpkf0XeVkYDK28hsPeTG8I
 ZmITd8Mgn3YMi+jpZ5oNSDZJXNpRFz4tB8EoTG14kI0st1QoQsvPOgiOHEHPbG/2Lldb
 5QfcM210qC8LcbqTAJYGSpu0T/oSmMRdMFXzrf9vSLlX9HpXnN++Z+dxkB+jqmEEIqu5
 yAIA==
X-Gm-Message-State: AOAM53127AMpqllNrksQDH3MOl7vppV93WnCSvbn5a+7J3BLpN72ueBR
 Yb28rszqs5i/5h9enOQog5GmRw==
X-Google-Smtp-Source: ABdhPJxcJUvDsK3oIUHP9wRYtdoTs8gPfnwJiymutRJ1taxtfmL49N1LsgMLrjMeGZQr+mAGenyjww==
X-Received: by 2002:a17:90a:684d:: with SMTP id
 e13mr7891197pjm.161.1618969225468; 
 Tue, 20 Apr 2021 18:40:25 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id e9sm236686pgk.69.2021.04.20.18.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:40:25 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] target/mips: Restrict EVA opcodes to system
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1409603-a4e1-91bb-8ebb-030facb01b1c@linaro.org>
Date: Tue, 20 Apr 2021 18:40:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> Enhanced Virtual Address (EVA) instructions are restricted
> to Kernel execution mode, thus not available on user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> RFC because I'd rather not use such #ifdef'ry again.
> TODO: have the compiler elide this code.
> 
>   target/mips/translate.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Yeah, I would approach this via a smaller ifdef in check_cp0_enabled first.


r~

