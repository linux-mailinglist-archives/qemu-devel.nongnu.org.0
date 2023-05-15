Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF9702A67
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:22:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVLL-00039f-PT; Mon, 15 May 2023 06:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVLC-000399-Fa
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:22:08 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyVLA-0004xV-2k
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:22:05 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac82b07eb3so127026661fa.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684146120; x=1686738120;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Z39OO44K/Z7hO/l1sxJgSzfVYg5mQg7l3OK/8e4gJeA=;
 b=KCOuwvvtgpgeTtr4isbcnBb45HD2ntc3YXPZwupkFYwYvKZoTUNOXn04+s2/T49Rr+
 SAKzDsAUmOc9OFrfiA2tYfWsyF1bfDJFLFH0vbwslUKgsJnIf5uI3vx+x6fBhfmgYSzX
 9MIwWnvGe9s5K5Lt4Ko7uqM25twthDLryWut+MS118pSLCp8bftpnbINuoc/cR4FRYLG
 6Z6LoSqusA0rUR+ie7yfUMRw2+6P+HekU4IyszmnYE1qpLX9AE27GRrCssCaj+8MhUJU
 /UUXjWKohmHSjiSGqwKyE+q9d+sljfeQSGt2AHJZSGzdYXi8CiQfZLqNMHFKDQDeG4O+
 YMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684146120; x=1686738120;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z39OO44K/Z7hO/l1sxJgSzfVYg5mQg7l3OK/8e4gJeA=;
 b=W6zsQhdMfiPl+ZWW1DIfgt8bZkKNXPoXrm2T7pgPxhRtn/b2Ps+IUyn2/yps/yx0+q
 b9BpYE/+9E5vhNV52mSAWga4P/fZWV7QLPV2iS/HB8VS7/37f8cM/DE8Dwrvyg+o96L/
 BsWgr+Cv47iiT5Y2Nma8FH2c0nlHv3pom9U1cbNeGhadcezXEtYUNdNtjBroVkpaHYRZ
 vTnRyjFDxMUtYxexWAd3TcgXEazTmUf17aLM06hIAtdNbg+LB2L7lQzfR14XWH11wvHD
 ITWE4s8U+uGicAZezvUK+bisoAnVYj/0vSKp0C/NhHGpaWaa7Xza+GayDEBwKjI1U4gr
 pRPQ==
X-Gm-Message-State: AC+VfDy1Rog7jFAp4NcUE0OHuDwG5HS9lD6exZqHn3kse19uBIiKLRxV
 PaZIvMO26h8jMIvoEbc2Tydr5Q==
X-Google-Smtp-Source: ACHHUZ4yMY6KN0A1bmPAcf1zL+0af4hm0ft1TL7Fga39Dm4T5249g/D4ISKyhzr5kBeGVvMrXePiaA==
X-Received: by 2002:a19:ad0a:0:b0:4ef:eb50:4d3d with SMTP id
 t10-20020a19ad0a000000b004efeb504d3dmr6288230lfc.18.1684146120265; 
 Mon, 15 May 2023 03:22:00 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 d28-20020ac24c9c000000b004f27e3ea8c1sm1088110lfl.144.2023.05.15.03.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 03:21:59 -0700 (PDT)
Message-ID: <8eb29c56-7a19-c599-8791-2f3a74e7352a@linaro.org>
Date: Mon, 15 May 2023 12:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

W dniu 15.05.2023 o 12:15, Peter Maydell pisze:> On Mon, 15 May 2023 at 
11:04, Marcin Juszkiewicz
 > <marcin.juszkiewicz@linaro.org> wrote:
 >>
 >> Let add GIC information into DeviceTree as part of SBSA-REF versioning.
 >>
 >> Trusted Firmware will read it and provide to next firmware level.
 >>
 >> Bumps platform version to 0.1 one so we can check is node is present.
 >
 > (Missing signed-off-by.)
Oops. Will add in next revision.

 > I thought the idea with the sbsa-ref dtb was that it was
 > really just a minimal provision of data to the firmware,
 > not a real DTB, and that (as on real hardware) creating
 > the DTB to pass to the next level of the guest code was
 > the job of the guest firmware.
 >
 > Why do we need to provide a full GIC DTB node ?
First version had "/magic-numbers/gicd.base" node when I was checking 
will it work as expected. Then there was discussion about making it 
proper DT node to avoid "DT has schema for it" replies.

I took code from arm/hw/virt.c for it.


