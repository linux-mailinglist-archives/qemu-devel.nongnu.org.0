Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B396062A0B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov02I-0002zf-LB; Tue, 15 Nov 2022 12:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ov01l-0002uo-4b
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:47:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ov01Z-0004rV-Fy
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 12:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668534424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=1cF19ObaaVLvMhmRpjRjYt/I2iC+6I44V7t7iDoH9WY=;
 b=XHpYgMoOqjHWIhp0yqRX/BQWMHvMrNXIs3E5g26pWoHuA45ooPNvPv+1XgdcKLCbAOHnEc
 gjyXv3ejIBFKANcDEOzUuBwBCgTUQ5ihpfD/oVyWAAUGrzcHmtcUJD/sjBUlhiWnPz641t
 SEIRbMPPqQBbP6IB1vZOZUJd1i7ehuY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-J0yh4DnRPnGoEmmGr3Fw2A-1; Tue, 15 Nov 2022 12:47:01 -0500
X-MC-Unique: J0yh4DnRPnGoEmmGr3Fw2A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0699B811E7A;
 Tue, 15 Nov 2022 17:47:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDC3492B1C;
 Tue, 15 Nov 2022 17:46:59 +0000 (UTC)
Date: Tue, 15 Nov 2022 17:46:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com,
 idryomov@gmail.com
Subject: Re: [PATCH v3] block/rbd: Add support for layered encryption
Message-ID: <Y3PQj/MBztn8SobQ@redhat.com>
References: <20221115122527.2896476-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221115122527.2896476-1-oro@il.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Nov 15, 2022 at 06:25:27AM -0600, Or Ozeri wrote:
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
> v3: further nit fixes suggested by @idryomov
> v2: nit fixes suggested by @idryomov
> ---
>  block/rbd.c          | 119 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  35 +++++++++++--
>  2 files changed, 150 insertions(+), 4 deletions(-)
> 
> diff --git a/block/rbd.c b/block/rbd.c
> index f826410f40..ce017c29b5 100644
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
> @@ -470,6 +480,9 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>      size_t passphrase_len;
>      rbd_encryption_luks1_format_options_t luks_opts;
>      rbd_encryption_luks2_format_options_t luks2_opts;
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +    rbd_encryption_luks_format_options_t luks_any_opts;
> +#endif
>      rbd_encryption_format_t format;
>      rbd_encryption_options_t opts;
>      size_t opts_size;
> @@ -505,6 +518,23 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>              luks2_opts.passphrase_size = passphrase_len;
>              break;
>          }
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
> +            memset(&luks_any_opts, 0, sizeof(luks_any_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS;
> +            opts = &luks_any_opts;
> +            opts_size = sizeof(luks_any_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKSAny_base(&encrypt->u.luks_any),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_any_opts.passphrase = passphrase;
> +            luks_any_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +#endif

This looks unrelated to support of multiple layers, unless I'm missing
something.

>          default: {
>              r = -ENOTSUP;
>              error_setg_errno(
> @@ -522,6 +552,74 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
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
> +        if (curr_encrypt->format != RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY) {
> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    curr_encrypt->format);
> +            goto exit;
> +        }
> +
> +        specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
> +        specs[i].opts_size = sizeof(rbd_encryption_luks_format_options_t);
> +
> +        luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
> +        specs[i].opts = luks_any_opts;
> +
> +        r = qemu_rbd_convert_luks_options(
> +                qapi_RbdEncryptionOptionsLUKSAny_base(
> +                        &curr_encrypt->u.luks_any),
> +                (char**)&luks_any_opts->passphrase,
> +                &luks_any_opts->passphrase_size,
> +                errp);
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
> +        luks_any_opts = specs[i].opts;
> +        if (luks_any_opts) {
> +            g_free((char*)luks_any_opts->passphrase);
> +            g_free(luks_any_opts);
> +        }
> +    }
> +    g_free(specs);
> +    return r;
> +}
> +#endif
>  #endif
>  
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> @@ -993,7 +1091,16 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
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
> @@ -1284,6 +1391,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
> index 882b266532..15715d990e 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3753,10 +3753,20 @@
>  ##
>  # @RbdImageEncryptionFormat:
>  #
> +# luks
> +#
> +# luks2
> +#
> +# luks-any: Used for opening either luks or luks2. (Since 7.2)
> +#
> +# luks-layered: Layered encryption. Only used for info. (Since 7.2)
> +#
> +# luks2-layered: Layered encryption. Only used for info. (Since 7.2)

I don't think these additions really make sense given what you've
described. The image is still using 'luks' or 'luks2' format for
the encryption. All that's changed is that you give distinct
passphrases for each layer. IOW this isn't a different encryption
format, just a more flexible configuration

> +#
>  # Since: 6.1
>  ##
>  { 'enum': 'RbdImageEncryptionFormat',
> -  'data': [ 'luks', 'luks2' ] }
> +  'data': [ 'luks', 'luks2', 'luks-any', 'luks-layered', 'luks2-layered' ] }
>  
>  ##
>  # @RbdEncryptionOptionsLUKSBase:
> @@ -3798,6 +3808,15 @@
>    'base': 'RbdEncryptionOptionsLUKSBase',
>    'data': { } }
>  
> +##
> +# @RbdEncryptionOptionsLUKSAny:
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKSAny',
> +  'base': 'RbdEncryptionOptionsLUKSBase',
> +  'data': { } }
> +
>  ##
>  # @RbdEncryptionCreateOptionsLUKS:
>  #
> @@ -3819,13 +3838,23 @@
>  ##
>  # @RbdEncryptionOptions:
>  #
> +# @format: Encryption format.
> +#
> +# @parent: Parent image encryption options (for cloned images).
> +#          Can be left unspecified if this cloned image is encrypted
> +#          using the same format and secret as its parent image (i.e.
> +#          not explicitly formatted) or if its parent image is not
> +#          encrypted. (Since 7.2)
> +#
>  # Since: 6.1
>  ##
>  { 'union': 'RbdEncryptionOptions',
> -  'base': { 'format': 'RbdImageEncryptionFormat' },
> +  'base': { 'format': 'RbdImageEncryptionFormat',
> +            '*parent': 'RbdEncryptionOptions' },
>    'discriminator': 'format',
>    'data': { 'luks': 'RbdEncryptionOptionsLUKS',
> -            'luks2': 'RbdEncryptionOptionsLUKS2' } }
> +            'luks2': 'RbdEncryptionOptionsLUKS2',
> +            'luks-any': 'RbdEncryptionOptionsLUKSAny'} }

AFAICT, supporting layered encryption shouldn't require anything other
than the 'parent' addition.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


