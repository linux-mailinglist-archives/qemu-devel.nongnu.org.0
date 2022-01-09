Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D064889C4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 15:19:52 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Z30-0000sR-VM
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 09:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6Z1F-00007t-1X
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 09:18:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n6Z1B-0006yl-PB
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 09:18:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2hT8PAw7BF4o7wRcmtmL9xw250koRK/IIdXA75T6rwc=; b=N9+lvmmhNunoMm2B2WOuWk66M9
 W8cvXTKhvfwxbkYhpxpsmrZTKU/RMrOpEwuUeznU3EtjdxmkftnpCGxhnoCai8wpz8reFI3CGCb7a
 JnuisOxJhE2h9rhvbIktO3p/t6u08voIVlcyqY6/P+t5eBUyj7U+qO+NYmy6fVJG8UjWnKMNi4QVu
 NhUd5K6ERUQT+mHSSxOoV0jr2oPxMtcpM136/AjsKX+B+pGbY/7TYx+YChVFRlm6ggzniH/OJxmwP
 akAcmTd7yCgqrY3uCoaqsxRfo3LoH9QPjfD04kbq9LrS+Af+ccfyWtSsSGve01NZ0Pdedg9Ycu6d2
 eWnh/u3Od/4FyyIsrXD7XY17MZmuERG4EI8C9HL113U92RHV+VRdKDThWHXg1xbOWGXySReAlqOZg
 3T4ureKA0x72UfDjzlLQaHgmtmhzeVsHKvkt3nlKqhEdpfhvpyn1HdI+HxjZ8ukbAwPwgwKwGQgR5
 TOwfmPRNZQ3ALTNaBhZjyQG8p65hgcwV7GDTXZ3DRhYx2mIYct91/JhZYT/rLFFcqnCKm5tIFA6nY
 Jk6h9zomDipJET5vrgySIx4UhwOq+6dqAcDGHpVT7Q+UMgE9H5aLLV2DC1KV34iI4UkRcwDcGNW+h
 GIqVUF8rE4kQPmY9FgI874PjOO+8ncrpeHB5bPE4A=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>
Subject: Re: [PATCH 00/15] reduce audio playback latency
Date: Sun, 09 Jan 2022 15:17:51 +0100
Message-ID: <1981711.luYxhZlUWu@silver>
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Donnerstag, 6. Januar 2022 10:21:47 CET Volker R=FCmelin wrote:
> This patch series reduces the playback latency for audio backends,
> in some cases significantly. For PulseAudio, the audio buffer is
> also moved from the QEMU side to the PulseAudio server side. This
> improves the drop-out safety for PulseAudio.
>=20
> I actually measured the latency reduction with the PulseAudio
> backend. For the test I used my Linux host configured to play
> audio with PulseAudio. The guest was a Linux guest, also
> configured to use PulseAudio.

I haven't reviewed all the patches yet, but from what I read so far, does t=
hat=20
mean the additional 3rd buffer is solely for PulseAudio, so for JACK and ot=
her=20
backends these changes would overall be a degradation, wouldn't they?

> Measuring audio latencies is difficult. I played a sine tone in
> the guest with Audacity and measured the time from releasing the
> left mouse button until the tone can be heard. A few seconds
> before the measurement I started playback of an audio file with
> 10 minutes of silence to fill the audio buffers. The over-all
> latency can't be used to estimate the playback latency, but it
> can be used to calculate the playback latency reduction.
>=20
> The measured over-all latency with PulseAudio is around 200ms
> without these patches and around 135ms with these patches. The
> difference of 65ms agrees well with the expected value of
> 46.4ms * 2 + 15ms - 46.4ms =3D 61.4ms. 46.4ms * 2 is the size of
> the mixing-engine buffer ("[PATCH 14/15] paaudio: fix samples vs.
> frames mix-up" explains the factor 2), 15ms is the server side
> PulseAudio buffer size used before these patches and 46.4ms is
> the new server side PulseAudio buffer size.
>=20
> Volker R=FCmelin (15):
>    audio: replace open-coded buffer arithmetic
>    audio: move function audio_pcm_hw_clip_out()
>    audio: add function audio_pcm_hw_conv_in()
>    audio: inline function audio_pcm_sw_get_rpos_in()
>    paaudio: increase default latency to 46ms
>    jackaudio: use more jack audio buffers
>    audio: copy playback stream in sequential order
>    audio: add pcm_ops function table for capture backend
>    audio: revert tests for pcm_ops table
>    audio: restore mixing-engine playback buffer size
>    paaudio: reduce effective playback buffer size
>    dsoundaudio: reduce effective playback buffer size
>    ossaudio: reduce effective playback buffer size
>    paaudio: fix samples vs. frames mix-up
>    sdlaudio: fix samples vs. frames mix-up
>=20
>   audio/alsaaudio.c   |   1 +
>   audio/audio.c       | 194 ++++++++++++++++++++++++--------------------
>   audio/audio_int.h   |   9 +-
>   audio/coreaudio.c   |  13 +--
>   audio/dsoundaudio.c |  30 ++++---
>   audio/jackaudio.c   |   5 +-
>   audio/noaudio.c     |   1 +
>   audio/ossaudio.c    |  17 +++-
>   audio/paaudio.c     |  49 ++++++-----
>   audio/sdlaudio.c    |  21 +++--
>   audio/wavaudio.c    |   1 +
>   11 files changed, 199 insertions(+), 142 deletions(-)



