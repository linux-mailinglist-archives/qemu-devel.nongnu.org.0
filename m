Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15246FDE59
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:17:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwjhV-0004x8-Dn; Wed, 10 May 2023 09:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjhT-0004wB-A8
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:17:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjhR-0003mp-E9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:17:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so51446525e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724664; x=1686316664;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=iZs+aJT7D9xRmbb5tR0YQhjxdelKCGKqh3+CtZhMoMZi4eKIG0g01UzmCy4WjnXhZU
 TDaT3o109yRLm3lpMGWOkqbErQkVnEhw2zIhmCQLtbs9WqUu38KZ9j0JtRQQCxSbkfRk
 VLKq62hOHSNmqFsw+d4Q0vQLyvaTnYnd4sH1c3VVnAje6ndktM7J+8VxHVuJLx/n6G9f
 2TreLAR48Kat0OBuKY/P4ag9HDtYGRk0Yfp4SBcOi8SlJZge8vHaG7LtpNdgps/ZewWx
 CaTKLthBEyFXOixiOz+sx3IMnXFE9YYzz3MkUkRhzU2/FL8SnoldnnKLM+g/Afnpau/r
 dm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724664; x=1686316664;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hFriCZonhOuk6sv5IQYLJJX2xl2EvXiMAlMqHv/V1Yk=;
 b=BStxioK73L3duNwHS/3Vs8ABfH3EQQYAZ/zJCpqWsM7WV30say4R9Bn9tMhV8J6NS0
 /hQ7tyb52Rl6jpJbrlq3db9hhc7TdCGctQaepkno22fD0ZH0QAeFpHnmELMKPsyZBq/w
 JDvlxbPsid6vFqXtIyD4TFlkG02yY2DDPYXGz+dqE3xSByjLhkDquyGhqmQQ5jywxkIN
 UGpUBaWF0zm4V5hVWqUSp8m+iHMdag0qafkxlabXJyvsx2q1Siu1oGKmxtG4oAkoUzfM
 n7OA7BsB2VND9dkAgSt7N21XCXN0gHVyNBHjqTR2yGT+UEhdBGByYiUKH/ruPrXZ+sFJ
 +sGA==
X-Gm-Message-State: AC+VfDwPIdRDc9j10C2SHoon5cPPQFbMvlXrMzoHSTTs5Me0mQr9uce0
 aq7aDteDPi9V883zxcPVtcdvdQ==
X-Google-Smtp-Source: ACHHUZ45pFE5DSmDCOoMgBcrdPyfL29FaJQVMIYRcYfDbdk3ItROYy0dA4WSKqzqwLVk6WlbI+5CFw==
X-Received: by 2002:a7b:ca42:0:b0:3f1:6fb3:ffcc with SMTP id
 m2-20020a7bca42000000b003f16fb3ffccmr11524030wml.22.1683724663793; 
 Wed, 10 May 2023 06:17:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a5d4e49000000b003047ea78b42sm17117181wrt.43.2023.05.10.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:17:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20A431FFBB;
 Wed, 10 May 2023 14:17:43 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-16-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 15/30] tcg/loongarch64: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed, 10 May 2023 14:17:33 +0100
In-reply-to: <20230506072235.597467-16-richard.henderson@linaro.org>
Message-ID: <87y1lw72bs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

