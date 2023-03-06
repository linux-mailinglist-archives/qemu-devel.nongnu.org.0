Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E556ABF97
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZA2A-0004VE-Gz; Mon, 06 Mar 2023 07:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZA1a-00040Z-KB
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:33:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZA1X-000467-Ld
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:33:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h11so8630054wrm.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678105982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDZhTZZrCjlFbqJSdwRIo2BMiBc16c/C9lqRcswNAPE=;
 b=QcLoukipamXjsati7EzR6hYirDGIZutk8KpfhGgUIvuVGsm6v8AdmkVMTKzN6ED5aW
 N3se87wpWKTCuerj8w7LT1Gk2W8utxutx6XBrEUrTWv/FZurcTf+qJU6NaXBIH1p5P4Y
 Rhd+dtnd/qMBvXFEargUcn8EQEvBtd955BALrHNJZe54F57s2BocT282S+jExzVy6Hfl
 CFK4V4AqkBVhnPUFbYBoEF0f0gZj/+kiA2W3WhwaD7hC3sc+5gqjjDqmXWR2PMlyLKQS
 CQWQ+hvyY87axJLMCvQhN38PlBfKed6C5k2wBUTMKaT9iKECAlwIRsawxOdwAJ3Mitww
 WsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678105982;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qDZhTZZrCjlFbqJSdwRIo2BMiBc16c/C9lqRcswNAPE=;
 b=XfwCZho4BXfgonXxdK+XsX+hBOXWmHfdxif145+hgiYLgkzowMvREL0t9/4EU5q+hd
 f6sYnF1pxJ/W1bRrvn0CUoaJH6YvM5FxqR4En6pZmLBX8HRzhk0jemUdVooh63ZjoOgm
 zBL6aK+RhceiWAnXj0BM7JOi4rBobssY6PQuak29h9dCIRGGCFpuhHy/tu4EYe2ugsMy
 g+zsKcCjCwEukSUirFV9c70yYE2UgPCAQJ44LhDzLdXJi90+fje3yqarh9h2eksEB/KL
 DQU7buzPJFh6lC7RFK6uR3DZ+JQsgxDou60z5Je4LW/LTEtr1bxvdtYm4T66FjFrYcpo
 H2SA==
X-Gm-Message-State: AO0yUKWS1Ti7hYWEEwZeOoGreijqykc0VhguucQgl3qfvWvkmLo8vY1N
 UayUulRx+oJc4r4ctUuytWpxQA==
X-Google-Smtp-Source: AK7set/xQ037bVX4T0FrAWjxS2TG/6LWFVlBhS0PQ5TXAxFAv4GKDZPOf6DhitFGmOqaXJAoahLJgw==
X-Received: by 2002:adf:e506:0:b0:2ce:3d6c:9a03 with SMTP id
 j6-20020adfe506000000b002ce3d6c9a03mr5810311wrm.19.1678105981754; 
 Mon, 06 Mar 2023 04:33:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a5d4d88000000b002c70e60eb40sm9838920wru.11.2023.03.06.04.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 04:33:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 119C71FFB7;
 Mon,  6 Mar 2023 12:33:01 +0000 (GMT)
References: <20230301125211.278808-1-williamvdvelde@gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Willem van de Velde <williamvdvelde@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] Add qemu qcode support for keys F13 to F24
Date: Mon, 06 Mar 2023 12:30:37 +0000
In-reply-to: <20230301125211.278808-1-williamvdvelde@gmail.com>
Message-ID: <87y1oaqcua.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Willem van de Velde <williamvdvelde@gmail.com> writes:

> To be able to use the function keys F13 to F24 these should be defined in=
 de keycodemapdb and added to the qapi.
> The keycodemapdb is updated in its own repository, this patch enables the=
 use of those keys within qemu.
>
> Signed-off-by: Willem van de Velde <williamvdvelde@gmail.com>

Adding maintainer to CC list so this doesn't get lost.

For reference from:
https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html#cc-the-=
relevant-maintainer

  git config sendemail.cccmd 'scripts/get_maintainer.pl --nogit-fallback'

will configure git send-email to do this automatically.

> ---
>  qapi/ui.json    | 15 ++++++++++++++-
>  ui/keycodemapdb |  2 +-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 0abba3e930..98322342f7 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -886,6 +886,19 @@
>  # @lang1: since 6.1
>  # @lang2: since 6.1
>  #
> +# @f13: since 8.0
> +# @f14: since 8.0
> +# @f15: since 8.0
> +# @f16: since 8.0
> +# @f17: since 8.0
> +# @f18: since 8.0
> +# @f19: since 8.0
> +# @f20: since 8.0
> +# @f21: since 8.0
> +# @f22: since 8.0
> +# @f23: since 8.0
> +# @f24: since 8.0
> +#
>  # 'sysrq' was mistakenly added to hack around the fact that
>  # the ps2 driver was not generating correct scancodes sequences
>  # when 'alt+print' was pressed. This flaw is now fixed and the
> @@ -918,7 +931,7 @@
>              'volumeup', 'volumedown', 'mediaselect',
>              'mail', 'calculator', 'computer',
>              'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookma=
rks',
> -            'lang1', 'lang2' ] }
> +            'lang1', 'lang2','f13','f14','f15','f16','f17','f18','f19','=
f20','f21','f22','f23','f24' ] }
>=20=20
>  ##
>  # @KeyValueKind:
> diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> index d21009b1c9..f5772a62ec 160000
> --- a/ui/keycodemapdb
> +++ b/ui/keycodemapdb
> @@ -1 +1 @@
> -Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
> +Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

