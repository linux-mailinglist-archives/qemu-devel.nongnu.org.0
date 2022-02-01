Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2B4A6891
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:34:29 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2fM-00031b-BG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEy8P-00020h-8d
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:45:37 -0500
Received: from [2a00:1450:4864:20::62c] (port=46680
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEy6T-0003wy-14
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:42:11 -0500
Received: by mail-ej1-x62c.google.com with SMTP id o12so56931829eju.13
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bfajV5BN1jnF39EYpBo7aZ9OujaWjQzxUcdzgDszWYA=;
 b=yLXdlL1qAYGzKKh56B46McT3LHO081wvE3pRBtSuvlyjneYencmUBoZeVuNoCDaGGl
 hdH/dvfapj/BtNS5UXV/YbwEyoLSktoDqM9Qm3KMo3S6/M70TX6jA1iCtMGyeBty55CQ
 esXhlvtw3oQCkv4GDX6QtjjA1sif+mL1eMEyC9yELXVuhtHdSdhbUO3bgmFJjG05nC+g
 4VlTkWvWAzmaxNhh3AvKmgZu+8+hU7ZUu4Es2+7CQhRoA8UCKbn1DywK80vO6vMDviFM
 F8j0JJDRbJ02+pK60llaqfbw5+sgAZxOKf8orUigO/9QuZwwkZUV13Mvhrkqso3eSHyR
 mj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bfajV5BN1jnF39EYpBo7aZ9OujaWjQzxUcdzgDszWYA=;
 b=2qiVyVuC+5MOViYdhJlw0nwDJ9J2O7N0tfgRSiTeNc6r/1NEreQ8QW8CeJIHObA+v6
 nmnrNMMrYJXvB7ct4p4A9HvUYrXUNAiVjFIcIV0NWF4nqlvHTamrE0/TyzKfH+Td5P8P
 oKS2eoDrwNC6o8Af6bXnROuTunuFNqA6ed8cjCSFoOsxPEq+SI+ccXdI7S0f1s5VS6/L
 o34w6EX4n/44n/U0PsXQAJFPqXbNk+2Z1zG8yCUqpxE5ulIsC/hzwwYP23+YrgRarvOJ
 tzCbxjOK506U+jKNsnqp9z4auT752JQInggUpbYdj9WMOYl7zLmvxCR0Rs+8sFTDgGNI
 0Ddw==
X-Gm-Message-State: AOAM530cwTHCOshvGqZ2PRJpz/7SJ/3hfcTrPSEud/ty6GkRPD288GS6
 gs+inNLp0X0+UfdZzSASye04FA==
X-Google-Smtp-Source: ABdhPJxwZBpqyHMhoZuygpNWYUfbP5yvGM08Y0g7aV/KH3CKQQi1hktumJYy7eBhcZUEW+HdvPzMHg==
X-Received: by 2002:a17:907:1b0b:: with SMTP id
 mp11mr22558285ejc.499.1643740912357; 
 Tue, 01 Feb 2022 10:41:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k24sm13394530ejv.179.2022.02.01.10.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:41:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 812CB1FFB7;
 Tue,  1 Feb 2022 18:41:50 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/20] tcg/i386: Detect AVX512
Date: Tue, 01 Feb 2022 18:41:37 +0000
In-reply-to: <20211218194250.247633-6-richard.henderson@linaro.org>
Message-ID: <87tudiwhsh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There are some operation sizes in some subsets of AVX512 that
> are missing from previous iterations of AVX.  Detect them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Hard for me to test but the code looks sane

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

