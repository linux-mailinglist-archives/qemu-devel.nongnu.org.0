Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7566A21FD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdLp-0005uZ-QO; Fri, 24 Feb 2023 14:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pVdLd-0005KX-9I
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:03:15 -0500
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pVdLa-00039w-TK
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:03:13 -0500
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout12.t-online.de (Postfix) with SMTP id BBCC81DFC2;
 Fri, 24 Feb 2023 20:03:06 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.75]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pVdLW-2S8ifZ0; Fri, 24 Feb 2023 20:03:06 +0100
Message-ID: <fa61e27f-6c37-af55-44bc-119592240720@t-online.de>
Date: Fri, 24 Feb 2023 20:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v3 00/15] audio: improve callback interface for audio frontends
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1677265386-81AEBD99-703D9758/0/0 CLEAN NORMAL
X-TOI-MSGID: 52f2f6dc-438d-400d-9d2e-2bff0c13c3f1
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Based-on: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
([PATCH v2 00/11] audio: more improvements)

The callback interface for emulated audio devices is strange. The 
callback function has an 'avail' parameter that passes the number of 
bytes that can be written or read. Unfortunately, this value sometimes 
is only an imprecise estimate and the callback functions must check the 
actual bytes written or read. For playback devices, this means that they 
either need a ring buffer or have to write the unwritten bytes again the 
next time. For recording devices, things are a bit easier. They only 
need to continue with the actual number of bytes read.

After this patch series, the 'avail' argument for the -audiodev 
out.mixing-engine=on and in.mixing-engine=on cases is exact. Audio 
frontends only need a linear frame buffer and there's a guarantee they 
can write or read 'avail' bytes.

The -audiodev out.mixing-engine=off case is also mostly accurate. Only 
the D-Bus audio backend is still missing a required function. The 
-audiodev in.mixing-engine=off case always passes a much too large 
'avail' value. I haven't worked on this yet, because there was no reason 
for it so far.

The following logs show the improvements. Not only the audio frontends 
can write or read all needed or available bytes. The same is true for 
the audio backends. For playback, the first six lines in the logs are 
expected. Here you can see how quickly the guest fills the empty 
downstream buffers after playback starts.

QEMU was started with -device ich9-intel-hda,addr=0x1b -device 
hda-duplex,audiodev=audio0 -audiodev 
pa,out.frequency=96000,in.frequency=96000,id=audio0

playback guest 44100Hz => host 96000Hz

unpatched version:
hda_audio_output_cb: to write 8188, written 1704
audio_run_out: free 4458, played 926
hda_audio_output_cb: to write 6488, written 2384
audio_run_out: free 3532, played 1297
hda_audio_output_cb: to write 4104, written 2648
audio_run_out: free 2235, played 1441
audio_run_out: free 794, played 793
audio_run_out: free 897, played 896
audio_run_out: free 831, played 829
...
hda_audio_output_cb: could not write 4 bytes
hda_audio_output_cb: to write 1764, written 1760
audio_run_out: free 960, played 958
...

patched version:
hda_audio_output_cb: to write 8192, written 1620
audio_run_out: free 4458, played 880
hda_audio_output_cb: to write 6576, written 2508
audio_run_out: free 3578, played 1365
hda_audio_output_cb: to write 4068, written 2500
audio_run_out: free 2213, played 1360

record host 96000Hz => guest 44100Hz

unpatched version:
audio_run_in: avail 4458, acquired 4454
audio_run_in: avail 1574, acquired 1572
audio_run_in: avail 766, acquired 764
audio_run_in: avail 1052, acquired 1051
audio_run_in: avail 761, acquired 760
audio_run_in: avail 1123, acquired 1121
...
hda_audio_input_cb: could not read 4 bytes
hda_audio_input_cb: to read 1988, read 1984
audio_run_in: avail 1082, acquired 1080
...

patched version:
(no output)

QEMU was started with -device ich9-intel-hda,addr=0x1b -device 
hda-duplex,audiodev=audio0 -audiodev 
pa,out.frequency=32000,in.frequency=32000,id=audio0

playback guest 44100Hz => host 32000Hz

unpatched version:
hda_audio_output_cb: to write 8188, written 1620
audio_run_out: free 1486, played 294
hda_audio_output_cb: to write 6568, written 2512
audio_run_out: free 1192, played 455
hda_audio_output_cb: to write 4060, written 2504
audio_run_out: free 737, played 455
audio_run_out: free 282, played 281
audio_run_out: free 357, played 356
audio_run_out: free 314, played 313
...
hda_audio_output_cb: could not write 4 bytes
hda_audio_output_cb: to write 1416, written 1412
audio_run_out: free 257, played 256
...

patched version:
hda_audio_output_cb: to write 8192, written 1656
audio_run_out: free 1486, played 300
hda_audio_output_cb: to write 6536, written 2516
audio_run_out: free 1186, played 457
hda_audio_output_cb: to write 4020, written 2540
audio_run_out: free 729, played 460

record host 32000Hz => guest 44100Hz

unpatched version:
audio_run_in: avail 1486, acquired 1485
audio_run_in: avail 272, acquired 271
audio_run_in: avail 366, acquired 365
hda_audio_input_cb: could not read 4 bytes
hda_audio_input_cb: to read 1420, read 1416
audio_run_in: avail 258, acquired 257
audio_run_in: avail 375, acquired 374
hda_audio_input_cb: could not read 4 bytes
hda_audio_input_cb: to read 2056, read 2052
audio_run_in: avail 260, acquired 259
...

patched version:
(no output)

This is the debug code for the logs above.

---snip--
 > --- a/audio/audio.c    2022-12-13 19:14:31.793153558 +0100
 > +++ b/audio/audio.c    2022-12-11 16:24:48.842649711 +0100
 > @@ -1228,6 +1228,10 @@ static void audio_run_out (AudioState *s
 >  #ifdef DEBUG_OUT
 >          dolog("played=%zu\n", played);
 >  #endif
 > +        if (hw_free - played) {
 > +            fprintf(stderr, "%s: free %zu, played %zu\n",
 > +                    __func__, hw_free, played);
 > +        }
 >
 >          if (played) {
 >              hw->ts_helper += played;
 > @@ -1318,6 +1322,7 @@ static void audio_run_in (AudioState *s)
 >              if (sw->active) {
 >                  size_t sw_avail = audio_get_avail(sw);
 >                  size_t avail;
 > +                size_t prev_acquired = sw->total_hw_samples_acquired;
 >
 >                  avail = st_rate_frames_out(sw->rate, sw_avail);
 >                  if (avail > 0) {
 > @@ -1325,6 +1330,11 @@ static void audio_run_in (AudioState *s)
 > sw->callback.fn(sw->callback.opaque,
 >                                      avail * sw->info.bytes_per_frame);
 >                  }
 > +
 > +                if (sw_avail + prev_acquired - 
sw->total_hw_samples_acquired) {
 > +                    fprintf(stderr, "%s: avail %zu, acquired %zu\n", 
__func__,
 > +                            sw_avail, sw->total_hw_samples_acquired 
- prev_acquired);
 > +                }
 >              }
 >          }
 >      }
 > --- a/hw/audio/hda-codec.c    2023-01-04 14:07:31.954304889 +0100
 > +++ b/hw/audio/hda-codec.c    2023-01-04 13:57:47.687320406 +0100
 > @@ -265,20 +265,28 @@ static void hda_audio_input_cb(void *opa
 >      int64_t rpos = st->rpos;
 >
 >      int64_t to_transfer = MIN(B_SIZE - (wpos - rpos), avail);
 > +    unsigned int total_read = 0;
 >
 >      while (to_transfer) {
 >          uint32_t start = (uint32_t) (wpos & B_MASK);
 >          uint32_t chunk = (uint32_t) MIN(B_SIZE - start, to_transfer);
 >          uint32_t read = AUD_read(st->voice.in, st->buf + start, chunk);
 >          wpos += read;
 > +        total_read += read;
 >          to_transfer -= read;
 >          st->wpos += read;
 >          if (chunk != read) {
 > +            fprintf(stderr, "%s: could not read %u bytes\n", __func__,
 > +                    chunk - read);
 >              break;
 >          }
 >      }
 >
 >      hda_timer_sync_adjust(st, -((wpos - rpos) - (B_SIZE >> 1)));
 > +    if (avail != total_read) {
 > +        fprintf(stderr, "%s: to read %d, read %u\n", __func__,
 > +                avail, total_read);
 > +    }
 >  }
 >
 >  static void hda_audio_output_timer(void *opaque)
 > @@ -329,6 +337,7 @@ static void hda_audio_output_cb(void *op
 >      int64_t rpos = st->rpos;
 >
 >      int64_t to_transfer = MIN(wpos - rpos, avail);
 > +    unsigned int total_written = 0;
 >
 >      if (wpos - rpos == B_SIZE) {
 >          /* drop buffer, reset timer adjust */
 > @@ -343,15 +352,22 @@ static void hda_audio_output_cb(void *op
 >          uint32_t start = (uint32_t) (rpos & B_MASK);
 >          uint32_t chunk = (uint32_t) MIN(B_SIZE - start, to_transfer);
 >          uint32_t written = AUD_write(st->voice.out, st->buf + start, 
chunk);
 > +        total_written += written;
 >          rpos += written;
 >          to_transfer -= written;
 >          st->rpos += written;
 >          if (chunk != written) {
 > +            fprintf(stderr, "%s: could not write %u bytes\n", __func__,
 > +                    chunk - written);
 >              break;
 >          }
 >      }
 >
 >      hda_timer_sync_adjust(st, (wpos - rpos) - (B_SIZE >> 1));
 > +    if (avail != total_written) {
 > +        fprintf(stderr, "%s: to write %d, written %u\n", __func__,
 > +                avail, total_written);
 > +    }
 >  }
 >
 >  static void hda_audio_compat_input_cb(void *opaque, int avail)
---snip--

v2:
The patch series was rebased onto [PATCH v2 00/11] audio: more 
improvements. Patch 15/17 (audio: handle leftover audio frame from 
upsampling) and patch 17/17 (audio: remove sw->ratio) needed changes 
because of this.

v3:
Address Marc-André's comments.

Patches 09/17 (audio/mixeng: calculate number of input frames) and 10/17 
(audio: wire up st_rate_frames_in()) were squashed into patch 09/15 
(audio: make playback packet length calculation exact) and the function 
comment of st_rate_frames_in() has more details.

Patches 13/17 (audio/mixeng: calculate number of output frames) and 
14/17 (audio: wire up st_rate_frames_out()) were squashed into patch 
12/15 (audio: make recording packet length calculation exact) and the 
function comment of st_rate_frames_out() has more details.

Volker Rümelin (15):
   audio: change type of mix_buf and conv_buf
   audio: change type and name of the resample buffer
   audio: make the resampling code greedy
   audio: replace the resampling loop in audio_pcm_sw_write()
   audio: remove sw == NULL check
   audio: rename variables in audio_pcm_sw_write()
   audio: don't misuse audio_pcm_sw_write()
   audio: remove unused noop_conv() function
   audio: make playback packet length calculation exact
   audio: replace the resampling loop in audio_pcm_sw_read()
   audio: rename variables in audio_pcm_sw_read()
   audio: make recording packet length calculation exact
   audio: handle leftover audio frame from upsampling
   audio/audio_template: substitute sw->hw with hw
   audio: remove sw->ratio

  audio/audio.c          | 366 +++++++++++++++++++++--------------------
  audio/audio_int.h      |  12 +-
  audio/audio_template.h |  61 ++++---
  audio/mixeng.c         |  80 +++++++++
  audio/mixeng.h         |   2 +
  audio/rate_template.h  |  21 ++-
  6 files changed, 321 insertions(+), 221 deletions(-)

-- 
2.35.3


