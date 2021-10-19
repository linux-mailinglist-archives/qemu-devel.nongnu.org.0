Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8D4333D5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:48:27 +0200 (CEST)
Received: from localhost ([::1]:58452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmfS-0005KO-SR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mcmdU-0003vO-KW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:46:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mcmdR-0005Ef-Q9
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:46:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t2so47024115wrb.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qVxTDHKkjG4B/KDsCEDUFj4j+utKMbgmC6ux1xGGZeA=;
 b=CM6UjfA8sIkapRyJRsdT/1Mx1kG14dVq2ttjqm9wJQ1Q5Ein6u4l7g9C0hbog8sTu3
 Hha/ddIVh1pQhgJXnpX1P/D7L+XIhJh4kvWvRnqrcJgM22mtxyEgTQhDGke0zHIjftfQ
 vIPt5Y/8QxCUwYGcHIDcTLObkyL5sfRlITtJgr7CJu4DTjEFKDdHBqP0PcURu4XmDSly
 uI5zzsG+6lNls5NsgmvPExBs2uEiWe9yxwLxrAohRFh32L3AwFq3V/jvCw20onPR88C/
 YlH8nxbQynW3Nl3rdnbo3W1g2B+4SYubyDfuMe47oeMpep1Q959Ooj6oPQD0JU5dDpEs
 EimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qVxTDHKkjG4B/KDsCEDUFj4j+utKMbgmC6ux1xGGZeA=;
 b=y8RGo/AqbCl96D5K4PUYue+oY3veH8G9rIK6bRReeg1POUlHHP1AevTTxB99JRAp9X
 zbdEDQRy4S1wy4hEeXf3xjAtW4dz1t/28AlUOeITgzdXzHimvhkewoiUs6cZ7TNFdiQO
 s8BqzFOMZpdSqP/BO7bPrm2fT3Ltsg/n6fbTbE4lfGhpsIfacNp228wT1dtjrjX+NqGW
 05LTqfQvYLbgi6pA2axG1rPoGXpFonIU2aPgnrs3sHCKwQ3zsZrTg3cNYYyZlj2nO9Ko
 k2vnJHT2A1ybQL7Rv+BIZ+jeB31xWxSUiHv7MGVTysPv47nwcnyqdz5jfbJf8YaI5z9r
 8ruw==
X-Gm-Message-State: AOAM533m93OyGWNQkTg4pdwOlA7FBHdFNYH79G3VxkeaQuGNR5DMjePJ
 CNjlbzTQoSBpu/9njFIkACE=
X-Google-Smtp-Source: ABdhPJzbsqGk+mCxjxRugyqzp/KvI1JBPhziJkoy0AFFl9YCgrTRmrxzLKo1z/ys0nfnzpbuQJ7KRA==
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr42347263wrg.61.1634640379653; 
 Tue, 19 Oct 2021 03:46:19 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id y5sm14350126wrq.85.2021.10.19.03.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 03:46:18 -0700 (PDT)
Date: Tue, 19 Oct 2021 11:46:17 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <YW6h+YcNEgyzh5zw@stefanha-x1.localdomain>
References: <20211012082428.16222-1-jean-louis@dupond.be>
 <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ErNugYUo3jKz/ibg"
Content-Disposition: inline
In-Reply-To: <a9b2ff3a-0bba-216c-eeda-50821be4940e@dupond.be>
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ErNugYUo3jKz/ibg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 10:36:01AM +0200, Jean-Louis Dupond wrote:
> Forgot to CC maintainers.

Also CCing Jason Wang and Michael Tsirkin for VIRTIO.

Stefan

>=20
> On 12/10/2021 10:24, Jean-Louis Dupond wrote:
> > hw_compat modes only take into account their base name.
> > But if a device is created with (non)-transitional, then the compat
> > values are not used, causing migrating issues.
> >=20
> > This commit adds their (non)-transitional entries with the same settings
> > as the base entry.
> >=20
> > Fixes https://bugzilla.redhat.com/show_bug.cgi?id=3D1999141
> >=20
> > Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> > ---
> >   include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 34 insertions(+)
> >=20
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index 4ff19c714b..5726825c2d 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
> >       bool optional;
> >   } GlobalProperty;
> > +
> > +/**
> > + * Helper to add (non)transitional compat properties
> > + */
> > +static inline void
> > +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
> > +{
> > +    GlobalProperty *transitional =3D g_new0(typeof(*transitional), 1);
> > +    transitional->driver =3D g_strdup_printf("%s-transitional", prop->=
driver);
> > +    transitional->property =3D g_strdup(prop->property);
> > +    transitional->value =3D g_strdup(prop->value);
> > +    transitional->used =3D prop->used;
> > +    transitional->optional =3D prop->optional;
> > +    g_ptr_array_add(arr, (void *)transitional);
> > +
> > +    GlobalProperty *non_transitional =3D g_new0(typeof(*non_transition=
al), 1);
> > +    non_transitional->driver =3D g_strdup_printf("%s-non-transitional"=
, prop->driver);
> > +    non_transitional->property =3D g_strdup(prop->property);
> > +    non_transitional->value =3D g_strdup(prop->value);
> > +    non_transitional->used =3D prop->used;
> > +    non_transitional->optional =3D prop->optional;
> > +    g_ptr_array_add(arr, (void *)non_transitional);
> > +}
> > +
> >   static inline void
> >   compat_props_add(GPtrArray *arr,
> >                    GlobalProperty props[], size_t nelem)
> > @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
> >       int i;
> >       for (i =3D 0; i < nelem; i++) {
> >           g_ptr_array_add(arr, (void *)&props[i]);
> > +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-net-pci") ||
> > +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
> > +            compat_props_add_transitional(arr, &props[i]);
> > +        }
> >       }
> >   }
>=20

--ErNugYUo3jKz/ibg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFuofkACgkQnKSrs4Gr
c8jCXgf/cboWp8k/7egwJEf1xunaL2sxFO0BhdB4vJcRLYVIDKwzzLI/mzWbG3R9
yGkZC2r3tlsHUs9p2EIxX6NfOKIJm+39oknOeX45I3Z2y7y6G4Kk/I+mHezFrOdJ
TUlDt5LMnp5Y/Rp1A7ZTd5CyA+Iy75GNpaiyEHWJC5eGx7zeRkhDkKPiy+DKhKc5
zTMD6huF5theI66M3WMs2bRh89/ZAgtjDr+VBdmoG7wa16qhsXDxflws7qAb6sXA
t8hVPIIj/GLQo3wvxmMPm/rClpvQz9MdfFvPqU8uuvGDwP3yZ5wDs3kN1eF2jE4H
YnXefwPshu1p2oWsMtn2LGitrzCzTA==
=l+0z
-----END PGP SIGNATURE-----

--ErNugYUo3jKz/ibg--

