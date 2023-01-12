Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91938667294
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:50:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFx2E-0000e1-R0; Thu, 12 Jan 2023 07:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFx2C-0000cZ-G3
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFx2A-0005ex-BA
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:50:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673527817;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wy5RewF/a9WosN1yBU7c0IFtS9Ve8azwNDtAE0D/IS0=;
 b=btxDqSbJiJNM4/Ayvf859PeFNeKVT/uepo3LZ19h3/2aEW6rMdmWSYWLF9G9LZo1lozrWz
 nFc8sc35RIrp7VnDYvaikRvkMBOv5M7MEn4U/g6XXaF14nVctr8QUaWa18/5agJyOVihqB
 jqvk6TGJtcpMIgYgzQPSGNSMtyQgIjk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-LcJhBTQ-M_mC3KWYI5EFzg-1; Thu, 12 Jan 2023 07:50:14 -0500
X-MC-Unique: LcJhBTQ-M_mC3KWYI5EFzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC795802C1D;
 Thu, 12 Jan 2023 12:50:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65AE3C15BA0;
 Thu, 12 Jan 2023 12:50:12 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:50:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: Re: [PATCH v4 3/3] block/rbd: Add support for layered encryption
Message-ID: <Y8ACAjd0S9q8sS0k@redhat.com>
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-4-oro@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221120102836.3174090-4-oro@il.ibm.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 20, 2022 at 04:28:36AM -0600, Or Ozeri wrote:
> Starting from ceph Reef, RBD has built-in support for layered encryption,
> where each ancestor image (in a cloned image setting) can be possibly
> encrypted using a unique passphrase.
> 
> A new function, rbd_encryption_load2, was added to librbd API.
> This new function supports an array of passphrases (via "spec" structs).
> 
> This commit extends the qemu rbd driver API to use this new librbd API,
> in order to support this new layered encryption feature.
> 
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  block/rbd.c          | 161 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  17 ++++-
>  2 files changed, 175 insertions(+), 3 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index 7feae45e82..157922e23a 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -71,6 +71,16 @@ static const char rbd_luks2_header_verification[
>      'L', 'U', 'K', 'S', 0xBA, 0xBE, 0, 2
>  };
>  
> +static const char rbd_layered_luks_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'R', 'B', 'D', 'L', 0xBA, 0xBE, 0, 1
> +};
> +
> +static const char rbd_layered_luks2_header_verification[
> +        RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN] = {
> +    'R', 'B', 'D', 'L', 0xBA, 0xBE, 0, 2
> +};
> +
>  typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
> @@ -537,6 +547,136 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>  
>      return 0;
>  }
> +
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +static int qemu_rbd_encryption_load2(rbd_image_t image,
> +                                     RbdEncryptionOptions *encrypt,
> +                                     Error **errp)
> +{
> +    int r = 0;
> +    int encrypt_count = 1;
> +    int i;
> +    RbdEncryptionOptions *curr_encrypt;
> +    rbd_encryption_spec_t *specs;
> +    rbd_encryption_luks1_format_options_t* luks_opts;
> +    rbd_encryption_luks2_format_options_t* luks2_opts;
> +    rbd_encryption_luks_format_options_t* luks_any_opts;
> +
> +    /* count encryption options */
> +    for (curr_encrypt = encrypt; curr_encrypt->has_parent;
> +         curr_encrypt = curr_encrypt->parent) {
> +        ++encrypt_count;
> +    }
> +
> +    specs = g_new0(rbd_encryption_spec_t, encrypt_count);
> +
> +    curr_encrypt = encrypt;
> +    for (i = 0; i < encrypt_count; ++i) {
> +        switch (curr_encrypt->format) {
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +                specs[i].opts_size =
> +                        sizeof(rbd_encryption_luks1_format_options_t);
> +
> +                luks_opts = g_new0(rbd_encryption_luks1_format_options_t, 1);
> +                specs[i].opts = luks_opts;
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKS_base(
> +                                &curr_encrypt->u.luks),
> +                        &luks_opts->passphrase,
> +                        &luks_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +                specs[i].opts_size =
> +                        sizeof(rbd_encryption_luks2_format_options_t);
> +
> +                luks2_opts = g_new0(rbd_encryption_luks2_format_options_t, 1);
> +                specs[i].opts = luks2_opts;
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKS2_base(
> +                                &curr_encrypt->u.luks2),
> +                        &luks2_opts->passphrase,
> +                        &luks2_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
> +                specs[i].opts_size =
> +                        sizeof(rbd_encryption_luks_format_options_t);
> +
> +                luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
> +                specs[i].opts = luks_any_opts;
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKSAny_base(
> +                                &curr_encrypt->u.luks_any),
> +                        &luks_any_opts->passphrase,
> +                        &luks_any_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +
> +            default: {
> +                r = -ENOTSUP;
> +                error_setg_errno(
> +                        errp, -r, "unknown image encryption format: %u",
> +                        curr_encrypt->format);
> +            }
> +        }
> +
> +        if (r < 0) {
> +            goto exit;
> +        }
> +
> +        curr_encrypt = curr_encrypt->parent;
> +    }
> +
> +    r = rbd_encryption_load2(image, specs, encrypt_count);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "layered encryption load fail");
> +        goto exit;
> +    }
> +
> +exit:
> +    for (i = 0; i < encrypt_count; ++i) {
> +        if (!specs[i].opts) {
> +            break;
> +        }
> +
> +        switch (specs[i].format) {
> +            case RBD_ENCRYPTION_FORMAT_LUKS1: {
> +                luks_opts = specs[i].opts;
> +                g_free((void*)luks_opts->passphrase);
> +                break;
> +            }
> +
> +            case RBD_ENCRYPTION_FORMAT_LUKS2: {
> +                luks2_opts = specs[i].opts;
> +                g_free((void*)luks2_opts->passphrase);
> +                break;
> +            }
> +
> +            case RBD_ENCRYPTION_FORMAT_LUKS: {
> +                luks_any_opts = specs[i].opts;
> +                g_free((void*)luks_any_opts->passphrase);
> +                break;
> +            }
> +        }
> +
> +        g_free(specs[i].opts);
> +    }
> +    g_free(specs);
> +    return r;
> +}
> +#endif
>  #endif
>  
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> @@ -1008,7 +1148,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>  
>      if (opts->has_encrypt) {
>  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> -        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        if (opts->encrypt->has_parent) {
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +            r = qemu_rbd_encryption_load2(s->image, opts->encrypt, errp);
> +#else
> +            r = -ENOTSUP;
> +            error_setg(errp, "RBD library does not support layered encryption");
> +#endif
> +        } else {
> +            r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        }
>          if (r < 0) {
>              goto failed_post_open;
>          }
> @@ -1299,6 +1448,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>          spec_info->u.rbd.data->encryption_format =
>                  RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2;
>          spec_info->u.rbd.data->has_encryption_format = true;
> +    } else if (memcmp(buf, rbd_layered_luks_header_verification,
> +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> +        spec_info->u.rbd.data->encryption_format =
> +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_LAYERED;
> +        spec_info->u.rbd.data->has_encryption_format = true;
> +    } else if (memcmp(buf, rbd_layered_luks2_header_verification,
> +               RBD_ENCRYPTION_LUKS_HEADER_VERIFICATION_LEN) == 0) {
> +        spec_info->u.rbd.data->encryption_format =
> +                RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2_LAYERED;
> +        spec_info->u.rbd.data->has_encryption_format = true;
>      } else {
>          spec_info->u.rbd.data->has_encryption_format = false;
>      }
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index d064847d85..68f8c7c203 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3759,10 +3759,14 @@
>  #
>  # luks-any: Used for opening either luks or luks2. (Since 8.0)
>  #
> +# luks-layered: Layered encryption. Only used for info. (Since 8.0)
> +#
> +# luks2-layered: Layered encryption. Only used for info. (Since 8.0)

I don't think we should be reporting this differently.

The layering is not a different encryption format. It is
a configuration convenience to avoid repeating the same
passphrase for a stack of images when opening an image.

In terms of encryption format it is still either using
'luks1' or 'luks2'.

If we want to report the fact that all parent images
use the same key, then we should introduce a new field
for that  in ImageInfoSpecificRbd eg perhaps

{ 'struct': 'ImageInfoSpecificRbd',
  'data': {
      '*encryption-format': 'RbdImageEncryptionFormat'
      '*encryption-layered': 'bool',
  } }


> +#
>  # Since: 6.1
>  ##
>  { 'enum': 'RbdImageEncryptionFormat',
> -  'data': [ 'luks', 'luks2', 'luks-any' ] }
> +  'data': [ 'luks', 'luks2', 'luks-any', 'luks-layered', 'luks2-layered' ] }
>  
>  ##
>  # @RbdEncryptionOptionsLUKSBase:
> @@ -3834,10 +3838,19 @@
>  ##
>  # @RbdEncryptionOptions:
>  #
> +# @format: Encryption format.
> +#
> +# @parent: Parent image encryption options (for cloned images).
> +#          Can be left unspecified if this cloned image is encrypted
> +#          using the same format and secret as its parent image (i.e.
> +#          not explicitly formatted) or if its parent image is not
> +#          encrypted. (Since 8.0)
> +#
>  # Since: 6.1
>  ##
>  { 'union': 'RbdEncryptionOptions',
> -  'base': { 'format': 'RbdImageEncryptionFormat' },
> +  'base': { 'format': 'RbdImageEncryptionFormat',
> +            '*parent': 'RbdEncryptionOptions' },
>    'discriminator': 'format',
>    'data': { 'luks': 'RbdEncryptionOptionsLUKS',
>              'luks2': 'RbdEncryptionOptionsLUKS2',
> -- 
> 2.25.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


