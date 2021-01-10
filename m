Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2E2F063D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 11:02:49 +0100 (CET)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyXYe-0000kh-Bx
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 05:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyXXT-0000FA-Pd
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:01:35 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:46426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyXXR-0004kM-El
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 05:01:35 -0500
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout02.t-online.de (Postfix) with SMTP id D609941EA816;
 Sun, 10 Jan 2021 11:01:29 +0100 (CET)
Received: from [192.168.211.200]
 (ESlfq2ZDQh9OMj9x-MPX8vqTtGjIS4Iu5DHsg2kdAHGWkKdBLS+6zekz5ei1wcmZ9f@[93.236.152.29])
 by fwd21.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyXXN-1QZfjE0; Sun, 10 Jan 2021 11:01:29 +0100
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 00/23] next round of audio patches
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
Date: Sun, 10 Jan 2021 11:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: ESlfq2ZDQh9OMj9x-MPX8vqTtGjIS4Iu5DHsg2kdAHGWkKdBLS+6zekz5ei1wcmZ9f
X-TOI-EXPURGATEID: 150726::1610272889-0000D063-0178DC0E/0/0 CLEAN NORMAL
X-TOI-MSGID: 9a0cddaa-9a78-4b28-b535-b411c0ca139e
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A mix of bug fixes and improvements.

Patches 01/23 - 11/23 have a few SDL fixes and add audio recording
functions to the SDL audio backend.

Patch 12/23 removes unnecessary code from audio/audio.c.

Patches 13/23 - 16/23 fix a few PulseAudio backend bugs.

Patch 17/23 shows a PulseAudio backend bug. So far I don't think I
broke any fine tuned user settings and I don't want to do it here.

Patches 18/23 - 19/23 are the first steps towards glitch free and
lower latency PulseAudio playback and recording. Currently qemu
uses incredibly large buffers in the PulseAudio backend. For
playback this just increases the playback latency but doesn't
improve dropout safety, because PulseAudio can't access this buffer
directly. With these patches it's possible to move the large qemu
buffer to the PulseAudio server side and just keep a small buffer
on the qemu side. On the PulseAudio server side PulseAudio tries
to place a part of these buffers directly on the hardware and
PulseAudio runs with a higher priority than qemu, so it has a
better chance to deliver audio data in time.

Here is an example to show how this works:
-device intel-hda -device hda-duplex,audiodev=audio0
-machine pcspk-audiodev=audio0 -audiodev pa,id=audio0,
out.buffer-length=14000,out.latency=46440,in.latency=46440

Due to a bug in the PulseAudio backend, these command line options
actually decrease the playback latency compared to current defaults.
For playback with defaults (16 bits, stereo, 44100 samples/s)
we have a 15ms server side buffer + 2 * 46.44ms qemu audio buffer
+ 23.22ms hda codec buffer = 131.1ms latency. With my example it's
46.44ms + 2 * 14ms + 23.22ms = 97.66ms latency and I guess you
won't hear any drop outs. Btw.: 14ms = 10ms timer-period + 4ms
additional playback data the hda codec can produce in timer-period
time.

Patches 20/23 - 23/23 fix small issues with DirectSound.

Volker Rümelin (23):
  sdlaudio: remove leftover SDL1.2 code
  audio: fix bit-rotted code
  sdlaudio: add -audiodev sdl,out.buffer-count option
  sdlaudio: don't start playback in init routine
  sdlaudio: always clear the sample buffer
  sdlaudio: fill remaining sample buffer with silence
  sdlaudio: replace legacy functions with modern ones
  audio: split pcm_ops function get_buffer_in
  sdlaudio: add recording functions
  audio: break generic buffer dependency on mixing-engine
  sdlaudio: enable (in|out).mixing-engine=off
  audio: remove remaining unused plive code
  paaudio: avoid to clip samples multiple times
  paaudio: wait for PA_STREAM_READY in qpa_write()
  paaudio: wait until the playback stream is ready
  paaudio: remove unneeded code
  paaudio: comment bugs in functions qpa_init_*
  paaudio: limit minreq to 75% of audio timer_rate
  paaudio: send recorded data in smaller chunks
  dsoundaudio: replace GetForegroundWindow()
  dsoundaudio: rename dsound_open()
  dsoundaudio: enable f32 audio sample format
  dsoundaudio: fix log message

 audio/alsaaudio.c       |   3 +-
 audio/audio.c           |  48 +++----
 audio/audio_int.h       |   2 +
 audio/audio_legacy.c    |   3 +-
 audio/audio_template.h  |   2 +-
 audio/audio_win_int.c   |  73 ++++++----
 audio/dsound_template.h |   2 +-
 audio/dsoundaudio.c     |   6 +-
 audio/jackaudio.c       |   1 +
 audio/noaudio.c         |   1 +
 audio/ossaudio.c        |   1 +
 audio/paaudio.c         |  71 ++++++++--
 audio/sdlaudio.c        | 305 ++++++++++++++++++++++++++++------------
 audio/spiceaudio.c      |   1 +
 qapi/audio.json         |  33 ++++-
 qemu-options.hx         |   8 +-
 16 files changed, 399 insertions(+), 161 deletions(-)

-- 
2.26.2

