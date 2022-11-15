Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5E9629827
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuiu-0001FH-Qn; Tue, 15 Nov 2022 07:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouuiq-0001E7-P2; Tue, 15 Nov 2022 07:07:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouuio-0003EC-Gb; Tue, 15 Nov 2022 07:07:24 -0500
Received: by mail-ej1-x634.google.com with SMTP id n20so14913570ejh.0;
 Tue, 15 Nov 2022 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KSrkJJgM8QjzilhfUR9f5iTcc2/Ah25D9uOnFXdV/yM=;
 b=MFfSBrS1pcajavoXpxi9p2ecQgvEqZyDXWqv7ldKDnKVd52gKzDcycNamK6x6e3fNq
 VYOdtWdChmOBjYhwPVl+m0ySL1a+wzUcv1T/PvC5kR4gXgXmnO+u4OMdY7L0aqBw6Ejf
 KdxTGcKTGwgJjCiGU/xrATCM428NMac+oKQHiN6Pdx05ArJGah/gR02XH5zw3rT+ujSC
 ZLl7dHbD7TuRDuIRoZFcODDPEJtj90wMFHciNaRmWbeI4NdoxjLuRag4MIZoLO5vCcKm
 2pQlEfdncxf9LVTvQ7NhS6UEs2PpwIE3u4TD7sVrXOeBQ2RQcdXqigsAuqxdpDRytTIh
 KFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSrkJJgM8QjzilhfUR9f5iTcc2/Ah25D9uOnFXdV/yM=;
 b=AU7xKhHSnPIji4xoD9RBmO9/eDZqkr2aAlPGdsLJ/q0e6PQABXRK37s852gjZl3EkM
 NIpeTM9Sqtx5ZCwPccHU0yZMUn5hObkvSL171nQnLwaUDCYv2orAHC8sMm/MEpgV/fJK
 /OQIMLOgxplK+02358IAYq6DotQb/5ohhisE78XbKp4xMJnVFeYFNodT9uaunKKMvh6s
 yKJ9Mm7CQ19EgBCWbivzR7U1Bg2/n4sVEHzVUzZ8RoY26RF1u45iTo+ehKb4ltwQdtvY
 CcrgZKo9PSJkCgv6XzE9F4m/tceIQSNiEjbsACYWRnVnILrOT8ulyaWZuLm5Uhvi9dze
 zYUA==
X-Gm-Message-State: ANoB5pkys+ftYJHCHWe4PjRvI56m1NE3jxMabRmfhwJxeqPtN+8Nw4kg
 QW0ZHAdtjscxgJNTU9Fr8vEz5tU6/VJ2j/YaW9Y=
X-Google-Smtp-Source: AA0mqf44nsR0rvOhNuS1MoyAv+LkLl2ncZ9nEjwJnsOTx4rYxQEDXSqzShBb8P8UKvN0FnaBEQaIccLdjb5eES0QlR4=
X-Received: by 2002:a17:906:36d9:b0:78d:7f22:2c53 with SMTP id
 b25-20020a17090636d900b0078d7f222c53mr14027259ejc.420.1668514040455; Tue, 15
 Nov 2022 04:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20221113101727.2801739-1-oro@il.ibm.com>
In-Reply-To: <20221113101727.2801739-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 15 Nov 2022 13:07:08 +0100
Message-ID: <CAOi1vP_+7gDaBoLO6EdzUipGKwaGEuJZyLU+9eEEraq0bYCBkQ@mail.gmail.com>
Subject: Re: [PATCH v2] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Nov 13, 2022 at 11:17 AM Or Ozeri <oro@il.ibm.com> wrote:
>
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
> v2: nit fixes suggested by @idryomov
> ---
>  block/rbd.c          | 122 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  33 ++++++++++--
>  2 files changed, 151 insertions(+), 4 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index f826410f40..bde0326bfd 100644
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
>          default: {
>              r = -ENOTSUP;
>              error_setg_errno(
> @@ -522,6 +552,76 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
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
> +    char **passphrases;
> +
> +    /* count encryption options */
> +    for (curr_encrypt = encrypt; curr_encrypt->has_parent;
> +         curr_encrypt = curr_encrypt->parent) {
> +        ++encrypt_count;
> +    }
> +
> +    specs = g_new0(rbd_encryption_spec_t, encrypt_count);
> +    passphrases = g_new0(char*, encrypt_count);
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
> +                &passphrases[i], &luks_any_opts->passphrase_size,
> +                errp);
> +        if (r < 0) {
> +            goto exit;
> +        }
> +
> +        luks_any_opts->passphrase = passphrases[i];

I think qemu_rbd_convert_luks_options() is where the const is missing
(see my earlier reply).  If you make passphrase parameter const char**
there, passphrases array can just go away.

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
> +        luks_any_opts = (rbd_encryption_luks_format_options_t*)(specs[i].opts);

specs[i].opts is an opaque pointer, so this cast is redundant.
Actually, as it is, you could free specs[i].opts directly without
involving luks_any_opts variable at all but that would change once
passphrases array as ditched.

> +        g_free(luks_any_opts);
> +        g_free(passphrases[i]);
> +    }
> +    g_free(passphrases);
> +    g_free(specs);
> +    return r;
> +}
> +#endif
>  #endif
>
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> @@ -993,7 +1093,17 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>
>      if (opts->has_encrypt) {
>  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> -        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        if (opts->encrypt->has_parent) {
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +            r = qemu_rbd_encryption_load2(s->image, opts->encrypt, errp);
> +#else
> +            r = -ENOTSUP;
> +            error_setg(errp, "RBD library does not support"
> +                             " specifying parent encryption");

Nit: since the other error message is now "layered encryption load
fail", I would change this to "RBD library does not support layered
encryption".

> +#endif
> +        } else {
> +            r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        }
>          if (r < 0) {
>              goto failed_post_open;
>          }
> @@ -1284,6 +1394,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
> index 882b266532..c8f0ad56b8 100644
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
> @@ -3819,13 +3838,21 @@
>  ##
>  # @RbdEncryptionOptions:
>  #
> +# @format: Encryption format.
> +#
> +# @parent: Parent image encryption options (for cloned images).
> +#          Can be left unspecified if all ancestor images are encrypted
> +#          the same way as the child image or not encrypted.  (Since 7.2)

This still seems a bit misleading to me.  It's really about the next
parent image, not _all_ parent images.  Since there is only one parent
pointer and the rest is taken care of by recursion, we probably don't
need to attempt to talk about the entire chain and can instead focus on
the current cloned image.  How about the following:

# @parent: Parent image's encryption options (for cloned images).
#          Can be left unspecified if this cloned image is encrypted
#          using the same format and secret as its parent image (i.e.
#          not explicitly formatted) or if its parent image is not
#          encrypted. (Since 7.2)

Thanks,

                Ilya

