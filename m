Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7936C693
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:59:34 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNJN-0004XZ-Jy
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNHv-0003s0-Ej; Tue, 27 Apr 2021 08:58:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbNHt-0000io-SF; Tue, 27 Apr 2021 08:58:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so59391261wrr.2;
 Tue, 27 Apr 2021 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KHd61M3JWjyC0iYLpStsP0MB3yUmmvivy/vDBxuJOeA=;
 b=bVqfQuqUKcbDI+gwvADMiaCO6Wy0jt1kp1ibL8vHTvV0Ffpp5vaYdrxZmDlMxBNb16
 2llENK0MmdhTPyv2L6cZfjWL2VyTXA6TgNoFhIbvBDT2NkPBspyRrmamtxlX8WeOoFcy
 aMJWbZoVGv7KqLbN0dWKqEhz/nXIUP2X+O3H7A0OzMrgMsaT7pHyGdAnJIcOzdutX7JQ
 LxHUCTH8EojvhzqCgx5td1qIfYaFzGiLtVw+1iq9RMn4U7LKPFHv0RGvISvOgJxLlWbf
 gHbpQa0r68LYQ0xVwGHth2zw8aSBrGMAiHcBxYNInjNkhnz3efr3wnjQi1krD7BI/tuM
 /xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHd61M3JWjyC0iYLpStsP0MB3yUmmvivy/vDBxuJOeA=;
 b=cnvdXnDUuQD/+4TtNT7JnrQmtDXOkS9mf24u5/ZjmvPpTArv7LBp2xa4GUCswXSeCM
 g2ngdE5qxLsXZzR+5SGVYTMQcKx3gaW2XXlGPZDJ77324v6IW9dUHKh7LCbX4QsQSJqN
 n1fep3nX74gXp5vje/7NikC1c8YDZbrPn4g1RBkJn5Z/H8tl4jWgg1XiXYQGsFQ0YhrP
 8SaoCcIXYzul4slWk6gYBkFThELxgeXxlAArnaTLvM1f9tyMVvqttm9B5GJIggo4EeKJ
 YESwwTEIOvgfflZXNgos0Eu/8C/Dl9oopNOvxJsZ19Vv56qqsKXng32K08TU7Qd7U9Ay
 /eyw==
X-Gm-Message-State: AOAM530kNqqLn74tnThq4UMezs13rXVaPdxgwuUt9HpjqFKWWv1Zokh8
 fBQte3Zefkn5kJqwrN8onGc=
X-Google-Smtp-Source: ABdhPJyI7kMEBTlcUqaREkiqooKyOGiMQEee/Ujm3WiEYBX2/qgNUzR9PRxch+H8xEdAIMnRwAVsKA==
X-Received: by 2002:a5d:6a4a:: with SMTP id t10mr28770490wrw.422.1619528280119; 
 Tue, 27 Apr 2021 05:58:00 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d2sm3835075wrs.10.2021.04.27.05.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:57:59 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210323231358.396520-1-f4bug@amsat.org>
 <20210323231358.396520-6-f4bug@amsat.org>
 <b13580a7-be7d-d782-4811-eef8b6555765@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1921814e-dc9a-9312-4315-cee80e61375a@amsat.org>
Date: Tue, 27 Apr 2021 14:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b13580a7-be7d-d782-4811-eef8b6555765@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 12:43 AM, BALATON Zoltan wrote:
> On Wed, 24 Mar 2021, Philippe Mathieu-Daudé wrote:
>> Instead of creating an input IRQ with qemu_allocate_irqs()
>> to pass it as output IRQ of the PIC, with its handler simply
>> dispatching into the "intr" output IRQ, simplify by directly
>> connecting the PIC to the "intr" named output.
> 
> I think I've tried to do it that way first but it did not work for some
> reason, that's why I had to add the additional handler, but this was
> about a year ago so I don't remember the details. Did you test it still
> works or expect me to test it? (Note that testing with firmware only may
> not be enough as some firmwares don't use interrupts so only booting a
> guest might reveal a problem. Not sure about pegasos2 firmware but
> sam460ex U-Boot seems to poll instead of using IRQs.)

I tested with Fuloong2E (PMON + Linux).

>> Fixes: 3dc31cb8490 ("vt82c686: Move creation of ISA devices to the ISA
>> bridge")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/isa/vt82c686.c | 10 +---------
>> 1 file changed, 1 insertion(+), 9 deletions(-)

