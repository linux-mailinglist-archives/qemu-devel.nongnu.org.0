Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBA3B4E3D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 12:46:37 +0200 (CEST)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx5pb-0000Je-RA
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 06:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lx5o5-0007SE-NK; Sat, 26 Jun 2021 06:45:01 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:37503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lx5o2-0000TP-PP; Sat, 26 Jun 2021 06:45:01 -0400
Received: by mail-io1-xd33.google.com with SMTP id o5so15729309iob.4;
 Sat, 26 Jun 2021 03:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IFHGDa/FHjjc4dnIl4IPRgh3yaEuKLqpN0Z0oVtzqZE=;
 b=bWxpJyctpzZdSKDlqbCMNpFmWrGpXMHJNlTgBKITvwVVhcYgh7t5s/i8+bQSjFftXq
 pDr0kpdwBb4QjYARDh00tMtGzg4fDYn9Kdd1sdDFITJmGvUEYu5LAWlPHneq3YvrLouf
 oTh/ewTWNDMuN8ACHgCUSm5rnJglO9zCReVIvpdrWNfJ6lrYMAEXymHMk8SuZiajy1XY
 Euqapl8SPOT9rehrvKP7V1adIy5jV7Blgz85fXG3QSaEi8FFkWwZN7uvrm2V42FuqY69
 FnGQS/vhou6cZNlI8a/AyffJ+8Fhf2cQWrmyveYK8NiRovmLgRhygGJGCM0yJP55uXxA
 3qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IFHGDa/FHjjc4dnIl4IPRgh3yaEuKLqpN0Z0oVtzqZE=;
 b=HJePMhpOgV0ibtLm4i6NzgMDIVkTEnzftlXTAmAYas83GAQHk3VcyrnYRgcm0FBj8O
 Ut6AR3Ux2iU1qaR7qr8FDdIe3lIdJa/2wdlhP2jcrgP/fWWW0Rsu1Rvt6XBKp9ZV1DRy
 doVLE+hi9ODmgpczbNR+Zfwypsju1n84GOtSYVtlY4dXOTGtVjaV9fyTXNIPRuzS4HUl
 ZeE3yIXQrKtneB60TXPka3vsU0iSF8uS8l17WFSt7fJQr+V8ONQz/QpmYVBXBSNH/blI
 /0oS2vpFFdH95O0SRICS3gnCt1Rlpez59v5lOSmtrjT0L9GE9OgooRJD7h6z+Dt5xEda
 eIkg==
X-Gm-Message-State: AOAM532krfqXBKsEGmWhH0aiVS2/oEczCkQ54fBwp0TNQ1bjJ5WICtD1
 eLc7PapBPOF0qxIduRCANQnHNC5E/qM7ZG5Fz+s=
X-Google-Smtp-Source: ABdhPJyerwM950MKB31UXcHOnTuLKBruo1SFxBShM3J4x9uQHVBOMCFLdJaQZSW1blL+5HiOfKJN55sl7mUlaF71Rl8=
X-Received: by 2002:a02:9109:: with SMTP id a9mr13555549jag.93.1624704296579; 
 Sat, 26 Jun 2021 03:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210621144821.1451875-1-oro@il.ibm.com>
In-Reply-To: <20210621144821.1451875-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 26 Jun 2021 12:44:40 +0200
Message-ID: <CAOi1vP8A4jYRsZb2UtbhsQviG4WBC5P4TKbkQDyRPom0PY=aTA@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: Or Ozeri <oro@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd33.google.com
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
Cc: kwolf@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Mykola Golub <to.my.trociny@gmail.com>, Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 4:49 PM Or Ozeri <oro@il.ibm.com> wrote:
>
> Starting from ceph Pacific, RBD has built-in support for image-level encryption.
> Currently supported formats are LUKS version 1 and 2.
>
> There are 2 new relevant librbd APIs for controlling encryption, both expect an
> open image context:
>
> rbd_encryption_format: formats an image (i.e. writes the LUKS header)
> rbd_encryption_load: loads encryptor/decryptor to the image IO stack
>
> This commit extends the qemu rbd driver API to support the above.
>
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  block/rbd.c          | 367 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json | 110 ++++++++++++-
>  2 files changed, 471 insertions(+), 6 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index f098a89c7b..7e282a8e94 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -73,6 +73,18 @@
>  #define LIBRBD_USE_IOVEC 0
>  #endif
>
> +#define RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN 8
> +
> +static const char rbd_luks_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 1
> +};
> +
> +static const char rbd_luks2_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
> +};
> +
>  typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
> @@ -341,6 +353,202 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>      }
>  }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +static int qemu_rbd_convert_luks_options(
> +        RbdEncryptionOptionsLUKSBase *luks_opts,
> +        char **passphrase,
> +        size_t *passphrase_len,
> +        Error **errp)
> +{
> +    return qcrypto_secret_lookup(
> +            luks_opts->key_secret, (uint8_t **)passphrase, passphrase_len, errp);

Hi Or,

This looks good to me, just a few nits to consider:

Why wrap after the paren?  The second line ends up going over 80
columns.  I'd wrap between passphrase and passphrase_len.

> +}
> +
> +static int qemu_rbd_convert_luks_create_options(
> +        RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> +        rbd_encryption_algorithm_t *alg,
> +        char **passphrase,
> +        size_t *passphrase_len,
> +        Error **errp)
> +{
> +    int r = 0;
> +
> +    r = qemu_rbd_convert_luks_options(
> +            qapi_RbdEncryptionCreateOptionsLUKSBase_base(luks_opts),
> +            passphrase, passphrase_len, errp);
> +    if (r < 0) {
> +        return r;
> +    }
> +
> +    if (luks_opts->has_cipher_alg) {
> +        switch (luks_opts->cipher_alg) {
> +            case QCRYPTO_CIPHER_ALG_AES_128: {
> +                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
> +                break;
> +            }
> +            case QCRYPTO_CIPHER_ALG_AES_256: {
> +                *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> +                break;
> +            }
> +            default: {
> +                r = -ENOTSUP;
> +                error_setg_errno(errp, -r, "unknown encryption algorithm: %u",
> +                                 luks_opts->cipher_alg);
> +                return r;
> +            }
> +        }
> +    } else {
> +        /* default alg */
> +        *alg = RBD_ENCRYPTION_ALGORITHM_AES256;
> +    }
> +
> +    return 0;
> +}
> +
> +static int qemu_rbd_encryption_format(rbd_image_t image,
> +                                      RbdEncryptionCreateOptions *encrypt,
> +                                      Error **errp)
> +{
> +    int r = 0;
> +    g_autofree char *passphrase = NULL;

Should the passphrase be zeroed before being freed to avoid it lying
around in memory?  A quick grep didn't turn up a memzero_explicit or
memset_s like pattern in other places though...

> +    size_t passphrase_len;
> +    rbd_encryption_format_t format;
> +    rbd_encryption_options_t opts;
> +    rbd_encryption_luks1_format_options_t luks_opts;
> +    rbd_encryption_luks2_format_options_t luks2_opts;
> +    size_t opts_size;
> +    uint64_t raw_size, effective_size;
> +
> +    r = rbd_get_size(image, &raw_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get raw image size");
> +        return r;
> +    }
> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            memset(&luks_opts, 0, sizeof(luks_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = &luks_opts;
> +            opts_size = sizeof(luks_opts);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
> +                    &luks_opts.alg, &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_opts.passphrase = passphrase;
> +            luks_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = &luks2_opts;
> +            opts_size = sizeof(luks2_opts);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS2_base(
> +                            &encrypt->u.luks2),
> +                    &luks2_opts.alg, &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks2_opts.passphrase = passphrase;
> +            luks2_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +            return r;
> +        }
> +    }
> +
> +    r = rbd_encryption_format(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption format fail");
> +        return r;
> +    }
> +
> +    r = rbd_get_size(image, &effective_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get effective image size");
> +        return r;
> +    }
> +
> +    r = rbd_resize(image, raw_size + (raw_size - effective_size));
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot resize image after format");
> +        return r;
> +    }
> +
> +    return 0;
> +}
> +
> +static int qemu_rbd_encryption_load(rbd_image_t image,
> +                                      RbdEncryptionOptions *encrypt,
> +                                      Error **errp)
> +{
> +    int r = 0;
> +    g_autofree char *passphrase = NULL;

Same here.

> +    size_t passphrase_len;
> +    rbd_encryption_luks1_format_options_t luks_opts;
> +    rbd_encryption_luks2_format_options_t luks2_opts;
> +    rbd_encryption_format_t format;
> +    rbd_encryption_options_t opts;
> +    size_t opts_size;
> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            memset(&luks_opts, 0, sizeof(luks_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = &luks_opts;
> +            opts_size = sizeof(luks_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_opts.passphrase = passphrase;
> +            luks_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            memset(&luks2_opts, 0, sizeof(luks2_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = &luks2_opts;
> +            opts_size = sizeof(luks2_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks2_opts.passphrase = passphrase;
> +            luks2_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +            return r;
> +        }
> +    }
> +
> +    r = rbd_encryption_load(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption load fail");
> +    }
> +
> +    return r;

Could be return 0 for clarity?

> +}
> +#endif
> +
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                                const char *keypairs, const char *password_secret,
> @@ -358,6 +566,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          return -EINVAL;
>      }
>
> +#ifndef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->has_encrypt) {
> +        error_setg(errp, "RBD library does not support image encryption");
> +        return -ENOTSUP;
> +    }
> +#endif
> +
>      if (opts->has_cluster_size) {
>          int64_t objsize = opts->cluster_size;
>          if ((objsize - 1) & objsize) {    /* not a power of 2? */
> @@ -383,6 +598,27 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          goto out;
>      }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->has_encrypt) {
> +        rbd_image_t image;
> +
> +        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "error reading header from %s",
> +                             opts->location->image);

I know you copied this from qemu_rbd_open() but mentioning image name
seems redundant (and not done anywhere else in this patch).  How about
something like "error opening image for encryption format"?

> +            goto out;
> +        }
> +
> +        ret = qemu_rbd_encryption_format(image, opts->encrypt, errp);
> +        rbd_close(image);
> +        if (ret < 0) {
> +            /* encryption format fail, try removing the image */
> +            rbd_remove(io_ctx, opts->location->image);
> +            goto out;
> +        }
> +    }
> +#endif
> +
>      ret = 0;
>  out:
>      rados_ioctx_destroy(io_ctx);
> @@ -395,6 +631,43 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
>      return qemu_rbd_do_create(options, NULL, NULL, errp);
>  }
>
> +static int qemu_rbd_extract_encryption_create_options(
> +        QemuOpts *opts,
> +        RbdEncryptionCreateOptions **spec,
> +        Error **errp)
> +{
> +    QDict *opts_qdict;
> +    QDict *encrypt_qdict;
> +    Visitor *v;
> +    int ret = 0;
> +
> +    opts_qdict = qemu_opts_to_qdict(opts, NULL);
> +    qdict_extract_subqdict(opts_qdict, &encrypt_qdict, "encrypt.");
> +    qobject_unref(opts_qdict);
> +    if (!qdict_size(encrypt_qdict)) {
> +        *spec = NULL;
> +        goto exit;
> +    }
> +
> +    /* Convert options into a QAPI object */
> +    v = qobject_input_visitor_new_flat_confused(encrypt_qdict, errp);
> +    if (!v) {
> +        ret = -EINVAL;
> +        goto exit;
> +    }
> +
> +    visit_type_RbdEncryptionCreateOptions(v, NULL, spec, errp);
> +    visit_free(v);
> +    if (!*spec) {
> +        ret = -EINVAL;
> +        goto exit;
> +    }
> +
> +exit:
> +    qobject_unref(encrypt_qdict);
> +    return ret;
> +}
> +
>  static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>                                                  const char *filename,
>                                                  QemuOpts *opts,
> @@ -403,6 +676,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>      BlockdevCreateOptions *create_options;
>      BlockdevCreateOptionsRbd *rbd_opts;
>      BlockdevOptionsRbd *loc;
> +    RbdEncryptionCreateOptions *encrypt = NULL;
>      Error *local_err = NULL;
>      const char *keypairs, *password_secret;
>      QDict *options = NULL;
> @@ -431,6 +705,13 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>          goto exit;
>      }
>
> +    ret = qemu_rbd_extract_encryption_create_options(opts, &encrypt, errp);
> +    if (ret < 0) {
> +        goto exit;
> +    }
> +    rbd_opts->encrypt     = encrypt;
> +    rbd_opts->has_encrypt = !!encrypt;
> +
>      /*
>       * Caution: while qdict_get_try_str() is fine, getting non-string
>       * types would require more care.  When @options come from -blockdev
> @@ -756,12 +1037,25 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          goto failed_open;
>      }
>
> +    if (opts->has_encrypt) {
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        if (r < 0) {
> +            goto failed_post_open;
> +        }
> +#else
> +        r = -ENOTSUP;
> +        error_setg_errno(errp, -r,
> +                         "RBD library does not support image encryption");

I think this should be error_setg() like in qemu_rbd_do_create().
"Operation not supported" error message is clearly redundant here.

> +        goto failed_post_open;
> +#endif
> +    }
> +
>      r = rbd_get_size(s->image, &s->image_size);
>      if (r < 0) {
>          error_setg_errno(errp, -r, "error getting image size from %s",
>                           s->image_name);
> -        rbd_close(s->image);
> -        goto failed_open;
> +        goto failed_post_open;
>      }
>
>      /* If we are using an rbd snapshot, we must be r/o, otherwise
> @@ -769,8 +1063,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      if (s->snap != NULL) {
>          r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
>          if (r < 0) {
> -            rbd_close(s->image);
> -            goto failed_open;
> +            goto failed_post_open;
>          }
>      }
>
> @@ -780,6 +1073,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      r = 0;
>      goto out;
>
> +failed_post_open:
> +    rbd_close(s->image);
>  failed_open:
>      rados_ioctx_destroy(s->io_ctx);
>      g_free(s->snap);
> @@ -1050,6 +1345,53 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>      return 0;
>  }
>
> +static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
> +                                                     Error **errp)
> +{
> +    BDRVRBDState *s = bs->opaque;
> +    ImageInfoSpecific *spec_info;
> +    uint64_t raw_size;
> +    char buf[RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {0};
> +    int r;
> +
> +    r = rbd_get_size(s->image, &raw_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get raw image size");

This error message is a bit misleading because ->bdrv_get_specific_info
can be invoked on an image with a loaded encryption profile.  I'd drop
"raw" (and probably rename raw_size to e.g. image_size while at it).

> +        return NULL;
> +    }
> +
> +    if (raw_size >= RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) {
> +        r = rbd_read(s->image, 0,
> +                     RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN, buf);
> +        if (r < 0) {
> +            error_setg_errno(errp, -r, "cannot read image start for probe");
> +            return NULL;
> +        }
> +    }
> +
> +    spec_info = g_new(ImageInfoSpecific, 1);
> +    *spec_info = (ImageInfoSpecific){
> +        .type  = IMAGE_INFO_SPECIFIC_KIND_RBD,
> +        .u.rbd.data = g_new0(ImageInfoSpecificRbd, 1),
> +    };
> +
> +    if (memcmp(buf, rbd_luks_header_verification,
> +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> +        spec_info->u.rbd.data->encryption_format =
> +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS;
> +        spec_info->u.rbd.data->has_encryption_format = true;
> +    } else if (memcmp(buf, rbd_luks2_header_verification,
> +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> +        spec_info->u.rbd.data->encryption_format =
> +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
> +        spec_info->u.rbd.data->has_encryption_format = true;
> +    } else {
> +        spec_info->u.rbd.data->has_encryption_format = false;
> +    }
> +
> +    return spec_info;
> +}
> +
>  static int64_t qemu_rbd_getlength(BlockDriverState *bs)
>  {
>      BDRVRBDState *s = bs->opaque;
> @@ -1243,6 +1585,22 @@ static QemuOptsList qemu_rbd_create_opts = {
>              .type = QEMU_OPT_STRING,
>              .help = "ID of secret providing the password",
>          },
> +        {
> +            .name = "encrypt.format",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Encrypt the image, format choices: 'luks', 'luks2'",
> +        },
> +        {
> +            .name = "encrypt.cipher-alg",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Name of encryption cipher algorithm"
> +                    " (allowed values: aes-128, aes-256)",
> +        },
> +        {
> +            .name = "encrypt.key-secret",
> +            .type = QEMU_OPT_STRING,
> +            .help = "ID of secret providing LUKS passphrase",
> +        },
>          { /* end of list */ }
>      }
>  };
> @@ -1272,6 +1630,7 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
>      .bdrv_has_zero_init     = bdrv_has_zero_init_1,
>      .bdrv_get_info          = qemu_rbd_getinfo,
> +    .bdrv_get_specific_info = qemu_rbd_get_specific_info,
>      .create_opts            = &qemu_rbd_create_opts,
>      .bdrv_getlength         = qemu_rbd_getlength,
>      .bdrv_co_truncate       = qemu_rbd_co_truncate,
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..67cfd8c092 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -127,6 +127,18 @@
>        'extents': ['ImageInfo']
>    } }
>
> +##
> +# @ImageInfoSpecificRbd:
> +#
> +# @encryption-format: Image encryption format
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'ImageInfoSpecificRbd',
> +  'data': {
> +      '*encryption-format': 'RbdImageEncryptionFormat'
> +  } }
> +
>  ##
>  # @ImageInfoSpecific:
>  #
> @@ -141,7 +153,8 @@
>        # If we need to add block driver specific parameters for
>        # LUKS in future, then we'll subclass QCryptoBlockInfoLUKS
>        # to define a ImageInfoSpecificLUKS
> -      'luks': 'QCryptoBlockInfoLUKS'
> +      'luks': 'QCryptoBlockInfoLUKS',
> +      'rbd': 'ImageInfoSpecificRbd'
>    } }
>
>  ##
> @@ -3609,6 +3622,94 @@
>  { 'enum': 'RbdAuthMode',
>    'data': [ 'cephx', 'none' ] }
>
> +##
> +# @RbdImageEncryptionFormat:
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'RbdImageEncryptionFormat',
> +  'data': [ 'luks', 'luks2' ] }
> +
> +##
> +# @RbdEncryptionOptionsLUKSBase:
> +#
> +# @key-secret: ID of a QCryptoSecret object providing a passphrase
> +#              for unlocking the encryption
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKSBase',
> +  'data': { 'key-secret': 'str' }}

'data': { 'key-secret': 'str' } }

> +
> +##
> +# @RbdEncryptionCreateOptionsLUKSBase:
> +#
> +# @cipher-alg: The encryption algorithm
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionCreateOptionsLUKSBase',
> +  'base': 'RbdEncryptionOptionsLUKSBase',
> +  'data': { '*cipher-alg': 'QCryptoCipherAlgorithm'}}

'data': { '*cipher-alg': 'QCryptoCipherAlgorithm' } }

> +
> +##
> +# @RbdEncryptionOptionsLUKS:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKS',
> +  'base': 'RbdEncryptionOptionsLUKSBase',
> +  'data': {}}

'data': { } }

here and below.

> +
> +##
> +# @RbdEncryptionOptionsLUKS2:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKS2',
> +  'base': 'RbdEncryptionOptionsLUKSBase',
> +  'data': {}}
> +
> +##
> +# @RbdEncryptionCreateOptionsLUKS:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionCreateOptionsLUKS',
> +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> +  'data': {}}
> +
> +##
> +# @RbdEncryptionCreateOptionsLUKS2:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionCreateOptionsLUKS2',
> +  'base': 'RbdEncryptionCreateOptionsLUKSBase',
> +  'data': {}}
> +
> +##
> +# @RbdEncryptionOptions:
> +#
> +# Since: 6.1
> +##
> +{ 'union': 'RbdEncryptionOptions',
> +  'base': { 'format': 'RbdImageEncryptionFormat' },
> +  'discriminator': 'format',
> +  'data': { 'luks': 'RbdEncryptionOptionsLUKS',
> +            'luks2': 'RbdEncryptionOptionsLUKS2'} }

'luks2': 'RbdEncryptionOptionsLUKS2' } }

> +
> +##
> +# @RbdEncryptionCreateOptions:
> +#
> +# Since: 6.1
> +##
> +{ 'union': 'RbdEncryptionCreateOptions',
> +  'base': { 'format': 'RbdImageEncryptionFormat' },
> +  'discriminator': 'format',
> +  'data': { 'luks': 'RbdEncryptionCreateOptionsLUKS',
> +            'luks2': 'RbdEncryptionCreateOptionsLUKS2'} }

'luks2': 'RbdEncryptionCreateOptionsLUKS2' } }

> +
>  ##
>  # @BlockdevOptionsRbd:
>  #
> @@ -3624,6 +3725,8 @@
>  #
>  # @snapshot: Ceph snapshot name.
>  #
> +# @encrypt: Image encryption options. (Since 6.1)
> +#
>  # @user: Ceph id name.
>  #
>  # @auth-client-required: Acceptable authentication modes.
> @@ -3646,6 +3749,7 @@
>              'image': 'str',
>              '*conf': 'str',
>              '*snapshot': 'str',
> +            '*encrypt': 'RbdEncryptionOptions',
>              '*user': 'str',
>              '*auth-client-required': ['RbdAuthMode'],
>              '*key-secret': 'str',
> @@ -4418,13 +4522,15 @@
>  #            point to a snapshot.
>  # @size: Size of the virtual disk in bytes
>  # @cluster-size: RBD object size
> +# @encrypt: Image encryption options. (Since 6.1)
>  #
>  # Since: 2.12
>  ##
>  { 'struct': 'BlockdevCreateOptionsRbd',
>    'data': { 'location':         'BlockdevOptionsRbd',
>              'size':             'size',
> -            '*cluster-size' :   'size' } }
> +            '*cluster-size' :   'size',
> +            '*encrypt' :        'RbdEncryptionCreateOptions'} }

'*encrypt' :        'RbdEncryptionCreateOptions' } }

Thanks,

                Ilya

