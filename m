Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557E307794
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:03:44 +0100 (CET)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57tf-0002c4-DW
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57ps-00012i-6h
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:48 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l57pq-00013B-1z
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:59:47 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e15so4671509wme.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MbYCUOezN/SHSsd6G/yl4mF8qq7KhykBtagZiuXSWc4=;
 b=K2jX7KfR6HEiRZGUOuEJItuj1uBhJIbA9vYYkB8HpVhwZ4OpGKjWzV1XRQIgELAAVe
 ZucVsjP9a+NevO+v714Ig6vi5XR3LR4+XSBOqHkZAOkf0ZvYTfJzfXgzeQNioudnIy5K
 h64087BLVaAnWO0Dp/W7BP+4dxtBQhfVeZnqi99neS5cCGLuoIkev4GK7vzHm1qpB2Uf
 BS9CKio8LsSGnNTbXogHj7IRmor+AtiSwHUZ9DXarhfRo5FlDGZrNV4pwWkcXhOTCrHN
 BSlr8wR3gSLNpX4Q+M9btHp+z+em3Yji9stMM6cGhL56rXkB14zgAz7lS6Krbc2bnrgK
 I2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MbYCUOezN/SHSsd6G/yl4mF8qq7KhykBtagZiuXSWc4=;
 b=gq45op+EJNOOx95QghJhASTQzPkvCvgPlrgBg7Xbo0JeVGJdqlObDMJ+h1xsna65cA
 kYum646l++Rqo1HBcoWFCQdWbaVbytH7IaelHe47b/FK1Fh9X+3qwFgtjXd7cg9YzmNr
 xj04QOdq5RKp2foQypHF8JRGwLwC2xATRRCeM6gFy6N6tEPBDpRg1oibFJQxJ681wLiQ
 qvsTnNlDNQz6WZh16SNxXRBPBKgQRmNzPHBjj9S6hlbopGrPeDMsG51ABAkvx0uwZoK1
 JIXeNAal5TtdvcNZbNd4Bz2ldIMyuLVZYEcX/C/gGJ/jBGkyAa4Uwz+5YFdnn9/kdT32
 zrgw==
X-Gm-Message-State: AOAM532dT5GMaoD1+GZPCjnSHOQm3rdp6zw8bswsOJr4NnHnLTKk7tRv
 +RlbV4hjBXQxnvaA768/RNV7FQ==
X-Google-Smtp-Source: ABdhPJwt9ryBslZrtjbDqrKBkytLXMAJ5pVFr/XuE1KSZ/xAGiU3DRF1nrhsJBmwPA00pl0evqSPQA==
X-Received: by 2002:a1c:e2d7:: with SMTP id z206mr8829551wmg.99.1611842383376; 
 Thu, 28 Jan 2021 05:59:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm7968697wra.9.2021.01.28.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 05:59:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A07F1FF7E;
 Thu, 28 Jan 2021 13:59:41 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/23] tcg/tci: Implement INDEX_op_ld16s_i32
Date: Thu, 28 Jan 2021 13:59:30 +0000
In-reply-to: <20210128082331.196801-5-richard.henderson@linaro.org>
Message-ID: <87a6stw4aa.fsf@linaro.org>
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
> Message-Id: <20210128024814.2056958-1-sw@weilnetz.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/tci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 2311aa7d3a..2edb47506e 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -614,7 +614,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchS=
tate *env,
>              TODO();
>              break;
>          case INDEX_op_ld16s_i32:
> -            TODO();
> +            t0 =3D *tb_ptr++;
> +            t1 =3D tci_read_r(regs, &tb_ptr);
> +            t2 =3D tci_read_s32(&tb_ptr);
> +            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
>              break;
>          case INDEX_op_ld_i32:
>              t0 =3D *tb_ptr++;


--=20
Alex Benn=C3=A9e

