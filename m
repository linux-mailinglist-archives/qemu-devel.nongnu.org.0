Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856B43D2B7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:19:26 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfpOO-0006QQ-LJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dezgeg@gmail.com>) id 1mfkyh-00012E-UG
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:36:35 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dezgeg@gmail.com>) id 1mfkyd-0000rR-07
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:36:32 -0400
Received: by mail-lf1-x135.google.com with SMTP id bi35so6998335lfb.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U/4nY+vhmlEEAXndKBqzIWqlIJeRWcpnDOJfz6lmnoQ=;
 b=ifEBOicziUUcDaFDWrQO7m3Gf5eHQZYNmz/YsEaSTaj2SKMpKrbhLjdrk/EVJi+5r9
 fpwwAvNLcQCFuEav6X+yghFEvoe90ZUcqMcm2NRHWJUaFK8ZiSFyklkHkDiw8LOyajdD
 44JHy0m0KxKIOhd0Za0mh4uUGtgdqF3LU56wgIG0jncUJvcMJ1KKeFEF+DxoCaOaMDe+
 D1BHSrfPqQhoM0kIblBhJDetPzqqepG1vMAcmplvkYXkXuhwTGTs786tEmR6gqy8LCkJ
 J0XeTta8+bP9U01E8wx3Y6sNPv9vs8i0glzSloGOfTK5TxrGMM0WTvZW/P/Nj48dySs1
 aIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U/4nY+vhmlEEAXndKBqzIWqlIJeRWcpnDOJfz6lmnoQ=;
 b=XaXFn8UkuQtA6JsiQePJ/jwARaLR3S4oeC+igjkN3571n0N9qdj1QwJ5+Ii2mawYTa
 EiMC2f90px3pIclcenQHE4xjPcnrRmUK5sEWH58uie/hm6KxETcGOOn0Mbt67oMud9mj
 eowa32FDppUATXrs89KcQWnMyJs1HtMBILEfPd+WlhTLB3T84MT6g9TKXoUXEFaICc7I
 ZIPX3l0DenM+IWYrM1iWqiMWtJCWfNQvVmXKpyxUoiY43nK1PaCjsYCifvABIkj7AtlA
 LiBZeztq2PUKEU7mkK/U/SUPnJe5enTzWDEh5JZdlE3knHR6OndeC7+ucqOErVCmDzZ0
 WTgw==
X-Gm-Message-State: AOAM532SEmlx3R0ajuzixpowvuPHlfaivirx9hiY5g9/dCy/RzC3cdTv
 ZwhHi42yBXGZEbObIXP2I2/nCfkMyur1TfTOQhg=
X-Google-Smtp-Source: ABdhPJzyDb2i6QS7o/gMJ73issB1dtZuykwxewk8xaYsLOM76IZSYELZkIxPGHGjg9Nf4UM4zow/jA==
X-Received: by 2002:a05:6512:e8d:: with SMTP id
 bi13mr27597172lfb.287.1635348985213; 
 Wed, 27 Oct 2021 08:36:25 -0700 (PDT)
Received: from ?IPv6:2001:14ba:2100:0:22ce:a5c7:6ce0:1e18?
 (dffyyyybc56w8r7jyd4py-3.rev.dnainternet.fi.
 [2001:14ba:2100:0:22ce:a5c7:6ce0:1e18])
 by smtp.gmail.com with ESMTPSA id z2sm29966lfu.94.2021.10.27.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:36:24 -0700 (PDT)
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>, =?UTF-8?Q?Fran=c3=a7ois_Ozog?=
 <francois.ozog@linaro.org>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
From: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Message-ID: <a9ebcaaf-56bf-e3d0-eceb-64f205e12a84@iki.fi>
Date: Wed, 27 Oct 2021 18:36:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=dezgeg@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Oct 2021 16:12:00 -0400
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
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 QEMU Developers <qemu-devel@nongnu.org>, Matthias Brugger <mbrugger@suse.com>,
 Stephen Warren <swarren@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, Sean Anderson <seanga2@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jerry Van Baren <vanbaren@cideas.com>, Alexander Graf <agraf@csgraf.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 27.10.2021 17.08, Simon Glass wrote:
> Hi François,
> 
> On Tue, 26 Oct 2021 at 00:07, François Ozog <francois.ozog@linaro.org> wrote:
>>
>> Hi Simon
>>
>> Position unchanged on this series: adding fake dts for boards that generate their device tree in the dts directory is not good. If you have them in documentation the it is acceptable.
> 
> I think we are going to have to disagree on this one. I actually used
> the qemu one in testing/development recently. We have to have a way to
> develop in-tree with U-Boot. It does not impinge on any of your use
> cases, so far as I know.
> 

How about having the file just contain a single line

#include <generated-qemu-arm.dts>

... where this generated-*.dts is not checked to the source tree. Then 
of course comments on how to generate it via qemu -dumpdtb + dtc, with 
appropriate precautions (ie. must be regenerated if qemu command line is 
changed or qemu is upgraded), intended use case, and so forth.

