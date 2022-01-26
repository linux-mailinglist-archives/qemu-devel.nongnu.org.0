Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F849C94F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:09:44 +0100 (CET)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCh7P-00059F-Ni
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCh0A-0002Rn-PW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:02:15 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nCh06-0007JE-Lo
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=G9BXehR18dTsZ7sTo70X54CW2njQ6dSQyb2H6DYl2uE=; b=S2ObFp4FtxJ9CDwo++g02k8JVs
 VmFwoVpQOg4rlpP3JzH57CF8YWPCJd3oIcjfNWT7XDlJJOVCVKP/wvSMzGhvmZxk056zlAaft80sQ
 /KmYBmAyoySIwM+onF8xOjn3l+M0M0s7RvIakOuP5lFTEPp6bIkI2SD3c8NLGH1/mY6luZm4na7kF
 yNe0PpxXVDQpzwWgoEVjN7ztekcZNwKeK8A3WrDcUtqQRN2qkUtd8L3Ri6ydYl2nO4Ec2Q18BYFTD
 Q1m2R2sihsiK8rmeXsbGUxWptbbbTdW94Nx38Pga003E1YmEcA1EcmD3IogUXMUazRw8as1cchHdf
 La7APBDkyHSFAUrgzHPDbyjdHUl10KTsfIWSSrPdJpL33c6CwCSMfmibp34ZVKTV9SBMMVp82OKld
 GmJ/8zEqw+I7R7kvbkSUI5EgfLodx3nvuTfCfwTjtBaXXT6bDlOeZGR/R137p+FZ0iEs58YvAM7RU
 aUHOUXLyOmaJz7prYNZhwrVPK/E85cyDlCYJslZVHgvAJwdmrTG/hZHNc2lOtPGHpj/2lcgesjmdm
 uTVXGxv1qCKddGFMugn2+5/3N9iOs6yOl6OO06s11omVaSx6ENjIHQ2F04eZeOtmoRcp+cwvcepao
 ZkSNnZZsMhV6aKvb1Dhe3fVinJq9yl7/t8jcaEMT0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Thomas Huth <huth@tuxfamily.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 01/15] audio: replace open-coded buffer arithmetic
Date: Wed, 26 Jan 2022 13:01:49 +0100
Message-ID: <2983943.3R1u2BzM1D@silver>
In-Reply-To: <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <7976963.x2vcT3psHa@silver>
 <a9141436-adbb-e216-4131-157b0e634162@t-online.de>
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

On Dienstag, 25. Januar 2022 19:57:59 CET Volker R=FCmelin wrote:
> > On Samstag, 22. Januar 2022 13:57:31 CET Volker R=FCmelin wrote:
> >> Replace open-coded buffer arithmetic with the new function
> >> audio_ring_posb(). That's the position in backward direction
> >> of a given point at a given distance.
> >>=20
> >> Signed-off-by: Volker R=FCmelin<vr_qemu@t-online.de>
> >> ---
> >=20
> > First of all, getting rid of all those redundant, open coded ringbuffer
> > traversal code places highly makes sense!
> >=20
> >>   audio/audio.c     | 25 +++++++------------------
> >>   audio/audio_int.h |  6 ++++++
> >>   audio/coreaudio.c | 10 ++++------
> >>   audio/sdlaudio.c  | 11 +++++------
> >>   4 files changed, 22 insertions(+), 30 deletions(-)
> >>=20
> >> diff --git a/audio/audio.c b/audio/audio.c
> >> index dc28685d22..e7a139e289 100644
> >> --- a/audio/audio.c
> >> +++ b/audio/audio.c
> >> @@ -574,19 +574,13 @@ static size_t audio_pcm_sw_get_rpos_in(SWVoiceIn
> >> *sw)
> >>=20
> >>   {
> >>  =20
> >>       HWVoiceIn *hw =3D sw->hw;
> >>       ssize_t live =3D hw->total_samples_captured -
> >>       sw->total_hw_samples_acquired;
> >>=20
> >> -    ssize_t rpos;
> >>=20
> >>       if (audio_bug(__func__, live < 0 || live > hw->conv_buf->size)) {
> >>      =20
> >>           dolog("live=3D%zu hw->conv_buf->size=3D%zu\n", live,
> >>           hw->conv_buf->size);
> >>           return 0;
> >>      =20
> >>       }
> >>=20
> >> -    rpos =3D hw->conv_buf->pos - live;
> >> -    if (rpos >=3D 0) {
> >> -        return rpos;
> >> -    } else {
> >> -        return hw->conv_buf->size + rpos;
> >> -    }
> >> +    return audio_ring_posb(hw->conv_buf->pos, live, hw->conv_buf->siz=
e);
> >>=20
> >>   }
> >>  =20
> >>   static size_t audio_pcm_sw_read(SWVoiceIn *sw, void *buf, size_t siz=
e)
> >>=20
> >> @@ -1394,12 +1388,10 @@ void audio_generic_run_buffer_in(HWVoiceIn *hw)
> >>=20
> >>   void *audio_generic_get_buffer_in(HWVoiceIn *hw, size_t *size)
> >>   {
> >>=20
> >> -    ssize_t start =3D (ssize_t)hw->pos_emul - hw->pending_emul;
> >> +    size_t start;
> >>=20
> >> -    if (start < 0) {
> >> -        start +=3D hw->size_emul;
> >> -    }
> >> -    assert(start >=3D 0 && start < hw->size_emul);
> >> +    start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul,
> >> hw->size_emul); +    assert(start < hw->size_emul);
> >>=20
> >>       *size =3D MIN(*size, hw->pending_emul);
> >>       *size =3D MIN(*size, hw->size_emul - start);
> >>=20
> >> @@ -1415,13 +1407,10 @@ void audio_generic_put_buffer_in(HWVoiceIn *hw,
> >> void *buf, size_t size) void audio_generic_run_buffer_out(HWVoiceOut
> >> *hw)>>=20
> >>   {
> >>  =20
> >>       while (hw->pending_emul) {
> >>=20
> >> -        size_t write_len, written;
> >> -        ssize_t start =3D ((ssize_t) hw->pos_emul) - hw->pending_emul;
> >> +        size_t write_len, written, start;
> >>=20
> >> -        if (start < 0) {
> >> -            start +=3D hw->size_emul;
> >> -        }
> >> -        assert(start >=3D 0 && start < hw->size_emul);
> >> +        start =3D audio_ring_posb(hw->pos_emul, hw->pending_emul,
> >> hw->size_emul); +        assert(start < hw->size_emul);
> >>=20
> >>           write_len =3D MIN(hw->pending_emul, hw->size_emul - start);
> >=20
> > Just refactoring so far, which looks good so far.
> >=20
> >> diff --git a/audio/audio_int.h b/audio/audio_int.h
> >> index 428a091d05..2fb459f34e 100644
> >> --- a/audio/audio_int.h
> >> +++ b/audio/audio_int.h
> >> @@ -266,6 +266,12 @@ static inline size_t audio_ring_dist(size_t dst,
> >> size_t src, size_t len)>>=20
> >>       return (dst >=3D src) ? (dst - src) : (len - src + dst);
> >>  =20
> >>   }
> >=20
> > You haven't touched this function, but while I am looking at it, all
> > function arguments are unsigned. So probably modulo operator might be
> > used to get rid of a branch here.
>=20
> That would be "return (len - dist + pos) % len;" but on my x86_64 system
> I always prefer a conditional move instruction to a 64 bit integer
> division instruction.

Nevermind, I just mentioned it as a side note, here in QEMU it probably=20
doesn't matter at all. In other apps this is sometimes used in tight loops=
=20
where it can make a measurable difference to get rid of the branch(es).

>=20
> >> +/* return new position in backward direction at given distance */
> >> +static inline size_t audio_ring_posb(size_t pos, size_t dist, size_t
> >> len)
> >> +{
> >> +    return pos >=3D dist ? pos - dist : len - dist + pos;
> >> +}
> >> +
> >=20
> > Which is the exact same code as the already existing audio_ring_dist()
> > function above, and I see that you actually already used this in v1
> > before:
> >=20
> > #define audio_ring_posb(pos, dist, len) audio_ring_dist(pos, dist, len)
> >=20
> > I would definitely not copy-paste the body. Thomas just suggested in v1=
 to
> > add a comment, not to duplicate the actual math code:
> > https://lore.kernel.org/qemu-devel/20220106111718.0ec25383@tuxfamily.or=
g/
> >=20
> > Also for consistency, I would have called the function audio_ring_rpos()
> > and would have commented each argument.
>=20
> In the audio subsystem rpos is typically the read position. I chose posb
> to distinguish it from read position.
>=20
> > /**
> >=20
> >   * Returns new position in ringbuffer in backward direction at given
> >   distance. * @pos: current position in ringbuffer
> >   * @dist: distance in ringbuffer to walk in reverse direction
> >   * @len: size of ringbuffer
> >   */
>=20
> This comment is better than my comment. I'll use it in my v3 series.
>=20
> > static inline size_t audio_ring_rpos(pos, dist, len) {
> >=20
> >      return audio_ring_dist(pos, dist, len);
> >=20
> > }
>=20
> I don't think this inline function improves readability compared to my
> macro from v1. To understand the code you still have to replace
> parameter names in your mind. My v2 inline function can be understood at
> first glance.

I didn't mean readability. Believe it or not, it took me a bit to realize t=
hat=20
it was the exact same code as above.

Best regards,
Christian Schoenebeck



