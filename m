Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3B8675BB9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 18:39:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIvLd-0005wE-Jl; Fri, 20 Jan 2023 12:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIvLL-0005kY-5t
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:38:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIvLJ-0000Kk-9G
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 12:38:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id q5so844910wrv.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 09:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alBKzzi4JaxfukJfi28jd5iJDkgWrtuG111UO8L+Uks=;
 b=R0VyNAd3Wn3hj0x9MyHSDtsyPbm9LDOkFjHQkT1R7DAkLGBS7xxbTqhOW/P0nDo9tG
 FHhLGD37RmSv14q/Nam+4mEGVx3FiwJod2DovaWQDwb5q6yjLXIG0EmmtLMdC4lUsPJo
 QWMhQxYMEr2lBORYUc08dfO0KeYGAMmcgWmPRCT+EY3IpO6dcxxos6RDhPcEai44T0XO
 QZIbaqMYGNKESfn/jFPCUbMBnQqByjgcKWU8Rinb4SKIYwxQZ1ItBjeMCkUvm5ix1l91
 Jv4CKGR2swrv2stlOxiGLhg/NFJjVqthjbmGm2baXstRbbl6y/vTUVCkBOSRrJOuh0hr
 wHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=alBKzzi4JaxfukJfi28jd5iJDkgWrtuG111UO8L+Uks=;
 b=iYzB0YJZ1WdjGqSzgrZ+HiYf/5WpW8DmQcw4Xw3dzuTQnckAD9W+O1Ccxj8eKrer9O
 4K6uGmZcIMR67dAaVc+qZY6mbXt8DS1EbR3A3AzH1dgi/MCitUI76cuIaWhzxFlezKEM
 Js1JH5TIkSe4NKXN3KFBcBVZMc3wxGY+m+twkBsqHi9h0dtFoTz/FZInUmkwKBWbZUxz
 6tm8Cf4yHgglw2PhwlyTiDjYqmQIgfG1NJRQA8v7596ymk7VQmAkbueg1t20C87yJHCh
 q564iUJAJlV4o8t6Fd1nHQ6hXMR0rralYwOYu9CrdGSeNaXz3zYhbdQ9M2jTF7rteBX/
 busQ==
X-Gm-Message-State: AFqh2kqyaJq1Hbm4m61sfFEFj9d3QFQ670eOqnc0WqP/Xu1z1h7sIsoc
 sIPNY/jvQHSdHB+MbAocCkhZWg==
X-Google-Smtp-Source: AMrXdXuKX4OkwbLr342s8uxi2SoowFhRQsEbvwEAMbzthO80GRaNziYoMu+okBVceLoAC2Souqtokw==
X-Received: by 2002:adf:f70d:0:b0:2bc:7d67:90e with SMTP id
 r13-20020adff70d000000b002bc7d67090emr13455302wrp.32.1674236291253; 
 Fri, 20 Jan 2023 09:38:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm36261265wrq.70.2023.01.20.09.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:38:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74DBC1FFB7;
 Fri, 20 Jan 2023 17:38:10 +0000 (GMT)
References: <20230117035701.168514-1-richard.henderson@linaro.org>
 <20230117035701.168514-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/3] plugins: Avoid deadlock in qemu_plugin_user_exit
Date: Fri, 20 Jan 2023 17:35:14 +0000
In-reply-to: <20230117035701.168514-3-richard.henderson@linaro.org>
Message-ID: <87pmb9w1h9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> Use of start_exclusive on this exit path leads to deadlock,
> in particular when called from dump_core_and_abort.  There
> does not appear to be a need for it.

We don't want to be doing any translation while un-registering things
lest things get confused. You could split the patch in two though as the
early return seems reasonable.

>
> While we're at it, skip the entire function if no plugins.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  plugins/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/plugins/core.c b/plugins/core.c
> index ccb770a485..35aca0266d 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -502,7 +502,9 @@ void qemu_plugin_user_exit(void)
>=20=20
>      QEMU_LOCK_GUARD(&plugin.lock);
>=20=20
> -    start_exclusive();
> +    if (QTAILQ_EMPTY(&plugin.ctxs)) {
> +        return;
> +    }
>=20=20
>      /* un-register all callbacks except the final AT_EXIT one */
>      for (ev =3D 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
> @@ -520,8 +522,6 @@ void qemu_plugin_user_exit(void)
>          qemu_plugin_disable_mem_helpers(cpu);
>      }
>=20=20
> -    end_exclusive();
> -
>      /* now it's safe to handle the exit case */
>      qemu_plugin_atexit_cb();
>  }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

