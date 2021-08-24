Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB33F5C00
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:24:09 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITbE-0006Gp-0I
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITZx-0004PW-Kq; Tue, 24 Aug 2021 06:22:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITZw-0001So-3x; Tue, 24 Aug 2021 06:22:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id i6so6750313wrv.2;
 Tue, 24 Aug 2021 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p2UX9W5MONyIpO+iTH3a+HC08jNHyBB2IVRC0AfcjBM=;
 b=BdGfAePAf3DMKxhSUnrOWAwvMfANUF16hVC9TIRL5onFpX6kTtBUs5BFx55adabxAm
 cIjQctaClAeVkgUn99I0A8RXtHih1x4BP8/cjUPBYMi1V3hrv87urhLi3Ibsnpv8n1mf
 QH4jcxABZqvlB9v0ZOdHkavsc3WYZ9wMZHq1Nbivi8xPiMe8d39nbihk0oQW/BHXZBAY
 F8+LgNWBOA2U6ATqS9idBHIt0b7R9z0pmSfBCBrw0G8ivsZjLKO9Dq3qe5CXwjDQTmXG
 WmfaAZB8Km3rMQFH3l9SwKaf/9yM0M92fqUmfUo18xP9NNq6xXwaJn4qghgpUB6qPoZ9
 jiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p2UX9W5MONyIpO+iTH3a+HC08jNHyBB2IVRC0AfcjBM=;
 b=UKVf0RDvbzMbL2kcxbh7sIMaSy5AX1ephSMPzASaoldBccBcJrtwHbbkkOD7CGMxw6
 U8GF2GIit4qWPE/JT9bzsm8G5IWB0IAvpdwkxuHbbDsj1I4G/1dZx4NeKyuet1OR/N3S
 GcDUXKTj9DdHqB6mFWIyuTIN0pw9alMfQUAkc3KU9RdlVw1f/XOorpBiGJKMO/WqyNml
 0Yz9CduYU3OKPbH2bPP/wpN4yrzFyMjOTZ99I2yiL1wDyeeV6n5yp6jT3oZAye+V/6co
 icFgLZJn9ULq93i27ve5VusIocLQrnkylFXeBQGl6TXtITV3dJcrNyNz844+hqaL/O2M
 U5TQ==
X-Gm-Message-State: AOAM530fF5SKDloiPiAsmVN6yALqlIOmyPCRQ7wuPe8/4aNacHrvtR6k
 jO+b8c8bdJcOl1JTeQa+K6OkrFmUX4o=
X-Google-Smtp-Source: ABdhPJxDdb/s3COeaYlciQcK0L9EDnVspGYpVPJCqQ4HervuDHLNCzTklfI0bWkRId2d2iNmrbE1ZA==
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr18706608wrm.173.1629800565650; 
 Tue, 24 Aug 2021 03:22:45 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a133sm1889684wme.5.2021.08.24.03.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:22:45 -0700 (PDT)
Subject: Re: [RFC 08/10] hw/mos6522: Call mos6522_update_irq() when appropriate
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <c886cdc2911f250c3e8e15ceb717124c7044b50b.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72321786-8179-da83-2d50-e60ba781163e@amsat.org>
Date: Tue, 24 Aug 2021 12:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c886cdc2911f250c3e8e15ceb717124c7044b50b.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:
> It necessary to call mos6522_update_irq() when the interrupt flags
> change and unnecessary when they haven't.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  hw/misc/mos6522.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

