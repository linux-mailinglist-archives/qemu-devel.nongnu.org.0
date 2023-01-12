Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD7E66723B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:30:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwhs-0008S0-5U; Thu, 12 Jan 2023 07:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pFwhq-0008Rh-R1; Thu, 12 Jan 2023 07:29:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pFwhp-0000YU-1K; Thu, 12 Jan 2023 07:29:18 -0500
Received: by mail-ej1-x631.google.com with SMTP id u19so44302132ejm.8;
 Thu, 12 Jan 2023 04:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RBHeBZYcLpiZdVVWr2fsGENgntvUj3Fxoe2RSXAV2Zs=;
 b=htv+/gdxefwiCJNh1T9VMLuwWqYe5DRB23lBqlbjF2X1js5QtUHhCe3YCG4G6mwReT
 uNUPh5MbEclGKWuCmp0CYbj4xiwMadV631ufrRMkVICkRiCHKaYriow3SoCRTD5C+o7K
 ia2H8BH2zTmZ3e25QHLwUNEkW5JDdWpKpIij7mFnkKJlaegk1JYKTfCF6jxNQn/ALqJf
 Ver4DE16OY/1kwY32i/m36AnO3cGAXs63zFtXiSizW/EHLWTXnju2V6t6o49JSetivMk
 nbuh1eAXkmqfhyktXGa/7qp88m3HxwnaRTT42w4sBcCDB4CvdW52CVXKhd8+nULf7ot1
 S37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBHeBZYcLpiZdVVWr2fsGENgntvUj3Fxoe2RSXAV2Zs=;
 b=nNuKKlGzNSP69n+WXUX42hGp6JQUmfP/gKx1IxDak3JsNvTM+A/2rO1kP8NFnFN73Y
 Lalz2x+D9eU0iVoq38gKEq0DWlZnrtjELlTBi3uY8vxB/Hbe7hIvyd8PEU01NGRGySnY
 PcO3X8JK4z64n6Zsk+jdl5xsBI42j5qz4p3B2W+GrPImRvjGl8npkSBpEsPgQuh11Gk+
 HfryQudM/Dpz6Lsy4KRmKsIygSG3YPQKdlTOO4XhUnaJIS1F/g52HGy5rQh4eGhi06JK
 c6737Y8lTt/5tsbtbus2vW67j5gC5y2YqQQgqOfGt/A1tT290XL3ltk2xlPusnfUbd48
 H/Ug==
X-Gm-Message-State: AFqh2kov6+MVcN8xYg9DkMUQSXoleJEMqRBJOmEqNq0Mv+bfdIEQHqYz
 0Zi1r3RDvRPEgUeam7mDaUhGs+BjCz6IUsQOQXs=
X-Google-Smtp-Source: AMrXdXuEt9hE8mRYnNWqCFy3QFHNz5gvLq0923xmhtcXELrNoiH9OMDbVT44pv+OSCThq5RF+TIZaHRoFVkt1V+rUoI=
X-Received: by 2002:a17:906:708f:b0:7c4:e857:e0b8 with SMTP id
 b15-20020a170906708f00b007c4e857e0b8mr5510919ejk.603.1673526554626; Thu, 12
 Jan 2023 04:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20221120102836.3174090-1-oro@il.ibm.com>
 <20221120102836.3174090-4-oro@il.ibm.com>
In-Reply-To: <20221120102836.3174090-4-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 12 Jan 2023 13:29:02 +0100
Message-ID: <CAOi1vP_SxWbx=z_+iUS=P5Oisu4v4nVA-eeCAho25U1cV9OKRg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x631.google.com
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

On Sun, Nov 20, 2022 at 11:28 AM Or Ozeri <oro@il.ibm.com> wrote:
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

Hi Or,

Stick to the pointer alignment style used in this file:

    rbd_encryption_luks1_format_options_t *luks_opts;
    rbd_encryption_luks2_format_options_t *luks2_opts;
    rbd_encryption_luks_format_options_t *luks_any_opts;

> +
> +    /* count encryption options */
> +    for (curr_encrypt = encrypt; curr_encrypt->has_parent;

I think this needs to be rebased on top of 54fde4ff0621 ("qapi block:
Elide redundant has_FOO in generated C").  has_parent is probably not
a thing anymore.

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

I would move opts_size assignment here and avoid repeating the type (and
similar for LUKS2 and LUKS cases):

    specs[i].opts_size = sizeof(*luks_opts);

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

No need to leave a blank line between case statements.

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

Pointer alignment style:

    g_free((void *)luks_opts->passphrase);

> +                break;
> +            }
> +

No need to leave a blank line between case statements.

Thanks,

                Ilya

