Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DD625ADA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 14:01:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTeq-0003ez-Ji; Fri, 11 Nov 2022 08:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1otTeV-0003dN-Kn; Fri, 11 Nov 2022 08:00:59 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1otTeQ-0006lZ-JX; Fri, 11 Nov 2022 08:00:59 -0500
Received: by mail-ej1-x632.google.com with SMTP id y14so12390238ejd.9;
 Fri, 11 Nov 2022 05:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iQyabMv5ZhmNGGRJ4DpjBVOL7kWK+zzA+rw8oR2wkxw=;
 b=KICCW9PDbgxZ0raNMmKrZurqTIzjUQ04DXNkcbctkBxy2jW/2YnftlUXCNYdUhJNjR
 EWdKXe95tnsuUpV2Hlhrap2wa9J61Q1CgUlgxuU7zwzTbDOW1BoJ0HyRnagKArtlFa2W
 9Vd+qNtSdfkSBuD6Rp+8uMTuz4RxBeD++SI41tXEWw8eTqCJN28eRZWLiElSYyLIvtmy
 LY15z4XaKz44sFFtKdZMzp9M7gdYJvjYciksPx31oRBP6gQ/XZDr0/oeVl/Aa0Jhuc83
 ORUq0GY0MbCynG3ZyUO2J6VM8rqrYiinsKrkrIy6vHYVMaKyVS72yrsbjE8dQiaSo5Of
 hqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQyabMv5ZhmNGGRJ4DpjBVOL7kWK+zzA+rw8oR2wkxw=;
 b=UYQ5Q61EeEnWX6vNlXZ0DTzGb+l70QHiAJfJow/38UlnU9Vgq7aywysNCXTAZ3GbpW
 jXsl+ljjUJlgUX7e26UOH+oOaUkmcYXGA54bGAt6BaBZblgxAdJ/TKQ2YY5Hc44Vxn58
 W/jtxO7XWrFLf7FbVIkBlKhy9U4L2BAvruCpbmSt5XqI+rR5hnFiBeW7hC/svsRMiGij
 I9xeMNVNZ/a853VL2ehhpn+9uD3EnnD1Uh5O4ac+CMkmqWZRXVpo4uc043Y+4ILkxvtX
 OAITigr3PJ8wAOK2n5wTtQCAfZAhnfJPT/9UcvOu+JpTpuKoJdH7oVUK9ljrpRrHuuP3
 jH5A==
X-Gm-Message-State: ANoB5plAWl2Z7K49YKMRt2J/Acq70wbS4/BC3Q/k8AJgRdfGSCztij0J
 pQDVzYwpQvVntnySMShRXdQtfdMhSaqS4Ka8uhblaZoLO88=
X-Google-Smtp-Source: AA0mqf5jf3v249Co5bmpW2RLWkSVNcMn94ze23w6Ebukh5298VSfvZ5iTRG64dfSnp/xpbaAHGsRI0msYgCv4jdzUKs=
X-Received: by 2002:a17:906:5fcd:b0:78d:4cb3:f65d with SMTP id
 k13-20020a1709065fcd00b0078d4cb3f65dmr1825451ejv.79.1668171651059; Fri, 11
 Nov 2022 05:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20221026084836.1819572-1-oro@il.ibm.com>
In-Reply-To: <20221026084836.1819572-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 11 Nov 2022 14:00:39 +0100
Message-ID: <CAOi1vP8X6xeuYmPwTS=LivU=XeCM-WDERrCOAySWJauvsOs_iA@mail.gmail.com>
Subject: Re: [PATCH v1] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x632.google.com
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

On Wed, Oct 26, 2022 at 10:48 AM Or Ozeri <oro@il.ibm.com> wrote:
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
>  block/rbd.c          | 134 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  33 ++++++++++-
>  2 files changed, 163 insertions(+), 4 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index f826410f40..09953687c9 100644
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
> +    rbd_encryption_luks_format_options_t luks_all_opts;
> +#endif
>      rbd_encryption_format_t format;
>      rbd_encryption_options_t opts;
>      size_t opts_size;
> @@ -505,6 +518,23 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
>              luks2_opts.passphrase_size = passphrase_len;
>              break;
>          }
> +#ifdef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2
> +        case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ALL: {
> +            memset(&luks_all_opts, 0, sizeof(luks_all_opts));
> +            format = RBD_ENCRYPTION_FORMAT_LUKS;
> +            opts = &luks_all_opts;
> +            opts_size = sizeof(luks_all_opts);
> +            r = qemu_rbd_convert_luks_options(
> +                    qapi_RbdEncryptionOptionsLUKSAll_base(&encrypt->u.luks_all),
> +                    &passphrase, &passphrase_len, errp);
> +            if (r < 0) {
> +                return r;
> +            }
> +            luks_all_opts.passphrase = passphrase;
> +            luks_all_opts.passphrase_size = passphrase_len;
> +            break;
> +        }
> +#endif
>          default: {
>              r = -ENOTSUP;
>              error_setg_errno(
> @@ -522,6 +552,87 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
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
> +    int encryption_options_count = 1;
> +    int spec_count = 0;
> +    int passphrase_count = 0;
> +    int i;
> +    RbdEncryptionOptions *curr_encrypt;
> +    rbd_encryption_spec_t *specs;
> +    rbd_encryption_spec_t *curr_spec;
> +    rbd_encryption_luks_format_options_t* luks_all_opts;
> +    char **passphrases;
> +    char **curr_passphrase;
> +
> +    /* count encryption options */
> +    for (curr_encrypt = encrypt; curr_encrypt->has_parent;
> +         curr_encrypt = curr_encrypt->parent, ++encryption_options_count) {

Hi Or,

I would move the increment into the body because empty body loops can
be confusing (and might also rename to encrypt_count to match "encrypt"
and "curr_encrypt" names).

> +    }
> +
> +    specs = g_new0(rbd_encryption_spec_t, encryption_options_count);
> +    passphrases = g_new0(char*, encryption_options_count);

I don't understand the need for this char* array.  Is there a problem
with putting the blob directly into luks_all_opts->passphrase just like
the size is put into luks_all_opts->passphrase_size?

> +
> +    curr_encrypt = encrypt;
> +    for (i = 0; i < encryption_options_count; ++i) {
> +        if (curr_encrypt->format != RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ALL) {

I don't think librbd imposes this restriction.  It's probably fine
to impose it here to make the implementation simpler but I wanted to
highlight that.

> +            r = -ENOTSUP;
> +            error_setg_errno(
> +                    errp, -r, "unknown image encryption format: %u",
> +                    curr_encrypt->format);
> +            goto exit;
> +        }
> +
> +        curr_spec = &specs[i];

curr_spec and curr_passphrase variables seem completely redundant to
me -- specs[i] is actually shorter to type than curr_spec ;)

> +        curr_passphrase = &passphrases[i];
> +        curr_spec->format = RBD_ENCRYPTION_FORMAT_LUKS;
> +        curr_spec->opts_size = sizeof(rbd_encryption_luks_format_options_t);
> +
> +        luks_all_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
> +        curr_spec->opts = luks_all_opts;
> +        ++spec_count;

What is the purpose of counting specs (and then also, separately,
passphrases)?  Wouldn't encryption_options_count suffice?

If the only reason is cleanup, it should be much more robust to just
blast through the entire specs array and call g_free unconditionally on
both pointers in all slots.

> +        memset(luks_all_opts, 0, sizeof(rbd_encryption_luks_format_options_t));

g_new0 already initializes to zero, so this memset appears to be
redundant.

> +
> +        r = qemu_rbd_convert_luks_options(
> +                qapi_RbdEncryptionOptionsLUKSAll_base(
> +                        &curr_encrypt->u.luks_all),
> +                curr_passphrase, &luks_all_opts->passphrase_size,
> +                errp);
> +        if (r < 0) {
> +            goto exit;
> +        }
> +
> +        ++passphrase_count;
> +        luks_all_opts->passphrase = *curr_passphrase;
> +
> +        curr_encrypt = curr_encrypt->parent;
> +    }
> +
> +    r = rbd_encryption_load2(image, specs, spec_count);
> +    if (r < 0) {
> +        error_setg_errno(errp, -r, "encryption load (2) fail");

Perhaps "layered encryption load fail"?

> +        goto exit;
> +    }
> +
> +exit:
> +    for (i = 0; i < spec_count; ++i) {
> +        luks_all_opts = (rbd_encryption_luks_format_options_t*)(specs[i].opts);
> +        if (passphrase_count > 0) {
> +            g_free(passphrases[i]);
> +            --passphrase_count;
> +        }
> +        g_free(luks_all_opts);
> +    }
> +    g_free(passphrases);
> +    g_free(specs);
> +    return r;
> +}
> +#endif
>  #endif
>
>  /* FIXME Deprecate and remove keypairs or make it available in QMP. */
> @@ -993,7 +1104,18 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>
>      if (opts->has_encrypt) {
>  #ifdef LIBRBD_SUPPORTS_ENCRYPTION
> -        r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        if (opts->encrypt->has_parent) {
> +#ifndef LIBRBD_SUPPORTS_ENCRYPTION_LOAD2

I would flip this to #ifdef to avoid mixing "not supported branch at
the top" and "not supported branch at the bottom" styles in the same
function.

> +            r = -ENOTSUP;
> +            error_setg(errp, "RBD library does not support"
> +                             " specifying parent encryption");
> +            goto failed_post_open;

This goto is redundant.

> +#else
> +            r = qemu_rbd_encryption_load2(s->image, opts->encrypt, errp);
> +#endif
> +        } else {
> +            r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
> +        }
>          if (r < 0) {
>              goto failed_post_open;
>          }
> @@ -1284,6 +1406,16 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
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
> index 882b266532..81ac58cd8a 100644
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
> +# luks-all: Used for opening either luks or luks2. (Since 7.2)
> +#
> +# luks-layered: Layered encryption. Only used for info. (Since 7.2)
> +#
> +# luks2-layered: Layered encryption. Only used for info. (Since 7.2)
> +#
>  # Since: 6.1
>  ##
>  { 'enum': 'RbdImageEncryptionFormat',
> -  'data': [ 'luks', 'luks2' ] }
> +  'data': [ 'luks', 'luks2', 'luks-all', 'luks-layered', 'luks2-layered' ] }

I would rename luks-all (and RbdEncryptionOptionsLUKSAll, etc) to luks-any.

>
>  ##
>  # @RbdEncryptionOptionsLUKSBase:
> @@ -3798,6 +3808,15 @@
>    'base': 'RbdEncryptionOptionsLUKSBase',
>    'data': { } }
>
> +##
> +# @RbdEncryptionOptionsLUKSAll:
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'RbdEncryptionOptionsLUKSAll',
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
> +#          the same way as the child image.  (Since 7.2)

I would also add "... or not encrypted" here.

Thanks,

                Ilya

