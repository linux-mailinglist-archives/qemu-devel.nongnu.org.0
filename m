Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35856612A51
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 12:21:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op6N3-0004Dt-8g; Sun, 30 Oct 2022 07:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1op6Md-0003kp-MG
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 07:20:34 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1op6Mb-000057-KJ
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 07:20:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A2F0675A156;
 Sun, 30 Oct 2022 12:20:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6489E75A150; Sun, 30 Oct 2022 12:20:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 61AE375A135;
 Sun, 30 Oct 2022 12:20:22 +0100 (CET)
Date: Sun, 30 Oct 2022 12:20:22 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
cc: Elliot Nunn <elliot@nunn.io>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org, f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/cocoa: Support hardware cursor interface
In-Reply-To: <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
Message-ID: <6b2aaf64-1734-2491-1c71-d126d5a3b3f@eik.bme.hu>
References: <54930451-d85f-4ce0-9a45-b3478c5a6468@www.fastmail.com>
 <CAFEAcA_bip7nifW-Zq8qrSmZTCUQA1VMpMR8HSHsKVBAeQxy0A@mail.gmail.com>
 <CAMVc7JXPi3kbFyrN9757uKt-cUprKUBLM9nuDMRjawtVePVVAw@mail.gmail.com>
 <5232C333-9F52-455D-A0D5-B1A438800717@nunn.io>
 <a5029b6b-d0a9-a379-09c0-05d6786af0f2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Oct 2022, Akihiko Odaki wrote:
> On 2022/10/30 14:20, Elliot Nunn wrote:
>> Akihiko,
>> 
>> Thanks very much for reviewing my patch.
>> 
>> I think that you were right to use the sprite-within-a-window approach,
>> and avoid warping the OS cursor. I tried to compensate for the error
>> that cursor warping causes in the subsequent mouse event, but there is
>> still some error getting through that makes the cursor feel "janky".
>> 
>> But in absolute pointing mode, will it be possible to remove the guest's
>> code path from visual updates of the cursor? I find that under Mac OS 9,
>> this provides better responsiveness. I can think of two methods:
>> 
>> 1. In absolute pointing mode, re-enable Cocoa's cursor and let the host
>> OS move it according to user input.
>> 
>> 2. Keep the cursor sprite, but move it according to Cocoa's mouse
>> movement events instead of dpy_mouse_set events.
>> 
>> I prefer option 2. What do you think?
>
> My patch has been only tested with recent Linux, but it certainly should be 
> ensured that it works well for old systems when upstreaming.
>
> First I'd like to know what display device you use. It looks like 
> dpy_mouse_set is used only by ati-vga, vhost-user-gpu, virtio-gpu, and 
> vmware.
>
> Also, can you give reasoning while 2 is preferred? 1 would allow to exploit 
> the hardware's feature for cursor composition, resulting in smoother 
> experience and a bit less power consumption. But there may be complications 
> it can cause so I have not decided which one is the better yet.

Maybe cc-ing Gerd as the UI maintainer is a good idea in case he can add 
some insight too.

I'm not sure about this and may be wrong but I have a theory that the 
problems with mouse tracking are caused by not taking mouse ponter 
acceleration into account correctly. I did not check it and can't prove it 
but I think the guest and host cursor get out of sync because QEMU does 
not know about pointer acceleration methods and parameters which are 
different for each OS (and also user settable) so it's hard to reproduce 
it in QEMU so it just assumes linear movement and tracks guest cursor 
assuming that. Then it has to correct it when mouse is moved faster and 
the pointer ends up at a different place than expected. Is this a 
plausible theory? If so then we may need to take pointer acceleration into 
account or move the guest pointer based on host values or maybe somehow 
change guest pointer acceleration values to match the host's but that 
seems to be quite difficult because of the number of different guests. But 
it you're writing a guest driver this may be an option too at least for 
that guest.

Maybe it would help if there was a clearer picture of how all this works. 
We have the mouse connected to the host that sends relative move events. 
Then this is forwarded to the guest which moves the pointer based on accel 
setting of its own while the host moves its pointer with a different accel 
setting. Did I get that right? Then we either need to sync these pointer 
accel settings or pick one and use that for both. To let the host draw the 
pointer we should change the guest accel settings to match the host's or 
somehow change it for the QEMU window on the host to match the guest's. 
Neither seems to be easy and probably needs something in the guest to do 
it so I'm lost at this point and it's just a vague idea that could be all 
wrong but maybe thinking on this path could lead somewhere.

Regards,
BALATON Zoltan

