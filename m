Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE46475BDD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:33:08 +0100 (CET)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWHC-0001Dp-OF
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVBZ-0007CB-S7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:23:13 -0500
Received: from [2a00:1450:4864:20::42a] (port=45629
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxVBX-0001qK-Rm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:23:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o13so38437259wrs.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CvrooWElS6xvcOsJOHqfyqNtUyk/5R9z4LUy8GugdFU=;
 b=SMGjhH1R/tgAeeRUrNAIp4IcVeyGg9uGXTXhQWxK8Da02QylMLX8OXKCNxqO4pJNnz
 ufiNIYPsfYQAnM8xg+cKG5R8BCQMwQyPFnf+aSFX0gRzITQCUMbqOb0JlJSt99880K0D
 TNUQ3R6VaKW0kIIiZfpERZ9vcvN/WE1Gtqi/eE52LUduBFoPP/NMEetsLClY4abD+ttk
 AKMrIHXzBNEj9HxWEIPCnVmp+R+3gRXFNNPagKW5LzXa6uuexcN+fC5vDbgIqVD6E6ox
 Ds2sqErJVleTj6Ls060TbtFFVTTvNgYFPH18ZUV7VUT33+m1y7qtUzb/5FPzHgWzkH45
 FZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CvrooWElS6xvcOsJOHqfyqNtUyk/5R9z4LUy8GugdFU=;
 b=y3FTjl+AKebM904f6mcK64uWRpJanOLBn4Wd4oIJO0XZX1kYPIwvzBFJkrUXzT5LfS
 0Itrmx0xejzwZTkSAIJlh4V4v1e7SUBg2BGpJOWp1usLo7LAz7nZiqi+prIf+JIH1kR+
 0tusxq4neG+EDKJRHER1RcMalsZ4NPFUVKioLUHin6sn2Szvbdx+GuAVuRAtkQGfBRnk
 K8BzfUbpemjm1iEBg4Eyy2tRK7PYcw91pgoS9oEKBQLyXT/0LyDsJ7dS72FLKhlrgcpb
 H/pTvakuYH93wDY2Rdpy5VuuOtyFP9fKiMaHpNp2fGlYnEKyOdWm9Wdo/L5RKxnwPT+y
 b/uA==
X-Gm-Message-State: AOAM531qt8lY7G9F1kVzMDLgiy1ihmAdak+Sct/trRZKQnbh/p5Qtm6i
 o0b6s2Be2oU9npiMfvh3t/yfaw==
X-Google-Smtp-Source: ABdhPJztAgCIRN6xAptu2V5nppOxCEOywqGlwlZKo5Q24rm5rV2luTCGaS0D4NoQdLRggerselCYdw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4514825wrq.120.1639578190154; 
 Wed, 15 Dec 2021 06:23:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm2422024wrx.117.2021.12.15.06.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 06:23:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86CA61FF96;
 Wed, 15 Dec 2021 14:23:08 +0000 (GMT)
References: <20211118145716.4116731-1-philmd@redhat.com>
 <20211118145716.4116731-2-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2? v2 1/5] docs/devel/style: Render C types as
 monospaced text
Date: Wed, 15 Dec 2021 14:20:54 +0000
In-reply-to: <20211118145716.4116731-2-philmd@redhat.com>
Message-ID: <874k7agd6b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  docs/devel/style.rst | 59 ++++++++++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 29 deletions(-)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index e00af62e763..3e519dc6ade 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -111,7 +111,7 @@ Variables are lower_case_with_underscores; easy to ty=
pe and read.  Structured
>  type names are in CamelCase; harder to type but standing out.  Enum type
>  names and function type names should also be in CamelCase.  Scalar type
>  names are lower_case_with_underscores_ending_with_a_t, like the POSIX
> -uint64_t and family.  Note that this last convention contradicts POSIX
> +``uint64_t`` and family.  Note that this last convention contradicts POS=
IX
>  and is therefore likely to be changed.
>=20=20
>  Variable Naming Conventions
> @@ -290,57 +290,57 @@ a few useful guidelines here.
>  Scalars
>  -------
>=20=20
> -If you're using "int" or "long", odds are good that there's a better typ=
e.
> -If a variable is counting something, it should be declared with an
> -unsigned type.
> +If you're using '``int``' or '``long``', odds are good that there's a
> better

We seem to be switching between quoted and unquoted ``types``. Are the
quotes really needed if they are also highlighted by the monospace font?

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

