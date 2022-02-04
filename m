Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FD4A9CE3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:23:46 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1NA-0003nL-Sd
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nG15J-00023b-TS; Fri, 04 Feb 2022 11:06:17 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nG14y-0002hJ-RR; Fri, 04 Feb 2022 11:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=tItttx9lql/RaD2swkBt6LUc3+eynbbFoMlQyvJmcZo=; b=RrcZKIMdL4Qr+GPvLIxvd3mFgP
 Yu9vgyJCZQc+xdAn+36AK3GWIROT33rFQZV1X+chstjN7yd4k/e9M66lqddoLbHMpko7EEosCFTtm
 SD2/u3D+RRrlVJycFxJ1kxf9VrkZMU9hVSrXU47gz04byvcNVnIAX0y8W+Kwi41xF/h6AW5ayfHXg
 5STHBYdIOuBawS5lwdwAZKW9HJTHvGOmLGl2T7AB6oGtKzvf0zPCH2UMMKAiSL/8fSuvTexyggiPa
 aqZe8Ww3GglUQ7uLNzWUTUyKmxNWo5L4Y5mbUTgwF+tWatL9+ln6tyXFK+6WuIDJL0A1/j/VJau/w
 ud9p4FzJn8NpIX2zWyoBpwpDyd4xefnlUWFBiD7HdXKAkifF2xGSZNviZyoyI8VhHX5blNvZSJQAl
 stOImbBEgePbG1cgvtWn1cPV9mqD2gSy/ZTDNBi3Q9LkN/jIaticfwZk8CdVQ8YoMdrKyS6YH3Rdd
 QFZhVi97wSarjXflOiv6VtXYRkckEYSiw3uPDpN2+FeQz94c7AoILUGDjAoAuo1aGQEFXcHJw/Ynu
 JnOnqD47SY5AMerluC8VRlz/oyq+skXHG/G3Ogo1aab6BhIOr5rFGL7TbyuV0GK8p62XmLNClYg4Z
 ply8typmTdFwIMRYqYeVZye+grRIix20zgJHy2yMk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: "Dmitry V. Levin" <ldv@altlinux.org>, Vitaly Chikunov <vt@altlinux.org>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 04 Feb 2022 17:04:48 +0100
Message-ID: <3780614.DPuHsZYPev@silver>
In-Reply-To: <5c9d8b95-30ec-0801-ab26-51f40958b357@amsat.org>
References: <20220204050609.15510-1-vt@altlinux.org>
 <20220204155059.GA18407@altlinux.org>
 <5c9d8b95-30ec-0801-ab26-51f40958b357@amsat.org>
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

On Freitag, 4. Februar 2022 16:54:12 CET Philippe Mathieu-Daud=E9 wrote:
> On 4/2/22 16:50, Dmitry V. Levin wrote:
> > On Fri, Feb 04, 2022 at 06:32:07PM +0300, Vitaly Chikunov wrote:
> > [...]
> >=20
> >>> struct dirent *
> >>> qemu_dirent_dup(struct dirent *dent)
> >>> {
> >>>=20
> >>>      size_t sz =3D offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(=
dent)
> >>>      + 1;
> >>=20
> >> But d_namlen is not populated by synth_direntry, so this will lead to
> >> a bug too. Idea is that qemu_dirent_dup handles real dirents and
> >> simulated (underpopulated) dirents.
> >>=20
> >> Also Linux does not have d_namlen AFAIK, thus this code will not provi=
de
> >> any speed up in most cases (and always fallback to strlen), unlike if =
we
> >> use d_reclen.
> >>=20
> >> Also, I m not sure if _D_EXACT_NAMLEN is defined on all systems, so th=
is
> >> needs ifdefs too.
> >=20
> > Yes, _D_EXACT_NAMLEN() is a GNU extension, it was introduced in glibc
> > back in 1996 but some popular libcs available for Linux do not provide
> > this macro.
>=20
> Can't we define _D_EXACT_NAMLEN() if not available?

It is not that trivial.

With recent macOS patch set in mind: macOS does not have any of these macro=
s=20
either. It does have d_namlen and d_reclen though. Keep in mind though that=
=20
macOS also has d_seekoff which is almost always zero though.

So please, don't blindly define something, test it! On doubt I stick with=20
Vitaly's solution, because it just works^TM.

On the long term we can still adjust this to make all people happy, but thi=
s=20
is about fixing a crash, so I am fine with what Greg called "band-aid".

Best regards,
Christian Schoenebeck



