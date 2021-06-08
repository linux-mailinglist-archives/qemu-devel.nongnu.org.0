Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B160039FBFC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:08:59 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqeHi-0006xn-Ch
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeES-0004iU-6d
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:05:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqeEQ-0002NH-2k
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 12:05:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1849574wmq.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=n7oX8BlI6/38oqWf/y24e2nVSiOFKHWr3CTsmqQmNaE=;
 b=nudpyrdnZCwLIbRf0D+8iN0rO0eFPA9WcYIiT4ablBA5myc2mpQjWIuwcQ5piSNyXP
 RkUWy+DMzl5Vo1ZxGsG+q2LT/Vy14ct4KYByV3NH2K9zYpzyYxh3YeUCwswTDryG0of6
 I/ijEGqljzoMxfXslIa33ilM5DnlKbhgZfCdoZ807ANYO5xVYfBxMNt2a6106ehzY8y2
 dklCpoz6C9hh6f3xBUsoY6ZvZcrjSLomOIaLWOeEUf9HxNyWU/wSHrl1H8rYQt5pCnEZ
 a/iQNDBg8cnvF4KvnjwHPtunRdlfmc9WjPnOGTSTAj9yGlzwLqQodx3VkWJ9dL62rHIg
 CwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=n7oX8BlI6/38oqWf/y24e2nVSiOFKHWr3CTsmqQmNaE=;
 b=GZoW7ltx4MmPH6qO0ak2OKkGanyOF9IC6eM1R2ZQB36D6w+wvmPnjF4LBJhvqOMd/6
 /NAJpxWHE+Xb0a2aWIUXkgjCikuhEWDpSGLxLE7Z+nc6fUowC7j2QXYakmtlWOYBPshp
 1JcuTFzRMWpu7R8dJls6KVtGNKU/nTvYTQSc2e0AEDXJrsJeXwLLTKHzxdG1eGiWBa94
 J43ZZ9QC5lJ+0OX5Exg6STa0MsuP4aifriq4Ae61/euAAUuY7vo78fYK7jeNTfxbXOPm
 OyrDO/ez/XZWefKbE3Hpe1O8DF2Fna26ZmhjHPXIKcKW4mcLKxwhU5qsUFnwO4rb2KK0
 zvjg==
X-Gm-Message-State: AOAM532/lFumR0OtYoFhGUziUNjGFzwrn3578qqq6yHcTqw1CnDKJdCf
 KP1+rHJFEYDQIRaHybQOxsgflA==
X-Google-Smtp-Source: ABdhPJwD3DkMJv3lDN4afmL34TH1ujb6yKzlNZxGb2XxDV3m4m652fVLDkwkoSjft7bTVrLKiZjQRg==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr22906621wml.29.1623168332258; 
 Tue, 08 Jun 2021 09:05:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm21079015wrv.35.2021.06.08.09.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:05:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADCD41FF7E;
 Tue,  8 Jun 2021 17:05:29 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 16/28] tcg: Replace region.end with region.total_size
Date: Tue, 08 Jun 2021 17:03:20 +0100
In-reply-to: <20210502231844.1977630-17-richard.henderson@linaro.org>
Message-ID: <871r9cl4ty.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> A size is easier to work with than an end point,
> particularly during initial buffer allocation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/tcg/region.c b/tcg/region.c
> index 9a1e039824..a17f342f38 100644
> --- a/tcg/region.c
> +++ b/tcg/region.c
> @@ -48,7 +48,7 @@ struct tcg_region_state {
>      /* fields set at init time */
>      void *start;
>      void *start_aligned;
> -    void *end;
> +    size_t total_size; /* size of entire buffer */
>      size_t n;
>      size_t size; /* size of one region */
>      size_t stride; /* .size + guard size */

I'd shuffle that to the end so it scans size < stride < total_size. I
see we have special handling bellow:

> @@ -279,7 +279,7 @@ static void tcg_region_bounds(size_t curr_region, voi=
d **pstart, void **pend)
>          start =3D region.start;
>      }
>      if (curr_region =3D=3D region.n - 1) {
> -        end =3D region.end;
> +        end =3D region.start_aligned + region.total_size;

So why isn't this end =3D start_aligned + (n * stride)? do we not line up
for the last region?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

