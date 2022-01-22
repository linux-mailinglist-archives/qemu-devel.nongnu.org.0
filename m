Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C36496C83
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:21:27 +0100 (CET)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGKc-0007me-0B
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:21:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nBFth-0005cp-3t
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:53:39 -0500
Received: from mailout02.t-online.de ([194.25.134.17]:59796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nBFtZ-0002Kf-L1
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 07:53:32 -0500
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout02.t-online.de (Postfix) with SMTP id 28042396A;
 Sat, 22 Jan 2022 13:52:46 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nBFsq-044hwf0; Sat, 22 Jan 2022 13:52:44 +0100
Message-ID: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
Date: Sat, 22 Jan 2022 13:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 00/15] reduce audio playback latency
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1642855964-0001619A-201FD2BA/0/0 CLEAN NORMAL
X-TOI-MSGID: f9a56268-3a70-4653-a986-7b3f4be1efd5
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series reduces the playback latency for audio backends,
in some cases significantly. For PulseAudio, the audio buffer is
also moved from the QEMU side to the PulseAudio server side. This
improves the drop-out safety for PulseAudio.

I actually measured the latency reduction with the PulseAudio
backend. For the test I used my Linux host configured to play
audio with PulseAudio. The guest was a Linux guest, also
configured to use PulseAudio.

Measuring audio latencies is difficult. I played a sine tone in
the guest with Audacity and measured the time from releasing the
left mouse button until the tone can be heard. A few seconds
before the measurement I started playback of an audio file with
10 minutes of silence to fill the audio buffers. The over-all
latency can't be used to estimate the playback latency, but it
can be used to calculate the playback latency reduction.

The measured over-all latency with PulseAudio is around 200ms
without these patches and around 135ms with these patches. The
difference of 65ms agrees well with the expected value of
46.4ms * 2 + 15ms - 46.4ms = 61.4ms. 46.4ms * 2 is the size of
the mixing-engine buffer ("[PATCH 14/15] paaudio: fix samples vs.
frames mix-up" explains the factor 2), 15ms is the server side
PulseAudio buffer size used before these patches and 46.4ms is
the new server side PulseAudio buffer size.

For JACK users these patches don't reduce the playback latency
but improve drop-out safety. After patch "audio: restore mixing-
engine playback buffer size" the buffer size used is exactly
the same as before these patches.

v2:
[PATCH v2 01/15] audio: replace open-coded buffer arithmetic
Replaced the audio_ring_posb macro with an inline function. The
macro trick made the code quite unreadable. Compared to v1 the
generated code size stays the same.

[PATCH v2 06/15] jackaudio: use more jack audio buffers
Improved commit message.

[PATCH v2 09/15] Revert "audio: fix wavcapture segfault"
Used git revert cbaf25d1f5.

[PATCH v2 13/15] ossaudio: reduce effective playback buffer size
Improved commit message.

Volker Rümelin (15):
   audio: replace open-coded buffer arithmetic
   audio: move function audio_pcm_hw_clip_out()
   audio: add function audio_pcm_hw_conv_in()
   audio: inline function audio_pcm_sw_get_rpos_in()
   paaudio: increase default latency to 46ms
   jackaudio: use more jack audio buffers
   audio: copy playback stream in sequential order
   audio: add pcm_ops function table for capture backend
   Revert "audio: fix wavcapture segfault"
   audio: restore mixing-engine playback buffer size
   paaudio: reduce effective playback buffer size
   dsoundaudio: reduce effective playback buffer size
   ossaudio: reduce effective playback buffer size
   paaudio: fix samples vs. frames mix-up
   sdlaudio: fix samples vs. frames mix-up

  audio/alsaaudio.c   |   1 +
  audio/audio.c       | 194 ++++++++++++++++++++++++--------------------
  audio/audio_int.h   |  13 ++-
  audio/coreaudio.c   |  13 +--
  audio/dsoundaudio.c |  30 ++++---
  audio/jackaudio.c   |   5 +-
  audio/noaudio.c     |   1 +
  audio/ossaudio.c    |  17 +++-
  audio/paaudio.c     |  49 ++++++-----
  audio/sdlaudio.c    |  21 +++--
  audio/wavaudio.c    |   1 +
  11 files changed, 203 insertions(+), 142 deletions(-)

-- 
2.31.1

