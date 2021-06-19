Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C3D3ADB8A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 21:46:14 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lugv0-000055-0t
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 15:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lugtc-0007Cl-U5; Sat, 19 Jun 2021 15:44:48 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lugtZ-0000sk-DU; Sat, 19 Jun 2021 15:44:48 -0400
Received: by mail-il1-x129.google.com with SMTP id x12so11484281ill.4;
 Sat, 19 Jun 2021 12:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmDlmq+NGm35wusEunzqud1MoMDsGru0M8UqPwVB+xs=;
 b=NdQdz/NBwaZZ+3Top7AzjExm+5Y8Ob4TCG1SZdZb95Cz9AOfjSeCGO5Gt7ECPKOjH7
 cCUTHLhbLudJ1816t4XgdraFN2VIPdQ+2gYZqWX1Lb4Vlp6B+8i83OlNPQRLiyYK18JC
 S7G3khBrBPBUYiRU93ZLNQQzJBwDDu7z47ppmjX6NE9P6oNW20dgxgFMv/gTcDtZ7gZz
 PKJDgLXnv55W5QBkTYOncmVMqBY+EmFwi3zqFo35gqZU6CZBEW04DKzSKQia99MkKfcz
 OkBsnxwK/wMLOJmVvUUXK20fISWhAC9OYhU1ZVK4gYSeKoCEPzHoyvcJ0g+mwqMYfxFN
 BevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmDlmq+NGm35wusEunzqud1MoMDsGru0M8UqPwVB+xs=;
 b=o18jhHhtqqqnDwk/PednuEWl2sDOAve9IV7R38akTdOqWpaoX3Pv7IV+gowWsV8B8X
 DjsrKPhp1l3WIDQNsrkCryEL11twHqorVbjydh3NF/HklQEe1gNbrCMVNWZd1cc+mEMT
 GBkR2oZaNModzWNVv6C2fRiDoeKcvIOpZXRtwLIpRtjPjv6oHiTcPCyY96bP43cS1eYE
 vEhZIVhp63xB89Q6FtYbKcCTgIUe0kZ8ZaBnzAgIuFiAj7YaOyNXz8GsF39ew8wLfj4I
 dDpNPNDBTNRd5Px+zEMkyK5Is9AgIwDQpB00eOCzOCqL8i9djfDpXrGi7fZGwCjGBdMN
 m9/A==
X-Gm-Message-State: AOAM530sNX4+AFw+cuZijNXhH7fZgyvTkFpOC/RMycIsqRPA8+nCcyt/
 ySuaTTW+Xjvhgmrsxeez4KeVyF1yr1583hWC0+Q=
X-Google-Smtp-Source: ABdhPJyJMUnAuq34T6j7H2EGetBjhesCsCZ9y6aYGWnl1FWrAops+PdpDIPMSMYy2pneUmxVtEnGnEHdNIDBTxNXonk=
X-Received: by 2002:a92:290f:: with SMTP id l15mr1367921ilg.220.1624131883216; 
 Sat, 19 Jun 2021 12:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210617160520.3694358-1-oro@il.ibm.com>
In-Reply-To: <20210617160520.3694358-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 19 Jun 2021 21:44:32 +0200
Message-ID: <CAOi1vP8JJiupdBCQsfN=KK8j1Q2Bnu059vXS0a1M53QsgY+OFQ@mail.gmail.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
To: Or Ozeri <oro@il.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=idryomov@gmail.com; helo=mail-il1-x129.google.com
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Mykola Golub <to.my.trociny@gmail.com>,
 Danny Harnik <dannyh@il.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 6:05 PM Or Ozeri <oro@il.ibm.com> wrote:
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
>  block/raw-format.c   |   7 +
>  block/rbd.c          | 371 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json | 110 ++++++++++++-
>  3 files changed, 482 insertions(+), 6 deletions(-)
>
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 7717578ed6..f6e70e2356 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -369,6 +369,12 @@ static int raw_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
>      return bdrv_get_info(bs->file->bs, bdi);
>  }
>
> +static ImageInfoSpecific *raw_get_specific_info(BlockDriverState *bs,
> +                                                Error **errp)
> +{
> +    return bdrv_get_specific_info(bs->file->bs, errp);
> +}
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      if (bs->probed) {
> @@ -603,6 +609,7 @@ BlockDriver bdrv_raw = {
>      .has_variable_length  = true,
>      .bdrv_measure         = &raw_measure,
>      .bdrv_get_info        = &raw_get_info,
> +    .bdrv_get_specific_info = &raw_get_specific_info,

Hi Or,

This feels a bit contentious to me.

AFAIU ImageInfoSpecific is for format-specfic information.  "raw"
is a format and passing the request down the stack this way results
in a somewhat confusing output such as

    $ qemu-img info rbd:foo/bar
    image: json:{"driver": "raw", "file": {"pool": "foo", "image":
"bar", "driver": "rbd", "namespace": ""}}
    file format: raw
    ...
    Format specific information:
       <information for rbd format>

I think this should be broken out into its own patch and get separate
acks.

>      .bdrv_refresh_limits  = &raw_refresh_limits,
>      .bdrv_probe_blocksizes = &raw_probe_blocksizes,
>      .bdrv_probe_geometry  = &raw_probe_geometry,
> diff --git a/block/rbd.c b/block/rbd.c
> index f098a89c7b..183b17cd84 100644
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
> @@ -341,6 +353,206 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>      }
>  }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +static int qemu_rbd_convert_luks_options(
> +        RbdEncryptionOptionsLUKSBase *luks_opts,
> +        char **passphrase,
> +        Error **errp)
> +{
> +    int r = 0;
> +
> +    if (!luks_opts->has_key_secret) {
> +        r = -EINVAL;
> +        error_setg_errno(errp, -r, "missing encrypt.key-secret");
> +        return r;
> +    }

Why is key-secret optional?

> +
> +    *passphrase = qcrypto_secret_lookup_as_utf8(luks_opts->key_secret, errp);
> +    if (!*passphrase) {
> +        return -EIO;
> +    }
> +
> +    return 0;
> +}
> +
> +static int qemu_rbd_convert_luks_create_options(
> +        RbdEncryptionCreateOptionsLUKSBase *luks_opts,
> +        rbd_encryption_algorithm_t *alg,
> +        char **passphrase,
> +        Error **errp)
> +{
> +    int r = 0;
> +
> +    r = qemu_rbd_convert_luks_options(
> +            qapi_RbdEncryptionCreateOptionsLUKSBase_base(luks_opts),
> +            passphrase, errp);
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
> +    g_autofree rbd_encryption_options_t opts = NULL;
> +    rbd_encryption_format_t format;
> +    rbd_image_info_t info;
> +    size_t opts_size;
> +    uint64_t raw_size;
> +
> +    r = rbd_stat(image, &info, sizeof(info));
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get raw image size");
> +        return r;
> +    }
> +    raw_size = info.size;

Using rbd_get_size() to put size directly into raw_size would be
neater and avoid rbd_image_info_t.

> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            rbd_encryption_luks1_format_options_t *luks_opts =
> +                    g_new0(rbd_encryption_luks1_format_options_t, 1);

Why is this dynamically allocated?  It doesn't matter that much, but
would rbd_encryption_luks1_format_options_t on the stack not work?

> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = luks_opts;
> +            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS_base(&encrypt->u.luks),
> +                    &luks_opts->alg, &passphrase, errp);
> +            luks_opts->passphrase = passphrase;
> +            luks_opts->passphrase_size = strlen(passphrase);

r needs to be checked before strlen() is called, as passphrase
would be NULL on error.

More importantly, what about randomly-generated (i.e. binary)
passphrases?  I think qemu_rbd_convert_luks_options() should be
switched to qcrypto_secret_lookup() to cover this case.  Then
this strlen() would go away entirely.

> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            rbd_encryption_luks2_format_options_t *luks2_opts =
> +                    g_new0(rbd_encryption_luks2_format_options_t, 1);

Same here.

> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = luks2_opts;
> +            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
> +            r = qemu_rbd_convert_luks_create_options(
> +                    qapi_RbdEncryptionCreateOptionsLUKS2_base(
> +                            &encrypt->u.luks2),
> +                    &luks2_opts->alg, &passphrase, errp);
> +            luks2_opts->passphrase = passphrase;
> +            luks2_opts->passphrase_size = strlen(passphrase);

And here.

> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +        }
> +    }
> +
> +    if (r < 0) {
> +        return r;
> +    }
> +
> +    r = rbd_encryption_format(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption format fail");
> +        return r;
> +    }
> +
> +    r = rbd_stat(image, &info, sizeof(info));
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get effective image size");
> +        return r;
> +    }
> +
> +    r = rbd_resize(image, raw_size + (raw_size - info.size));
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
> +    g_autofree rbd_encryption_options_t opts = NULL;
> +    rbd_encryption_format_t format;
> +    size_t opts_size;
> +
> +    switch (encrypt->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +            rbd_encryption_luks1_format_options_t *luks_opts =
> +                    g_new0(rbd_encryption_luks1_format_options_t, 1);
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = luks_opts;
> +            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS_base(&encrypt->u.luks),
> +                    &passphrase, errp);
> +            luks_opts->passphrase = passphrase;
> +            luks_opts->passphrase_size = strlen(passphrase);
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            rbd_encryption_luks2_format_options_t *luks2_opts =
> +                    g_new0(rbd_encryption_luks2_format_options_t, 1);
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = luks2_opts;
> +            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS2_base(&encrypt->u.luks2),
> +                    &passphrase, errp);
> +            luks2_opts->passphrase = passphrase;
> +            luks2_opts->passphrase_size = strlen(passphrase);

Same as in qemu_rbd_encryption_format().

> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    encrypt->format);
> +        }
> +    }
> +
> +    if (r < 0) {
> +        return r;
> +    }
> +
> +    r = rbd_encryption_load(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption load fail");
> +    }
> +
> +    return r;
> +}
> +#endif
> +
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                                const char *keypairs, const char *password_secret,
> @@ -358,6 +570,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          return -EINVAL;
>      }
>
> +#ifndef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->location->has_encrypt) {

Here opts->location->encrypt is being checked

> +        error_setg(errp, "RBD library does not support image encryption");
> +        return -ENOTSUP;
> +    }
> +#endif
> +
>      if (opts->has_cluster_size) {
>          int64_t objsize = opts->cluster_size;
>          if ((objsize - 1) & objsize) {    /* not a power of 2? */
> @@ -383,6 +602,27 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          goto out;
>      }
>
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->has_encrypt) {

... but opts->encrypt is being acted on.  A request to create an
encrypted image with an old librbd would not be failed.

> +        rbd_image_t image;
> +
> +        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "error reading header from %s",
> +                             opts->location->image);
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
> @@ -395,6 +635,43 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
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
> @@ -403,6 +680,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>      BlockdevCreateOptions *create_options;
>      BlockdevCreateOptionsRbd *rbd_opts;
>      BlockdevOptionsRbd *loc;
> +    RbdEncryptionCreateOptions *encrypt = NULL;
>      Error *local_err = NULL;
>      const char *keypairs, *password_secret;
>      QDict *options = NULL;
> @@ -431,6 +709,13 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
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
> @@ -756,12 +1041,25 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
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
> @@ -769,8 +1067,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      if (s->snap != NULL) {
>          r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
>          if (r < 0) {
> -            rbd_close(s->image);
> -            goto failed_open;
> +            goto failed_post_open;
>          }
>      }
>
> @@ -780,6 +1077,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      r = 0;
>      goto out;
>
> +failed_post_open:
> +    rbd_close(s->image);
>  failed_open:
>      rados_ioctx_destroy(s->io_ctx);
>      g_free(s->snap);
> @@ -1050,6 +1349,53 @@ static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>      return 0;
>  }
>
> +static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
> +                                                     Error **errp)
> +{
> +    BDRVRBDState *s = bs->opaque;
> +    ImageInfoSpecific *spec_info;
> +    rbd_image_info_t info;
> +    char buf[RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {0};
> +    int r;
> +
> +    r = rbd_stat(s->image, &info, sizeof(info));

Ditto -- rbd_get_size().

> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "cannot get image size");
> +        return NULL;
> +    }
> +
> +    if (info.size >= RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) {
> +        r = rbd_read(s->image, 0,
> +                     RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN, buf) ;

Stray space before semicolon.

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
> @@ -1243,6 +1589,22 @@ static QemuOptsList qemu_rbd_create_opts = {
>              .type = QEMU_OPT_STRING,
>              .help = "ID of secret providing the password",
>          },
> +        {
> +            .name = "encrypt.format",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Encrypt the image, format choices: 'luks', 'luks2'",

I think it should be "luks1" and "luks2" to match rbd/librbd.h and
"rbd encryption format" command.

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

A question probably better suited for QEMU maintainers but just in
case you have already asked and clarified this matter...

There seem to be two image creation APIs: the old option-based thing
and the new QAPI-based x-blockdev-create command.  This patch extends
both and implements the old -> new translation.  Is this the right way
to do it?  Is the option-based interface supposed to be extended when
adding new functionality?

>          { /* end of list */ }
>      }
>  };
> @@ -1272,6 +1634,7 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_co_create_opts    = qemu_rbd_co_create_opts,
>      .bdrv_has_zero_init     = bdrv_has_zero_init_1,
>      .bdrv_get_info          = qemu_rbd_getinfo,
> +    .bdrv_get_specific_info = qemu_rbd_get_specific_info,
>      .create_opts            = &qemu_rbd_create_opts,
>      .bdrv_getlength         = qemu_rbd_getlength,
>      .bdrv_co_truncate       = qemu_rbd_co_truncate,
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..60d2ff0d1a 100644
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

Ditto -- "luks1" and "luks2".

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
> +  'data': { '*key-secret': 'str' }}

When would we not need a passphrase?  I think it should be required.

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

Why QCryptoCipherAlgorithm instead of just enumerating the two
algorithms that librbd supports?  An early failure when parsing
seems better than failing in qemu_rbd_convert_luks_create_options()
and having to clean up the newly created image.

> +
> +##
> +# @RbdEncryptionOptionsLUKS:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKS',
> +  'base': 'RbdEncryptionOptionsLUKSBase',
> +  'data': {}}
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

This appears over-engineered to me.  A three-deep hierarchy for
a structure with two fields (key-secret and cipher-alg) seems like
it could be simplified.

Why differentiate between luks1 and luks2 if the fields are exactly
the same?  Do you expect one of these empty derived structures to be
extended in the future?

Thanks,

                Ilya

