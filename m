Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683FD1BC41A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 17:52:08 +0200 (CEST)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTSWl-0008AV-CF
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 11:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jTSUL-0005aL-Qh
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:49:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jTSU6-0006lC-8C
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:49:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41869
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jTSU5-0006ku-My
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588088959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhZ7d7kFq8hZOxTX7LZ2Jq6OAiFk6MQsVGtjLmxBkpM=;
 b=HYC7+gSqQdloMxUFtLkjR60lrhdbfOA8jjqHDGZxM/YjC7p6UR/3bMh1NaoVQph5YckEuP
 Fi7JScltFun4YjK7R3AZGMsKhZR9uZ4ErlT1+BS6RrZ+sHFV69eRE2HetSKpZEM1l58AA2
 JhzEr45R4D6Ub6HpUBECZUOsGEi1f3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-SIir6Ii_O4qGlEYBFEJP_Q-1; Tue, 28 Apr 2020 11:49:15 -0400
X-MC-Unique: SIir6Ii_O4qGlEYBFEJP_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F3A468;
 Tue, 28 Apr 2020 15:49:14 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 742A5605CB;
 Tue, 28 Apr 2020 15:49:11 +0000 (UTC)
Date: Tue, 28 Apr 2020 16:49:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 04/14] block/amend: separate amend and create options
 for qemu-img
Message-ID: <20200428154907.GG1374620@redhat.com>
References: <20200308151903.25941-1-mlevitsk@redhat.com>
 <20200308151903.25941-5-mlevitsk@redhat.com>
 <20200428150333.GB1467943@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200428150333.GB1467943@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 28, 2020 at 04:03:33PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Sun, Mar 08, 2020 at 05:18:53PM +0200, Maxim Levitsky wrote:
> > Some options are only useful for creation
> > (or hard to be amended, like cluster size for qcow2), while some other
> > options are only useful for amend, like upcoming keyslot management
> > options for luks
> >=20
> > Since currently only qcow2 supports amend, move all its options
> > to a common macro and then include it in each action option list.
> >=20
> > In future it might be useful to remove some options which are
> > not supported anyway from amend list, which currently
> > cause an error message if amended.
>=20
> In the v1 posting I had suggested changing this patch, so that it
> only adds things to the amend list that actually can be amended.=20
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg07570.html

Never mind, I should have read ahead in the series to see the next
patch

So for this patch

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


>=20
> >=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  block/qcow2.c             | 160 +++++++++++++++++++++-----------------
> >  include/block/block_int.h |   4 +
> >  qemu-img.c                |  18 ++---
> >  3 files changed, 100 insertions(+), 82 deletions(-)
> >=20
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index b55e5b7c1f..9574085772 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -5440,83 +5440,96 @@ void qcow2_signal_corruption(BlockDriverState *=
bs, bool fatal, int64_t offset,
> >      s->signaled_corruption =3D true;
> >  }
> > =20
> > +#define QCOW_COMMON_OPTIONS                                         \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_SIZE,                                     =
\
> > +        .type =3D QEMU_OPT_SIZE,                                      =
\
> > +        .help =3D "Virtual disk size"                                 =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_COMPAT_LEVEL,                             =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "Compatibility level (v2 [0.10] or v3 [1.1])"       =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_BACKING_FILE,                             =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "File name of a base image"                         =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_BACKING_FMT,                              =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "Image format of the base image"                    =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_DATA_FILE,                                =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "File name of an external data file"                =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_DATA_FILE_RAW,                            =
\
> > +        .type =3D QEMU_OPT_BOOL,                                      =
\
> > +        .help =3D "The external data file must stay valid "           =
\
> > +                "as a raw image"                                    \
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_ENCRYPT,                                  =
\
> > +        .type =3D QEMU_OPT_BOOL,                                      =
\
> > +        .help =3D "Encrypt the image with format 'aes'. (Deprecated " =
\
> > +                "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=3Daes)",    =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_ENCRYPT_FORMAT,                           =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "Encrypt the image, format choices: 'aes', 'luks'", =
\
> > +    },                                                              \
> > +    BLOCK_CRYPTO_OPT_DEF_KEY_SECRET("encrypt.",                     \
> > +        "ID of secret providing qcow AES key or LUKS passphrase"),  \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_ALG("encrypt."),               \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_MODE("encrypt."),              \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_ALG("encrypt."),                \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_HASH_ALG("encrypt."),           \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_HASH_ALG("encrypt."),                 \
> > +    BLOCK_CRYPTO_OPT_DEF_LUKS_ITER_TIME("encrypt."),                \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_CLUSTER_SIZE,                             =
\
> > +        .type =3D QEMU_OPT_SIZE,                                      =
\
> > +        .help =3D "qcow2 cluster size",                               =
\
> > +        .def_value_str =3D stringify(DEFAULT_CLUSTER_SIZE)            =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_PREALLOC,                                 =
\
> > +        .type =3D QEMU_OPT_STRING,                                    =
\
> > +        .help =3D "Preallocation mode (allowed values: off, "         =
\
> > +                "metadata, falloc, full)"                           \
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_LAZY_REFCOUNTS,                           =
\
> > +        .type =3D QEMU_OPT_BOOL,                                      =
\
> > +        .help =3D "Postpone refcount updates",                        =
\
> > +        .def_value_str =3D "off"                                      =
\
> > +    },                                                              \
> > +    {                                                               \
> > +        .name =3D BLOCK_OPT_REFCOUNT_BITS,                            =
\
> > +        .type =3D QEMU_OPT_NUMBER,                                    =
\
> > +        .help =3D "Width of a reference count entry in bits",         =
\
> > +        .def_value_str =3D "16"                                       =
\
> > +    }                                                               \
> > +
> >  static QemuOptsList qcow2_create_opts =3D {
> >      .name =3D "qcow2-create-opts",
> >      .head =3D QTAILQ_HEAD_INITIALIZER(qcow2_create_opts.head),
> >      .desc =3D {
> > -        {
> > -            .name =3D BLOCK_OPT_SIZE,
> > -            .type =3D QEMU_OPT_SIZE,
> > -            .help =3D "Virtual disk size"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_COMPAT_LEVEL,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "Compatibility level (v2 [0.10] or v3 [1.1])"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_BACKING_FILE,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "File name of a base image"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_BACKING_FMT,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "Image format of the base image"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_DATA_FILE,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "File name of an external data file"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_DATA_FILE_RAW,
> > -            .type =3D QEMU_OPT_BOOL,
> > -            .help =3D "The external data file must stay valid as a raw=
 image"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_ENCRYPT,
> > -            .type =3D QEMU_OPT_BOOL,
> > -            .help =3D "Encrypt the image with format 'aes'. (Deprecate=
d "
> > -                    "in favor of " BLOCK_OPT_ENCRYPT_FORMAT "=3Daes)",
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_ENCRYPT_FORMAT,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "Encrypt the image, format choices: 'aes', 'luks=
'",
> > -        },
> > -        BLOCK_CRYPTO_OPT_DEF_KEY_SECRET("encrypt.",
> > -            "ID of secret providing qcow AES key or LUKS passphrase"),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_ALG("encrypt."),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_CIPHER_MODE("encrypt."),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_ALG("encrypt."),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_IVGEN_HASH_ALG("encrypt."),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_HASH_ALG("encrypt."),
> > -        BLOCK_CRYPTO_OPT_DEF_LUKS_ITER_TIME("encrypt."),
> > -        {
> > -            .name =3D BLOCK_OPT_CLUSTER_SIZE,
> > -            .type =3D QEMU_OPT_SIZE,
> > -            .help =3D "qcow2 cluster size",
> > -            .def_value_str =3D stringify(DEFAULT_CLUSTER_SIZE)
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_PREALLOC,
> > -            .type =3D QEMU_OPT_STRING,
> > -            .help =3D "Preallocation mode (allowed values: off, metada=
ta, "
> > -                    "falloc, full)"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_LAZY_REFCOUNTS,
> > -            .type =3D QEMU_OPT_BOOL,
> > -            .help =3D "Postpone refcount updates",
> > -            .def_value_str =3D "off"
> > -        },
> > -        {
> > -            .name =3D BLOCK_OPT_REFCOUNT_BITS,
> > -            .type =3D QEMU_OPT_NUMBER,
> > -            .help =3D "Width of a reference count entry in bits",
> > -            .def_value_str =3D "16"
> > -        },
> > +        QCOW_COMMON_OPTIONS,
> > +        { /* end of list */ }
> > +    }
> > +};
> > +
> > +static QemuOptsList qcow2_amend_opts =3D {
> > +    .name =3D "qcow2-amend-opts",
> > +    .head =3D QTAILQ_HEAD_INITIALIZER(qcow2_amend_opts.head),
> > +    .desc =3D {
> > +        QCOW_COMMON_OPTIONS,
> >          { /* end of list */ }
> >      }
> >  };
> > @@ -5576,6 +5589,7 @@ BlockDriver bdrv_qcow2 =3D {
> >      .bdrv_inactivate            =3D qcow2_inactivate,
> > =20
> >      .create_opts         =3D &qcow2_create_opts,
> > +    .amend_opts          =3D &qcow2_amend_opts,
> >      .strong_runtime_opts =3D qcow2_strong_runtime_opts,
> >      .mutable_opts        =3D mutable_opts,
> >      .bdrv_co_check       =3D qcow2_co_check,
> > diff --git a/include/block/block_int.h b/include/block/block_int.h
> > index 24d00fbf48..48a4c2fa1c 100644
> > --- a/include/block/block_int.h
> > +++ b/include/block/block_int.h
> > @@ -406,6 +406,10 @@ struct BlockDriver {
> > =20
> >      /* List of options for creating images, terminated by name =3D=3D =
NULL */
> >      QemuOptsList *create_opts;
> > +
> > +    /* List of options for image amend*/
> > +    QemuOptsList *amend_opts;
> > +
> >      /*
> >       * If this driver supports reopening images this contains a
> >       * NULL-terminated list of the runtime options that can be
> > diff --git a/qemu-img.c b/qemu-img.c
> > index 551388676f..2555aedee9 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -3898,11 +3898,11 @@ static int print_amend_option_help(const char *=
format)
> >          return 1;
> >      }
> > =20
> > -    /* Every driver supporting amendment must have create_opts */
> > -    assert(drv->create_opts);
> > +    /* Every driver supporting amendment must have amend_opts */
> > +    assert(drv->amend_opts);
> > =20
> >      printf("Creation options for '%s':\n", format);
> > -    qemu_opts_print_help(drv->create_opts, false);
> > +    qemu_opts_print_help(drv->amend_opts, false);
> >      printf("\nNote that not all of these options may be amendable.\n")=
;
> >      return 0;
> >  }
> > @@ -3912,7 +3912,7 @@ static int img_amend(int argc, char **argv)
> >      Error *err =3D NULL;
> >      int c, ret =3D 0;
> >      char *options =3D NULL;
> > -    QemuOptsList *create_opts =3D NULL;
> > +    QemuOptsList *amend_opts =3D NULL;
> >      QemuOpts *opts =3D NULL;
> >      const char *fmt =3D NULL, *filename, *cache;
> >      int flags;
> > @@ -4051,11 +4051,11 @@ static int img_amend(int argc, char **argv)
> >          goto out;
> >      }
> > =20
> > -    /* Every driver supporting amendment must have create_opts */
> > -    assert(bs->drv->create_opts);
> > +    /* Every driver supporting amendment must have amend_opts */
> > +    assert(bs->drv->amend_opts);
> > =20
> > -    create_opts =3D qemu_opts_append(create_opts, bs->drv->create_opts=
);
> > -    opts =3D qemu_opts_create(create_opts, NULL, 0, &error_abort);
> > +    amend_opts =3D qemu_opts_append(amend_opts, bs->drv->amend_opts);
> > +    opts =3D qemu_opts_create(amend_opts, NULL, 0, &error_abort);
> >      qemu_opts_do_parse(opts, options, NULL, &err);
> >      if (err) {
> >          error_report_err(err);
> > @@ -4078,7 +4078,7 @@ out:
> >  out_no_progress:
> >      blk_unref(blk);
> >      qemu_opts_del(opts);
> > -    qemu_opts_free(create_opts);
> > +    qemu_opts_free(amend_opts);
> >      g_free(options);
> > =20
> >      if (ret) {
> > --=20
> > 2.17.2
> >=20
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
>=20

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


