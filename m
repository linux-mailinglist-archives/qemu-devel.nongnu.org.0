Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5932F2E93
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:02:32 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzINb-0006fR-RV
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIKe-0005G6-2y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIKT-0003PO-Gy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:59:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 3so1860322wmg.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 03:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Xr0SAgzyBEZ/n5lACGNcKiklOcmXSqTpp7d7eFA62B8=;
 b=wVCZrZc8a5JhWqzZLxqFvCyqmAlXOumhAGp3qMHd5baV8M1n51PEZbNql3VKtxwOhI
 n+G6UtyK0X2DYdnLnsyyrRGHsdpN5JSXXdAKc4DnS2wLM9o6BVXn9FNXcuhX93Thov68
 Yjcf0DJ97zUbVv3NF5/RYfcA4M3eGsg6y8Y0013SaYKrSIQszezk1KpI5/y303iKGOMO
 0LrbChQ1VxaNz2KJDydfUGYAAXSZQFVStHkJwXzRMoPNMrYguRbfLrmwf8G2PU31LZqb
 KylpcCZl6r7aU2duM/BvIv12xT9B2rS6jn2vGF2AQhjjdX+WW0w7xleZsLu5rI4QEPqX
 LxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Xr0SAgzyBEZ/n5lACGNcKiklOcmXSqTpp7d7eFA62B8=;
 b=DXt1y3YkaCvCY6UqWYcL3jU4Hb4uoH99RpuF48T88dbsIb9m9+z933hw8jrWnZx/21
 mcG+HQPALAyaIhw+Qb5NrJkqNvGoNCexv3OebV9+RXrzT4udm/bkFzNcy/mNec4rCWMf
 nIoMvby7k56Xf5sAE3MHUtJKRJ7Q9eFIkkhNuCyDYfDSycuMWpzF2kZo+gU5aw3x2Z7N
 /HvYooKxTZNTS9nismGc4lYF2093hdY32zcPSE/bRGc3A6jFzJHV3Q7Bww4ou9f64tfW
 +90O8k0vh7ZvJ6qpD1XYMYKFY1vFCnWI/bZ6vVXu6nkmLkart4aEzMmfrO6MpDF9STX+
 UsWA==
X-Gm-Message-State: AOAM531K8H7dAf6rKNoucHUh05wdD3ttEkrmCrg5uf683Z6Pq/pCLj8E
 xVSvLqPubP4L0N9otNSSK1WcKw==
X-Google-Smtp-Source: ABdhPJwxvFbDlPLLt58Al/7MrPSHWHgxNmI68h2Bn1toPQKEwvollCJnQKROxW2Gm+vSO75MdIzsVg==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr3202881wmr.179.1610452755872; 
 Tue, 12 Jan 2021 03:59:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n17sm3465033wmc.33.2021.01.12.03.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 03:59:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B39F1FF7E;
 Tue, 12 Jan 2021 11:59:14 +0000 (GMT)
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v6 34/35] Auto-import Docker support files
Date: Tue, 12 Jan 2021 11:58:30 +0000
In-reply-to: <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
Message-ID: <874kjmnz71.fsf@linaro.org>
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu, Fam Zheng <fam@euphon.net>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> From: Alessandro Di Federico <ale@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  tests/docker/docker.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index 36b7868..d473566 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -28,6 +28,7 @@ from io import StringIO, BytesIO
>  from shutil import copy, rmtree
>  from pwd import getpwuid
>  from datetime import datetime, timedelta
> +from glob import glob
>=20=20
>=20=20
>  FILTERED_ENV_NAMES =3D ['ftp_proxy', 'http_proxy', 'https_proxy']
> @@ -466,7 +467,8 @@ class BuildCommand(SubCommand):
>                      return 1
>=20=20
>              # Is there a .pre file to run in the build context?
> -            docker_pre =3D os.path.splitext(args.dockerfile)[0]+".pre"
> +            basename =3D os.path.splitext(args.dockerfile)[0]
> +            docker_pre =3D basename + ".pre"
>              if os.path.exists(docker_pre):
>                  stdout =3D DEVNULL if args.quiet else None
>                  rc =3D subprocess.call(os.path.realpath(docker_pre),
> @@ -488,7 +490,9 @@ class BuildCommand(SubCommand):
>                  _copy_binary_with_libs(args.include_executable,
>                                         qpath, docker_dir)
>=20=20
> -            for filename in args.extra_files or []:
> +            extra_files =3D args.extra_files or []
> +            extra_files +=3D glob(basename + ".*")
> +            for filename in extra_files:

Hmm not so sure about this magic. What's wrong with the existing
--extra-files mechanism?=20

>                  _copy_with_mkdir(filename, docker_dir)
>                  cksum +=3D [(filename, _file_checksum(filename))]


--=20
Alex Benn=C3=A9e

