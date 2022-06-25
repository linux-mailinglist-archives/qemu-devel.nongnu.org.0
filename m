Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D452D55AB95
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 18:34:36 +0200 (CEST)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o58jz-0005JS-FC
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o58iM-0004F2-S2
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:32:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o58iL-0002Mr-9j
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:32:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so4319797wms.1
 for <qemu-devel@nongnu.org>; Sat, 25 Jun 2022 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JuOFqKiyMagpR9P965bRJnoUeSF0VRIYXh/fSIsOcSE=;
 b=S6c1mdVgLVtpcJ0z3RUPtM2EeYbvN9fkR5IjZA5TRqoDxE0fzFFtWbinIidBgOiSm0
 OiiY8XZ8TxLe8RCYSgTjx8N51GlFjtBVx/MaEK7Ml+luBJGEloAFsE/aJs7dZNvYHXQp
 ajcghWE8S+QEr9lADw0y62YW7mo9aWVRTlIes21gui8K6+pm7Vf/1pACseWkrJJy4LxS
 DHOixPlNlEDx1Z/qjRPYwZiFO3O42oNAQ4Irn+BFsigrSGam0gow3jXnEji1bLhB1doN
 WmdvR18g5o48VFlQsTRivWW7vxnEBJ208VGPMqAvbBh0QCoDRf24z/3I0RxGjwpat/ml
 fiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JuOFqKiyMagpR9P965bRJnoUeSF0VRIYXh/fSIsOcSE=;
 b=O8+skxWcdm9MzhaxC2N9rYARyzmL/qd003OkjpEM6rBdTA1s/HqOuIo0jafchrwB5J
 nWCG02uaVgMdyomp1eHoEigB+S+P34GXlLKa6GuuqHf/xZWoac3ZXmdvNHryik7qkwl8
 OvvGyBEJeAQM4u+X3juYbWGSOhj5QY5a+UuQyyR/nqNAnmHUj4KhdJRW1IooDa6BrGC9
 M00Tt3g9Q9ZxCJjGcFanTsDwQA5qbl7DgM8e34y9bJd+H/ZS+eJXDwduh4fZUoqdbnUt
 dERZ7gYX3FSnetuCfHdPbHGgYAgc9QnwuYevA7V3JsNlikvEp10MCoOF8YIGgTMg/ZSF
 X6UQ==
X-Gm-Message-State: AJIora+6HK1dewL1UmVSbEM3nx1zIMJ5VNf9ULGAjknfHx39nMH9Ccee
 bND8FB3dPy6F2IRSgci2R9uB1g==
X-Google-Smtp-Source: AGRyM1v1RdsfEE7sFzGS8h6+Bcl+pu4tLbEUXocmQuqqwjR47mBMkhLgKGlq9sgvkPBogIKUIntwjw==
X-Received: by 2002:a05:600c:286:b0:3a0:30f8:8a43 with SMTP id
 6-20020a05600c028600b003a030f88a43mr5385962wmk.90.1656174771081; 
 Sat, 25 Jun 2022 09:32:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0039c4d022a44sm7121776wmn.1.2022.06.25.09.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 09:32:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DF391FFB7;
 Sat, 25 Jun 2022 17:32:49 +0100 (BST)
References: <20220624150216.3627-1-shnusongshaobo@gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shaobo Song <shnusongshaobo@gmail.com>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg: Fix returned type in
 alloc_code_gen_buffer_splitwx_memfd()
Date: Sat, 25 Jun 2022 17:32:42 +0100
In-reply-to: <20220624150216.3627-1-shnusongshaobo@gmail.com>
Message-ID: <87fsjsaekv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shaobo Song <shnusongshaobo@gmail.com> writes:

>  This fixes a bug in POSIX-compliant environments. Since we had allocated=
=20
>  a buffer named 'tcg-jit' with read-write access protections we need a in=
t=20
>  type to combine these access flags and return it, whereas we had inexpli=
cably=20
>  return a bool type. It may cause an unnecessary protection change in=20
>  tcg_region_init().
>
> Signed-off-by: Shaobo Song <shnusongshaobo@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

