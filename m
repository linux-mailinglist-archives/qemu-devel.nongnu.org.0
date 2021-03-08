Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3333109B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:18:53 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGii-00051G-2W
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJGAB-0000KM-0n; Mon, 08 Mar 2021 08:43:11 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJGA8-0005n4-TK; Mon, 08 Mar 2021 08:43:10 -0500
Received: by mail-ed1-x529.google.com with SMTP id h10so14827759edl.6;
 Mon, 08 Mar 2021 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ip7fFtm6uT1J3MZdzmllHivAdvDKMGFOkrMfVJMWspg=;
 b=rXHlstHxZkhbwmRznHMIte1nEdM7gR70G0DZy5l1qwZVqc2FEivhZtSpj/HTydkeuq
 Gnjvu2/kqIfh+oLzwh39zm9IO2sTyYFhhZCLogk5Ffb+FuEeOhjWhYQP+hf5B8kt27wi
 mxf0BocrCCeohSPCEWICQyTO3oIsICueaY7ZhyiVahJy9YKeWC0UYf+EYn4+dQ+dYN4y
 W7Kwvx2qucbf+DRTiCF8dB6GW8NZMay+hYOAAFxtxWMZIKO/f94UFgM7E7CKcRsPo6Tu
 Ruioid7YsJCEp8Lo39gJxqNR0xDioVv7+wei/g+9TWdTiBvR1Scp9NlHrAnHpbA86cNs
 Brwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ip7fFtm6uT1J3MZdzmllHivAdvDKMGFOkrMfVJMWspg=;
 b=KxpgTyVXoJ20bPwsjOdGmX4BXACh281Zh48zBOyKC7aNFQ2xabYbC857pU3kn/cIOY
 jJx00VvwPPK9ixQSGoL0jTa1mLzvOUGjmyl4xEG/54w1dZ50NlAZb+IzviuDhqLICd4q
 KHaY0wi/hs5b/ieNojvwxhw2JZOOMNJY6WNHlsSnCK1sl2aRYMWcDyxXHt3sSokN5hhF
 Ma5D840B8ogdght/v8CuCQ25+6R2eyWnigeMJLUBa0uOHQalznjI23oAIqyYWZZbI0xf
 bqAvMmA0kzBBa9ctPL0MIarHphvfvUzKPZ8Imx7ShSYrc05KC1AGXsABC3Zkvajobx5Z
 eOMA==
X-Gm-Message-State: AOAM531WEjJL3GaBDaLqWlhbr4KCgZBe76GFxGVMyFQAl06Pte76Wn6H
 4Xbce8SWLtxTkhD43RZFEbwmKKWKgls=
X-Google-Smtp-Source: ABdhPJwmYT01JsXNSxj4zqShjhb09HawG/j0LNwWWVwqUOUcLUAHrE3bKy3KWQrPrw+STEwgbo4tjw==
X-Received: by 2002:aa7:cd63:: with SMTP id ca3mr16045080edb.265.1615210986705; 
 Mon, 08 Mar 2021 05:43:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v1sm6518444ejd.3.2021.03.08.05.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:43:05 -0800 (PST)
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
To: BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
 <97399e18-3217-40db-5021-702371d196bc@amsat.org>
 <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
 <YD7Wl/21vn7Dkizg@yekko.fritz.box>
 <bc813a4-51f6-7893-1cff-294e231f743@eik.bme.hu>
 <8d55999-396-9f7a-6dc-88b1761d1e9e@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bac27957-6321-36cf-4389-5d4530b20b38@amsat.org>
Date: Mon, 8 Mar 2021 14:43:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8d55999-396-9f7a-6dc-88b1761d1e9e@eik.bme.hu>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 12:45 PM, BALATON Zoltan wrote:
> Ping? Is there anything that needs a respin that you're waiting for or
> you just did not yet have the time yet to merge this series?

I asked you to split patch 4:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg786871.html

If you can get Paolo to Ack patch #1 and split patch 4, I'm
OK to queue the VIA patches via the MIPS tree, letting this
single one for the PPC tree.

Regards,

Phil.

