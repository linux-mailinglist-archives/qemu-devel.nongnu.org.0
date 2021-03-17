Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D73633F8E9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:15:11 +0100 (CET)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbdO-0000Ug-Ed
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMbPF-0002z0-Ju; Wed, 17 Mar 2021 15:00:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMbP9-0003Vl-VS; Wed, 17 Mar 2021 15:00:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id e18so2943543wrt.6;
 Wed, 17 Mar 2021 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RfYQkNDI2CePM1bVdUco5MnPHa+DN+iB58ilrdwb7w=;
 b=n6fIJMlQT72PJuGuqctQjtr/0JsNqx5pc92dXpBFKYtCZB04s/X7FtLmfZ6+EUv0Rk
 a89WqmldCWTIVzXOWEEl5SNO1QY6EW1PI0OqMDD6Un0oA1rbnY7gPXc3KHJ/0oieULeI
 KfVoO4rr4D+aEoVh+Z9r5YqGT8Xuuorsgu8+pc40KiCPPNod8bskiOeiX6YZUbu/BIKo
 SrKYUjrWv0LSxXUZcjO9BcJuzd/UUAwIH5/6Lb+3vi70gRg0kyCAVxO4PtD9T3aLqAsv
 GyWDwwZFUDwgLW0Qvf9CwoBYfnR+GVd+EkE6WBQR1qMBijMwNTosZoXAELw2axadLHck
 Cqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RfYQkNDI2CePM1bVdUco5MnPHa+DN+iB58ilrdwb7w=;
 b=SBy0mnprAzSc5/rdVhMHapC38ujMYJ0RhwItycCURZkdXPeo8+PpklIcW4rfVB806A
 0yZ9sOJS6n49DID8IIkS5VXyNBnT5ZU7ZcyK7Q+wIqFaLI26wLN0pYYjEpg9GxIWmjfP
 QD2qSgM+EGceqaq/125OkMs2RW/DGy5YWIQ+74Eau64UT9sMv2lrYRA7DMMe8oIrBXou
 zIJr9+V1nKTPRd8oe1VqZ6s0P7U7HDfJ+w7x9GVDrTnGG32atuIWZzLvFMqXmQbJYcQF
 dLnPbhGiVH9jcnyzZVnJQ/ninV9KHPr4/fPika53+JM8TNxTB7bs225fNKaEVjr3evY/
 m+Iw==
X-Gm-Message-State: AOAM5325Q7/3a+y1y0zt4nXb+SUkJ85XoHBYiK74mBo8UhO63vsJ/lK+
 iiEJa1HOX2bOEOGrvmEs1rk=
X-Google-Smtp-Source: ABdhPJwR/8sPKcbOQfSumkY+mthBUzdx8TQWP8uDEhCQSbuTOCMWIqriup6IdTuVHqu5PpwvA6EmLQ==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr5747163wru.78.1616007620954; 
 Wed, 17 Mar 2021 12:00:20 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h20sm3264629wmm.19.2021.03.17.12.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 12:00:20 -0700 (PDT)
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Do not sysbus-map mmio flash region
 directly, use alias
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-3-f4bug@amsat.org>
 <871fce3d-8b3c-bcce-6170-9010b1ed7d5c@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38ba72b0-ca80-11e9-3933-1da563748a83@amsat.org>
Date: Wed, 17 Mar 2021 20:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <871fce3d-8b3c-bcce-6170-9010b1ed7d5c@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 7:30 PM, Cédric Le Goater wrote:
> On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
>> The flash mmio region is exposed as an AddressSpace.
>> AddressSpaces must not be sysbus-mapped, therefore map
>> the region using an alias.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> That does the trick but you need an extra change in the model. 
> 
> The fixes are in my aspeed-6.0 branch on GH and they survive the last
> patch of your series :
> 
>   [PATCH 5/5] memory: Make sure root MR won't be added as subregion

I wondered about changing DMA_FLASH_ADDR() wasn't sure the tests
would use the flash.

> I will upstream for 6.1.

Thanks!

Phil.

