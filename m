Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2063077A9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:06:57 +0100 (CET)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57wm-0006Wt-Tv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57q0-0001M7-Cy
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57py-00016C-Np
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so5523564wrz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OxEHKhpBL700BFz3quy9aG3cFpqLOM609JV6cnBT3UY=;
 b=rA78wZ5LzghfBffuCNKccdQcunLpkQW6jBT7r3Whf/KOvHDksyDe4uefWzqZSGXtWL
 UuKhho3YMiOpWmHFgLTOvl4eoJ6dArq9CMzMq+aU5hzAxgtlzc47U0URgUvzymeTYCt+
 sRZM/taMdhc7Pyja2VAifSdxBZXzHB87GpUagY8CbN90XpS23xjlkugiv8XrDMdqLAw4
 zpmTsA3Ccz5i+WWgnsljISXJ2qdsJpOYKGPyMlW6GH5V6B4Eb1br4+hZ3BsWyAO6XLM/
 K/d41wIz+nsvSdnxG43mE9XLVLdRmzUoT0Va7sj1mXGI+CGlzLKOodSeRDRtQZkr8aEP
 v5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OxEHKhpBL700BFz3quy9aG3cFpqLOM609JV6cnBT3UY=;
 b=RjxbUriU9kYfK3B8rXmp7m/GFaXZFPzJmaJCp6tPIRW7MYPMZZK1Dl2Oi50D74N0hl
 immTfmcHao72CPNEz35+12wwu9bHFcOEcJGMHy2EO7QO5wz+yAcgZ/DmcK31YO4v+Pom
 FkDfcrv7AbDtAexyRDLrlquT56xB9Sk8ltImM8jVTsMLPMiwU6bE7ULSb4cMYKj4VrPq
 GzSx4OtSuB2z0+ass7Xn85TWIXdQcD17H96YgYTc2sL+/PcenEQn2ZL4mFUXbLB1TRPJ
 tqrWowpAu7XyI+dTMT/iu+nAWw5UeR2y3mAquxWsb39EpCLYxJVFn4H1tWxpkHDMHH4C
 4Bog==
X-Gm-Message-State: AOAM5339SzNsOlu2OAiqP16mGNDPLcB6TlZFMCX4w2xR7iBt16BKqAD0
 l0PEm1m/J354W5HIhJ1GZPW2Rw==
X-Google-Smtp-Source: ABdhPJwjG40zFEHBBpzJJxtBbvZDbgPS2lxg9dfSFujP/0yfgUoGXBZ1EYKLO8QIiy09imElayCGbg==
X-Received: by 2002:adf:f891:: with SMTP id u17mr16668993wrp.253.1611842393326; 
 Thu, 28 Jan 2021 05:59:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q2sm6111999wma.6.2021.01.28.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:59:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F1331FF7E;
 Thu, 28 Jan 2021 13:59:51 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/23] tcg/tci: Implement INDEX_op_ld8s_i64
Date: Thu, 28 Jan 2021 13:59:45 +0000
In-reply-to: <20210128082331.196801-6-richard.henderson@linaro.org>
Message-ID: <877dnxw4a0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> From: Stefan Weil <sw@weilnetz.de>
>
> That TCG opcode is used by debian-buster (arm64) running ffmpeg:
>
>     qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm
>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Message-Id: <20210128020425.2055454-1-sw@weilnetz.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/tci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 2edb47506e..0e1b8e8383 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -882,7 +882,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchS=
tate *env,
>              tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
>              break;
>          case INDEX_op_ld8s_i64:
> -            TODO();
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_r(regs, &tb_ptr);
> +            t2 =3D tci_read_s32(&tb_ptr);
> +            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
>              break;
>          case INDEX_op_ld16u_i64:
>              t0 =3D *tb_ptr++;


--=20
Alex Benn=C3=A9e

