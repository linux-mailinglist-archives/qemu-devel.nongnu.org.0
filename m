Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E03B9FF6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 13:41:01 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzHXX-0007oY-Vu
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 07:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lzHUZ-0006Qv-Sw
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:37:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lzHUU-00054N-Ci
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625225869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wP4CKP349PMf473FfhZrA0OVj6oI52Ufso3jP4adgSw=;
 b=M7aTpBadrcc1/16GIGBbSG4Jyxlb3DKwKqWblguLoWFyy9VTAgFeQ5UJ2nMSJ+tLQdFTQV
 pBYlHJTd2DYNUcvI0V2KWaU+OWm6pguRVtiwwmy0MjG+YNMS86XqjZpFpmDVxstjOsgKcK
 g4VMpaV7rLsSMQAa3n+vAlCIt+RNtAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-LcGqwItvOsKeafeQp5PJfw-1; Fri, 02 Jul 2021 07:37:45 -0400
X-MC-Unique: LcGqwItvOsKeafeQp5PJfw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BDD0100C673;
 Fri,  2 Jul 2021 11:37:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-65.ams2.redhat.com [10.36.114.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B740620DE;
 Fri,  2 Jul 2021 11:37:42 +0000 (UTC)
Date: Fri, 2 Jul 2021 13:37:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH v2] block/rbd: Add support for rbd image encryption
Message-ID: <YN76hR7Qt1d28jbc@redhat.com>
References: <20210627114635.39326-1-oro@il.ibm.com>
 <CAOi1vP8uY2ZS8aU972DY19RoLbb8ejPBZByokRmoR8Jnw4kg-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8uY2ZS8aU972DY19RoLbb8ejPBZByokRmoR8Jnw4kg-g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Or Ozeri <oro@il.ibm.com>,
 Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.06.2021 um 15:46 hat Ilya Dryomov geschrieben:
> On Sun, Jun 27, 2021 at 1:46 PM Or Ozeri <oro@il.ibm.com> wrote:
> >
> > Starting from ceph Pacific, RBD has built-in support for image-level encryption.
> > Currently supported formats are LUKS version 1 and 2.
> >
> > There are 2 new relevant librbd APIs for controlling encryption, both expect an
> > open image context:
> >
> > rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> > rbd_encryption_load: loads encryptor/decryptor to the image IO stack
> >
> > This commit extends the qemu rbd driver API to support the above.
> >
> > Signed-off-by: Or Ozeri <oro@il.ibm.com>
> > ---
> > v2: handle encryption info only for the case where encryption is not loaded
> > ---
> >  block/rbd.c          | 361 ++++++++++++++++++++++++++++++++++++++++++-
> >  qapi/block-core.json | 110 ++++++++++++-
> >  2 files changed, 465 insertions(+), 6 deletions(-)
> >
> > diff --git a/block/rbd.c b/block/rbd.c
> > index f098a89c7b..8edd1be49e 100644
> > --- a/block/rbd.c
> > +++ b/block/rbd.c
> > @@ -73,6 +73,18 @@
> >  #define LIBRBD_USE_IOVEC 0
> >  #endif
> >
> > +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> > +
> > +static const char rbd_luks_header_verification[
> > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> > +};
> > +
> > +static const char rbd_luks2_header_verification[
> > +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> > +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> > +};
> > +
> >  typedef enum {
> >      RBD_AIO_READ,
> >      RBD_AIO_WRITE,
> > @@ -341,6 +353,203 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
> >      }
> >  }
> >
> > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > +static int qemu_rbd_convert_luks_options(
> > +        RbdEncryptionOptionsLUKSBase *luks_opts,
> > +        char **passphrase,
> > +        size_t *passphrase_len,
> > +        Error **errp)
> > +{
> > +    return qcrypto_secret_lookup(luks_opts->key_secret, (uint8_t **)passphrase,
> > +                                 passphrase_len, errp);
> > +}
> > +
> > +static int qemu_rbd_convert_luks_create_options(
> > +        RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> > +        rbd_encryption_algorithm_t *alg,
> > +        char **passphrase,
> > +        size_t *passphrase_len,
> > +        Error **errp)
> > +{
> > +    int r = 0;
> > +
> > +    r = qemu_rbd_convert_luks_options(
> > +            qapi_RbdEncryptionCreateOptionsLUKSBase_base(luks_opts),
> > +            passphrase, passphrase_len, errp);
> > +    if (r < 0) {
> > +        return r;
> > +    }
> > +
> > +    if (luks_opts->has_cipher_alg) {
> > +        switch (luks_opts->cipher_alg) {
> > +            case QCRYPTO_CIPHER_ALG_AES_128: {
> > +                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
> > +                break;
> > +            }
> > +            case QCRYPTO_CIPHER_ALG_AES_256: {
> > +                *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> > +                break;
> > +            }
> > +            default: {
> > +                r = -ENOTSUP;
> > +                error_setg_errno(errp, -r, "unknown encryption algorithm: %u",
> > +                                 luks_opts->cipher_alg);
> > +                return r;
> > +            }
> > +        }
> > +    } else {
> > +        /* default alg */
> > +        *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int qemu_rbd_encryption_format(rbd_image_t image,
> > +                                      RbdEncryptionCreateOptions *encrypt,
> > +                                      Error **errp)
> > +{
> > +    int r = 0;
> > +    g_autofree char *passphrase = NULL;
> > +    size_t passphrase_len;
> > +    rbd_encryption_format_t format;
> > +    rbd_encryption_options_t opts;
> > +    rbd_encryption_luks1_format_options_t luks_opts;
> > +    rbd_encryption_luks2_format_options_t luks2_opts;
> > +    size_t opts_size;
> > +    uint64_t raw_size, effective_size;
> > +
> > +    r = rbd_get_size(image, &raw_size);
> > +    if (r < 0) {
> > +        error_setg_errno(errp, -r, "cannot get raw image size");
> > +        return r;
> > +    }
> > +
> > +    switch (encrypt->format) {
> > +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> > +            memset(&luks_opts, 0, sizeof(luks_opts));
> > +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> > +            opts = &luks_opts;
> > +            opts_size = sizeof(luks_opts);
> > +            r = qemu_rbd_convert_luks_create_options(
> > +                    qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
> > +                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
> > +            if (r < 0) {
> > +                return r;
> > +            }
> > +            luks_opts.passphrase = passphrase;
> > +            luks_opts.passphrase_size = passphrase_len;
> > +            break;
> > +        }
> > +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> > +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> > +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> > +            opts = &luks2_opts;
> > +            opts_size = sizeof(luks2_opts);
> > +            r = qemu_rbd_convert_luks_create_options(
> > +                    qapi_RbdEncryptionCreateOptionsLUKS2_base(
> > +                            &encrypt->u.luks2),
> > +                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
> > +            if (r < 0) {
> > +                return r;
> > +            }
> > +            luks2_opts.passphrase = passphrase;
> > +            luks2_opts.passphrase_size = passphrase_len;
> > +            break;
> > +        }
> > +        default: {
> > +            r = -ENOTSUP;
> > +            error_setg_errno(
> > +                    errp, -r, "unknown image encryption format: %u",
> > +                    encrypt->format);
> > +            return r;
> > +        }
> > +    }
> > +
> > +    r = rbd_encryption_format(image, format, opts, opts_size);
> > +    if (r < 0) {
> > +        error_setg_errno(errp, -r, "encryption format fail");
> > +        return r;
> > +    }
> > +
> > +    r = rbd_get_size(image, &effective_size);
> > +    if (r < 0) {
> > +        error_setg_errno(errp, -r, "cannot get effective image size");
> > +        return r;
> > +    }
> > +
> > +    r = rbd_resize(image, raw_size + (raw_size - effective_size));
> > +    if (r < 0) {
> > +        error_setg_errno(errp, -r, "cannot resize image after format");
> > +        return r;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int qemu_rbd_encryption_load(rbd_image_t image,
> > +                                    RbdEncryptionOptions *encrypt,
> > +                                    Error **errp)
> > +{
> > +    int r = 0;
> > +    g_autofree char *passphrase = NULL;
> > +    size_t passphrase_len;
> > +    rbd_encryption_luks1_format_options_t luks_opts;
> > +    rbd_encryption_luks2_format_options_t luks2_opts;
> > +    rbd_encryption_format_t format;
> > +    rbd_encryption_options_t opts;
> > +    size_t opts_size;
> > +
> > +    switch (encrypt->format) {
> > +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> > +            memset(&luks_opts, 0, sizeof(luks_opts));
> > +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> > +            opts = &luks_opts;
> > +            opts_size = sizeof(luks_opts);
> > +            r = qemu_rbd_convert_luks_options(
> > +                    qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
> > +                    &passphrase, &passphrase_len, errp);
> > +            if (r < 0) {
> > +                return r;
> > +            }
> > +            luks_opts.passphrase = passphrase;
> > +            luks_opts.passphrase_size = passphrase_len;
> > +            break;
> > +        }
> > +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> > +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> > +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> > +            opts = &luks2_opts;
> > +            opts_size = sizeof(luks2_opts);
> > +            r = qemu_rbd_convert_luks_options(
> > +                    qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
> > +                    &passphrase, &passphrase_len, errp);
> > +            if (r < 0) {
> > +                return r;
> > +            }
> > +            luks2_opts.passphrase = passphrase;
> > +            luks2_opts.passphrase_size = passphrase_len;
> > +            break;
> > +        }
> > +        default: {
> > +            r = -ENOTSUP;
> > +            error_setg_errno(
> > +                    errp, -r, "unknown image encryption format: %u",
> > +                    encrypt->format);
> > +            return r;
> > +        }
> > +    }
> > +
> > +    r = rbd_encryption_load(image, format, opts, opts_size);
> > +    if (r < 0) {
> > +        error_setg_errno(errp, -r, "encryption load fail");
> > +        return r;
> > +    }
> > +
> > +    return 0;
> > +}
> > +#endif
> > +
> >  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> >  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
> >                                const char *keypairs, const char *password_secret,
> > @@ -358,6 +567,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
> >          return -EINVAL;
> >      }
> >
> > +#ifndef LIBRBD_SUPPORTS_ENCRYPTION
> > +    if (opts->has_encrypt) {
> > +        error_setg(errp, "RBD library does not support image encryption");
> > +        return -ENOTSUP;
> > +    }
> > +#endif
> > +
> >      if (opts->has_cluster_size) {
> >          int64_t objsize = opts->cluster_size;
> >          if ((objsize - 1) & objsize) {    /* not a power of 2? */
> > @@ -383,6 +599,28 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
> >          goto out;
> >      }
> >
> > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > +    if (opts->has_encrypt) {
> > +        rbd_image_t image;
> > +
> > +        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret,
> > +                             "error opening image '%s' for encryption format",
> > +                             opts->location->image);
> > +            goto out;
> > +        }
> > +
> > +        ret = qemu_rbd_encryption_format(image, opts->encrypt, errp);
> > +        rbd_close(image);
> > +        if (ret < 0) {
> > +            /* encryption format fail, try removing the image */
> > +            rbd_remove(io_ctx, opts->location->image);
> > +            goto out;
> > +        }
> > +    }
> > +#endif
> > +
> >      ret = 0;
> >  out:
> >      rados_ioctx_destroy(io_ctx);
> > @@ -395,6 +633,43 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
> >      return qemu_rbd_do_create(options, NULL, NULL, errp);
> >  }
> >
> > +static int qemu_rbd_extract_encryption_create_options(
> > +        QemuOpts *opts,
> > +        RbdEncryptionCreateOptions **spec,
> > +        Error **errp)
> > +{
> > +    QDict *opts_qdict;
> > +    QDict *encrypt_qdict;
> > +    Visitor *v;
> > +    int ret = 0;
> > +
> > +    opts_qdict = qemu_opts_to_qdict(opts, NULL);
> > +    qdict_extract_subqdict(opts_qdict, &encrypt_qdict, "encrypt.");
> > +    qobject_unref(opts_qdict);
> > +    if (!qdict_size(encrypt_qdict)) {
> > +        *spec = NULL;
> > +        goto exit;
> > +    }
> > +
> > +    /* Convert options into a QAPI object */
> > +    v = qobject_input_visitor_new_flat_confused(encrypt_qdict, errp);
> > +    if (!v) {
> > +        ret = -EINVAL;
> > +        goto exit;
> > +    }
> > +
> > +    visit_type_RbdEncryptionCreateOptions(v, NULL, spec, errp);
> > +    visit_free(v);
> > +    if (!*spec) {
> > +        ret = -EINVAL;
> > +        goto exit;
> > +    }
> > +
> > +exit:
> > +    qobject_unref(encrypt_qdict);
> > +    return ret;
> > +}
> > +
> >  static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
> >                                                  const char *filename,
> >                                                  QemuOpts *opts,
> > @@ -403,6 +678,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
> >      BlockdevCreateOptions *create_options;
> >      BlockdevCreateOptionsRbd *rbd_opts;
> >      BlockdevOptionsRbd *loc;
> > +    RbdEncryptionCreateOptions *encrypt = NULL;
> >      Error *local_err = NULL;
> >      const char *keypairs, *password_secret;
> >      QDict *options = NULL;
> > @@ -431,6 +707,13 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
> >          goto exit;
> >      }
> >
> > +    ret = qemu_rbd_extract_encryption_create_options(opts, &encrypt, errp);
> > +    if (ret < 0) {
> > +        goto exit;
> > +    }
> > +    rbd_opts->encrypt     = encrypt;
> > +    rbd_opts->has_encrypt = !!encrypt;
> > +
> >      /*
> >       * Caution: while qdict_get_try_str() is fine, getting non-string
> >       * types would require more care.  When @options come from -blockdev
> > @@ -756,12 +1039,24 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >          goto failed_open;
> >      }
> >
> > +    if (opts->has_encrypt) {
> > +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> > +        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> > +        if (r < 0) {
> > +            goto failed_post_open;
> > +        }
> > +#else
> > +        r = -ENOTSUP;
> > +        error_setg(errp, "RBD library does not support image encryption");
> > +        goto failed_post_open;
> > +#endif
> > +    }
> > +
> >      r = rbd_get_size(s->image, &s->image_size);
> >      if (r < 0) {
> >          error_setg_errno(errp, -r, "error getting image size from %s",
> >                           s->image_name);
> > -        rbd_close(s->image);
> > -        goto failed_open;
> > +        goto failed_post_open;
> >      }
> >
> >      /* If we are using an rbd snapshot, we must be r/o, otherwise
> > @@ -769,8 +1064,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >      if (s->snap != NULL) {
> >          r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
> >          if (r < 0) {
> > -            rbd_close(s->image);
> > -            goto failed_open;
> > +            goto failed_post_open;
> >          }
> >      }
> >
> > @@ -780,6 +1074,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >      r = 0;
> >      goto out;
> >
> > +failed_post_open:
> > +    rbd_close(s->image);
> >  failed_open:
> >      rados_ioctx_destroy(s->io_ctx);
> >      g_free(s->snap);
> > @@ -1050,6 +1346,46 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
> >      return 0;
> >  }
> >
> > +static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
> > +                                                     Error **errp)
> > +{
> > +    BDRVRBDState *s = bs->opaque;
> > +    ImageInfoSpecific *spec_info;
> > +    char buf[RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {0};
> > +    int r;
> > +
> > +    if (s->image_size >= RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) {
> > +        r = rbd_read(s->image, 0,
> > +                     RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN, buf);
> > +        if (r < 0) {
> > +            error_setg_errno(errp, -r, "cannot read image start for probe");
> > +            return NULL;
> > +        }
> > +    }
> > +
> > +    spec_info = g_new(ImageInfoSpecific, 1);
> > +    *spec_info = (ImageInfoSpecific){
> > +        .type  = IMAGE_INFO_SPECIFIC_KIND_RBD,
> > +        .u.rbd.data = g_new0(ImageInfoSpecificRbd, 1),
> > +    };
> > +
> > +    if (memcmp(buf, rbd_luks_header_verification,
> > +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> > +        spec_info->u.rbd.data->encryption_format =
> > +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS;
> > +        spec_info->u.rbd.data->has_encryption_format = true;
> > +    } else if (memcmp(buf, rbd_luks2_header_verification,
> > +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> > +        spec_info->u.rbd.data->encryption_format =
> > +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
> > +        spec_info->u.rbd.data->has_encryption_format = true;
> > +    } else {
> > +        spec_info->u.rbd.data->has_encryption_format = false;
> > +    }
> > +
> > +    return spec_info;
> > +}
> > +
> >  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
> >  {
> >      BDRVRBDState *s = bs->opaque;
> > @@ -1243,6 +1579,22 @@ static QemuOptsList qemu_rbd_create_opts = {
> >              .type = QEMU_OPT_STRING,
> >              .help = "ID of secret providing the password",
> >          },
> > +        {
> > +            .name = "encrypt.format",
> > +            .type = QEMU_OPT_STRING,
> > +            .help = "Encrypt the image, format choices: 'luks', 'luks2'",
> > +        },
> > +        {
> > +            .name = "encrypt.cipher-alg",
> > +            .type = QEMU_OPT_STRING,
> > +            .help = "Name of encryption cipher algorithm"
> > +                    " (allowed values: aes-128, aes-256)",
> > +        },
> > +        {
> > +            .name = "encrypt.key-secret",
> > +            .type = QEMU_OPT_STRING,
> > +            .help = "ID of secret providing LUKS passphrase",
> > +        },
> >          { /* end of list */ }
> >      }
> >  };
> > @@ -1272,6 +1624,7 @@ static BlockDriver bdrv_rbd = {
> >      .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
> >      .bdrv_has_zero_init     = bdrv_has_zero_init_1,
> >      .bdrv_get_info          = qemu_rbd_getinfo,
> > +    .bdrv_get_specific_info = qemu_rbd_get_specific_info,
> >      .create_opts            = &qemu_rbd_create_opts,
> >      .bdrv_getlength         = qemu_rbd_getlength,
> >      .bdrv_co_truncate       = qemu_rbd_co_truncate,
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 6d227924d0..6cf67d796e 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -127,6 +127,18 @@
> >        'extents': ['ImageInfo']
> >    } }
> >
> > +##
> > +# @ImageInfoSpecificRbd:
> > +#
> > +# @encryption-format: Image encryption format
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'ImageInfoSpecificRbd',
> > +  'data': {
> > +      '*encryption-format': 'RbdImageEncryptionFormat'
> > +  } }
> > +
> >  ##
> >  # @ImageInfoSpecific:
> >  #
> > @@ -141,7 +153,8 @@
> >        # If we need to add block driver specific parameters for
> >        # LUKS in future, then we'll subclass QCryptoBlockInfoLUKS
> >        # to define a ImageInfoSpecificLUKS
> > -      'luks': 'QCryptoBlockInfoLUKS'
> > +      'luks': 'QCryptoBlockInfoLUKS',
> > +      'rbd': 'ImageInfoSpecificRbd'
> >    } }
> >
> >  ##
> > @@ -3609,6 +3622,94 @@
> >  { 'enum': 'RbdAuthMode',
> >    'data': [ 'cephx', 'none' ] }
> >
> > +##
> > +# @RbdImageEncryptionFormat:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'enum': 'RbdImageEncryptionFormat',
> > +  'data': [ 'luks', 'luks2' ] }
> > +
> > +##
> > +# @RbdEncryptionOptionsLUKSBase:
> > +#
> > +# @key-secret: ID of a QCryptoSecret object providing a passphrase
> > +#              for unlocking the encryption
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { 'key-secret': 'str' } }
> > +
> > +##
> > +# @RbdEncryptionCreateOptionsLUKSBase:
> > +#
> > +# @cipher-alg: The encryption algorithm
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm' } }
> > +
> > +##
> > +# @RbdEncryptionOptionsLUKS:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKS',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { } }
> > +
> > +##
> > +# @RbdEncryptionOptionsLUKS2:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionOptionsLUKS2',
> > +  'base': 'RbdEncryptionOptionsLUKSBase',
> > +  'data': { } }
> > +
> > +##
> > +# @RbdEncryptionCreateOptionsLUKS:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKS',
> > +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'data': { } }
> > +
> > +##
> > +# @RbdEncryptionCreateOptionsLUKS2:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'RbdEncryptionCreateOptionsLUKS2',
> > +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> > +  'data': { } }
> > +
> > +##
> > +# @RbdEncryptionOptions:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'union': 'RbdEncryptionOptions',
> > +  'base': { 'format': 'RbdImageEncryptionFormat' },
> > +  'discriminator': 'format',
> > +  'data': { 'luks': 'RbdEncryptionOptionsLUKS',
> > +            'luks2': 'RbdEncryptionOptionsLUKS2' } }
> > +
> > +##
> > +# @RbdEncryptionCreateOptions:
> > +#
> > +# Since: 6.1
> > +##
> > +{ 'union': 'RbdEncryptionCreateOptions',
> > +  'base': { 'format': 'RbdImageEncryptionFormat' },
> > +  'discriminator': 'format',
> > +  'data': { 'luks': 'RbdEncryptionCreateOptionsLUKS',
> > +            'luks2': 'RbdEncryptionCreateOptionsLUKS2' } }
> > +
> >  ##
> >  # @BlockdevOptionsRbd:
> >  #
> > @@ -3624,6 +3725,8 @@
> >  #
> >  # @snapshot: Ceph snapshot name.
> >  #
> > +# @encrypt: Image encryption options. (Since 6.1)
> > +#
> >  # @user: Ceph id name.
> >  #
> >  # @auth-client-required: Acceptable authentication modes.
> > @@ -3646,6 +3749,7 @@
> >              'image': 'str',
> >              '*conf': 'str',
> >              '*snapshot': 'str',
> > +            '*encrypt': 'RbdEncryptionOptions',
> >              '*user': 'str',
> >              '*auth-client-required': ['RbdAuthMode'],
> >              '*key-secret': 'str',
> > @@ -4418,13 +4522,15 @@
> >  #            point to a snapshot.
> >  # @size: Size of the virtual disk in bytes
> >  # @cluster-size: RBD object size
> > +# @encrypt: Image encryption options. (Since 6.1)
> >  #
> >  # Since: 2.12
> >  ##
> >  { 'struct': 'BlockdevCreateOptionsRbd',
> >    'data': { 'location':         'BlockdevOptionsRbd',
> >              'size':             'size',
> > -            '*cluster-size' :   'size' } }
> > +            '*cluster-size' :   'size',
> > +            '*encrypt' :        'RbdEncryptionCreateOptions' } }
> >
> >  ##
> >  # @BlockdevVmdkSubformat:
> > --
> > 2.27.0
> >
> 
> Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks, applied to the block branch.

Kevin


