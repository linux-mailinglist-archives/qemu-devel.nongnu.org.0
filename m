Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881984CAD6B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:23:06 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTcv-0002i3-JY
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPTRt-0006eX-7Z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:41 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPTRq-0008LP-Oa
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=70lYZvgFLXC94ZH7r5J67h7lr3M7VCE1YgdfMB/y0BI=; b=kset9nwcS4mZJVgWi1TWmRFx+Z
 19JdRSX6GSZEGRZvI2IjafGgaEPe1acJV1cArau/Ze307F9OqiXPqgaqvPsJ8ycP0BfNJhChM+GiK
 QXyN9CyiLIRfyaCjcpuvMoJ6LjhhBThXpxtauU88eA2SPp4Al0BeHbq9QVIvgyAxqPEp/VF7w9i0/
 +i44JZ9OyluxxWZ0SDEPk+TENN84QbVAcf8lhVg0RJxct8mM+3yD2PNauijcqXnNAIVb9YIxuw75g
 gtynWpIst3G6Tp0B1K2ZZ/NLbddWczV0XWyWVopNgpBChfwoS9xeZVUrKic9ixM/Wlys6yDD5HFR7
 gTjnaxYQ2zFIb/urLjJNij22EpIE6hZYe73zPUPV5IgTWflVX9WXZYtalCg/KaBY+oujYegz8NOZQ
 kPg1zryYmRXguhxsxOvgChouNvoSXigO7niW0WZUIKeH7LXETL2v6GvlcDV9abei5ge739iHgEJtI
 UmPLn7xMkZBWXvE6Ww30X1yUyvFkIb4MzVltfxIuX/bm9oEwLkezQXk5sJq3foZRMVhcJYmYOxtkt
 dj7sKDEpNWziF67amLNx9pP7V/KBNTFOlbmhcJoViucdPg5O/fJ/KMgO1sKm3SP5Q6DdMNhcwDS0I
 5h3kkWfXruxHXY4FwpfZrASrJPwr69RlxccpVyg4s=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 06/15] jackaudio: use more jack audio buffers
Date: Wed, 02 Mar 2022 19:11:36 +0100
Message-ID: <1951855.XoFpWQ29RW@silver>
In-Reply-To: <20220301191311.26695-6-vr_qemu@t-online.de>
References: <3d0bd2ac-e5b9-9cf6-c98f-c047390a3ec5@t-online.de>
 <20220301191311.26695-6-vr_qemu@t-online.de>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 1. M=E4rz 2022 20:13:02 CET Volker R=FCmelin wrote:
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
> ---

I actually reviewed this patch already, but OK, then a 2nd time:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck

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



