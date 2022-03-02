Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B04CA7D7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:21:04 +0100 (CET)
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPqh-0003ph-D4
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPPmb-00064t-Tr
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:16:50 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPPmZ-0007Io-P2
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 09:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xYGPc3RYY9rjYNGechpraAZCAYlUlS1v0KqhEU/UN6Q=; b=U+mnDDy+BGZeXiIT8mtm3vhzgG
 jcqc9XfmnY5Zlnuc3NFp16G4ov6jHneOj08PIap6rd8ZfRkHC2EJDipjo7yYtAwU/isUX3QZmeYw8
 aSMkjrkf8Z1yvwVBsRHNZmJQ9uFr0YbNG71DIzITdqBMDVc7LFW/w6oNxfoWv07C22LM0JECsNGHs
 FPFB5C5khdFYM4O0LnOZdMVhzRSJhCMnkw/ISBy1a4pPAzI1T4FenBx3cY5NozkG1j99YrGN9T5uE
 CpbYKc+AUl2c1+YYqltuBxQPe5YInM4p7AxAM/jPkQu5OvCktKWt9U8VKWY1vDs6KT4TnBJTVoDB/
 8vni5uxc5X0CFznKqlr+hx3gWQJztHE1+3DRUEFDS2gJ5ogKHe08jczifTTlQgvq83vpXCQSxXbvw
 rFDZSBESBX3o++R4Gcz+ercLZTSV1wYU8DXnWW3lySAU/5pC92jf8ttU3CgtOWM6oh1/a8kRoosqg
 er/7NYUMWpZVK+GftHPlFUj2LC4FVI2EW+gY2pdTcj2sti7NGRk2SktsnGyc41H3WVUPQq4OXy+1F
 2t1oC9iAa4TwL0QuxC4qBfWg2WylcE5Go9uKwrT/OwdQyGtY3Ar/qTPNa7jem/yF0yM9cgTcre7P5
 7Sehn9La1jdytUu5Lmlf9/7NpwB1WTmMok+SyRPbI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] 9pfs: move qemu_dirent_dup() from osdep -> 9p-util
Date: Wed, 02 Mar 2022 15:16:43 +0100
Message-ID: <2106481.Hga0XrbuFZ@silver>
In-Reply-To: <CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com>
References: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
 <CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com>
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

On Dienstag, 1. M=E4rz 2022 22:59:43 CET Peter Maydell wrote:
> On Tue, 1 Mar 2022 at 20:47, Christian Schoenebeck
>=20
> <qemu_oss@crudebyte.com> wrote:
> > Function qemu_dirent_dup() is currently only used by 9pfs server, so mo=
ve
> > it from project global header osdep.h to 9pfs specific header 9p-util.h.
> >=20
> > Link:
> > https://lore.kernel.org/qemu-devel/CAFEAcA_=3DHAUNomKD2wurSVaAHa5mrk22A=
1oHK
> > LWUDjk7v6Khmg@mail.gmail.com/ Based-on:
> > <20220227223522.91937-12-wwcohen@gmail.com>
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >  hw/9pfs/9p-util.h    | 30 ++++++++++++++++++++++++++++++
> >  include/qemu/osdep.h | 13 -------------
> >  util/osdep.c         | 21 ---------------------
> >  3 files changed, 30 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 1f74d37558..8b92614e6c 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -112,6 +112,36 @@ static inline off_t qemu_dirent_off(struct dirent
> > *dent)>=20
> >  #endif
> >  }
> >=20
> > +/**
> > + * Duplicate directory entry @dent.
> > + *
> > + * It is highly recommended to use this function instead of open coding
> > + * duplication of @c dirent objects, because the actual @c struct @c
> > dirent + * size may be bigger or shorter than @c sizeof(struct dirent)
> > and correct + * handling is platform specific (see gitlab issue #841).
> > + *
> > + * @dent - original directory entry to be duplicated
> > + * @returns duplicated directory entry which should be freed with
> > g_free()
> > + */
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> since it's just code movement, but those "@c"s look a bit weird:
> are they really valid kerneldoc comment markup?
>=20
> thanks
> -- PMM

You are right, that's Doxygen format, not kerneldoc format.

If you don't mind I send a separate, subsequent patch that just wipes the=20
"@c"s away, and leave this patch as-is (as this one is pure refactoring).

Alternatively I could replace the "@c"s by kerneldoc's solution which=20
apparently is "::foo" I think ("foo" being the inlined C code).

Best regards,
Christian Schoenebeck



