Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA66FDE49
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:15:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwjex-0002wq-RQ; Wed, 10 May 2023 09:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjer-0002ry-Vy
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:15:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjee-00036E-Bk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:15:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-306dbad5182so4679976f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724491; x=1686316491;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=W/YEkqbHr2r8kKhOn1J2A8kyfPFoZpN4vRaVbyZU6JulNm5csFzslGTd2enNXKi2Ti
 sHRC/uWeKN0xS7d2P8h9olD2j6BlX88wBIwO5dMqbpYTfgO0AZSEN1S58zp9hid+Knr3
 J9vNf14KJ6sgsTIO65WWkFDnugZbdevGgO4Yi/IyPlZ7yDYdvILG8EoLdsEuO8P3dES3
 sj6YHOPgSTIYFBwu87jzB0N5O9iS9JVO8h6B2SeAebyINuuE2/3kom1VgTUhpNYdo42Z
 Ct0Wxv9dShhidg+JvW3+KfzdWZwJ/V8hJepPN1WGTSQbWp3klh6tKfXdgcdcGq7BI7y6
 ZAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724491; x=1686316491;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=jU+opc9xVzM+JFMI//HeSc42x0PSE9UF++LZkg9G7VjQn+mBt6H3+iELYWmvWRbqgu
 /r9sJ5GQt0n0seeVMbewlveSIWtDLAX44N1ir3uWAFmWzSyOzmrfvxEkx60UgJMK2Tjh
 SHd7w1+V1LM1D+WQTeUexx3Ocd+l9UUW320GPyCLD+ecU+Yi+/fajdgHGjt/3ShXOInF
 gFuHMk6v8eumY73BZSMwpUKjJv2paC/4/3/ubIjHwL6l3nx4i8G0WbLGQ2fImAshlLHM
 3n2h0tfVT+lGuN6w5J9dhlrXWZ7NKcfPF33ReDsCeklKxmak/rfve4MzSkitE+t+yu8J
 SsZw==
X-Gm-Message-State: AC+VfDynoInx/RnDsaLE2vvboeEXWLLJeaEBwbkokPqo4VESn+2WR6Mh
 gtK9TsRDmMz1o5TxL2tumABuBw==
X-Google-Smtp-Source: ACHHUZ4xr6uWpYFIm7oRBaWvh/PGpEfSu1YcaiOyf9PBY4rlbHokUD/H1DGziJFYnq7L4jykC/2I+w==
X-Received: by 2002:a5d:43c4:0:b0:2f0:2dfe:e903 with SMTP id
 v4-20020a5d43c4000000b002f02dfee903mr13236316wrr.69.1683724490832; 
 Wed, 10 May 2023 06:14:50 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b003075428aad5sm17181896wrr.29.2023.05.10.06.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:14:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 359701FFBB;
 Wed, 10 May 2023 14:14:50 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-14-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 13/30] tcg/aarch64: Convert
 tcg_out_qemu_{ld,st}_slow_path
Date: Wed, 10 May 2023 14:14:42 +0100
In-reply-to: <20230506072235.597467-14-richard.henderson@linaro.org>
Message-ID: <877ctg8h11.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Use tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

