Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EB3BC30E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:19:08 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0U7X-0000i7-GV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0U5u-0007yR-3N; Mon, 05 Jul 2021 15:17:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0U5s-0002Dj-Ek; Mon, 05 Jul 2021 15:17:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id n33so4543725wms.1;
 Mon, 05 Jul 2021 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BYQ07LU1TkY7M/azToriUB8W7GEwl08eTrWX7UbmIV0=;
 b=PHielBT4mB1Tl9AgdkPiMsFUWBb0uxBPqum5KKuVeJbM95jgbU0WrqZAwfK/CImNs0
 9VLVTGN9wegozSuYAysZdnhVrBU03Pl12C6U0gQAaEdm1eUg02K6Miz3c7diqz+NjLI6
 WKX9V645ShW7Ff/eQtk+YPwdZSwwg4qo18uEdUqD+uLND4ozLsiGIqUs6rL8wSJU2puA
 CMg5VUQTCKjqf2TBF5BN5PPtN/KMI+z+Vv/4XBclZHtxDzINVLSkpa0Lt8xkLOXxcNtR
 5N6xda6+Q+V0frz8AZV1fQdC3DyyPoJgl1cmx2RfSdC+k92iDHq64pz7FhNgJWfWM01d
 QpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYQ07LU1TkY7M/azToriUB8W7GEwl08eTrWX7UbmIV0=;
 b=Wfby1oplNr9Cxzx/zq5Ja6DQvQTtjQATqr/xSSast4WJq5qIe/cV8xsMO5cthwWM5F
 jkZcgGLXZyYaVZhtyrK1tRU20VVMShMED+GunOI2ApTHcNwVb8bAdWpf5jaBAbFupwDd
 1gERqrBWv4tg7SDA0BlCrzrRQKjBpS9BLf3XoDZRA8ERXhOOVheJ2G420/nrE4Hu9yRB
 YtujFX/7uApNZruoz57Oxhrbsn20WzS5MSD8yz5Fn3GJjb4iy6Gl7j6Ens5D7kVK+xlH
 8cFBH3gI++AYRLz4QGCkbT831uhVmZLcC+xYLFkPB9PRczhOeHWUCX8LL1fwJ+FH2raH
 2vkw==
X-Gm-Message-State: AOAM531MYnXWa2DpZSASIMq+YJV81BvNBDEEBWQ34wSj83TcAWoIHhOq
 EKovirjNMg63xm33mxlV7yIxE914+84=
X-Google-Smtp-Source: ABdhPJxpFPkjnpELlkjrjiqQReHeLSMEZT7c0E3WsNoZuMIDfsu4sAcbq3W5Y6cWaMhvqG2GV/PKww==
X-Received: by 2002:a1c:63c3:: with SMTP id x186mr16224815wmb.27.1625512642037; 
 Mon, 05 Jul 2021 12:17:22 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t9sm14077690wrq.92.2021.07.05.12.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 12:17:21 -0700 (PDT)
Subject: Re: [PATCH 0/4] ppc/Pegasos2: Firmware replacement using VOF
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Alexey Kardashevskiy <aik@ozlabs.ru>
References: <cover.1624811233.git.balaton@eik.bme.hu>
 <a72a7538-e571-efae-27b-3cec1493441@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2fa5211f-593c-8939-1b34-4964a93baee4@amsat.org>
Date: Mon, 5 Jul 2021 21:17:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a72a7538-e571-efae-27b-3cec1493441@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Greg Kurz <groug@kaod.org>, Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 1:35 PM, BALATON Zoltan wrote:
> On Sun, 27 Jun 2021, BALATON Zoltan wrote:
>> Based-on: <20210625055155.2252896-1-aik@ozlabs.ru>
>> ^ That is v22 of Alexey's VOF patch
>>
>> With this series on top of VOF v22 I can now boot Linux and MorphOS on
>> pegasos2 without a firmware blob so I hope this is enough to get this
>> board in 6.1 and also have it enabled so people can start using it
>> eventually (a lot of people don't compile their QEMU but rely on
>> binaries from distros and other sources). Provided that VOF will also
>> be merged by then. This gives VOF another use case that may help it
>> getting merged at last.
>>
>> Further info and example command lines can be found at
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
> 
> Ping? Freeze is coming and this would be the second release pegasos2
> misses (after it missed 6.0) if this is not in the next pull request so
> that's why I'm pushing.

I'm not sure who can help, I was expecting Alexey would review
your series. Cc'ing Laurent and Greg in case, to help you...

>> BALATON Zoltan (4):
>>  ppc/pegasos2: Introduce Pegasos2MachineState structure
>>  target/ppc: Allow virtual hypervisor on CPU without HV
>>  ppc/pegasos2: Use Virtual Open Firmware as firmware replacement
>>  ppc/pegasos2: Implement some RTAS functions with VOF
>>
>> default-configs/devices/ppc-softmmu.mak |   2 +-
>> hw/ppc/Kconfig                          |   1 +
>> hw/ppc/pegasos2.c                       | 783 +++++++++++++++++++++++-
>> target/ppc/cpu.c                        |   2 +-
>> 4 files changed, 771 insertions(+), 17 deletions(-)
>>
>>
> 


