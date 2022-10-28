Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19A7610CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:14:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLR7-0000E3-5M; Fri, 28 Oct 2022 05:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ooLR4-0000DR-Pn
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:13:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ooLR3-0006GC-9R
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:13:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id n14so2706234wmq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PI+5ACwMf1ps12cJfS4GQB7qffaDmFinQ2vmj9nFcRo=;
 b=yTaQ0x58NvAdzX62Fqc1jkomT4zFD6//PErs9CpTUisp5zL0h47jhm7UqwEyfqPZcR
 N9NiJWPO7bberiQt8g3A0ssO7/8SG0oHwi/LXi/efuKXqil4xuD/LFBMFXL3IiA4XA9g
 oKkoycMHR4cEyVd++OVlPURlTV3EBCU026QB1G3gLXBLtf77O/i08VzBNFQnwYbNoMdm
 //iliI/xmRArfVfctgU6znKN29leNe2eubKOKWg25/UarYFR6gbkB6/OrFdhOXoqUjA8
 9/hc6eWPdTUM2+1OP5ibVVbDC/F0tI+xbiUYRSIJ1oIWJKoWVtmiQ85xZgggudHjLfvs
 eD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PI+5ACwMf1ps12cJfS4GQB7qffaDmFinQ2vmj9nFcRo=;
 b=z0k25KpNBA5P3QGDDOVn75CcRdBs7HLenSwDQ7imfFf2TJDyuFVL+IvxcezQ1fx8D6
 d77PpU4Yiog6UTjKQ7X9m0zdqSctAwjp9ImUAwiy9A/2FHBhOon+rRfXllbXVw127LGA
 E5A1MAhZTVQyVcjOiDVrCVwYxOdEBtZaUJtxPNK5z/aSfceoThN+6MdUb50Atk0mbonY
 1h+Ru0V/z2I92RzpPxOWfKI6VB7z2gNstO/cLN+JUMwFfRQ9h5cj4f7nz3270l4CEU1X
 ZkMPKdRoozkaxttN61b3bqVAOLhOAoDv/TFxpejnuNFmJLJdPx9TSwnjnjpcI9lK/qJp
 hKVg==
X-Gm-Message-State: ACrzQf0DUKbPDNLQyKQdLiFxIGxsJqfheiHaZcTkqW/UDQ72wid02yEP
 by9Y2eNgHdKuc211nos/rziKnrseRQ3tCQ==
X-Google-Smtp-Source: AMsMyM4fNBKRzhe5BYFzkD7FX6zirio98X8JNmhAnxEdy2QJfpCp0KnaTAYH1/hbVZdBK+KuHk1yKw==
X-Received: by 2002:a05:600c:5127:b0:3c6:47ff:5d33 with SMTP id
 o39-20020a05600c512700b003c647ff5d33mr9092912wms.68.1666948431619; 
 Fri, 28 Oct 2022 02:13:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c468a00b003c452678025sm7429955wmo.4.2022.10.28.02.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 02:13:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A06521FFB7;
 Fri, 28 Oct 2022 10:13:50 +0100 (BST)
References: <20221028072145.1593205-1-uwu@icenowy.me>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg/tci: fix logic error when registering helpers via FFI
Date: Fri, 28 Oct 2022 10:13:21 +0100
In-reply-to: <20221028072145.1593205-1-uwu@icenowy.me>
Message-ID: <87tu3oz4xd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Icenowy Zheng <uwu@icenowy.me> writes:

> When registering helpers via FFI for TCI, the inner loop that iterates
> parameters of the helper reuses (and thus pollutes) the same variable
> used by the outer loop that iterates all helpers, thus made some helpers
> unregistered.
>
> Fix this logic error by using a dedicated temporary variable for the
> inner loop.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  tcg/tcg.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 612a12f58f..adfaf61a32 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -619,6 +619,7 @@ static void tcg_context_init(unsigned max_cpus)
>          gpointer hash =3D (gpointer)(uintptr_t)typemask;
>          ffi_status status;
>          int nargs;
> +        int j;

You could tuck this variable definition...


>=20=20
>          if (g_hash_table_lookup(ffi_table, hash)) {
>              continue;
> @@ -634,9 +635,9 @@ static void tcg_context_init(unsigned max_cpus)
>=20=20
>          if (nargs !=3D 0) {

here to keep things more local.

>              ca->cif.arg_types =3D ca->args;
> -            for (i =3D 0; i < nargs; ++i) {
> -                int typecode =3D extract32(typemask, (i + 1) * 3, 3);
> -                ca->args[i] =3D typecode_to_ffi[typecode];
> +            for (j =3D 0; j < nargs; ++j) {
> +                int typecode =3D extract32(typemask, (j + 1) * 3, 3);
> +                ca->args[j] =3D typecode_to_ffi[typecode];
>              }
>          }

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

