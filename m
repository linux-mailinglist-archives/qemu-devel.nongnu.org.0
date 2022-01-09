Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E05488AF6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:22:30 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6btk-0004jH-IC
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6bee-0006Nk-3g
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:06:52 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6bea-0005Ui-UC
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:06:51 -0500
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout07.t-online.de (Postfix) with SMTP id 26502BD9F;
 Sun,  9 Jan 2022 18:06:46 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n6beW-3d8edV0; Sun, 9 Jan 2022 18:06:44 +0100
Message-ID: <988cdc99-ed34-00cb-bef1-e73b94672a28@t-online.de>
Date: Sun, 9 Jan 2022 18:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 00/15] reduce audio playback latency
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <1981711.luYxhZlUWu@silver>
Content-Language: en-US
In-Reply-To: <1981711.luYxhZlUWu@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641748004-00004E7B-020E9C32/0/0 CLEAN NORMAL
X-TOI-MSGID: f13533c3-5e19-4877-8d95-f3d1ad726932
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Donnerstag, 6. Januar 2022 10:21:47 CET Volker Rümelin wrote:
>> This patch series reduces the playback latency for audio backends,
>> in some cases significantly. For PulseAudio, the audio buffer is
>> also moved from the QEMU side to the PulseAudio server side. This
>> improves the drop-out safety for PulseAudio.
>>
>> I actually measured the latency reduction with the PulseAudio
>> backend. For the test I used my Linux host configured to play
>> audio with PulseAudio. The guest was a Linux guest, also
>> configured to use PulseAudio.
> I haven't reviewed all the patches yet, but from what I read so far, does that
> mean the additional 3rd buffer is solely for PulseAudio, so for JACK and other
> backends these changes would overall be a degradation, wouldn't they?

No, nothing changes for JACK and it's an improvement for all the other 
backends where I added a buffer_get_free function. The important changes 
are in [PATCH 10/15] audio: restore mixing-engine playback buffer size. 
That patch tries to keep the mixing-engine buffer empty at the end of 
audio_run_out().

I couldn't reduce the playback latency for JACK, because the JACK audio 
buffers are already very small and any further reduction introduces 
playback glitches on my system.

For PulseAudio there is no additional buffer. I only increased the size 
of the server side buffer from 15ms to 46,4ms and added a 
buffer_get_free function. Before this patch series a few ten ms after 
playback started the mixing-engine buffer was full which added 2 * 
46,4ms to the playback latency. With these patches the mixing-engine 
buffer is empty. This looks like the buffer in use was moved from the 
mixing-engine to the PulseAudio server side.

>> Measuring audio latencies is difficult. I played a sine tone in
>> the guest with Audacity and measured the time from releasing the
>> left mouse button until the tone can be heard. A few seconds
>> before the measurement I started playback of an audio file with
>> 10 minutes of silence to fill the audio buffers. The over-all
>> latency can't be used to estimate the playback latency, but it
>> can be used to calculate the playback latency reduction.
>>
>> The measured over-all latency with PulseAudio is around 200ms
>> without these patches and around 135ms with these patches. The
>> difference of 65ms agrees well with the expected value of
>> 46.4ms * 2 + 15ms - 46.4ms = 61.4ms. 46.4ms * 2 is the size of
>> the mixing-engine buffer ("[PATCH 14/15] paaudio: fix samples vs.
>> frames mix-up" explains the factor 2), 15ms is the server side
>> PulseAudio buffer size used before these patches and 46.4ms is
>> the new server side PulseAudio buffer size.
>>
>> Volker Rümelin (15):
>>     audio: replace open-coded buffer arithmetic
>>     audio: move function audio_pcm_hw_clip_out()
>>     audio: add function audio_pcm_hw_conv_in()
>>     audio: inline function audio_pcm_sw_get_rpos_in()
>>     paaudio: increase default latency to 46ms
>>     jackaudio: use more jack audio buffers
>>     audio: copy playback stream in sequential order
>>     audio: add pcm_ops function table for capture backend
>>     audio: revert tests for pcm_ops table
>>     audio: restore mixing-engine playback buffer size
>>     paaudio: reduce effective playback buffer size
>>     dsoundaudio: reduce effective playback buffer size
>>     ossaudio: reduce effective playback buffer size
>>     paaudio: fix samples vs. frames mix-up
>>     sdlaudio: fix samples vs. frames mix-up
>>
>>    audio/alsaaudio.c   |   1 +
>>    audio/audio.c       | 194 ++++++++++++++++++++++++--------------------
>>    audio/audio_int.h   |   9 +-
>>    audio/coreaudio.c   |  13 +--
>>    audio/dsoundaudio.c |  30 ++++---
>>    audio/jackaudio.c   |   5 +-
>>    audio/noaudio.c     |   1 +
>>    audio/ossaudio.c    |  17 +++-
>>    audio/paaudio.c     |  49 ++++++-----
>>    audio/sdlaudio.c    |  21 +++--
>>    audio/wavaudio.c    |   1 +
>>    11 files changed, 199 insertions(+), 142 deletions(-)


