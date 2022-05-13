Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145995267AE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:57:16 +0200 (CEST)
Received: from localhost ([::1]:50912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYbK-000839-U7
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1npYZf-0006GV-38
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:55:31 -0400
Received: from mail-yw1-f182.google.com ([209.85.128.182]:37545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1npYZa-0003sn-OG
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:55:29 -0400
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2f16645872fso96467137b3.4
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iX/YlBXRfXeVhuVM5iK5LuBjsFIvOae5anQjL7M32aE=;
 b=BCAQiCfsDLz4myIuaP5zpiTBYRX+mBJHacD8WTjGVvC0bWC0xQTlr6QmN+A3yctvuU
 49QMqFs/DJIxvMSvnwUZ7VAN2kQ8uGhindlokHPXSqRcZQhDSjfEz+17Qm5WpOxI+kJr
 h0qph9iIrX8GOY0DA1cuTIkNnif4FfY44RYdy8R6dgQPqhWThdEVrmmIyqELugUiLZMU
 pTPV/8m5jIDQ+kkRkCaCdyGWGJzb4Waxp8LcZXbqV5C7c1uqNW3/O/TQk941vSeyhVnK
 /3a19rmGesZdy4cdCg7eHVhsTR5OoG3lxcnfvRPs9V9qfeAY0f6lBvVV5hqD93Q9x/fx
 RHTA==
X-Gm-Message-State: AOAM533hrKqjjVETt//mCYMsQ83rTu8olof1QF+ucLP9Gf9p0mu7dUIa
 EdjNz1f+lgfuTAL7wmhVbgMHyOnZb8C5KJt3PeA=
X-Google-Smtp-Source: ABdhPJy1RQDkSg2Wg2RkwLgHIknzzppbl9cSgNL6KEb3D3G48fs2hIO1ZuMguRMSrphD4mq+m7NXx9DDwhD5vcD3ktc=
X-Received: by 2002:a81:8cb:0:b0:2f8:9f07:5a12 with SMTP id
 194-20020a8108cb000000b002f89f075a12mr6813157ywi.373.1652460923608; Fri, 13
 May 2022 09:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220513163827.26281-1-peter.maydell@linaro.org>
In-Reply-To: <20220513163827.26281-1-peter.maydell@linaro.org>
Date: Fri, 13 May 2022 18:55:12 +0200
Message-ID: <CAAdtpL6is6Q3nPcYfzN_vOdQvzq67jEA4dAmgDpptCxbgAyekg@mail.gmail.com>
Subject: Re: [PATCH] hw/tpm/tpm_tis_common.c: Assert that locty is in range
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.128.182;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yw1-f182.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Fri, May 13, 2022 at 6:43 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> In tpm_tis_mmio_read(), tpm_tis_mmio_write() and
> tpm_tis_dump_state(), we calculate a locality index with
> tpm_tis_locality_from_addr() and then use it as an index into the
> s->loc[] array.  In all these cases, the array index can't overflow
> because the MemoryRegion is sized to be TPM_TIS_NUM_LOCALITIES <<
> TPM_TIS_LOCALITY_SHIFT bytes.  However, Coverity can't see that, and
> it complains (CID 1487138, 1487180, 1487188, 1487198, 1487240).
>
> Add assertions that the calculated locality index is valid, which
> will help Coverity and also catch any potential future bug where
> the MemoryRegion isn't sized exactly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with 'make check' only...
>
>  hw/tpm/tpm_tis_common.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/tpm/tpm_tis_common.c b/hw/tpm/tpm_tis_common.c
> index e700d821816..81edae410c8 100644
> --- a/hw/tpm/tpm_tis_common.c
> +++ b/hw/tpm/tpm_tis_common.c
> @@ -295,6 +295,8 @@ static void tpm_tis_dump_state(TPMState *s, hwaddr ad=
dr)
>      uint8_t locty =3D tpm_tis_locality_from_addr(addr);
>      hwaddr base =3D addr & ~0xfff;
>
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>      printf("tpm_tis: active locality      : %d\n"
>             "tpm_tis: state of locality %d : %d\n"
>             "tpm_tis: register dump:\n",

This one was here ...:
https://lore.kernel.org/qemu-devel/20220330235723.68033-1-philippe.mathieu.=
daude@gmail.com/

> @@ -336,6 +338,8 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwadd=
r addr,
>      uint32_t avail;
>      uint8_t v;
>
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>      if (tpm_backend_had_startup_error(s->be_driver)) {
>          return 0;
>      }
> @@ -458,6 +462,8 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr a=
ddr,
>      uint16_t len;
>      uint32_t mask =3D (size =3D=3D 1) ? 0xff : ((size =3D=3D 2) ? 0xffff=
 : ~0);
>
> +    assert(TPM_TIS_IS_VALID_LOCTY(locty));
> +
>      trace_tpm_tis_mmio_write(size, addr, val);
>
>      if (locty =3D=3D 4) {

... but not these, so:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

