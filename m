Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E2667E047
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 10:32:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLL5x-0004Yy-JQ; Fri, 27 Jan 2023 04:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pLL5S-0004Vy-LM; Fri, 27 Jan 2023 04:32:02 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pLL5K-00078n-K8; Fri, 27 Jan 2023 04:31:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ss4so12004251ejb.11;
 Fri, 27 Jan 2023 01:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hJ/Z57ZqirhrIr7/UItf3ZvcDsPjY/53TCKzPEzGDtE=;
 b=p1P/x7NVKlI9a7UjIC0jKFBhn8ezSEggGvUTGa41e6D4lUXitD00mEMSvhRYEm9bL9
 /i4Q7H/BKFrGCyTCq8VN8/rsgbJuFOAaOTsYLGHyoINbfLVX7q2avMojNU+OgeWv3Qk0
 ipOB95j1yf6+E6PA/tfeOHyYgQSIpVcFa1oqg/wtdMbNcM6B7QHW4T3F37geCEP/XaiD
 ATYvODgkuQp+kV3Ik4L4SR7oNjuYOhVYC+MtdVNe/ks085FTbJ81knpHIHGRoVkaROkK
 VSrHAajN/Mh/4VtBkJNe+R302V0AFezqKtnoTHVe/+tvom0IFyN1qtrglAmEVe0WBp4U
 iwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hJ/Z57ZqirhrIr7/UItf3ZvcDsPjY/53TCKzPEzGDtE=;
 b=CgE0RFFeBfnbxy11EWct8tD3zAY2JSr7qy4ppghApIFP+MhJhwRn5iW4wW7LgsNWiW
 63VqvD648DU0ozXUa4MCALp11mf09OZf+R0Cp3DfIOqwMb3WMHDRulKgc2vHbzBcfe9U
 AvdTijoG4VO8aprGug8Hbqi+E5KtbrAvCX2Yzzi1naDSA0CINTTx9eiGSC6TAoKB9T6J
 BRik6Cn+iAEr4JyQEBPNFnE8mOhjJtgYWUzEasHu8gFC5qJ/Dol0X7oDsK6O5KosuPHI
 rxAikMC/E851POIZODZpcxSuyDFcvOV9o4tyt5A2lll9QpRi0mnQOKubD0EUTYhF/+Mf
 Kb3g==
X-Gm-Message-State: AFqh2kqdRiM3XReWx2GlAdHN7ihkf3NSfZySUDQ0G8R8daaI87o32an2
 szojGoQVTcpNNbmJ67d1NDPbvp48HA8rm5UvoiU=
X-Google-Smtp-Source: AMrXdXtqVXZZkcZieB6JoU5M0E2JoBoaRWUyYy4eeqEY4QnMzYTE3dO5Z0O6w3wc2kHeBgI+L73ch/XG9ZRMAJ09EXs=
X-Received: by 2002:a17:906:8417:b0:866:d223:34bf with SMTP id
 n23-20020a170906841700b00866d22334bfmr5963644ejx.108.1674811904481; Fri, 27
 Jan 2023 01:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20230115123932.2564966-1-oro@il.ibm.com>
 <20230115123932.2564966-4-oro@il.ibm.com>
In-Reply-To: <20230115123932.2564966-4-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 27 Jan 2023 10:31:32 +0100
Message-ID: <CAOi1vP__6HZOLTK+sxarGPzTb3CauCODfR4_AD66waJ6D1LUuQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] block/rbd: Add support for layered encryption
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62c.google.com
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

On Sun, Jan 15, 2023 at 1:40 PM Or Ozeri <oro@il.ibm.com> wrote:
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
>  block/rbd.c          | 154 ++++++++++++++++++++++++++++++++++++++++++-
>  qapi/block-core.json |  11 +++-
>  2 files changed, 163 insertions(+), 2 deletions(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index b929378871..c8418a8057 100644
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
> @@ -537,6 +547,129 @@ static int qemu_rbd_encryption_load(rbd_image_t image,
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
> +    rbd_encryption_luks1_format_options_t *luks_opts;
> +    rbd_encryption_luks2_format_options_t *luks2_opts;
> +    rbd_encryption_luks_format_options_t *luks_any_opts;
> +
> +    /* count encryption options */
> +    for (curr_encrypt = encrypt; curr_encrypt->parent;
> +         curr_encrypt = curr_encrypt->parent) {
> +        ++encrypt_count;
> +    }

This seems a bit weird because it doesn't follow the usual counting
pattern.  I had to stop and re-read it to make sure there is nothing
funny going on.  I'd make it:

    for (curr_encrypt = encrypt->parent; curr_encrypt;
         curr_encrypt = curr_encrypt->parent) {

> +
> +    specs = g_new0(rbd_encryption_spec_t, encrypt_count);
> +
> +    curr_encrypt = encrypt;
> +    for (i = 0; i < encrypt_count; ++i) {
> +        switch (curr_encrypt->format) {
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS1;
> +
> +                luks_opts = g_new0(rbd_encryption_luks1_format_options_t, 1);
> +                specs[i].opts = luks_opts;
> +                specs[i].opts_size = sizeof(*luks_opts);
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKS_base(
> +                                &curr_encrypt->u.luks),
> +                        (char **)&luks_opts->passphrase,
> +                        &luks_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS2: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS2;
> +
> +                luks2_opts = g_new0(rbd_encryption_luks2_format_options_t, 1);
> +                specs[i].opts = luks2_opts;
> +                specs[i].opts_size = sizeof(*luks2_opts);
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKS2_base(
> +                                &curr_encrypt->u.luks2),
> +                        (char **)&luks2_opts->passphrase,
> +                        &luks2_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +            case RBD_IMAGE_ENCRYPTION_FORMAT_LUKS_ANY: {
> +                specs[i].format = RBD_ENCRYPTION_FORMAT_LUKS;
> +
> +                luks_any_opts = g_new0(rbd_encryption_luks_format_options_t, 1);
> +                specs[i].opts = luks_any_opts;
> +                specs[i].opts_size = sizeof(*luks_any_opts);
> +
> +                r = qemu_rbd_convert_luks_options(
> +                        qapi_RbdEncryptionOptionsLUKSAny_base(
> +                                &curr_encrypt->u.luks_any),
> +                        (char **)&luks_any_opts->passphrase,
> +                        &luks_any_opts->passphrase_size,
> +                        errp);
> +                break;
> +            }
> +

The blank line before the default case is still there.

Thanks,

                Ilya

