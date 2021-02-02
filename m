Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB630BEA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:49:27 +0100 (CET)
Received: from localhost ([::1]:34966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6v7V-0007oF-4Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6v2n-0005dq-Qx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:44:33 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6v2l-0007Uu-IY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:44:33 -0500
Received: by mail-wr1-x430.google.com with SMTP id a1so20316662wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W2O3ko70QgQjwjAk9NdYNuI3WjnlXV2qEgCFBNxCLl8=;
 b=xCTIEKdsI5RSZMmUDYMI+eopLtG+osbD4M9kUjjlcYjfWYB+0VSDDWwycolAyy/InX
 qChl/yOL0V4zNnIwdwQ3MIGi9cpYxkNcReMSG4eBJlpGr2d4egOCfF1SVyATIPaIjqJo
 O1P969oLUN5MtS2YJbFWQjOttQcYgvqQXG9vyeRJ33X+iDDdtYKvqqg3wFEO5esn/n/W
 +W8kQLfrXTEzRe2fp7eR17p22FLEoxhTDCH9sQm/IRhyryIUF2akaQWzqkt1AWS7cDuM
 65skUbsbVLvzdsXhKbI6OSf6CvE7B7ltBYiDzdZobF1YsIZnbI8FgFvxl0IFHANLMl4t
 ndcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W2O3ko70QgQjwjAk9NdYNuI3WjnlXV2qEgCFBNxCLl8=;
 b=X/KkGljOXB6Em3T0zGYUx6Mma0DMpLdxyAEuEIUSDjI9hjG07aufR+l4CCxC3R3xZE
 eVnWHvf3EscqhU3zjDBr9evv09vJEuYCDME3J8ol0XYGHNhE2m1SXJPxr+7pk/ZdnXwu
 fYwo9YLMpozBCbOpObdzri+NIwlGOD8eJet9XC4Eudsyb1EHrZs38op2KrVQuFZMQdUJ
 DYcFbn1clzlOmnOOR5ad/wzD5fazJpwxOpQMiij5rqAqMEs3SyKs+ywJi0ZWCe8shGTN
 s6lYuZMLy9LQyB0NZ2wvb4s9Q1jvXVyP/q+yW2a20w0rYXlq4fhDzh57dYXe9RJe6Y2v
 rAFw==
X-Gm-Message-State: AOAM530MdQ+3mSAdsOdA74nncdDWidMHGpT8oZfxaW/HTFOmJaV4yNaP
 ZlFIqX6yB9PHsDuuAcbCEWan7+GeqIeOyDFR
X-Google-Smtp-Source: ABdhPJxLjo0PQR0/C0cOoEhAO5x7f9VcET1/zNvf80zzBlBmc0e3GKC7F/b2T+StQjSpaurxJxNTIQ==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr23727887wrs.56.1612269869637; 
 Tue, 02 Feb 2021 04:44:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y63sm2832964wmd.21.2021.02.02.04.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 04:44:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B77F01FF7E;
 Tue,  2 Feb 2021 12:44:27 +0000 (GMT)
References: <20210202104911.879393-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] configure: Escape non-numbers in version_ge()
Date: Tue, 02 Feb 2021 12:43:25 +0000
In-reply-to: <20210202104911.879393-1-philmd@redhat.com>
Message-ID: <87mtwmtz9w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On Red Hat based distributions, the configure script emits various
> warnings:
>
>   # ./configure
>   Using './build' as the directory for build output
>   ./configure: line 212: test: 2-15: integer expression expected
>   ./configure: line 213: test: 2-15: integer expression expected
>   ./configure: line 212: test: el8: integer expression expected
>   ./configure: line 213: test: el8: integer expression expected
>
> This is produced by the gdb version check introduced in commit
> b1863ccc957 ("configure: gate our use of GDB to 8.3.1 or above"):
>
>     gdb_version=3D$($gdb_bin --version | head -n 1)
>     if version_ge ${gdb_version##* } 8.3.1; then
>         echo "HAVE_GDB_BIN=3D$gdb_bin" >> $config_host_mak
>     fi
>
> Because on RHEL/Fedora the minor version is not a plain number:
>
>   $ gdb --version | head -n 1
>   GNU gdb (GDB) Fedora 9.1-7.fc32
>
>   $ gdb --version | head -n 1
>   GNU gdb (GDB) Red Hat Enterprise Linux 8.2-15.el8
>
> Fix by only using the leading numbers, stripping the rest.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configure b/configure
> index e85d6baf8f8..21f6530a812 100755
> --- a/configure
> +++ b/configure
> @@ -205,7 +205,7 @@ version_ge () {
>          local_first=3D${2-0}
>          # 'shift 2' if $2 is set, or 'shift' if $2 is not set
>          shift ${2:+2}
> -        local_ver1=3D$*
> +        local_ver1=3D$(echo $* | sed -E 's/(^[0-9]+).*/\1/')
>          set x $local_ver2
>          # the second argument finished, the first must be greater or equ=
al
>          test $# =3D 1 && return 0

I already have a fix that was posted in:

  Subject: [PATCH  v2 7/8] configure: make version_ge more tolerant of shad=
y version input
  Date: Fri, 22 Jan 2021 18:18:53 +0000
  Message-Id: <20210122181854.23105-8-alex.bennee@linaro.org>

About to feature in the pre-PR series I'm about to post.

--=20
Alex Benn=C3=A9e

