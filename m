Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A40688745
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNepH-0006JM-Ix; Thu, 02 Feb 2023 14:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNepB-0006FT-RC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:00:47 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNep9-000322-Pd
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:00:45 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso4420041wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 11:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GRflAX64lCW0SjBPoU9rupnC8V5YQ+isuCTRpGFSdY=;
 b=O4XlUlT5YoijzUXR7/DjFPIl1EfnUMIXrtfrvarsOrd2CcWmPCotB64uxOT7sCCk0o
 vbT0bGPj1qxI66mTWGCPMjtevP4XP+NjZINXcm6TRbO+dd8vLegEE6Xkf4alXPuQH20X
 y/tV+ukoXz+QS9IVWbuA3DdT32OeZfkqkzNJDVlrsHffpqQSo/LFKun1oy0xiXuCuS/M
 qy2uBm3FJdKblunvAzU7OiJwn/0ZI/SlSpiImU0Xug+JKD5VSTMarf8Ek7mHhcEvH4Hs
 0cT3RVH6civRiW/XLtAEvMHRGGcfEbiXgmdVBNasec5SpGjqfE2lxMVJNlsMxVZwBYew
 Bi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1GRflAX64lCW0SjBPoU9rupnC8V5YQ+isuCTRpGFSdY=;
 b=g7VImO830BmxUlkAZJj7h9da1FqXh1Y5ix7cKlZiEPKCQnADtCYZvHumYsu0/hZOqN
 cNOE6BE7lFHvYluk2+97R9Fb2F26IGTy1taH8Garu5eem1Wrv7u9ZV+j7cqn0hd2t+20
 iBEvYFjEHd/sHTl4hHyI0XLGqL4y5ehybg3KLCpGJ/ElA+KXuzZU7xgxFbEm/SO6E+X3
 FgvBnA8f+xPmRoMzJKrneJwfwgeQEti6BynGc+R89/yeoHpMZ0cQUtoMtQ3y0eM8I68m
 rg8vbanuQbuiKrxoU2/HDHQwuNzkTYPHpEhI5jVzPwUnsANV0dxhrChd7iZWoLAVPbd4
 u/Ig==
X-Gm-Message-State: AO0yUKVImrytXBjEtr9YtuFM7krEpuniS0Qh2mKHi17MJDbCzyWZu+dQ
 TUleQU+WaD1nu3KuXpai+lNeqQ==
X-Google-Smtp-Source: AK7set9TS/OIrxjMfYOxI6xGEpYSV/bCH1ZtZ5IglqtgTpFKBjxizGrTHOm+BTwGgIG+lqAzMe+Oiw==
X-Received: by 2002:a05:600c:4f93:b0:3dc:59c3:9020 with SMTP id
 n19-20020a05600c4f9300b003dc59c39020mr7278036wmq.8.1675364441235; 
 Thu, 02 Feb 2023 11:00:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2ac800b003ddc781b1d4sm474586wme.33.2023.02.02.11.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 11:00:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E50871FFB7;
 Thu,  2 Feb 2023 19:00:39 +0000 (GMT)
References: <20230202175903.2119702-1-alex.bennee@linaro.org>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] gitlab: call ninja directly and reduce build noise
Date: Thu, 02 Feb 2023 18:59:12 +0000
In-reply-to: <20230202175903.2119702-1-alex.bennee@linaro.org>
Message-ID: <875ycjlwo8.fsf@linaro.org>
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


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> A significant portion of our CI logs are just enumerating each
> successfully built object file. The current widespread versions of
> ninja don't have a quiet option so we use NINJA_STATUS to add a fixed
> string to the ninja output which we then filter with fgrep. If there
> are any errors in the output we get them from the compiler.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest=
-template.yml
> index 73ecfabb8d..3c4b237e4f 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -21,7 +21,7 @@
>        then
>          ../meson/meson.py configure . -Dbackend_max_links=3D"$LD_JOBS" ;
>        fi || exit 1;
> -    - make -j"$JOBS"
> +    - env NINJA_STATUS=3D"[ninja][%f/%t] " ninja | fgrep -v "[ninja]"
>      - if test -n "$MAKE_CHECK_ARGS";
>        then
>          make -j"$JOBS" $MAKE_CHECK_ARGS ;


This is too much for gitlab as it trips up on no output at all. What we
really need is something that filters ninja output, counts the lines and
outputs a dot every 10? 20? lines to keep gitlab happy.

Shonky shell script? Very clever sed?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

