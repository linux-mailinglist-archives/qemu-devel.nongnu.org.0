Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B018E3FE928
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:11:52 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLfx1-00039e-Qa
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfvh-0001U7-9L; Thu, 02 Sep 2021 02:10:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLfvZ-0006ql-5C; Thu, 02 Sep 2021 02:10:29 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so978732wro.12;
 Wed, 01 Sep 2021 23:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=afBDYMMzvRCGDu0890wsshYdo3ossZ+D1eKT4Qv/I+w=;
 b=A4UtUMBG3Hzqac8y9/nRQmAvoqHERZu0efoGgNIc95U8nrL0tSLhZsTqbYrUNyca/L
 VfTVCSZTgjLMul01RGawSJZmn4wVZUl2gc+BceI5a0CbVvCmURStpn8xzTQG4IdjrsL+
 QBB6JKfk66i+WLA1ug2KofQtZ81rAbybfgxhtU94OuRZD6UHfyStWG58bPDLE2cFRqTi
 IFdAsaUx1iEmKOPQdlKkSoAnoA801pJSIeGPtzIDZ6AY2L5R/DaU2yfJ7HreGUg+0mcE
 VL5+Y03ayIewPLI0Dm0ptkeLFd8rkyu6Frnwv35nR1f8lHrQs+4WGVmMQx42O00RD28m
 aLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=afBDYMMzvRCGDu0890wsshYdo3ossZ+D1eKT4Qv/I+w=;
 b=iQ4hIFgXZ0O9JI84yY0T9R642+MZR5OhoCRYZh03wLL+OFrfCgIOemICEI+clXgytP
 LI2HKJB6kcf5l2BC/BaHFV32ytu1wsEioijtBd3peqN25tQQt+/yDiZi7M8VBNQ5H1vS
 sFNFEDncWuJZVlXZ6Y2vnLp6YFp0l0UTUxatRRp7lH1yWrNLL7EKSrgN2URSBuy+sT60
 wUFk2b4YbdBmTY39qikyqja1Qpu1Gy6cb/I3YaCHBizxXfxUlDAjzYyFbL8M8338yJft
 109HJMfb9Fj28cEPirn0gq+WbZfrM48CqdwDA8rTEYjje1gj8P6TTMHzutEcoE+TvGzE
 kH3A==
X-Gm-Message-State: AOAM533xHMy79USNr0DPfgVLJep2xtjjwB+fmuZiiEsJ7zRHlvzHzE7i
 heAE4MJXfDMf0J3+h7LXPFV92V+VAZg=
X-Google-Smtp-Source: ABdhPJzvCmtbHzb2t1PKmq7tgYGqpzDHFokIECyPyTvUod9of3pvX4KXVIFmFumoW3oqM/w7u92+ZQ==
X-Received: by 2002:adf:c149:: with SMTP id w9mr1605106wre.126.1630563018806; 
 Wed, 01 Sep 2021 23:10:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t23sm821156wrb.71.2021.09.01.23.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 23:10:18 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] hw/char: cadence_uart: Ignore access when
 unclocked or in reset for uart_{read,write}()
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-6-bmeng.cn@gmail.com> <20210901083251.GG6340@toto>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e17d9911-2c45-221c-7a05-2dc3c2fa22ce@amsat.org>
Date: Thu, 2 Sep 2021 08:10:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901083251.GG6340@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 10:32 AM, Edgar E. Iglesias wrote:
> On Wed, Sep 01, 2021 at 11:27:24AM +0800, Bin Meng wrote:
>> Read or write to uart registers when unclocked or in reset should be
>> ignored. Add the check there, and as a result of this, the check in
>> uart_write_tx_fifo() is now unnecessary.
> 
> Hi Bin,
> 
> I thought I had replied to this but it must have gotten lost somewhere.
> 
> We've got SW that expects FSBL (Bootlooader) to setup clocks and resets.
> It's quite common that users run that SW on QEMU without FSBL (FSBL typically
> requires the Xilinx tools installed). That's fine, since users can stil use
> -device loader to enable clocks etc.
> 
> To help folks understand what's going, a log (guest-error) message would
> be helpful here. In particular with the serial port since things will go
> very quiet if they get things wrong.

Interesting, I was expecting this error to be reported by
memory_region_access_valid() but indeed it is not in the path.

Alternative is to implement MemoryRegionOps::accepts().

