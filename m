Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D57407DEE
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:27:43 +0200 (CEST)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPROQ-00058p-Ag
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRNI-0003iN-Th
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:26:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRNH-00030o-8I
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:26:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2260567wmd.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1dYyPiTSKSxdLn2FjkP7SgSWZzXvxtttUe0EVGVAEQI=;
 b=ilD/9+5nD4lv5rg9qZZmX2jmkuaI12jp6Bmeg/0BQDc0dt7PbeDNo31q/KjWs523kP
 1m0WSwydzAmocl0VJjjvUUcjUMwLqVJLUFm9Zxes67ZQ/L4sWP3G0zQ2K971xyS6cdLU
 a6tBj4Z1MAwJ/XPd+p+Li7bE28u89ia5dITMZsv3TKrJJo0L+IUyCDmbb5vxBJT8qIWo
 CRYKlWjgPdhcwfnNWNlxUUECLbgqb7sxlWVgsYD6peV8iHPR6jVeb8Iek6TKNWv+odzJ
 WKgfDTyvCl5S2WhNMs1WYR19GRpdynzOfn5PiNvEJnZJ95KGJ1012yhEN5lo/kGFpezD
 vXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1dYyPiTSKSxdLn2FjkP7SgSWZzXvxtttUe0EVGVAEQI=;
 b=JnFoniLVFxO6mYzpAxs8M/enRiAx3mAYIt7KNjxHT82V2NlUAVzO4ylBZDX/N9yoKk
 Mj7OGdA2xymtm/55w5fQsvIn7B3qI5pZwPyjt2sb+pn5Cd44iAGKWK+8q1r0TWIoYwsa
 gJeYBgVYHwprmXISStpTmI55KWoi/hh/AE0DiHyC+tiTxuHsxX/Jxuq+byly/mFHRQb3
 Ht1lWTxzndU5DkZT2s1k2H6w2QEedM4mv+Ax+sXeUnK5hkCH9j7pIayDwsRw1AfkcqDg
 DaGR+otcOv2pNMwGOV3DnSKRIeEh1KttslI8c3KCgwPPZv6YzOaRErvGesuQPBQN60bm
 rjQQ==
X-Gm-Message-State: AOAM533rcM/yO1yUlatbTfMQ/kJCpLdveZwJIjl4GDo0gt20RGnn0/kF
 KxJU0QTaiMGzBkUwtcnf1sQ=
X-Google-Smtp-Source: ABdhPJwoyvpg9IiYXOqDAsPUzTXm3lUUGEGZ0OD/jUimbfBTZvysC+WCi8gY0gzL2cJGtEI5qjvI2Q==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr7200956wmi.88.1631460389677; 
 Sun, 12 Sep 2021 08:26:29 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id m4sm5629121wrx.81.2021.09.12.08.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:26:29 -0700 (PDT)
Subject: Re: [PATCH 16/20] nubus-bridge: embed the NubusBus object directly
 within nubus-bridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-17-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d838737-877c-7a3a-332d-314de63b0f00@amsat.org>
Date: Sun, 12 Sep 2021 17:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> Since nubus-bridge is a container for NubusBus then it should be embedded
> directly within the bridge device using qbus_create_inplace().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c              | 2 +-
>  hw/nubus/mac-nubus-bridge.c | 7 ++++---
>  hw/nubus/nubus-bridge.c     | 3 ++-
>  include/hw/nubus/nubus.h    | 2 +-
>  4 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

