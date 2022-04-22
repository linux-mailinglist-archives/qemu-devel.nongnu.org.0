Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964650BB38
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:08:58 +0200 (CEST)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuu1-0006QS-BZ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nhupu-0002x6-Iw
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:04:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nhups-00007T-TE
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:04:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso8151833wml.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d0SGbGKqKe5SNqm1kaUlWlpQIgLDuErXYJjhmvfewg4=;
 b=lClIEjN3NmRfgAc5fq5foNbhivpw2V/5uwNATcDxEIPhV1VvrOZDiptkRAcGRbZ8uD
 2IqxLBGIvbUnXX1b37UIAXACTTJp6vi79LpqvuICcEQ009fP1c4+NHqwuEx2ob8QIm+D
 kjNGjf6CaEAcTgq4lKka00zfQjb9O/1Z1JtSCi1T130Z/NU+KGcLMTifg6dj9vX3w0YH
 gnGtED7Lbi2GDLAG+BIpcOkycFLpXU+6yOh/IG9A1ULzSaz/zfqVSfBCj4DdLPe76rcF
 O08MLDVbixvg/85KLUITVq7aS1le80wraxJdcMZJDwZwWc/PYAOSNnwWfjPGD5uLr2P6
 uhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d0SGbGKqKe5SNqm1kaUlWlpQIgLDuErXYJjhmvfewg4=;
 b=Jggj8p7/P6fV1bFTn+c+XyU9lwncSoonpYbwL70wlz1lF2mtcH54P8smZ/eZhE91lh
 gGbh4fvuF5S7jxG9Cp4z8UGKPYLVIP+ISTGqxzKyDm8mahusZ69JnCpYba5U/K//VXI6
 Isw1CfUTbvJScJF3rah+Z0yd75jfgqfCtCx4wXydq1UrwCGi/nuJmTGqPn5xGq3dRHtP
 I6db2IiQKqNFPUOYymb4qw+mmhFUg0EGpUngASibTndc44UX2y/LqqSEryt3BXr7nTzr
 eciTrr4bnHDf6Ftp0EWraO/1Z4F70++zmcTQTCQj7EWn3jYkljf1hI5SYkCD+80oMY6A
 N/1w==
X-Gm-Message-State: AOAM532ujOp9lYMO97mZaiQqig1ChPGKU+rQniKEPcb/iCVPUtlEYdr2
 OCHIGatoVF236uo8dMT4XBU=
X-Google-Smtp-Source: ABdhPJzBDg62/lCBQQWxZeBbSdXXu+RfFzK/rYcgHG9IHXDyaMltTjzUjwYU7f8JS6SGZ80VJm2W/Q==
X-Received: by 2002:a1c:2947:0:b0:391:8d5a:69b7 with SMTP id
 p68-20020a1c2947000000b003918d5a69b7mr4574884wmp.113.1650639879098; 
 Fri, 22 Apr 2022 08:04:39 -0700 (PDT)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020adfd1e5000000b0020a97e7ba9fsm2351249wrd.92.2022.04.22.08.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:04:38 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:04:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v4] Use io_uring_register_ring_fd() to skip fd operations
Message-ID: <YmLEBDnoowL84+23@stefanha-x1.localdomain>
References: <20220421163648.4205-1-faithilikerun@gmail.com>
 <20220422083428.GA61339@fam-dell> <YmJs3gzZ9S1+cPmD@redhat.com>
 <20220422100047.GB61339@fam-dell> <YmJ+p1axke5dcSw8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XnMPHkfyolQGXKB/"
Content-Disposition: inline
In-Reply-To: <YmJ+p1axke5dcSw8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Sam Li <faithilikerun@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--XnMPHkfyolQGXKB/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 11:08:39AM +0100, Daniel P. Berrang=E9 wrote:
> On Fri, Apr 22, 2022 at 11:00:47AM +0100, Fam Zheng wrote:
> > On 2022-04-22 09:52, Daniel P. Berrang=E9 wrote:
> > > On Fri, Apr 22, 2022 at 09:34:28AM +0100, Fam Zheng wrote:
> > > > On 2022-04-22 00:36, Sam Li wrote:
> > > > > Linux recently added a new io_uring(7) optimization API that QEMU
> > > > > doesn't take advantage of yet. The liburing library that QEMU uses
> > > > > has added a corresponding new API calling io_uring_register_ring_=
fd().
> > > > > When this API is called after creating the ring, the io_uring_sub=
mit()
> > > > > library function passes a flag to the io_uring_enter(2) syscall
> > > > > allowing it to skip the ring file descriptor fdget()/fdput()
> > > > > operations. This saves some CPU cycles.
> > > > >=20
> > > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > > ---
> > > > >  block/io_uring.c | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/block/io_uring.c b/block/io_uring.c
> > > > > index 782afdb433..5247fb79e2 100644
> > > > > --- a/block/io_uring.c
> > > > > +++ b/block/io_uring.c
> > > > > @@ -435,8 +435,16 @@ LuringState *luring_init(Error **errp)
> > > > >      }
> > > > > =20
> > > > >      ioq_init(&s->io_q);
> > > > > -    return s;
> > > > > +    if (io_uring_register_ring_fd(&s->ring) < 0) {
> > > > > +        /*
> > > > > +         * Only warn about this error: we will fallback to the n=
on-optimized
> > > > > +         * io_uring operations.
> > > > > +         */
> > > > > +        error_reportf_err(*errp,
> > > > > +                         "failed to register linux io_uring ring=
 file descriptor");
> > > >=20
> > > > IIUC errp can be NULL, so let's not dereference it without checking=
=2E So, just
> > > > use error_report?
> > >=20
> > > Plenty of people will be running kernels that lack the new feature,
> > > so this "failure" will be an expected scenario. We shouldn't be
> > > spamming the logs with any error or warning message. Assuming  QEMU
> > > remains fully functional, merely not as optimized, we should be
> > > totally silent.
> >=20
> > Functionally, that's a very valid point. But performance wise, is it go=
od to
> > have some visibility of this? Since people use io_uring instead of other
> > options almost certainly for performance, and here the issue does matte=
r quite
> > a bit.
>=20
> IMHO what you describe is largely a documentation issue, and/or something
> for OS vendors to worry about if they want to maximise their users'
> performance. As long as io_uring is fully functional we shouldn't print
> errors on every QEMU startup, as it leads to pointless bug reports/support
> escalations about something that is operating normally, wasting users and
> vendors' time.

Also, this is a minor optimization. It's nice to save a CPU cycles when
possible, but it's probably not significant enough that users would
bother to upgrade their kernel.

I think no warning is necessary.

Stefan

--XnMPHkfyolQGXKB/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJixAQACgkQnKSrs4Gr
c8iz3ggAlI5utJn2jvuGpPeZvTMe5OYnUqVVUlZnS8O9qZCpZY8MmtIpz2im771t
7NLSIXnu2Y3O6ou62UXjNjmsz6yyIoVHF6R6HnYr+FIYH5dmGj/ntTeBlfduTk1I
+Bq+Y3K0S+1HKDgGeZqg3w7WnQy1ntaS1DrviRdUWzCbn7fykk+qhUQgk7gddijk
sgeIoqgN/1G72j9Nh3c9fGzjA0V3wBnqqJOLa0RW1LO/2X6S0XUaxHlHkKrmGan3
qNnzfh/XZXh6Lq+/4DMdlHNCWbkO/EU2jx8zuCASaPfXoiDsvM+Y/Ew2d36BuBKa
VAKJtmlcD2SU1EFgjAzr7hm6IY9lnA==
=nU6l
-----END PGP SIGNATURE-----

--XnMPHkfyolQGXKB/--

