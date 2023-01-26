Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33E67D2E8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:19:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5sc-0000vY-B4; Thu, 26 Jan 2023 12:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL5sa-0000sB-Bl
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:17:40 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL5sY-0003RC-Os
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:17:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3665753wmn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 09:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2V+OS6gs+L60lgabUvyTrSW+cC5REikU6vPhrTnR+A=;
 b=G8nPgKEHJb1eQrwWFhA3pBPlj7BnhJ6oZYGH5wHM5n3uaYWieviCYgA7mqkoR9W1js
 YH6gh28QMYWtmN+BF+19m5rN8WMmSWbEED8lg9uZJw+GDS60si3fXZvKEQostHCgru9K
 emOQzd5dKG1W7SYNMUCwW5xMiGD/O3CQD2kEZU/4WQhduyae7u5XL0/eaRZSkSqOQ0D9
 iQXJirGN0ws8N3CJC+qVXCepuTuGmJraVlknVwRcbvg7PFmQxchW9dHXBozyPckepGXC
 kriLHxzl/0Nycoy8Sht69SDQcz3Vw2U+jAViDhWzCEaVok/rmBA3yM5ysWVVKLER5YIb
 ApZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z2V+OS6gs+L60lgabUvyTrSW+cC5REikU6vPhrTnR+A=;
 b=zp8kpZ3e3YjW9QYGCbOzuXEfaC02mR5gq0IZ+1ap7mlWtszwoF1zmptAuOoRG7mwWB
 0JQNvV6ntLP0saLHqfXDcpDwjuqdHC7DwaBxPtp5zmHxRIqJ8922D+EiInDxES+6IG0w
 gUPGfBl2aF9gHdYweypGzOTT31+EoQz/yafzdJ4PEBcK9vrL3zNTJ1CPJ/khoP+XpG4s
 6m6kUyUD3/tZpux9rrU1Bk0Hqh63T2v53mwwM4tC32HHDCf5cnynPvGhJRV+xLUfadPS
 Rv2BH//pHxK6HoOLCF0VL3Zzom9RJpN/JllmUqQV3XzJKhG2t5jrmRd6vwZuHlwZsO6m
 DzQw==
X-Gm-Message-State: AFqh2krFg7lYracxABUIqQOO2NXzi5u+ImPgYuUIBqDilz5o2zscnPUp
 t1BatHxK9y5DNFQaJbVEMtIheA==
X-Google-Smtp-Source: AMrXdXuIwRe/ZSuo1+AcK+/KiXc4bhVCfzMkEasDJXi5yTjRZJ4WUGNPbU3XBBI4oXvCLP/5VuPFCQ==
X-Received: by 2002:a05:600c:3ac8:b0:3da:f67c:aca6 with SMTP id
 d8-20020a05600c3ac800b003daf67caca6mr35744133wms.34.1674753457224; 
 Thu, 26 Jan 2023 09:17:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003db012d49b7sm11790527wmo.2.2023.01.26.09.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 09:17:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CBEF1FFB7;
 Thu, 26 Jan 2023 17:17:36 +0000 (GMT)
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Thu, 26 Jan 2023 17:12:36 +0000
In-reply-to: <20230126043824.54819-4-richard.henderson@linaro.org>
Message-ID: <878rhpp64v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> When allocating a temp to the stack frame, consider the
> base type and allocate all parts at once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index ffddda96ed..ff30f5e141 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3264,11 +3264,12 @@ static bool liveness_pass_2(TCGContext *s)
>=20=20
>  static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>  {
> -    int size =3D tcg_type_size(ts->type);
> -    int align;
>      intptr_t off;
> +    int size, align;
>=20=20
> -    switch (ts->type) {
> +    /* When allocating an object, look at the full type. */
> +    size =3D tcg_type_size(ts->base_type);
> +    switch (ts->base_type) {
>      case TCG_TYPE_I32:
>          align =3D 4;
>          break;
> @@ -3299,13 +3300,26 @@ static void temp_allocate_frame(TCGContext *s, TC=
GTemp *ts)
>          tcg_raise_tb_overflow(s);
>      }
>      s->current_frame_offset =3D off + size;
> -
> -    ts->mem_offset =3D off;
>  #if defined(__sparc__)
> -    ts->mem_offset +=3D TCG_TARGET_STACK_BIAS;
> +    off +=3D TCG_TARGET_STACK_BIAS;
>  #endif
> -    ts->mem_base =3D s->frame_temp;
> -    ts->mem_allocated =3D 1;
> +
> +    /* If the object was subdivided, assign memory to all the parts. */
> +    if (ts->base_type !=3D ts->type) {
> +        int part_size =3D tcg_type_size(ts->type);
> +        int part_count =3D size / part_size;
> +
> +        ts -=3D ts->temp_subindex;

This seems a bit magic to me. Are we saying we always know there are
TCGTemps "behind" ts because that is implied by temp_subindex?

I guess:

        for (i =3D 1; i < n; ++i) {
                TCGTemp *ts2 =3D tcg_temp_alloc(s);

in tcg_temp_new_internal() implies this?

Maybe a comment like "tcg_temp_new_internal() ensures all TCGTemps with
subindexes will be sequential to the first part in memory"?

> +        for (int i =3D 0; i < part_count; ++i) {
> +            ts[i].mem_offset =3D off + i * part_size;
> +            ts[i].mem_base =3D s->frame_temp;
> +            ts[i].mem_allocated =3D 1;
> +        }
> +    } else {
> +        ts->mem_offset =3D off;
> +        ts->mem_base =3D s->frame_temp;
> +        ts->mem_allocated =3D 1;
> +    }
>  }

It might be worth doing some documentation of the various parts of
TCGTemp to help follow this.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

