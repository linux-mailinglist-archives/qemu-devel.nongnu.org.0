Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330AB6BFA12
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 13:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdVtF-0005dj-7W; Sat, 18 Mar 2023 08:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdVtD-0005dT-Mo
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:42:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdVtB-0002tl-B9
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 08:42:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so6529355wmb.5
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679143343;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+X5AZjW4T3hafnEKWm40v+WXiEjKiog1S2u4reHJTF8=;
 b=NZ8E9SQYeAxJ7u+dI7gRE1UidZX0tTBk/ga6QI0h3hsrtccqqWdanc+p212OPM5FKU
 J6nATdWRcPLo9vk1HeE6BtsSI1dyup/HiBCaG3HWgshxPsDve4nzvpFJa6bTvVj8UcEc
 iKUylYOvnMajR1sKXucUPdt+iNyQL32SQMzENeEe1B6hEGqYnMiIhkN1oUH/o3atrllK
 Xc7GGReIjnaZ6t0a67zD5cl5zzZ43P22yMnyD+zpOpigAgA0Amcy5fjCvxIOaMGNZA9n
 fXVu4+DeMi8ShUfb1mf3E/Ey6GP+cxP5OZ/N4cO2CNBFCdDUfN78d6KFRH6ynvqjeM3r
 bi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679143343;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+X5AZjW4T3hafnEKWm40v+WXiEjKiog1S2u4reHJTF8=;
 b=ATtFD+gsi22PBf4999rPZaZpRB6OERLoCtRIDz0NAJS05K6QDL2QCl8/LSOL2DBwm7
 ohWMiO53Gr7q/yHtEv49KUCDTN2RetXzVh/NPQsftAk6xuSlaKWQc3eIRRhs5A8gSQNF
 uHrF/a+5yrYGKxRsrGbZyM14/eqKanwPUJIxQMWlraMp6vfA/d6cfCrNcbydJd5L5oEI
 SK5+qG0cLtBagZ1wc+cpw5vULmib6ZWrGbb24NKDe4EjRp4Js3FGa/RtvZNg+d/aMtiF
 nNReJ3NHfvHMxi4q123KkQbbs9QelYJyKPd/7CgW37QSdKHiB/BbmMn6zLlN/W0PovKV
 e7Ng==
X-Gm-Message-State: AO0yUKVMKjSmXZAdSbrE27Sltoy3jzuCPVdYLhxd+gB2irQI/d1uJ5gb
 wegw70Ol4gl3ODJNmk0cYTsFZw==
X-Google-Smtp-Source: AK7set/qPkqD2vXp4Q7GK0IhYVl820fQ3a5Gnm6J7n+Pmji8BOt/VMGhnFfKdY3lL1KMhWy1TS2IIw==
X-Received: by 2002:a05:600c:21c6:b0:3ed:775e:5257 with SMTP id
 x6-20020a05600c21c600b003ed775e5257mr5094552wmj.35.1679143343029; 
 Sat, 18 Mar 2023 05:42:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6e82000000b002c55b0e6ef1sm4337428wrz.4.2023.03.18.05.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 05:42:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 666CA1FFB7;
 Sat, 18 Mar 2023 12:42:22 +0000 (GMT)
References: <20230318075159.97849-1-mjt@msgid.tls.msk.ru>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] doc: do not recommend -blockdev
Date: Sat, 18 Mar 2023 12:32:13 +0000
In-reply-to: <20230318075159.97849-1-mjt@msgid.tls.msk.ru>
Message-ID: <874jqiw7rl.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Michael Tokarev <mjt@tls.msk.ru> writes:

> Currently, documentation recommends to use -blockdev instead of -drive.
> This is quite a bit misleading, because -blockdev is "too" low-level,
> requires good knowlege of how to construct block device stack, esp.
> in context of various qcow2 layers, and requires too explicit configurati=
on.
> More, quite some constructs does not work with -blockdev, - for example
> this is -snapshot.
>
> Instead of "recommended" word, use another construct here.

Could we expand the images section:

  https://qemu.readthedocs.io/en/latest/system/images.html

to give a better overview of when you should use -device/-blockdev vs -driv=
e?

>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 59bdf67a2c..8fe31b465d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1143,7 +1143,7 @@ have gone through several iterations as the feature=
 set and complexity
>  of the block layer have grown. Many online guides to QEMU often
>  reference older and deprecated options, which can lead to confusion.
>=20=20
> -The recommended modern way to describe disks is to use a combination of
> +The low-level detailed way to describe disks is to use a combination of
>  ``-device`` to specify the hardware device and ``-blockdev`` to
>  describe the backend. The device defines what the guest sees and the
>  backend describes how QEMU handles the data.

How about:

  The most explicit way to describe disks is to use a combination of
  ``-device`` to specify the hardware device and ``-blockdev`` to
  describe the backend. The device defines what the guest sees and the
  backend describes how QEMU handles the data. The ``--drive`` option
  combines the device and backend into a single command line options which
  is useful in the majority of cases. Older options like ``-hda`` make a
  bake in a lot of assumptions from the days when QEMU was emulating a
  legacy PC, they are not recommended for modern configurations.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

