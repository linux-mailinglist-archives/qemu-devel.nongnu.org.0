Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA66C43500D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 18:21:34 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdELO-0003Qs-2F
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 12:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEJa-0002ie-2H
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:19:42 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdEJY-0000l3-KE
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 12:19:41 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso3090879wmc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BHlr3EoM6i9Xn63ERrAlEQa11j4reSKGQJSYcgJp4gY=;
 b=PrHxqfDHezIzDYBMzKziuRF39IwMbOLVmQS5ioWjaPwOPSSi8j0RlKUpNEXQ9DAOAk
 0I/s7csTIrVUTHC1NSfog3DlhZnSewQPqySwG2XcH9ASxeHQHxNPSs3ilGvta5h/QX3q
 gb1ry8abSUg48SvbPn/ZvqItlrS6hHeFzX0faQuj4sXD9mlXzt9fL0SrlKb8xBciN+RY
 m0LBOcSc6BmjlaUsLsdKpxh9VtSI3GcjLpFTSoRw9+1v2CwW6klNiZ3fdykFEfI5GDRG
 F+w4wMrRw34G/Zz39wgCdST6th6woMOQOiqZYzytkun+pOFIDKK8kA0HwgFi0+wAUXZC
 4xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BHlr3EoM6i9Xn63ERrAlEQa11j4reSKGQJSYcgJp4gY=;
 b=eG6gnirwMJJMeEVFJS46pVxWEvd9jzYKb1ZJmilKOJKhSHzmfRE3n1AFIPMJifu4RG
 hdLhDD/cVs3O2kDi3Ryv9G1fCFE0NANkBVLRQ1gGJ2q+/aOLA5lGDRjH2S8ZGLbGpM6M
 r02aEcf2ZaXLUKIkvuTNMhUkY2SVOunCmgLZAHOhuvStyElcS3afO9Ri8PsPLVKUFqIx
 WD3TAdBO/tmBqj7XfdsnPD7oXb4vwhMi5/RLV4FeIzaB+4GGTH9PDUFJ7J3VNHqvI6bs
 TWWq5YBQMNad5fjawTKHlTyAlmdh6mKZU82jVGFaMlyffHjSq5EEbCrxii8gpmN3H6HI
 2Grw==
X-Gm-Message-State: AOAM531k5P9zo+/FMS/tib7zCSsS4NhIdPMyRNm++bK0aAYsFFfhdL6a
 Cawoa4+qS1EkgHZDrSir7pAt6A==
X-Google-Smtp-Source: ABdhPJw+0vDJJyzxgPwpavJ88GBfO1/qeAv6WbNAD7h/g84MJEE33qOkTrvJzhZaF43KqE6SxnDN+Q==
X-Received: by 2002:a05:600c:2904:: with SMTP id i4mr215626wmd.9.1634746778952; 
 Wed, 20 Oct 2021 09:19:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm2476049wrp.13.2021.10.20.09.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 09:19:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5B4C1FF96;
 Wed, 20 Oct 2021 17:19:37 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-10-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Wed, 20 Oct 2021 17:17:47 +0100
In-reply-to: <20211007195456.1168070-10-richard.henderson@linaro.org>
Message-ID: <87h7dbvfc6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Rather than try to keep these up-to-date across folding,
> re-read nb_oargs at the end, after re-reading the opcode.
>
> A couple of asserts need dropping, but that will take care
> of itself as we split the function further.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 74b9aa025a..77cdffaaef 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
<snip>
>=20=20
> @@ -1579,6 +1572,7 @@ void tcg_optimize(TCGContext *s)
>          if (def->flags & TCG_OPF_BB_END) {
>              memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
>          } else {
> +            int nb_oargs =3D def->nb_oargs;
>              for (i =3D 0; i < nb_oargs; i++) {

nit: couldn't you just do for (i =3D 0; i < deb->nb_oargs; i++) or is that
too much for the compiler to wrap it's head around?

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

