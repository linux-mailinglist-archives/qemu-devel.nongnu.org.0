Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F249BBDC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 20:12:10 +0100 (CET)
Received: from localhost ([::1]:37178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCREf-0005Gp-8q
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 14:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nCR1A-00073a-70
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:58:12 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:49948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nCR12-0004ra-1F
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:58:07 -0500
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 6680F118EF;
 Tue, 25 Jan 2022 19:58:00 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nCR0y-0tJIvJ0; Tue, 25 Jan 2022 19:58:00 +0100
Message-ID: <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
Date: Tue, 25 Jan 2022 19:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 01/15] audio: replace open-coded buffer arithmetic
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <20220122125745.5037-1-vr_qemu@t-online.de> <7976963.x2vcT3psHa@silver>
Content-Language: en-US
In-Reply-To: <7976963.x2vcT3psHa@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1643137080-0001619A-22CDBBC2/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ace7fbb-6fba-4179-83bb-9c83e871cfda
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
Cc: Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On Samstag, 22. Januar 2022 13:57:31 CET Volker Rümelin wrote:
>> Replace open-coded buffer arithmetic with the new function
>> audio_ring_posb(). That's the position in backward direction
>> of a given point at a given distance.
>>
>> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
>> ---
> First of all, getting rid of all those redundant, open coded ringbuffer
> traversal code places highly makes sense!
>
>>   audio/audio.c     | 25 +++++++------------------
>>   audio/audio_int.h |  6 ++++++
>>   audio/coreaudio.c | 10 ++++------
>>   audio/sdlaudio.c  | 11 +++++------
>>   4 files changed, 22 insertions(+), 30 deletions(-)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index dc28685d22..e7a139e289 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -574,19 +574,13 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *sw)
>>   {
>>       HWVoiceIn *hw = sw->hw;
>>       ssize_t live = hw->total_samples_captured - sw->total_hw_samples_acquired;
>> -    ssize_t rpos;
>>
>>       if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
>>           dolog("live=%zu hw->conv_buf->size=%zu\n", live, hw->conv_buf->size);
>>           return 0;
>>       }
>>
>> -    rpos = hw->conv_buf->pos - live;
>> -    if (rpos >= 0) {
>> -        return rpos;
>> -    } else {
>> -        return hw->conv_buf->size + rpos;
>> -    }
>> +    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
>>   }
>>
>>   static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
>> @@ -1394,12 +1388,10 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw)
>>
>>   void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
>>   {
>> -    ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
>> +    size_t start;
>>
>> -    if (start < 0) {
>> -        start += hw->size_emul;
>> -    }
>> -    assert(start >= 0 && start < hw->size_emul);
>> +    start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
>> +    assert(start < hw->size_emul);
>>
>>       *size = MIN(*size, hw->pending_emul);
>>       *size = MIN(*size, hw->size_emul - start);
>> @@ -1415,13 +1407,10 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw, void
>> *buf, size_t size) void audio_generic_run_buffer_out(HWVoiceOut *hw)
>>   {
>>       while (hw->pending_emul) {
>> -        size_t write_len, written;
>> -        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
>> +        size_t write_len, written, start;
>>
>> -        if (start < 0) {
>> -            start += hw->size_emul;
>> -        }
>> -        assert(start >= 0 && start < hw->size_emul);
>> +        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
>> +        assert(start < hw->size_emul);
>>
>>           write_len = MIN(hw->pending_emul, hw->size_emul - start);
> Just refactoring so far, which looks good so far.
>
>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>> index 428a091d05..2fb459f34e 100644
>> --- a/audio/audio_int.h
>> +++ b/audio/audio_int.h
>> @@ -266,6 +266,12 @@ static inline size_t audio_ring_dist(size_t dst, size_t src, size_t len)
>>       return (dst >= src) ? (dst - src) : (len - src + dst);
>>   }
> You haven't touched this function, but while I am looking at it, all function
> arguments are unsigned. So probably modulo operator might be used to get rid
> of a branch here.

That would be "return (len - dist + pos) % len;" but on my x86_64 system 
I always prefer a conditional move instruction to a 64 bit integer 
division instruction.

>> +/* return new position in backward direction at given distance */
>> +static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
>> +{
>> +    return pos >= dist ? pos - dist : len - dist + pos;
>> +}
>> +
> Which is the exact same code as the already existing audio_ring_dist()
> function above, and I see that you actually already used this in v1 before:
>
> #define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist, len)
>
> I would definitely not copy-paste the body. Thomas just suggested in v1 to add
> a comment, not to duplicate the actual math code:
> https://lore.kernel.org/qemu-devel/20220106111718.0ec25383@tuxfamily.org/
>
> Also for consistency, I would have called the function audio_ring_rpos()
> and would have commented each argument.

In the audio subsystem rpos is typically the read position. I chose posb 
to distinguish it from read position.

> /**
>   * Returns new position in ringbuffer in backward direction at given distance.
>   * @pos: current position in ringbuffer
>   * @dist: distance in ringbuffer to walk in reverse direction
>   * @len: size of ringbuffer
>   */

This comment is better than my comment. I'll use it in my v3 series.

> static inline size_t audio_ring_rpos(pos, dist, len) {
>      return audio_ring_dist(pos, dist, len);
> }

I don't think this inline function improves readability compared to my 
macro from v1. To understand the code you still have to replace 
parameter names in your mind. My v2 inline function can be understood at 
first glance.

With best regards,
Volker

> At least IMO a bit more comments on math code barely hurts.
>
>>   #define dolog(fmt, ...) AUD_log(AUDIO_CAP, fmt, ## __VA_ARGS__)
>>
>>   #ifdef DEBUG
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index d8a21d3e50..1fdd1d4b14 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -333,12 +333,10 @@ static OSStatus audioDeviceIOProc(
>>
>>       len = frameCount * hw->info.bytes_per_frame;
>>       while (len) {
>> -        size_t write_len;
>> -        ssize_t start = ((ssize_t) hw->pos_emul) - hw->pending_emul;
>> -        if (start < 0) {
>> -            start += hw->size_emul;
>> -        }
>> -        assert(start >= 0 && start < hw->size_emul);
>> +        size_t write_len, start;
>> +
>> +        start = audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_emul);
>> +        assert(start < hw->size_emul);
>>
>>           write_len = MIN(MIN(hw->pending_emul, len),
>>                           hw->size_emul - start);
>> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
>> index c68c62a3e4..d6f3aa1a9a 100644
>> --- a/audio/sdlaudio.c
>> +++ b/audio/sdlaudio.c
>> @@ -224,12 +224,11 @@ static void sdl_callback_out(void *opaque, Uint8 *buf,
>> int len) /* dolog("callback_out: len=%d avail=%zu\n", len,
>> hw->pending_emul); */
>>
>>           while (hw->pending_emul && len) {
>> -            size_t write_len;
>> -            ssize_t start = (ssize_t)hw->pos_emul - hw->pending_emul;
>> -            if (start < 0) {
>> -                start += hw->size_emul;
>> -            }
>> -            assert(start >= 0 && start < hw->size_emul);
>> +            size_t write_len, start;
>> +
>> +            start = audio_ring_posb(hw->pos_emul, hw->pending_emul,
>> +                                    hw->size_emul);
>> +            assert(start < hw->size_emul);
>>
>>               write_len = MIN(MIN(hw->pending_emul, len),
>>                               hw->size_emul - start);
> This rest looks fine to me.
>
> Best regards,
> Christian Schoenebeck
>
>


