Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58F66281D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsaz-0006fq-DM; Mon, 09 Jan 2023 08:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEsag-0006bX-V7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:38 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pEsaf-0001Vu-19
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:53:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m7so8217232wrn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktoK/mXhVNGzAS4YrFK3A1u4zHLpxrGC5tcWHbw5tI4=;
 b=GKBXDtWIqJvTJZG8EPMfR4eV82nxfFNx141XeGWwdSCYsBZhp/bRW5DA9fV+EKY2au
 ptHx9HlnEf8VuQ1ma9SO4OXuDyb8L4lb9lA4eVh2axaws32/+g757w7M5aiuNVgV793+
 nz8oBkHbmw3E5vIxJ7xVSM7W1/Ulu8ygvvfMMYtp2SnCkLtHY85l+x0U6GNhBIaIfhdv
 7R06QEfHrH/W1PsDYPy183yt7dQK5KxESo+hKXaVEIVZPp7pbMt49h5tyYIDwV+crMrS
 WjwBgCDEwwrxhpTK/miAjuhx881ybJ2MrxfVveOSLampM7ftoW6M7RIaEtM9ziXW8pu4
 DQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ktoK/mXhVNGzAS4YrFK3A1u4zHLpxrGC5tcWHbw5tI4=;
 b=gf60dpqWbtMpnMNZlwHu1EOuMaSdf5/FOAKrmT06ZqZuyvIv78Dd14R3He4B50i/8S
 0w6C9plJCHjkH8k7578epqGotMD5DCDKlo3h3xwgFYvH13xtitZu1bR7ejkkXiidsESt
 dU956b2OlAxs+cUp8nDDu5pEoRhiBNiJOAsTnw8f4ot4Um9ytnDjtODmlAzLOyN1jDju
 nyPq1oB/r7Ib/Kp1HC2tCqStL4KKDOMEOHAAL4e1CYBnWz5RL0R3t0v8IfgW3I96WsHO
 CHcLPgZZxefQy9jAmXtz2MMEVEvNf5hXnFSJhFg/mbqlRwEBzTMwj2RpbXybJh8yRaT6
 KPmQ==
X-Gm-Message-State: AFqh2kqoT55WOcftlL6oeeOQ436HBU+TvD+/1MPBdMrlw7tdMQeIH7+h
 Sbg0XWYXIKvRMszo4HiyWx/gMClW1a0x9SF8
X-Google-Smtp-Source: AMrXdXvDtiuTYQep4musT6JBSzh4rH/hyv5gTZ5267dFQvGAdYeL5cWuoreccGmsKR+u+qLyNa5sCA==
X-Received: by 2002:a5d:6e07:0:b0:242:285:6b39 with SMTP id
 h7-20020a5d6e07000000b0024202856b39mr41099965wrz.50.1673272406463; 
 Mon, 09 Jan 2023 05:53:26 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm8672282wrx.97.2023.01.09.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 05:53:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3D221FFB7;
 Mon,  9 Jan 2023 13:53:25 +0000 (GMT)
References: <20230108164731.61469-1-cota@braap.org>
 <20230108165107.62488-1-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH 4/4] cpu-exec: assert that plugin_mem_cbs is NULL after
 execution
Date: Mon, 09 Jan 2023 13:52:36 +0000
In-reply-to: <20230108165107.62488-1-cota@braap.org>
Message-ID: <87k01voluy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


Emilio Cota <cota@braap.org> writes:

> Fixes: #1381
>
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>  accel/tcg/cpu-exec.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 356fe348de..de4ba6e23c 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -504,6 +504,7 @@ static void cpu_exec_exit(CPUState *cpu)
>      if (cc->tcg_ops->cpu_exec_exit) {
>          cc->tcg_ops->cpu_exec_exit(cpu);
>      }
> +    g_assert(cpu->plugin_mem_cbs =3D=3D NULL);
>  }
>=20=20
>  void cpu_exec_step_atomic(CPUState *cpu)
> @@ -1031,6 +1032,7 @@ int cpu_exec(CPUState *cpu)
>=20=20
>              cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
>=20=20
> +            g_assert(cpu->plugin_mem_cbs =3D=3D NULL);
>              /* Try to align the host and virtual clocks
>                 if the guest is in advance */
>              align_clocks(&sc, cpu);

Can we assert this anywhere else? This fails with non-plugin enabled
builds:

  https://gitlab.com/stsquad/qemu/-/pipelines/741478109/failures

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

