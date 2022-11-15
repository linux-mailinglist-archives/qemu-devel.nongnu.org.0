Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA662A078
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 18:36:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouzpr-0003g9-9u; Tue, 15 Nov 2022 12:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouzpo-0003fw-0H; Tue, 15 Nov 2022 12:34:56 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ouzpm-0002sw-7D; Tue, 15 Nov 2022 12:34:55 -0500
Received: by mail-ed1-x52a.google.com with SMTP id s12so22894201edd.5;
 Tue, 15 Nov 2022 09:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=piJ+BIEoN62h1AWglLPWSOxNhM1gtJBl7aTpRt//xQI=;
 b=B/KTpL5ylmbLTaXdPt/4PDOyMvSp1Js5LGZzZI3SdAzPOxNNB5v2PFANKafiygv4J/
 3I/27zH4xeI4wpnnCk1cMO0mpPsdaj5vw8pLdXqPKie7MW5EPszH3P3tfzzkIzisPGmR
 Pp3v3Q6bKZqvt50xMnL9xZU1m4h8hYYrdvABlpmnI7tD7gFWI8Q9pzaQCbCF+k7Jp5xT
 RqowaYWQvHaxBNSQpEoF46q2cxC+TPIx2ST0WZWWdqTEQe0VtREWbS/K9tkJXmcqMqbY
 dDycvMR5KhWYUn02/t2MM4yJSqX6XjSDYKOdZW9QTrh9J9vB0vIwbXHCGyzwU7+aXzFm
 aV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=piJ+BIEoN62h1AWglLPWSOxNhM1gtJBl7aTpRt//xQI=;
 b=dcrPRrT8pJlO0nEuCmCE1V7DbmiIjo16MLeh3FXxVcPr0/xNIIHrbRzOrJA9m73Y+d
 L/EGs9/15c4Jcpu2gRn1aR7UPFw9LyikPxpiAjag/ct8McuWQn3TZtCuZdbDpcpyaeBN
 nyx5ngOV8ZFyXjQS1zge6JsYO8hCsLyIvkZJBxJwsEGpTL04jWrW10Dl85/enFWXe3gt
 UekXLGBQ05IkvupNyqqdglMhDu3nNVEUEVrSjbUnnoUlzzzwQxpf+5GjJ2mMww839mx4
 nWdPYe5K70byh7nbDi8hDWpdkI075CYkIEcXTK7Kxr8wPOKvWT3HY703sKycnasivFu6
 sHUA==
X-Gm-Message-State: ANoB5pn4Q6qkBNM+z1hGXu16PSBkRJQbeLMQ5gkRvvuvJKc6zSMDyNX+
 cCX2JajdAtSmIHBqd5ZFtbTVXTEmC5XVInR8fhw=
X-Google-Smtp-Source: AA0mqf68r5FOBQRBqdi0EA3IgdpUWmCS7yKXsX+rbb/NpOIhTe1TcMoH0ZMct/gcDJLPnXsgEaN6tLf0aIwRB1G91ZQ=
X-Received: by 2002:a05:6402:5a:b0:45a:1bfa:98bf with SMTP id
 f26-20020a056402005a00b0045a1bfa98bfmr16051826edu.413.1668533691954; Tue, 15
 Nov 2022 09:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20221115122527.2896476-1-oro@il.ibm.com>
In-Reply-To: <20221115122527.2896476-1-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 15 Nov 2022 18:34:40 +0100
Message-ID: <CAOi1vP-k4rvd659e4sTmKw1BCNZzmBVPQw7z0_f66ov8vDTraQ@mail.gmail.com>
Subject: Re: [PATCH v3] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, dannyh@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x52a.google.com
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

On Tue, Nov 15, 2022 at 1:25 PM Or Ozeri <oro@il.ibm.com> wrote:
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

Nit: I would change qemu_rbd_convert_luks_options() to take
const char **passphrase and eliminate this cast.  It's a trivial
fixup so it can be folded into this patch with no explanation.

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

Nit: when resorting to a cast, cast to the actual expected type.
In case of free(), that's void *.

free() should have been specified to take const void * but that
ship has sailed.  Too bad GLib didn't fix this for g_free()...

Thanks,

                Ilya

