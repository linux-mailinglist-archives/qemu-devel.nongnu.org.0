Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5484973C7
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 18:43:34 +0100 (CET)
Received: from localhost ([::1]:54756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBgtp-0005we-ES
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 12:43:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBgrF-0004Y8-Qr
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 12:40:55 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBgr8-0005Xj-FX
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 12:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=d2WVavhEnqiksLPLWg9tYfTsaf5Om5yUYjwLsLbEa9Y=; b=C2znr3b+c/5KVr6FS/PvtOL0PT
 BrVyuZpOlBSgFYWOnUjsSBt/XvwaKS+JxjaHYrW+d3GTQOnf4MrDeaNhmMrsSnW9gpGuIgM5GqaXf
 0Lo8dTphXOdiu4AJl9F4QPczMqk/1F5OQIyxHDUxGec7YZauyhkxhTjB1HPUHZ7g5CGlh+EQMy4fv
 xfku/XGg9ApdAXYpAiktms9vOE6audX9YJiWpeELJIKrDlXf3x7wMAdwz2KntoezJIA0yvwX+Vo7V
 x9AQnBDJ6U+UISBsfFI/eH87Hpo3dy7iMQIvkZCl0p3uCEp4AKD/+CiXmfThpc2UrjxlBQlybDwLb
 3gaP+5601MnZc0g5BmkEdbMF08n8nWRI8HKak3utYqIBDEh9BCe5RwH/Fo2MucKZjYghQi88jOizh
 hqJKHmyCl46U4JKnpCoaHMRhwpus/U43jIiM2eMXHJz5UzAFYr7EOGXZRN/O5WxB4BUAWoL6WYBs6
 LwbpHzEDtlEQmu8zb1Tlt05MNjUPG1mAPnRbdAHDmzXiak6i+NstN/W30Kahq6ENdaapYZZmHZRiF
 idrxj9V5hQbFlSR5g1hcdF3YdV6v/x7E+pKZsnzXatFcrSXxiiCJrM9cGcUHB0qmLvo0kihuU3Q6x
 0xdkg4FnZtT4OZsHAGDcmdc+cWr2T22Kg0sBdptdU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <huth@tuxfamily.org>
Subject: Re: [PATCH v2 01/15] audio: replace open-coded buffer arithmetic
Date: Sun, 23 Jan 2022 18:40:02 +0100
Message-ID: <7976963.x2vcT3psHa@silver>
In-Reply-To: <20220122125745.5037-1-vr_qemu@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <20220122125745.5037-1-vr_qemu@t-online.de>
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

On Samstag, 22. Januar 2022 13:57:31 CET Volker R=FCmelin wrote:
> Replace open-coded buffer arithmetic with the new function
> audio_ring_posb(). That's the position in backward direction
> of a given point at a given distance.
>=20
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> ---

=46irst of all, getting rid of all those redundant, open coded ringbuffer
traversal code places highly makes sense!

>  audio/audio.c     | 25 +++++++------------------
>  audio/audio_int.h |  6 ++++++
>  audio/coreaudio.c | 10 ++++------
>  audio/sdlaudio.c  | 11 +++++------
>  4 files changed, 22 insertions(+), 30 deletions(-)
>=20
> diff --git a/audio/audio.c b/audio/audio.c
> index dc28685d22..e7a139e289 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -574,19 +574,13 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn *s=
w)
>  {
>      HWVoiceIn *hw =3D sw->hw;
>      ssize_t live =3D hw->total_samples_captured - sw->total_hw_samples_a=
cquired;
> -    ssize_t rpos;
>=20
>      if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
>          dolog("live=3D%zu hw->conv_buf->size=3D%zu\n", live, hw->conv_bu=
f->size);
>          return 0;
>      }
>=20
> -    rpos =3D hw->conv_buf->pos - live;
> -    if (rpos >=3D 0) {
> -        return rpos;
> -    } else {
> -        return hw->conv_buf->size + rpos;
> -    }
> +    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->size);
>  }
>=20
>  static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t size)
> @@ -1394,12 +1388,10 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw)
>=20
>  void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
>  {
> -    ssize_t start =3D (ssize_t)hw->pos_emul - hw->pending_emul;
> +    size_t start;
>=20
> -    if (start < 0) {
> -        start +=3D hw->size_emul;
> -    }
> -    assert(start >=3D 0 && start < hw->size_emul);
> +    start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->size_e=
mul);
> +    assert(start < hw->size_emul);
>=20
>      *size =3D MIN(*size, hw->pending_emul);
>      *size =3D MIN(*size, hw->size_emul - start);
> @@ -1415,13 +1407,10 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw, v=
oid
> *buf, size_t size) void audio_generic_run_buffer_out(HWVoiceOut *hw)
>  {
>      while (hw->pending_emul) {
> -        size_t write_len, written;
> -        ssize_t start =3D ((ssize_t) hw->pos_emul) - hw->pending_emul;
> +        size_t write_len, written, start;
>=20
> -        if (start < 0) {
> -            start +=3D hw->size_emul;
> -        }
> -        assert(start >=3D 0 && start < hw->size_emul);
> +        start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->si=
ze_emul);
> +        assert(start < hw->size_emul);
>=20
>          write_len =3D MIN(hw->pending_emul, hw->size_emul - start);

Just refactoring so far, which looks good so far.

> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index 428a091d05..2fb459f34e 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -266,6 +266,12 @@ static inline size_t audio_ring_dist(size_t dst, siz=
e_t src, size_t len)
>      return (dst >=3D src) ? (dst - src) : (len - src + dst);
>  }

You haven't touched this function, but while I am looking at it, all functi=
on
arguments are unsigned. So probably modulo operator might be used to get rid
of a branch here.

>=20
> +/* return new position in backward direction at given distance */
> +static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t len)
> +{
> +    return pos >=3D dist ? pos - dist : len - dist + pos;
> +}
> +

Which is the exact same code as the already existing audio_ring_dist()
function above, and I see that you actually already used this in v1 before:

#define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist, len)

I would definitely not copy-paste the body. Thomas just suggested in v1 to =
add
a comment, not to duplicate the actual math code:
https://lore.kernel.org/qemu-devel/20220106111718.0ec25383@tuxfamily.org/

Also for consistency, I would have called the function audio_ring_rpos()
and would have commented each argument.

/**
 * Returns new position in ringbuffer in backward direction at given distan=
ce.
 * @pos: current position in ringbuffer
 * @dist: distance in ringbuffer to walk in reverse direction
 * @len: size of ringbuffer
 */
static inline size_t audio_ring_rpos(pos, dist, len) {
    return audio_ring_dist(pos, dist, len);
}

At least IMO a bit more comments on math code barely hurts.

>  #define dolog(fmt, ...) AUD_log(AUDIO_CAP, fmt, ## __VA_ARGS__)
>=20
>  #ifdef DEBUG
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index d8a21d3e50..1fdd1d4b14 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -333,12 +333,10 @@ static OSStatus audioDeviceIOProc(
>=20
>      len =3D frameCount * hw->info.bytes_per_frame;
>      while (len) {
> -        size_t write_len;
> -        ssize_t start =3D ((ssize_t) hw->pos_emul) - hw->pending_emul;
> -        if (start < 0) {
> -            start +=3D hw->size_emul;
> -        }
> -        assert(start >=3D 0 && start < hw->size_emul);
> +        size_t write_len, start;
> +
> +        start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul, hw->si=
ze_emul);
> +        assert(start < hw->size_emul);
>=20
>          write_len =3D MIN(MIN(hw->pending_emul, len),
>                          hw->size_emul - start);
> diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
> index c68c62a3e4..d6f3aa1a9a 100644
> --- a/audio/sdlaudio.c
> +++ b/audio/sdlaudio.c
> @@ -224,12 +224,11 @@ static void sdl_callback_out(void *opaque, Uint8 *b=
uf,
> int len) /* dolog("callback_out: len=3D%d avail=3D%zu\n", len,
> hw->pending_emul); */
>=20
>          while (hw->pending_emul && len) {
> -            size_t write_len;
> -            ssize_t start =3D (ssize_t)hw->pos_emul - hw->pending_emul;
> -            if (start < 0) {
> -                start +=3D hw->size_emul;
> -            }
> -            assert(start >=3D 0 && start < hw->size_emul);
> +            size_t write_len, start;
> +
> +            start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul,
> +                                    hw->size_emul);
> +            assert(start < hw->size_emul);
>=20
>              write_len =3D MIN(MIN(hw->pending_emul, len),
>                              hw->size_emul - start);

This rest looks fine to me.

Best regards,
Christian Schoenebeck



