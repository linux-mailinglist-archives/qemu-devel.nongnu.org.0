Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F86B6198
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 23:56:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb87L-0008Mq-6I; Sat, 11 Mar 2023 17:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pb87H-0008MW-Ec
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 17:55:07 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pb87F-0000DE-Fs
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 17:55:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 85836746324;
 Sat, 11 Mar 2023 23:54:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4F905745720; Sat, 11 Mar 2023 23:54:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4E0E9745712;
 Sat, 11 Mar 2023 23:54:41 +0100 (CET)
Date: Sat, 11 Mar 2023 23:54:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
cc: Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>, 
 Rene Engel <ReneEngel80@emailn.de>
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
In-Reply-To: <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
Message-ID: <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

I've noticed before that since commit a806f95904cdb audio plays slower 
(like half speed) under AmigaOS on sam460ex with ES1370 but I did not have 
any other guests to reproduce it and verify this with so I did not report 
that yet. Now that we can also test with pegasos2 and via-ac97 it does not 
play slower on that machine neither with ES1370 not via-ac97 but still can 
reproduce it with sam460ex.

But on another host it seems to play faster with pegasos2. Here is a video 
taken by Rene demonstrating the problem: https://youtu.be/Rg5buzDqGuk So 
there seems to be a problem with playback speed here but I'm not sure if 
this is related to AmigaOS or something else.

At least we have some issue with AmigaOS on sam460ex and ES1370 playing 
too slow since commit a806f95904cdb on Linux with alsa backend and may 
also have an issue with sound being too fast on pegasos2 with coreaudio. 
However Rene said that recording it with a screen recorder did not show 
the problem, only when playing it normally, that's why the video is taken 
with a camera. I can't understand how that's possible but maybe you have 
some idea to at least how to test this further to find out more what's 
happening here or if you can see anything that can cause playback speed 
issues with these machines.

So far I've reproduced obviously slow speed with AmigaOS on sam460ex with 
ES1370 on Linux with alsa. The MorphOS and AmigaOS on pegasos2 with 
via-ac97 or ES1370 (latter only works with AmigaOS) seems to be OK to me 
on my machine but is playing too fast in Rene's video.

Could this be related to some differentce in host's sampling rate or some 
other settings somewhere? I have defaults.pcm.dmix.rate 44100 in 
/etc/asound.conf while Rene is using whatever macOS does with coreaudio.
Any ideas what to check further?

Regards,
BALATON Zoltan

