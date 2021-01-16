Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EC2F8D91
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 16:09:27 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0nCg-0004qn-BM
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 10:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0nBD-0004Io-QI; Sat, 16 Jan 2021 10:07:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0nBC-0002dU-B5; Sat, 16 Jan 2021 10:07:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id d26so12162233wrb.12;
 Sat, 16 Jan 2021 07:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zFryF24Al7CUn3GaH4Sih/NIC3fWYpUWPqv/eiwsBSM=;
 b=fPEywJxiuwT+mjhD+YsC2sMMOpfKpfdj4uHYJbYXCQCDabOPCffLkhlLepoqkee6vc
 OoDbq7/g27P8DXazxtFj5mWT33uxi4tm+Qn9Z8UrdjzIDpYe6xCZAQYIN6MgD0Ksr3Cf
 wTKKP+1tRWkW2Mf4Jn6EC99sD4yo8PwRCnWb0d3f/YoRj9ScOjlmf3ONRGP+g5rt7RlN
 XuskE1SBa+1TluOEv/4v2GV79K+mYoHTZJTBQWBFkIBB4aGIZDMFTKdgObyUde2pkxVk
 L/b2pdJWuiWQZjzsPRpw23WsHesQoNZ9A7stCXw2vN53/Ciejlp8DNHLEHJltPlq1Pn+
 a8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zFryF24Al7CUn3GaH4Sih/NIC3fWYpUWPqv/eiwsBSM=;
 b=DiPrPSS8FaVjIFf3GDzGJB/1r9gAJtAJp3OigXfxof5PFAPDfCBoLY0ZnnQjVKpaxn
 4rsPJZA5WxudlIv6mq9k8Elro2HkLf3O/jWkuWEVvq6G2bpMj/Dy0xHJnZAXweG0seiQ
 Myglk8lGAJrV0eCC9ue/V1RkqJB4Xjg7WKQgTwN7HaPrQ/jKiD6G5EK64U0jkpUmq89O
 7tgjZ63JH6RBTJLD3MN4C6DmHOAWp9FgCVlf6esFcP5AyLfozIQo8qL0uzRAup5U5ER0
 67miO4lStKaGAQKFMADkLqN6YkjESWNOsgHAuUeH3+r1OWO/ME5kF3vc67kP/D6YJ8Xq
 QwJQ==
X-Gm-Message-State: AOAM531WlIA6lX1MPwDoOIId6ZTnCJbdD4D7SUsU++po3hh2Kyf6iAvd
 W9BUofQiPaRP61uNS0qV05E=
X-Google-Smtp-Source: ABdhPJzmmZvZJ6hjge08i2akn30VUB439zNsmor0Hh1PLOfLZaq9Zm6HVQgkHYz/G4l/loWvrJ2iKw==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr17990103wre.185.1610809672646; 
 Sat, 16 Jan 2021 07:07:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y63sm16804172wmd.21.2021.01.16.07.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 07:07:51 -0800 (PST)
Subject: Re: [PATCH v7 0/9] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <CAEUhbmXVLKTqQ0GmoYSDtkeiYA96KkuickvLyFm_L6idTNJPkw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5993ce13-85fc-35b8-57e3-8a694a930f44@amsat.org>
Date: Sat, 16 Jan 2021 16:07:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXVLKTqQ0GmoYSDtkeiYA96KkuickvLyFm_L6idTNJPkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 3:03 PM, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, Jan 15, 2021 at 11:31 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi,
>>
>> This is how I understand the ecSPI reset works, after
>> looking at the IMX6DQRM.pdf datasheet.
>>
>> This is a respin of Ben's v5 series [*].
>>
>> Since v6:
>> - Dropped "Reduce 'change_mask' variable scope" patch
>> - Fixed inverted reset logic
>> - Added Juan R-b tags
>> - Removed 'RFC' tag as tests pass
>>
>> Based-on: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
>> (queued on riscv-next).
>>
> 
> This series dropped my imx_spi_soft_reset() change that has the
> imx_spi_update_irq() moved from imx_spi_reset(). May I know why?

Because we don't need it. My comment without looking at the datasheet
was incorrect: there is only one single reset on the block.

> 
> Regards,
> Bin
> 

