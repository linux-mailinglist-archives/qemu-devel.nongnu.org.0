Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B63FEC27
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:30:39 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjzS-0004E9-Es
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLjvo-0005VX-K4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:26:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLjvm-00058f-RS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:26:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id t15so2079389wrg.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XB2ySMwxaAU8AyEQvsNP4iD+kPPISaMwOkV++8A/wTE=;
 b=A28F4WeLOeHh68DkE2xnK7wjvUmXnxxMtsi4ghDF0GlR7z9EbnJs0bWDgDDJRYF/7m
 DWZ0t2P5x6eOa2BX42abf6IbQOpfK656rvtfvJJy0MJohH40Ba0AVeKAwi6ZckNaST9C
 Gg1o06466f76QScnpcP4lctL6DOCt9IqQ4/dStadwa8V085+v4fN78iokUKGlRXPn2p9
 IZvwdkLqyp1nVMrkzVbYc6dqr1OpnuMVJg3LpofROOV8ua1oxuVz5xZrHIDvj57H+q7N
 Q1pX2S/H6kc7y8V/CJidHUBDo0WQvw9mq5VMOussZnzk+Grpd4Lcx9H4N4hbhIZP37LR
 Gmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XB2ySMwxaAU8AyEQvsNP4iD+kPPISaMwOkV++8A/wTE=;
 b=Wk7RNYD+QF37hugi0O46McowxP+W+xmwI5xgphKu+B+TzXgUT8BxtRWY6JrjR6XJWT
 mDJ0p+lccEzIdQMWwbcB4fYJaabdOXf/xwoPYGUkrlFi2HKtLBehW5JZ6h1ZJr9Xnanl
 /L4sbCkBGft7ruSJ8tI5b6qkaKlDEz+eusOQTPubwyTPcVts8dg3Fdr9p1g1IYbkNHhQ
 u/2mQjR0eFogJyeyAz534eF/O3ANtW6cDvkxtw2bHzB0II0c4xTRLDngYuSw13mVmxrM
 dORwclLWAnYawMMKRkXvs24SurdHeuLXnxY/D/j8bgl1bAPFp9IyKD7meFbGulCtBJqL
 o/RA==
X-Gm-Message-State: AOAM5324RZ7ywViqdWlFDGFeLarwcE3F9Yz56CefNz8ShYfaLJRgzX1M
 A97z5PWtsDXDqb7uzTwvCH6JnTph3/Y=
X-Google-Smtp-Source: ABdhPJwplxI6cgjjk5kpUksWAty02DJ/Idvz3tdOtYUOxnoTnt9WLDwLyk041MvfUrKt5+Z9pmwByw==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2755348wre.39.1630578409628;
 Thu, 02 Sep 2021 03:26:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o5sm1392569wrw.17.2021.09.02.03.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 03:26:49 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] escc: re-use escc_reset_chn() for hard and soft
 reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
 <20210902102205.7554-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21a098b5-7237-7540-955c-70fbb7f384bb@amsat.org>
Date: Thu, 2 Sep 2021 12:26:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902102205.7554-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.029,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 12:22 PM, Mark Cave-Ayland wrote:
> This removes duplication of the internal device state initialisation from all
> of device reset, soft reset and hard reset.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

