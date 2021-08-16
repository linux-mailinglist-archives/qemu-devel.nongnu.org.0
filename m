Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BBD3ED8A3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:04:35 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdEA-0003Db-JF
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFd9u-0005cq-5V; Mon, 16 Aug 2021 10:00:12 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:41831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mFd9s-0006VI-B7; Mon, 16 Aug 2021 10:00:09 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 f33-20020a4a89240000b029027c19426fbeso4969048ooi.8; 
 Mon, 16 Aug 2021 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T1tBaGTM2DXvKug8XBHKu4U3gJU3xWiYQH6surQsnpM=;
 b=bG7JjBtEh4bOLNuPddFThTwqMaj2VwfEjdZyfXm7nRtc6qOIr265ETmTLRvOeNTTcw
 ycy+kAEL/lnK6cZulcoQaaeVHpe2iyVD5JkPLCvBYQX9bfpbRM97z2REG8sWuRl4FH/e
 6wo/wbwCDWAqi2b65a8NH6/PptI9tOvDRLZOOLIkI0o0930nU0FcVOVo1WT67Dlhv91V
 ULx7RcoOJV+3jYbh+vcI3sEUazR+/pR0hTlVKF+ycq/KYQuNvSbYoU7RQwNY9NXBlEjX
 /DNhzXFANBVyNjnStGzhE7Yd61g6WD8xc7hE7sBtu0LrkqVogWZ/75+7cIS2tu0Dklub
 SKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T1tBaGTM2DXvKug8XBHKu4U3gJU3xWiYQH6surQsnpM=;
 b=GqEkhMkT1jUyuzSopyk12lLMwtgWHvNG6rt4cAOhJMsYzgn+lIWozYQNbxe8vpOD9D
 TPXYGmHrVftGeBW6HlM1GxtJmzeOmcVih8yBZQ8NoWrb2WYQvnaM9LnKpn6o44uPg3Jh
 MEqG03B+Qf8BxRBLNfcxtCuTqtykJzlhq4wf2ecGC4dOMWj2W4XsIldnDxlNtjPETxTc
 lQ/i26s7REwCHlmr7Vx7eatFxO4sH1AEzpQENB+iHE13f4+Un/A4O7lPoV/5PZHOvOp4
 zZbQ5DJOrg+SG8uJfvh6UFvMP35o3c2TqcugkPpa9mCaYFvLJyBR4ZxDu//NOGPcqfOu
 38eg==
X-Gm-Message-State: AOAM532rH2FtK3iOUdl90OBwnhIWR0Lnmagk1y4A/CRMW73gKbXJwDnY
 IGYl3u2epaJrv0f/ymaWZiQ=
X-Google-Smtp-Source: ABdhPJyDHNG2Jn/sF3H964RQVqoPyjnFP12GtozddD0/DYibcRlRwUtjUG+ryYHOnSkCsAp13odjiw==
X-Received: by 2002:a4a:98b0:: with SMTP id a45mr11825875ooj.22.1629122402202; 
 Mon, 16 Aug 2021 07:00:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q187sm2120396oif.2.2021.08.16.07.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:00:01 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
 <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
Message-ID: <6b0a3a08-a57b-fbb6-71d8-3760d76fd265@roeck-us.net>
Date: Mon, 16 Aug 2021 06:59:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-KSFuYbkbu7iBvgLxgBgBPRGeOgLuEuh5g5_MO4=Nk0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 3:26 AM, Peter Maydell wrote:
> On Mon, 16 Aug 2021 at 06:46, David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>>> enabled in devicetree files, they are instantiated in Linux but
>>> obviously won't work. Disable associated devicetree nodes to prevent
>>> unpredictable behavior.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> I'll wait for Zoltan's opinion on this, but this sort of thing is why
>> I was always pretty dubious about qemu *loading* a dtb file, rather
>> than generating a dt internally.
> 
> My take is that if you have to modify the dtb file to get QEMU to
> work, then that's a bug in QEMU that should be fixed. It's no
> worse than for the machines we have that don't use dtb and where
> the kernel just knows what the hardware is. (In my experience
> Arm kernels can be a bit finicky about wanting the right dtb
> and not some earlier or later one, so I think at least for Arm
> trying to generate a dt for our non-virt boards would have been
> pretty painful and liable to "new kernels don't boot any more" bugs.)
> 
> Is it sufficient to create stub "unimplemented-device" ethernet
> controllers here, or does the guest want more behaviour than that?
> 

The controllers are instantiated (it looks like the Linux driver doesn't
really check during probe if the hardware is present but relies on DT),
but when trying to access them there is a PHY error. If a different Ethernet
device is explicitly specified and instantiated, it either ends up as eth2
or as eth0, depending on the driver load order. That makes it difficult
to test those other Ethernet devices (and with it the PCI controller).
Plus, of course, there is always the danger of hitting a more severe problem.

No problem though if this patch isn't accepted - I can carry it locally for
my testing. I thought it would be acceptable because there is already other
code doing the same, but I don't really depend on it.

Thanks,
Guenter

