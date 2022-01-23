Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FEB4973F1
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 18:53:48 +0100 (CET)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBh3i-00019S-MD
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 12:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBh1g-0000FK-Rt
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 12:51:41 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:54179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBh1d-0007Se-Cz
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 12:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bVvicSrvUrKz4Qc3q54IhoZFSTkrlGrTFZdB6Wbb0/E=; b=Xr29CEy3s7wvKUxUikgYydSvYg
 0w68YcPyzWrKO5PyNh1JkKTAR59wquFpONIjE6R54nI8uYKoQ7HkyBt54QLnpBqqM774+Er9ygdMx
 miERhrkjlECtW4cTui5SBuHMJ5u5sQJ5hcOvKI/b3+QOD/cl1BnPjiXeZik8L6wPGTHPnKAlJEbN2
 7A/2FX2JdydU3PvPTkiSvAXgFnJzwGlQO3eVRASQ84ye5Ekz/2V7sd5JWFK6GguxlFxWsH4ilndFG
 0hkVGbSF+RSSLqYumDeme5fYcZKSdpaca6/d/JGfmeErc0TbOxMFBX6ot/jpX9sRdifA0cNg5JJEq
 tURchOWjMukpZI3wlgnn4yJma36WLpF9i++kfLP4uLXS/w/1eAoFc4QMGlQrTyoyVckRTMbNGf5Cm
 3hWYD5ajaNFf/XpkuK0T+CvJ2IrJN5TgpONFS8OFyLZaxItYEdesPDWkLJ759UAux/GaISTterYRK
 Oo9gTSmrvvR0mjJmaIAI6fGA3k01XLTH3EXSRLFK+pPYO18z7+x4Vs8hqQIAIUtI9+qMz5+HedBgQ
 x17rYWflxiEUnbCtlxAPz4faCjbPkTosM72gb0pscFYZHOiNS1j+iBCjmJQpukJzxNQTI5CDa8gYV
 X92wpqHsaK+aUEHpL9B3PckjjmP9f5zLveP1yTQBY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 06/15] jackaudio: use more jack audio buffers
Date: Sun, 23 Jan 2022 18:51:34 +0100
Message-ID: <2091711.ThPptIsUb9@silver>
In-Reply-To: <20220122125745.5037-6-vr_qemu@t-online.de>
References: <addf2564-d61c-707e-ce5f-fb06264e7a39@t-online.de>
 <20220122125745.5037-6-vr_qemu@t-online.de>
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

On Samstag, 22. Januar 2022 13:57:36 CET Volker R=FCmelin wrote:
> The next patch reduces the effective qemu playback buffer size
> by timer-period. Increase the number of jack audio buffers by
> one to preserve the total effective buffer size. The size of one
> jack audio buffer is 512 samples. With audio defaults that's
> 512 samples / 44100 samples/s =3D 11.6 ms and only slightly larger
> than the timer-period of 10 ms.
>=20
> The larger jack audio buffer increases audio dropout safety,
> because the high priority jack-audio worker threads can provide
> audio data for a longer period of time as with a smaller buffer
> and more audio data in the mixing engine buffer that they can't
> access.
>=20
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> ---
>  audio/jackaudio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 317009e936..26246c3a8b 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -483,8 +483,8 @@ static int qjack_client_init(QJackClient *c)
>          c->buffersize =3D 512;
>      }
>=20
> -    /* create a 2 period buffer */
> -    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 2);
> +    /* create a 3 period buffer */
> +    qjack_buffer_create(&c->fifo, c->nchannels, c->buffersize * 3);
>=20
>      qjack_client_connect_ports(c);
>      c->state =3D QJACK_STATE_RUNNING;




