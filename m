Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6534AEC4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 19:50:51 +0100 (CET)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPrXm-0000GW-Vd
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 14:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrW6-00081i-Ld
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:49:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPrW5-0005D5-52
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 14:49:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so5407092wmd.4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 11:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DP/09gEFOXqr1jz/v9qo5t2dsnjwkskZ4mtSnvvRGEI=;
 b=MSofZ3e6D/Mxp+pfZW9LaK2J6jHt83Wie2f3axroSBpJiX++wzWBbd528FxQqeFj+n
 zUWFgiPYupLDt13PXuxTUSzliqtQflYwAHM/SXOgngJ0kxMDJmgdK9sy49LVHSRIZwwu
 8vcdr6D4JL6Juy12a5rKJeSiYGK2c1yzRC4gFA8htIvGdlmgC60sbdaA0UqOOif0Bl33
 NZ+wuc6s2BzkwWhUHB+5XkmegzfBdx17TQn+OfTnLiffkYYQIhcQRG2tb7yXXaOumqDl
 PJi+TgHIvHC8qcz64JXWZGCpejzA7lVTdqWSACZ5pO3SS/Eu0R45WsZaG4yUTiAWyYYC
 jezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DP/09gEFOXqr1jz/v9qo5t2dsnjwkskZ4mtSnvvRGEI=;
 b=K0qNxW1wrRnTUh3sRQMlSArmR2QeZI65X6ylZsqrNu3YNBcynB2aUHP6Xv0wglT4i0
 +IfnNFCEsC1FwTg41q2uxKOQVY72k4we8twepKILyWWNjBmE2qQOIaQrQf/9yH+wEdMV
 JnxhyvhrpMVuUok1KLm6qnOdBaz6r7Cau4tg6oPMyCkK/vFQCVdOdIJLYwb0Ph4ysBUg
 RomGFB0ZaCASNvDiDq157brMnbZUC2r3UqT+7arE0/tf9AqzK+pp16HHZB5axEin4kub
 cC1Z9xESrUCPvJWJUE+tamPEDTvFOyFz7ZTtZDfzhL8ghbC6lILa0iec/pcDPPeybGu9
 iOAA==
X-Gm-Message-State: AOAM532FW/f8LPRsMP+x047gG3RWJDO5uqBHOVG3yW6SE+qkzdn+LQ8f
 PHVtAaL6eFhMOUhanU8V/aE=
X-Google-Smtp-Source: ABdhPJy2i23TCzIu6VRO2+FhEHV+D/AppoqFkSniVIuSdjzQ+6AYW7bKR5R91nyhRGvjMSpWXRhjpA==
X-Received: by 2002:a05:600c:4150:: with SMTP id
 h16mr14281522wmm.120.1616784543776; 
 Fri, 26 Mar 2021 11:49:03 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p10sm14550265wrw.33.2021.03.26.11.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 11:49:03 -0700 (PDT)
Subject: Re: [PATCH for-6.0] hw/timer/renesas_tmr: Add default-case asserts in
 read_tcnt()
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210319162458.13760-1-peter.maydell@linaro.org>
 <CAFEAcA9hz5ZsetCWMGJd+aX0td6vE7YiAW+x2C=K3mCsdWiJ8w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aafa7c42-333e-60ce-1323-5623536d7af8@amsat.org>
Date: Fri, 26 Mar 2021 19:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9hz5ZsetCWMGJd+aX0td6vE7YiAW+x2C=K3mCsdWiJ8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 2:34 PM, Peter Maydell wrote:
> ping for review?

FYI:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg790977.html

> On Fri, 19 Mar 2021 at 16:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> In commit 81b3ddaf8772ec we fixed a use of uninitialized data
>> in read_tcnt(). However this change wasn't enough to placate
>> Coverity, which is not smart enough to see that if we read a
>> 2 bit field and then handle cases 0, 1, 2 and 3 then there cannot
>> be a flow of execution through the switch default. Add explicit
>> default cases which assert that they can't be reached, which
>> should help silence Coverity.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/timer/renesas_tmr.c | 4 ++++
>>  1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

