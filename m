Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEA6B36C3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 07:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paWSd-0002ST-0m; Fri, 10 Mar 2023 01:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1paWSZ-0002SA-GI
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 01:42:35 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1paWSW-0003EZ-Vj
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 01:42:34 -0500
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout11.t-online.de (Postfix) with SMTP id 147D3B77B;
 Fri, 10 Mar 2023 07:42:28 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.75]) by fwd88.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1paWSQ-3244or0; Fri, 10 Mar 2023 07:42:26 +0100
Message-ID: <a3717185-a930-e8e7-80cc-edb8d9e4d01d@t-online.de>
Date: Fri, 10 Mar 2023 07:42:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: kraxel@redhat.com, armbru@redhat.com, qemu_oss@crudebyte.com,
 pbonzini@redhat.com, wtaymans@redhat.com, qemu-devel@nongnu.org
References: <20230306171020.381116-1-dbassey@redhat.com>
Content-Language: en-US
In-Reply-To: <20230306171020.381116-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678430546-736BB7D8-AE36159B/0/0 CLEAN NORMAL
X-TOI-MSGID: 356ad9c2-f029-4178-9a26-203d105c7a70
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Dorinda,

I've started to write down my suggestions and comments. After more than 
one page of text, I think that without sample code, the text is not very 
understandable. Therefore I will write three mails.

In this mail I describe the problem with the QEMU Pipewire audio 
backend. My next mail is a patch for the v7 QEMU pipewire backend with 
my suggestions how I would change the code. I can then reply to my own 
mail with comments, explaining my changes.

I tested the pipewire audio backend with the QEMU hda device. Audio 
playback doesn't work well on my computer. I hear dropouts every few 
seconds.

> +#define BUFFER_SAMPLES    512

BUFFER_SAMPLES can't be a fixed size. To hear the problem please start 
QEMU with qemu-system-x86_64 -device ich9-intel-hda -device 
hda-duplex,audiodev=audio0 -audiodev 
pipewire,id=audio0,out.frequency=96000,in.frequency=96000 ... . The 
pipewire backend tells QEMU to use a buffer size of 512 audio frames. 
The buffer can hold data for 512 frames / 96000  frames/s = 5.3ms. With 
a timer-period of 10ms there is no way to transport enough frames to the 
pipewire buffer.

Just using a larger BUFFER_SAMPLES value also doesn't work. When I start 
QEMU with qemu-system-x86_64 -device ich9-intel-hda -device 
hda-duplex,audiodev=audio0 -audiodev 
pipewire,id=audio0,timer-period=2000 ... the maximum audio frame 
throughput increases as when using a larger BUFFER_SAMPLES value. But 
the higher maximum throughput makes the dropout issue more audible.

This has to do with how often pipewire calls playback_on_process() and 
capture_on_process(). On my system pipewire calls playback_on_process() 
and capture_on_process() every 21ms and sometimes the callback is 
delayed by 42ms. At a guest audio frame rate of 44100 frames/s the QEMU 
hda device drops its buffer if data wasn't read for longer than 23ms on 
average. With a timer period of 2ms, the PWVoice buffer fills quicker 
and the time to the next pipewire update is longer. This increases the 
chance that the hda device drops its buffer. With a timer period of 
10ms, the PWVoice buffer fills slower. This is similar to a jitter 
buffer, but a good jitter buffer implementation would work better.

My next mail with the sample code will give pipewire a hint to call the 
callbacks faster than timer-period and then remove BUFFER_SAMPLES.

With best regards,
Volker


