Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712E3206E6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 20:25:57 +0100 (CET)
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDXt5-0001Oi-P2
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 14:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXrR-0000vk-FW
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:24:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDXrP-00086G-Um
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:24:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id l17so9915007wmq.2
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 11:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d3ii6l5pcAQ3njlAAX339d840Og6DIyf0M6e26qHthk=;
 b=VVMkTeJxi2b6ff8Pot+cwNUGh8taqRvAds07dXpXeIcQhAETQ3eQ9hWKW6gcbcm+lv
 njBDSNKvELlhGEp7kfTy7Mb3pTy5MDxP7mvvHF6BzWzMTH0K65ZqHiRg+O6nz9D1TUo/
 b/r7rJrchM3IDlNN1pz+h8Gl/wQJNmhEbO1/VQZiA56FFtX87/tSrXJFW56JhQGftqiU
 PF+/3Jb9OEk3Xs/YddIW9fmGgMY1r5MLPWOd89tlHg/dyoGNE2QqRW4vD+0BPS2wC+p0
 WYOzOyuEeVoYXL8BNg2SgrRmGRUlC86bfJvnPg+jK6Pfw9Tq33mFJTtwLR1GAo7wJxQU
 fkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d3ii6l5pcAQ3njlAAX339d840Og6DIyf0M6e26qHthk=;
 b=prqRsTT9AvlFFxOX4FJn2O14W3fWnC7dkcYWEDtV4mFrss2mU6EvPrb9ZYpx8UoS8p
 zRqE+leHdItcwauflbznKp6BFthiKZuKKioV4DNHi90zgcoQ3wWYbCC/Lsn7zN561XOb
 okhsAMT6qS0fXXKz0n6qpsULBvfGOtucqY990XWGbx/wVza486xylEBN7yklQC62Zmv2
 Zo5Ox3Gt+M/GxtEDWdK76LdZHgZcvrGmrUaxivkz0fjZ8huG/SfFDnnne8d4NvuW2SLF
 uPY8yuEZJSDXbWUcnJIFCc98yg1TXiFT6ybhoxttGaCsXzEEP6nP0QbX7kXJcK1Jy6Rw
 Ogug==
X-Gm-Message-State: AOAM533+VNct0w386nssDpTLISm5YbIjSVRap4aNtBPnhKpQ6UaeVgV7
 XRbuoQAWNThJoYfJm3wtxOA=
X-Google-Smtp-Source: ABdhPJyZA46G+80ZGWsCiMGvPWnJjH6gVQ4627vAq15ctkKd1ytXrkx+4YtfS/y9FR0McprgBLbXEg==
X-Received: by 2002:a05:600c:35c9:: with SMTP id
 r9mr13463082wmq.92.1613849050244; 
 Sat, 20 Feb 2021 11:24:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h19sm16790955wmq.47.2021.02.20.11.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 11:24:09 -0800 (PST)
Subject: Re: [PATCH v2 09/13] vt82c686: Fix superio_cfg_{read,write}()
 functions
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2d5607d-29b1-a702-1268-dfbe59b1f687@amsat.org>
Date: Sat, 20 Feb 2021 20:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/9/21 9:16 PM, BALATON Zoltan wrote:
> These functions are memory region callbacks so we have to check
> against relative address not the mapped address. Also reduce
> indentation by returning early and log unimplemented accesses.
> Additionally we remove separate index value from SuperIOConfig and
> store the index at reg 0 which is reserved and returns 0 on read. This
> simplifies object state.

Again... Why are you putting so many changes in the same patch?

I split it in 5 distinct patches trivial to review. I probably
shouldn't spend that amount of maintainer time with your series,
but this time I did it, my bad.

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 63 ++++++++++++++++++++++++++---------------------
>  1 file changed, 35 insertions(+), 28 deletions(-)

