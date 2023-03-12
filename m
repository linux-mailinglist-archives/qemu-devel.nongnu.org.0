Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F250A6B6440
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 10:47:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbIHa-0006B5-Pe; Sun, 12 Mar 2023 05:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbIHY-0006Av-Gx
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:46:24 -0400
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbIHV-0008Na-18
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 05:46:23 -0400
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout03.t-online.de (Postfix) with SMTP id 0E0D3B12C;
 Sun, 12 Mar 2023 10:46:17 +0100 (CET)
Received: from [192.168.211.200] ([79.208.22.72]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pbIHP-4f6Ryj0; Sun, 12 Mar 2023 10:46:15 +0100
Message-ID: <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
Date: Sun, 12 Mar 2023 10:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Rene Engel <ReneEngel80@emailn.de>, qemu-devel@nongnu.org
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1678614375-B2834007-FB1E0D6D/0/0 CLEAN NORMAL
X-TOI-MSGID: fd41a4c0-dbb3-4c65-8088-77589cc60151
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 11.03.23 um 23:54 schrieb BALATON Zoltan:
> Hello,
>
> I've noticed before that since commit a806f95904cdb audio plays slower 
> (like half speed) under AmigaOS on sam460ex with ES1370 but I did not 
> have any other guests to reproduce it and verify this with so I did 
> not report that yet. Now that we can also test with pegasos2 and 
> via-ac97 it does not play slower on that machine neither with ES1370 
> not via-ac97 but still can reproduce it with sam460ex.
>
> But on another host it seems to play faster with pegasos2. Here is a 
> video taken by Rene demonstrating the problem: 
> https://youtu.be/Rg5buzDqGuk So there seems to be a problem with 
> playback speed here but I'm not sure if this is related to AmigaOS or 
> something else.
>
> At least we have some issue with AmigaOS on sam460ex and ES1370 
> playing too slow since commit a806f95904cdb on Linux with alsa backend 
> and may also have an issue with sound being too fast on pegasos2 with 
> coreaudio. However Rene said that recording it with a screen recorder 
> did not show the problem, only when playing it normally, that's why 
> the video is taken with a camera. I can't understand how that's 
> possible but maybe you have some idea to at least how to test this 
> further to find out more what's happening here or if you can see 
> anything that can cause playback speed issues with these machines.
>
> So far I've reproduced obviously slow speed with AmigaOS on sam460ex 
> with ES1370 on Linux with alsa. The MorphOS and AmigaOS on pegasos2 
> with via-ac97 or ES1370 (latter only works with AmigaOS) seems to be 
> OK to me on my machine but is playing too fast in Rene's video.
>
> Could this be related to some differentce in host's sampling rate or 
> some other settings somewhere? I have defaults.pcm.dmix.rate 44100 in 
> /etc/asound.conf while Rene is using whatever macOS does with coreaudio.
> Any ideas what to check further?

Hi,

perhaps this issue is similar to the Linux guest driver issue with an 
AC97 device. The Linux driver tries to measure the AC97 clock frequency. 
It starts playback with a certain amount of audio frames and measures 
the time needed for playback. Since QEMU is not a cycle exact simulation 
the result is always wrong. Before my latency reducing patches the 
result was always way off and the Linux driver rejected the measurement 
and used a clock frequency of 48000Hz. Now the driver sometimes believes 
the measurement is correct and adjusts the clock frequency. This can be 
fixed with the kernel command-line argument snd_intel8x0.ac97_clock=48000.

If AmigaOS also tries to measure the audio clock frequency, it may help 
to increase the playback latency to make the measurement worse. I would 
start with -audiodev coreaudio,id=audio0,out.buffer-count=12. The 
default buffer count is 4.

With best regards,
Volker

>
> Regards,
> BALATON Zoltan


