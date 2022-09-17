Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658195BB871
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZXln-00026N-UL
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 09:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oZXf5-0006IV-FV
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:15:12 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:51236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oZXf3-00085q-BI
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 09:15:11 -0400
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout03.t-online.de (Postfix) with SMTP id EB98975C1;
 Sat, 17 Sep 2022 15:15:04 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oZXey-0SRjgv0; Sat, 17 Sep 2022 15:15:04 +0200
Message-ID: <988e1e66-6f03-5843-d686-666132cf8ef9@t-online.de>
Date: Sat, 17 Sep 2022 15:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/2] audio: prevent a class of guest-triggered aborts
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663420504-79BAA9DD-0C3F2FCB/0/0 CLEAN NORMAL
X-TOI-MSGID: cd61091a-5905-4dce-8d43-c71900538c35
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The issues with guest-triggered aborts started with commit ab32b78cd1 
"audio: Simplify audio_bug() removing old code" which introduced an 
abort() in function audio_bug(). The abort() was there before, but it 
was only compiled in for debugging purposes.

After this commit issue https://bugs.launchpad.net/bugs/1910603 showed 
up. This bug was mitigated with commits a2cd86a94a ("hw/audio/sb16: 
Avoid assertion by restricting I/O sampling rate range") and 60e543f5ce 
("hw/audio/sb16: Restrict I/O sampling rate range for command 41h/42h"). 
The issue was only mitigated because I can still trigger the same abort.

To reproduce start a FreeDOS QEMU guest with:

./qemu-system-i386 -machine pc,pcspk-audiodev=audio0 \
  -device sb16,audiodev=audio0 \
  -audiodev 
pa,id=audio0,timer-period=170,out.mixing-engine=on,out.buffer-length=181 \
  -drive ...

On the guest enter the out port sequence from launchpad bug #1910603:
C:\> debug
-o 22c 41
-o 22c 0
-o 22c 4
-o 22c 1c

On the host:
A bug was just triggered in audio_calloc
Save all your work and restart without audio
I am sorry
Context:
audio_pcm_sw_alloc_resources_out passed invalid arguments to audio_calloc
nmemb=0 size=16 (len=0)
Aborted (core dumped)

Here is another example to trigger the same abort. Start a Linux guest 
with an AC97 audio device:

./qemu-system-x86_64 -machine q35,pcspk-audiodev=audio0 \
  -device AC97,bus=pcie.0,addr=0x1b,audiodev=audio0 \
  -audiodev pa,id=audio0 \
  - ...

Open a shell on the guest:
~>sudo lspci -s '00:1b.0' -nn -vv
00:1b.0 Multimedia audio controller [0401]: Intel Corporation 82801AA 
AC'97 Audio Controller [8086:2415] (rev 01)
     Subsystem: Red Hat, Inc. QEMU Virtual Machine [1af4:1100]
     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR+ FastB2B- DisINTx-
     Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin A routed to IRQ 16
     Region 0: I/O ports at c000 [size=1K]
     Region 1: I/O ports at c400 [size=256]
     Kernel driver in use: snd_intel8x0
     Kernel modules: snd_intel8x0

~># IOBAR0 + 0x2c
~>sudo outw 0xc02c 1

On the host:
A bug was just triggered in audio_calloc
Save all your work and restart without audio
I am sorry
Context:
audio_pcm_sw_alloc_resources_out passed invalid arguments to audio_calloc
nmemb=0 size=16 (len=0)
Aborted (core dumped)

Remove the abort() in audio_bug() to avoid this class of guest-triggered 
aborts.

Volker Rümelin (2):
   Revert "audio: Log context for audio bug"
   audio: remove abort() in audio_bug()

  audio/audio.c          | 24 ++++++++++++------------
  audio/audio_template.h | 27 +++++++++++++++------------
  2 files changed, 27 insertions(+), 24 deletions(-)

-- 
2.35.3


