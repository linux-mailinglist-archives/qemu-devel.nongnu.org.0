Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25E48A22B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:53:18 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n72bN-0000vQ-8l
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:53:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n72Yu-0007v4-SP
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:50:45 -0500
Received: from mailout09.t-online.de ([194.25.134.84]:53532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n72Ys-0002uT-Po
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:50:44 -0500
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout09.t-online.de (Postfix) with SMTP id 08E95F20C;
 Mon, 10 Jan 2022 22:50:39 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n72Ym-22hQ8X0; Mon, 10 Jan 2022 22:50:36 +0100
Message-ID: <42c95d74-aca9-257b-0e83-b35d69a790ec@t-online.de>
Date: Mon, 10 Jan 2022 22:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 00/15] reduce audio playback latency
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
 <1981711.luYxhZlUWu@silver>
 <988cdc99-ed34-00cb-bef1-e73b94672a28@t-online.de>
 <3415099.zrPmtJVVhH@silver>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <3415099.zrPmtJVVhH@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641851436-0000AD4E-08C60ACC/0/0 CLEAN NORMAL
X-TOI-MSGID: f8bd0464-c0e1-4303-9c17-463043190632
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.01.22 um 14:11 schrieb Christian Schoenebeck:
> On Sonntag, 9. Januar 2022 18:06:44 CET Volker Rümelin wrote:
>>> On Donnerstag, 6. Januar 2022 10:21:47 CET Volker Rümelin wrote:
>>>> This patch series reduces the playback latency for audio backends,
>>>> in some cases significantly. For PulseAudio, the audio buffer is
>>>> also moved from the QEMU side to the PulseAudio server side. This
>>>> improves the drop-out safety for PulseAudio.
>>>>
>>>> I actually measured the latency reduction with the PulseAudio
>>>> backend. For the test I used my Linux host configured to play
>>>> audio with PulseAudio. The guest was a Linux guest, also
>>>> configured to use PulseAudio.
>>> I haven't reviewed all the patches yet, but from what I read so far, does
>>> that mean the additional 3rd buffer is solely for PulseAudio, so for JACK
>>> and other backends these changes would overall be a degradation, wouldn't
>>> they?
>> No, nothing changes for JACK and it's an improvement for all the other
>> backends where I added a buffer_get_free function. The important changes
>> are in [PATCH 10/15] audio: restore mixing-engine playback buffer size.
>> That patch tries to keep the mixing-engine buffer empty at the end of
>> audio_run_out().
>>
>> I couldn't reduce the playback latency for JACK, because the JACK audio
>> buffers are already very small and any further reduction introduces
>> playback glitches on my system.
> And that's actually my concern. A split 2 buffers -> 3 buffers while
> (approximately) retaining overall latency increases the chance of dropouts.

No, the 3 * 512 frames JACK buffer improves dropout safety compared to a 
2 * 512 frames buffer. Before my patches I could sometimes hear glitches 
when I switched from and to the QEMU GTK window. With the change to a 3 
* 512 frames JACK buffer, audio playback is glitch free and it comes 
without additional playback latency.

>
>> For PulseAudio there is no additional buffer. I only increased the size
>> of the server side buffer from 15ms to 46,4ms and added a
>> buffer_get_free function. Before this patch series a few ten ms after
>> playback started the mixing-engine buffer was full which added 2 *
>> 46,4ms to the playback latency. With these patches the mixing-engine
>> buffer is empty. This looks like the buffer in use was moved from the
>> mixing-engine to the PulseAudio server side.
>


