Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BD650499
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 21:07:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6zvC-0004Km-La; Sun, 18 Dec 2022 15:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p6zv7-0004Jy-HN
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:06:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p6zv5-0007D9-N8
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=GRzgxMPt7EDpk6zJ+AB8dOrXGV/4myPmN1xqEUpEo0w=; b=SMcuDQ1I5ugElSQ8mHCcglWJ4u
 Amti3iM+x8dXEyGK8LXWHsbMxfREBA6+GYrW3Xa7DWdThKrc3OsJSO5pYKWkiYDa6w9tkkobZPS49
 BqG6yuGAqrNrbA/yelrFvoEGgdcl+K4oC/80uDiV6Q16lfQcBLTC6U9a9vBL1yzMJDRhiZnAXy9vX
 vS6cW7fyDyTBylcnQoZcIq8+n8Cof0yXBSGqR4oikCAYueGkw/YlH1pMIzKXnsQC/u/Q/jL0lxCPr
 Tx99luOvXL+i4ctNpme7bZmCA7LM6X4KfAt3X4ndDbUiAD3fIbLl+LoQjod2TyhaqCcBIG1q4LJ0j
 am3M37dgCoQvhoSTZUb+UsHXYRnZxxYmzxRBzgFLI6BQNAQNkpkePTEXjnx/hFa1QB9CO13r4WnxU
 S6NNWDoqqxNoUC2dpREUCbULah33Fy7mWr/dHdVcP1/EFn/1OxkWsJjoadH/0WMGZyPGlwa9boXGY
 43zI0KQsfS3BNyKgm8B5hFENa3VKKGU9SqTHZeERVTOHPxI6g8aAL4t5XhoTRx91Stje6sMAxBNNr
 nNs9/uACMNUoJuyghZ0CbTjy/PJHvoqyCyHON4fmncVIySB95KHon01QB5gslY6gSebkwwCwhmrBw
 YBoPYKZbLHI8Jh735dkkw64SwJq8IxOZZ8A1hMlx0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Date: Sun, 18 Dec 2022 21:05:54 +0100
Message-ID: <2688636.InQPIc3kla@silver>
In-Reply-To: <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
 <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sunday, December 18, 2022 6:39:00 PM CET Volker R=FCmelin wrote:
> Am 18.12.22 um 18:26 schrieb Philippe Mathieu-Daud=E9:
> > On 18/12/22 18:15, Volker R=FCmelin wrote:
> >> Use g_malloc0() as a direct replacement for audio_calloc().
> >>
> >> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> >> ---
> >>   audio/audio_template.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/audio/audio_template.h b/audio/audio_template.h
> >> index d343a1dcb3..5f51ef26b2 100644
> >> --- a/audio/audio_template.h
> >> +++ b/audio/audio_template.h
> >> @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_,=20
> >> TYPE)(AudioState *s,
> >>           return NULL;
> >>       }
> >>   -    hw =3D audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
> >> +    hw =3D g_malloc0(glue(drv->voice_size_, TYPE));
> >>       if (!hw) {
> >
> > g_malloc0() can't fail. Either you want g_try_malloc0() or
> > remove the error path.
> >
>=20
> g_malloc0() returns NULL if drv->voice_size_(out|in) is 0. I think the=20
> code is correct.

Correct, that's the only case these glib functions return NULL. And AFAICS
this can be zero with CoreAudio or wav.

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>=20
> >>           dolog ("Can not allocate voice `%s' size %d\n",
> >>                  drv->name, glue (drv->voice_size_, TYPE));
> >
>=20
>=20
>=20



