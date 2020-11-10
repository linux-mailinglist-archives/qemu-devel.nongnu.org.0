Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F212ADD1E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:39:31 +0100 (CET)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXcA-0002rC-4L
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcXaJ-0002G3-9I
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:37:36 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcXaG-0001PL-ST
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:37:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id d142so3954395wmd.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6dOQaOBclXYtanf55FVWBq/TwBLJqxPBDiVgj4zjKTI=;
 b=i+Bv2wl5Xi+J0SAq6vsjTR0wbaxGEMKOufnJhx9vApp6CyDQVfOW8njhwMXyhbCZ45
 ngwqwB9sRNVW/E8iPtU5gOX8tYTspMeVQ43y6XLVvGaNbg7HpDo7fYjYUHaienggliYT
 v3gAlX5OeQOk8A0wlIHDR2lRfkGk72mHWhQsKuzzOMux7uH+E9cwE6NN4w+fBEo53GSR
 N00q8A/jpkS553BFbf6BHOGRJMnTSIU9PjCPbmwZiD5wXQbGmaR+536ILKEqIgHTs+dz
 PWhqhGythR7LZqXmrelWsVZ9J94xPNv0DgNj2CeVds5hHLuKO4NbU3bHsGaRvmsOPKWt
 vnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=6dOQaOBclXYtanf55FVWBq/TwBLJqxPBDiVgj4zjKTI=;
 b=EXd2J5/n95BUBP2U/PF1n8Kn+I141sox06y67y98Je2bEvPYhyDZs447+RE/Yea+0L
 K8PXTj1YTtt6X3rfBV6sVXkyxxvb59u2L/0Zn2+s5d10J/MdxOOXkP0szRFKapb1Voqi
 y3SX7cScSgok18n+vuubstiFvJ02a2Fu0CyNyiWc4+Wg7iVzV99PQqOYu1GOqkoU2FFl
 HuJUoLzGpInKzTNjkD7cwJIk5+nOt+xOiLvaA40oRewNJtP+Le6U8oHbHDEzuGcEOzxD
 eta/RnHGEO9BY+PGjjnKfVBT7igQCz2wBym2sJPWKizuptl6TeSbZ4rzu1mVUrhJzPr8
 +0vw==
X-Gm-Message-State: AOAM533MAS8O4XfSeovYWxh3IPoXsz7b6Fqk/gyECQZjNkvt5qjhRQQ9
 d/H2aQKVIv00ruRHSIWSrQjmLw==
X-Google-Smtp-Source: ABdhPJw6Bzs7wtkQGPxvqQilQjBXra6hbd+KISEPahVDYCJh1x66l4X+kp4zGHIHdmJ47/7OlKC1DQ==
X-Received: by 2002:a1c:9d02:: with SMTP id g2mr228811wme.110.1605029849626;
 Tue, 10 Nov 2020 09:37:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm3539003wmc.26.2020.11.10.09.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 09:37:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B1FEB1FF7E;
 Tue, 10 Nov 2020 17:37:27 +0000 (GMT)
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <20201106032921.600200-17-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 16/41] accel/tcg: Support split-wx for darwin/iOS
 with vm_remap
In-reply-to: <20201106032921.600200-17-richard.henderson@linaro.org>
Date: Tue, 10 Nov 2020 17:37:27 +0000
Message-ID: <87zh3p6rl4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: j@getutm.app, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Cribbed from code posted by Joelle van Dyne <j@getutm.app>,
> and rearranged to a cleaner structure.  Completely untested.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 65 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 1931e65365..17df6c94fa 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1166,9 +1166,71 @@ static bool alloc_code_gen_buffer_splitwx_memfd(si=
ze_t size, Error **errp)
>  }
>  #endif /* CONFIG_POSIX */
>=20=20
> +#ifdef CONFIG_DARWIN
> +#include <mach/mach.h>
> +
> +extern kern_return_t mach_vm_remap(vm_map_t target_task,
> +                                   mach_vm_address_t *target_address,
> +                                   mach_vm_size_t size,
> +                                   mach_vm_offset_t mask,
> +                                   int flags,
> +                                   vm_map_t src_task,
> +                                   mach_vm_address_t src_address,
> +                                   boolean_t copy,
> +                                   vm_prot_t *cur_protection,
> +                                   vm_prot_t *max_protection,
> +                                   vm_inherit_t inheritance);

Our checkpatch really doesn't like the extern being dropped in here but
having grepped the xnu source I'm not sure we have a choice. I'm curious
how stable the function might be given it's not in a published header.

--=20
Alex Benn=C3=A9e

