Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08DC5F6C82
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:09:43 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUNS-0006rC-2k
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogTUM-0003f5-Q0; Thu, 06 Oct 2022 12:12:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ogTUK-0006It-QS; Thu, 06 Oct 2022 12:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=DYd7OLbsoP3rMHvf/Bn3LMDYKygIPiL+4S1EFDLp53I=; b=XCWhZjEvABnWFH3O3DDP6CUgqA
 YcRiQL0NtaFnyu5TLtmUKDnFluQReSAKR0ZeKj4JtWCT6Bjl2QVFt4tVDnvgp2PgdNtXKgBvPGTHK
 W/b9yx6gTLGuiXcxWIPHUZWLbYgbrzUcDC9M3R1QUM6Kx1waxJvbGIzAGrCGVfCBLzVv0IjKJV1hF
 wtUOtlKZGjuHjCRBbPEo25zJoVSaKxwy2q5joRII9r7JCxX9fRQ9On0kP8IGSsb/PUMyiVKmPmnAD
 qj9fqePTodYSxrRqHEd/ye0eU2VREfmSW+6bi0drtp6llAyfMp1wwEyfSVD0F2KfPOUy5MN8jiuK5
 qg3MASwnOjipJ9pkhvlgC17qy8Vo9Za59Xf+xuM3crjbA4bhzJJeS7KwabY/GD1ewh8HwLoZV+gfU
 k0dHx/05XywaB6Sf2giO7vrh1LzoTxNvYpkXwuT1M53sJrioaAr5egmDoFJkhvjdNCL6x8DFklivw
 aSe7lsjdtYXHAxplSc8hfejSE2WiGoj72oyH7KMv+4wAwf+HzI3tHRlQO3jbos6TG7/BzmB1E6rwV
 K09DrPVB8aK6rZTbD0IvZRO+9SZFcxKWPDhobMiobdhipYI05XmJwlezrLftisINzHwkpqtEZeJYw
 zJgMLIYW+62YalE9jznz2IcIeyu0et2//DqkZ0x/s=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Linus Heckemann <git@sphalerite.org>
Cc: Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6] 9pfs: use GHashTable for fid table
Date: Thu, 06 Oct 2022 18:12:38 +0200
Message-ID: <2980150.NV5oU9txOS@silver>
In-Reply-To: <3864477.uoRi9OHyCq@silver>
References: <20221004104121.713689-1-git@sphalerite.org>
 <19360658.4YNXD89StS@silver> <3864477.uoRi9OHyCq@silver>
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

On Mittwoch, 5. Oktober 2022 11:38:39 CEST Christian Schoenebeck wrote:
> On Dienstag, 4. Oktober 2022 14:54:16 CEST Christian Schoenebeck wrote:
> > On Dienstag, 4. Oktober 2022 12:41:21 CEST Linus Heckemann wrote:
> > > The previous implementation would iterate over the fid table for
> > > lookup operations, resulting in an operation with O(n) complexity on
> > > the number of open files and poor cache locality -- for every open,
> > > stat, read, write, etc operation.
> > >=20
> > > This change uses a hashtable for this instead, significantly improving
> > > the performance of the 9p filesystem. The runtime of NixOS's simple
> > > installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> > > decreased by a factor of about 10.
> > >=20
> > > Signed-off-by: Linus Heckemann <git@sphalerite.org>
> > > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > > Message-Id: <20220908112353.289267-1-git@sphalerite.org>
> > > [CS: - Retain BUG_ON(f->clunked) in get_fid().
> > >=20
> > >      - Add TODO comment in clunk_fid(). ]
> > >=20
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> >=20
> > In general: LGTM now, but I will definitely go for some longer test runs
> > before queuing this patch. Some minor side notes below ...
>=20
> So I was running a compilation marathon on 9p as root fs this night, first
> couple hours went smooth, but then after about 12 hours 9p became unusable
> with error:
>=20
>   Too many open files
>=20
> The question is, is that a new issue introduced by this patch? I.e. does =
it
> break the reclaim fd code? Or is that rather unrelated to this patch, and=
 a
> problem we already had?
>=20
> Linus, could you look at this? It would probably make sense to force gett=
ing
> into this situation much earlier like:
>=20
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..0c104b81e1 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -4330,6 +4330,6 @@ static void __attribute__((__constructor__))
> v9fs_set_fd_limit(void)
>          error_report("Failed to get the resource limit");
>          exit(1);
>      }
> -    open_fd_hw =3D rlim.rlim_cur - MIN(400, rlim.rlim_cur / 3);
> +    open_fd_hw =3D rlim.rlim_cur - MIN(50, rlim.rlim_cur / 3);
>      open_fd_rc =3D rlim.rlim_cur / 2;
>  }
>=20
> I can't remember that we had this issue before, so there might still be
> something wrong with this GHashTable patch here.

Much easier reproducer; and no source changes required whatsoever:

  prlimit --nofile=3D140 -- qemu-system-x86_64 ...

And I actually get this error without this patch as well, which suggests th=
at=20
we already had a bug in the reclaim FDs code before? :/

Anyway, as it seems that this bug was not introduced by this particular pat=
ch,=20
and with the unnecesary `goto` and `out:` label removed:

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Best regards,
Christian Schoenebeck



