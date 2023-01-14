Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9752566A8BA
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 03:42:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGWU5-0003OR-G3; Fri, 13 Jan 2023 21:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pGWU3-0003OE-CQ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:41:27 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pGWU1-0001PB-8N
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 21:41:26 -0500
Received: by mail-pj1-x102f.google.com with SMTP id o18so2993950pji.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 18:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZV1W17qhTd2VRchYeoC/OMwvAb9xQ2+P43Y/MBjsPU=;
 b=BOtQFatLMdGOeyLUT9qcUKA7SuUCvvBbz6Zf/QcYYj2I/6gCF1e9xzLMuwEbevIctC
 HAmCdfBtQ9X2p7I1ahFo7UPAf5J7EE/tP/RK4Nx7xu+yjw7gZeSYjclyRHY0ccITbdfJ
 pvlnZ44LksW09SDoxyQ1cWw9OKhO3yztOhc5WyzqxbuJzNxFqinPaPGhJwR8yO79rRCc
 wDMjdSh+65cSXOwTV20/ScXmSbo1OPGMjndzOg4OxTap+QMncNCrwyF/8l76ykFljzX/
 0jxLbiBajUXH34vZzJROSYVBFuoCOJs4TDeg3e/EqSGFY/cyPYEGyNdex7/8pdpYJsv3
 0OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZV1W17qhTd2VRchYeoC/OMwvAb9xQ2+P43Y/MBjsPU=;
 b=MFqx33lRBnw7o8zHS1sItRgMX0BUCrzBOYGsUCnFiIjmxHbDA38OfZ238xEMlKMl3k
 KGRhbFvXpNRmFEJ2Jz9x/ornmCuT3tCgOmCaogwe337nPl5IWtk8EYapzG3D11K8bXBc
 U2+RItVCrp8AY/NSoaVdVny6cw9dfSpIrHMOmziX7CyzUBeaYJDaGFMXz1T53s9Vkh5g
 9/Y7Fx6VnbHujjQMtxsDL8pBNlYS2GWO2DuDavpfHsSO/AYRJrw6S46LrSWHa6X26J3J
 GDZm7GWfzzZmKqCGokB+ZDpRO0XvJaxjg321bHdXjLN0sFi59wS5iqjjoJvg2DPofZXt
 2INg==
X-Gm-Message-State: AFqh2kq/N4WVQI7b6aNmFdwMh2L17JJhMSpncGrRtOJ8dL6EAS1lFKw0
 TtdORGThBFDqrX3mFk+qj6o=
X-Google-Smtp-Source: AMrXdXuZ56DaKeNR7MKSXggHH0OPGtjSQXA8eLx0BbBBKtErNEDLB+pL94L+OmFeLtBF4XO08Jx/QA==
X-Received: by 2002:a17:90b:d8f:b0:228:5b99:3b45 with SMTP id
 bg15-20020a17090b0d8f00b002285b993b45mr18429923pjb.7.1673664083149; 
 Fri, 13 Jan 2023 18:41:23 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:d54:e521:8bac:7bed?
 ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a17090a0ac200b002139459e121sm10214197pje.27.2023.01.13.18.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 18:41:22 -0800 (PST)
Message-ID: <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
Date: Sat, 14 Jan 2023 11:41:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Display update issue on M1 Macs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2023/01/13 22:43, BALATON Zoltan wrote:
> On Thu, 5 Jan 2023, BALATON Zoltan wrote:
>> Hello,
>>
>> I got reports from several users trying to run AmigaOS4 on sam460ex on 
>> Apple silicon Macs that they get missing graphics that I can't 
>> reproduce on x86_64. With help from the users who get the problem 
>> we've narrowed it down to the following:
>>
>> It looks like that data written to the sm501's ram in 
>> qemu/hw/display/sm501.c::sm501_2d_operation() is then not seen from 
>> sm501_update_display() in the same file. The sm501_2d_operation() 
>> function is called when the guest accesses the emulated card so it may 
>> run in a different thread than sm501_update_display() which is called 
>> by the ui backend but I'm not sure how QEMU calls these. Is device 
>> code running in iothread and display update in main thread? The 
>> problem is also independent of the display backend and was reproduced 
>> with both -display cocoa and -display sdl.
>>
>> We have confirmed it's not the pixman routines that 
>> sm501_2d_operation() uses as the same issue is seen also with QEMU 4.x 
>> where pixman wasn't used and with all versions up to 7.2 so it's also 
>> not some bisectable change in QEMU. It also happens with 
>> --enable-debug so it doesn't seem to be related to optimisation either 
>> and I don't get it on x86_64 but even x86_64 QEMU builds run on Apple 
>> M1 with Rosetta 2 show the problem. It also only seems to affect 
>> graphics written from sm501_2d_operation() which AmigaOS4 uses 
>> extensively but other OSes don't and just render graphics with the 
>> vcpu which work without problem also on the M1 Macs that show this 
>> problem with AmigaOS4. Theoretically this could be some missing 
>> syncronisation which is something ARM and PPC may need while x86 
>> doesn't but I don't know if this is really the reason and if so where 
>> and how to fix it). Any idea what may cause this and what could be a 
>> fix to try?
> 
> Any idea anyone? At least some explanation if the above is plausible or 
> if there's an option to disable the iothread and run everyting in a 
> single thread to verify the theory could help. I've got reports from at 
> least 3 people getting this problem but I can't do much to fix it 
> without some help.
> 
>> (Info on how to run it is here:
>> http://zero.eik.bme.hu/~balaton/qemu/amiga/#amigaos
>> but AmigaOS4 is not freely distributable so it's a bit hard to 
>> reproduce. Some Linux X servers that support sm501/sm502 may also use 
>> the card's 2d engine but I don't know about any live CDs that readily 
>> run on sam460ex.)
>>
>> Thank you,
>> BALATON Zoltan

Sorry, I missed the email.

Indeed the ui backend should call sm501_update_display() in the main 
thread, which should be different from the thread calling 
sm501_2d_operation(). However, if I understand it correctly, both of the 
functions should be called with iothread lock held so there should be no 
race condition in theory.

But there is an exception: memory_region_snapshot_and_clear_dirty() 
releases iothread lock, and that broke raspi3b display device:
https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/

It is unexpected that gfx_update() callback releases iothread lock so it 
may break things in peculiar ways.

Peter, is there any change in the situation regarding the race 
introduced by memory_region_snapshot_and_clear_dirty()?

For now, to workaround the issue, I think you can create another mutex 
and make the entire sm501_2d_engine_write() and sm501_update_display() 
critical sections.

Regards,
Akihiko Odaki

