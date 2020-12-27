Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821072E319D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 15:57:24 +0100 (CET)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXU3-0008I9-Hq
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 09:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXTF-0007sJ-Mu
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:56:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXTD-0000xS-SO
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 09:56:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so7391085wmz.0
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 06:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MVQ1XDqkNrurUZmFR58tftKrKT+E2YeWa8QwBg4gEzY=;
 b=RbfuJTF85jk/n91v8BLHgyaAMyLFV3u6JmRlm9FkTOaibh0lF9A/G9uSbUXDt+gnpt
 fcYWDnQQQwXCun7dIVbq/BbNHBf1OlP1NJQIHFtkQ/Z2oytSFGpcJ5Rk6qIPao79mpk5
 azOWwljTOrHNnYmG4RvaazUBhz/T8asQO4LCi5XtXm6gOVwsfyllfdYFoeqTSZ/1LxBr
 8amykhaia+U5sbCRnhoRlJFB3y6P9NNDfIDL9M0+s6D5DIfHhFrL4aRiYvDF4e5nqoSz
 pmotwoqyOtoBTkQwOJ1HqqINf2ivGE1tI1hBVNcytiO2mVytGRVy7cleYee09E7jNmGy
 CW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MVQ1XDqkNrurUZmFR58tftKrKT+E2YeWa8QwBg4gEzY=;
 b=K3NK1FqKHJSU/rDuwMk/m9/OJvhQm+xMFVrH5UtzALHBM6dQ4k6mqSydKCJVK97t6z
 hvvmXsVxJahtIukWpZCFyxrUz/8B5L5KfeFa3Fss0ORnWr9YOqi3Yetihlefs/Fj4P5M
 3yX8VfoFNil7fZQ3EGbinTNRLCOPviqSwhTE3xtr4F/Yng9KL81qEaXnL5druoK/zitd
 CuqPt97C52k5il/3V7B7R+3LWq05auXOpqP31J8QS1AqSOn3LZDyfCLyWmwk7Pds8sg1
 KVqDA6Qz2wjpT1GvCD88BTJszwpKOxogFqsRAIZCWoRw3mLKkj6Vdu03tR0bByM7AwqD
 CUOQ==
X-Gm-Message-State: AOAM5305D8XQQ5DjZkGDitefa0WwRfMlcOXWBXtdxrxTk78iETmgvqWO
 EwaGOv6+EluJYYZaiiuvrSE=
X-Google-Smtp-Source: ABdhPJwWQEF0jHlibuvtZFrqbk41jtpUSN/bMgXKKLorNDXZzuf8Pm7USoz5y034CqRP/svFjrxLbA==
X-Received: by 2002:a1c:204e:: with SMTP id g75mr16934934wmg.100.1609080990509; 
 Sun, 27 Dec 2020 06:56:30 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id j10sm16663128wmj.7.2020.12.27.06.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 06:56:29 -0800 (PST)
Subject: Re: [PATCH 06/12] audio/via-ac97: Simplify code and set
 user_creatable to false
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <717bd2ed67a42476fdb4c6132d7c351eb9f54282.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <59478f83-35ab-6610-5233-dd300fc8cb27@amsat.org>
Date: Sun, 27 Dec 2020 15:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <717bd2ed67a42476fdb4c6132d7c351eb9f54282.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zoltan,

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> Remove some unneded, empty code and set user_creatable to false
> (besides being not implemented yet, so does nothing anyway) it's also
> normally part of VIA south bridge chips so no need to confuse users
> showing them these devices.

After contributing during more than 8 years you should know we try
to avoid to do multiples changes in the same patch ;)

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/audio/via-ac97.c | 51 +++++++++++++++++----------------------------
>  1 file changed, 19 insertions(+), 32 deletions(-)

