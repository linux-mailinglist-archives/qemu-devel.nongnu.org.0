Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675B372C63
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:48:47 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwLt-0005xC-Vo
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldwKK-0004vf-V3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldwKF-0003oA-RF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620139622;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dUhKywx96WUzOOrTfJEHtMg6l2qpluwQ0tqCZxOzhss=;
 b=YYTqP082aZ5C61PlMEJWpXZvuLJGLxc85sp/ehwJlW3/R7JwvJvzZeG/1Yo0KtqDEhvA8D
 XDDdVRDezmo7hFaBKKOizfd4NkWduuGrtN+u8AbuOSydL32o2is0iaozoERmCD4ApVDMMN
 0m1qJzx87+fRT5aYL4IcF1YVfRN/ZFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-uGBJd3c_OI-IYHwmFSVz1w-1; Tue, 04 May 2021 10:46:56 -0400
X-MC-Unique: uGBJd3c_OI-IYHwmFSVz1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CA5483DC07;
 Tue,  4 May 2021 14:46:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 295E42AE8A;
 Tue,  4 May 2021 14:46:49 +0000 (UTC)
Date: Tue, 4 May 2021 15:46:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
Message-ID: <YJFeV5YwdBRywKAX@redhat.com>
References: <20210502073617.2978836-1-oro@il.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210502073617.2978836-1-oro@il.ibm.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, dannyh@il.ibm.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, to.my.trociny@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 02, 2021 at 10:36:17AM +0300, Or Ozeri wrote:
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
>  block/rbd.c          | 230 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  61 ++++++++++++
>  2 files changed, 287 insertions(+), 4 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index f098a89c7b..1239e97889 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -108,6 +108,13 @@ typedef struct BDRVRBDState {
>      uint64_t image_size;
>  } BDRVRBDState;
>  
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +typedef int (*RbdEncryptionFunc)(rbd_image_t image,
> +                                 rbd_encryption_format_t format,
> +                                 rbd_encryption_options_t opts,
> +                                 size_t opts_size);
> +#endif
> +
>  static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>                              BlockdevOptionsRbd *opts, bool cache,
>                              const char *keypairs, const char *secretid,
> @@ -341,6 +348,115 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>      }
>  }
>  
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +static int qemu_rbd_convert_luks_options(
> +        RbdEncryptionOptionsLUKSBase *luks_opts,
> +        rbd_encryption_algorithm_t *alg,
> +        char** passphrase,
> +        Error **errp)
> +{
> +    int r = 0;
> +
> +    if (!luks_opts->has_passphrase_secret) {
> +        r = -EINVAL;
> +        error_setg_errno(errp, -r, "missing encrypt.passphrase-secret");
> +        return r;
> +    }
> +
> +    *passphrase = qcrypto_secret_lookup_as_utf8(luks_opts->passphrase_secret,
> +                                                errp);
> +    if (!*passphrase) {
> +        return -EIO;
> +    }
> +
> +    if (luks_opts->has_cipher_alg) {
> +        switch (luks_opts->cipher_alg) {
> +            case RBD_ENCRYPTION_ALGORITHM_AES_128: {
> +                *alg = RBD_ENCRYPTION_ALGORITHM_AES128;
> +                break;
> +            }
> +            case RBD_ENCRYPTION_ALGORITHM_AES_256: {
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
> +static int qemu_rbd_apply_encryption_function(rbd_image_t image,
> +                                              RbdEncryptionSpec* spec,
> +                                              RbdEncryptionFunc func,
> +                                              Error **errp)
> +{
> +    int r = 0;
> +    g_autofree char *passphrase = NULL;
> +    g_autofree rbd_encryption_options_t opts = NULL;
> +    rbd_encryption_format_t format;
> +    size_t opts_size;
> +
> +    switch (spec->format) {
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS1: {
> +            rbd_encryption_luks1_format_options_t *luks1_opts =
> +                    g_new0(rbd_encryption_luks1_format_options_t, 1);
> +            format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +            opts = luks1_opts;
> +            opts_size = sizeof(rbd_encryption_luks1_format_options_t);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS1_base(&spec->u.luks1),
> +                    &luks1_opts->alg, &passphrase, errp);
> +            if (passphrase) {
> +                luks1_opts->passphrase = passphrase;
> +                luks1_opts->passphrase_size = strlen(passphrase);
> +            }
> +            break;
> +        }
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +            rbd_encryption_luks2_format_options_t *luks2_opts =
> +                    g_new0(rbd_encryption_luks2_format_options_t, 1);
> +            format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +            opts = luks2_opts;
> +            opts_size = sizeof(rbd_encryption_luks2_format_options_t);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKS2_base(&spec->u.luks2),
> +                    &luks2_opts->alg, &passphrase, errp);
> +            if (passphrase) {
> +                luks2_opts->passphrase = passphrase;
> +                luks2_opts->passphrase_size = strlen(passphrase);
> +            }
> +            break;
> +        }
> +        default: {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    spec->format);
> +        }
> +    }
> +
> +    if (r < 0) {
> +        return r;
> +    }
> +
> +    r = func(image, format, opts, opts_size);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "error applying encryption function");
> +    }
> +
> +    return r;
> +}
> +#endif
> +
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
>  static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>                                const char *keypairs, const char *password_secret,
> @@ -358,6 +474,13 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          return -EINVAL;
>      }
>  
> +#ifndef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->location->has_encrypt) {
> +        error_setg(errp, "RBD library does not support image encryption");
> +        return -ENOTSUP;
> +    }
> +#endif
> +
>      if (opts->has_cluster_size) {
>          int64_t objsize = opts->cluster_size;
>          if ((objsize - 1) & objsize) {    /* not a power of 2? */
> @@ -383,6 +506,30 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
>          goto out;
>      }
>  
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +    if (opts->location->has_encrypt) {
> +        rbd_image_t image;
> +
> +        ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret, "error reading header from %s",
> +                             opts->location->image);
> +            goto out;
> +        }
> +
> +        ret = qemu_rbd_apply_encryption_function(image,
> +                                                 opts->location->encrypt,
> +                                                 &rbd_encryption_format,
> +                                                 errp);
> +        rbd_close(image);
> +        if (ret < 0) {
> +            /* encryption format fail, try removing the image */
> +            rbd_remove(io_ctx, opts->location->image);
> +            goto out;
> +        }
> +    }
> +#endif

What happens to the size of the image when creating with luks ? LUKS
will typically have at least 1 MB of overhead for the headers. When
QEMU gets told to create an image with a size "512MB" that refers to
the guest exposed size. So with LUKS QEMU might allocate 513 MB instead
on the host POV, to ensure the guest POV is still 512 MB.  Does RBD
do this correctly and if not, can QEMU adjust to take this into account ?



> +
>      ret = 0;
>  out:
>      rados_ioctx_destroy(io_ctx);
> @@ -395,6 +542,42 @@ static int qemu_rbd_co_create(BlockdevCreateOptions *options, Error **errp)
>      return qemu_rbd_do_create(options, NULL, NULL, errp);
>  }
>  
> +static int qemu_rbd_extract_encryption_spec(QemuOpts *opts,
> +                                            RbdEncryptionSpec **spec,
> +                                            Error **errp)
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
> +    visit_type_RbdEncryptionSpec(v, NULL, spec, errp);
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
> @@ -403,6 +586,7 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>      BlockdevCreateOptions *create_options;
>      BlockdevCreateOptionsRbd *rbd_opts;
>      BlockdevOptionsRbd *loc;
> +    RbdEncryptionSpec *encryption_spec = NULL;
>      Error *local_err = NULL;
>      const char *keypairs, *password_secret;
>      QDict *options = NULL;
> @@ -431,6 +615,11 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>          goto exit;
>      }
>  
> +    ret = qemu_rbd_extract_encryption_spec(opts, &encryption_spec, errp);
> +    if (ret < 0) {
> +        goto exit;
> +    }
> +
>      /*
>       * Caution: while qdict_get_try_str() is fine, getting non-string
>       * types would require more care.  When @options come from -blockdev
> @@ -446,6 +635,8 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
>      loc->q_namespace = g_strdup(qdict_get_try_str(options, "namespace"));
>      loc->has_q_namespace = !!loc->q_namespace;
>      loc->image       = g_strdup(qdict_get_try_str(options, "image"));
> +    loc->encrypt     = encryption_spec;
> +    loc->has_encrypt = !!encryption_spec;
>      keypairs         = qdict_get_try_str(options, "=keyvalue-pairs");
>  
>      ret = qemu_rbd_do_create(create_options, keypairs, password_secret, errp);
> @@ -756,12 +947,26 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>          goto failed_open;
>      }
>  
> +    if (opts->has_encrypt) {
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION
> +        r = qemu_rbd_apply_encryption_function(s->image, opts->encrypt,
> +                                               &rbd_encryption_load, errp);
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
> @@ -769,8 +974,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      if (s->snap != NULL) {
>          r = bdrv_apply_auto_read_only(bs, "rbd snapshots are read-only", errp);
>          if (r < 0) {
> -            rbd_close(s->image);
> -            goto failed_open;
> +            goto failed_post_open;
>          }
>      }
>  
> @@ -780,6 +984,8 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      r = 0;
>      goto out;
>  
> +failed_post_open:
> +    rbd_close(s->image);
>  failed_open:
>      rados_ioctx_destroy(s->io_ctx);
>      g_free(s->snap);
> @@ -1243,6 +1449,22 @@ static QemuOptsList qemu_rbd_create_opts = {
>              .type = QEMU_OPT_STRING,
>              .help = "ID of secret providing the password",
>          },
> +        {
> +            .name = "encrypt.format",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Encrypt the image, format choices: 'luks1', 'luks2'",
> +        },
> +        {
> +            .name = "encrypt.cipher-alg",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Name of encryption cipher algorithm"
> +                    " (allowed values: aes-128, aes-256)",
> +        },
> +        {
> +            .name = "encrypt.passphrase-secret",
> +            .type = QEMU_OPT_STRING,
> +            .help = "ID of secret providing LUKS passphrase",
> +        },
>          { /* end of list */ }
>      }
>  };
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d227924d0..a1f3230e29 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3609,6 +3609,64 @@
>  { 'enum': 'RbdAuthMode',
>    'data': [ 'cephx', 'none' ] }
>  
> +##
> +# @RbdImageEncryptionFormat:
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'RbdImageEncryptionFormat',
> +  'data': [ 'luks1', 'luks2' ] }

We already have LUKS support in QEMU that we use with raw files
and with qcow2, and here we call LUKSv1 simply "luks".

IOW, I think we should just have "luks" and "luks2" 

> +
> +##
> +# @RbdEncryptionAlgorithm:
> +#
> +# Since: 6.1
> +##
> +{ 'enum': 'RbdEncryptionAlgorithm',
> +  'data': [ 'aes-128', 'aes-256' ] }

We already have a QCryptoCipherAlgorithm we should be using

> +
> +##
> +# @RbdEncryptionOptionsLUKSBase:
> +#
> +# @cipher-alg: The encryption algorithm
> +# @passphrase-secret: ID of a QCryptoSecret object providing a passphrase
> +#                     for unlocking the encryption
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKSBase',
> +  'data': { '*cipher-alg': 'RbdEncryptionAlgorithm',
> +            '*passphrase-secret': 'str' }}

For other block devices we've called it "key-secret", so please
lets keep the same terminology

IIUC, cipher-alg is only relevant when creating a new
disk image.

IOW, we ought to have separate option structs for the code
paths for opening and creating images, since the format
only wants a secret.

> +
> +##
> +# @RbdEncryptionOptionsLUKS1:
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKS1',
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
> +# @RbdEncryptionSpec:
> +#
> +# Since: 6.1
> +##
> +{ 'union': 'RbdEncryptionSpec',
> +  'base': { 'format': 'RbdImageEncryptionFormat' },
> +  'discriminator': 'format',
> +  'data': { 'luks1': 'RbdEncryptionOptionsLUKS1',
> +            'luks2': 'RbdEncryptionOptionsLUKS2'} }



> +
>  ##
>  # @BlockdevOptionsRbd:
>  #
> @@ -3624,6 +3682,8 @@
>  #
>  # @snapshot: Ceph snapshot name.
>  #
> +# @encrypt: Image encryption specification. (Since 6.1)
> +#
>  # @user: Ceph id name.
>  #
>  # @auth-client-required: Acceptable authentication modes.
> @@ -3646,6 +3706,7 @@
>              'image': 'str',
>              '*conf': 'str',
>              '*snapshot': 'str',
> +            '*encrypt': 'RbdEncryptionSpec',
>              '*user': 'str',
>              '*auth-client-required': ['RbdAuthMode'],
>              '*key-secret': 'str',


Is there any way to report that LUKS is enabled for a given image ?

For an application to specify the "key-secret" for encryption, we
need to know that the image is encrypted.  For the existing raw
and qcow2 file luks support we have this reported with "qemu-img info"


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


