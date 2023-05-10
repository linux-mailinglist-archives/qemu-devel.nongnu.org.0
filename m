Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF286FDEBF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk4G-0005DG-4j; Wed, 10 May 2023 09:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk4C-0005Bo-Js
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk46-0008DR-9D
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:41:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so3731835e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726068; x=1686318068;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rnf9Eoqgvr831wszE6QYdNiWnaNBmkEZZwX9tcpWpVw=;
 b=unHxTO2ck2D4IzCcah0Xg9bCM7MFm2ayUXJBekyqWJuxpVNMJS3fT0DniV4OqbbS78
 +J980DuqTcBsEAFwy9teQqxQ2MuDvu0TT3BIYftaAh89oE5FvdvuFf2/TFRwTimGAnFo
 pCg8HZxNhbLRZKpxMvTQiPttUnGxrq1G5OVETzgoVmFFihbVd2aN7zF569CaLD+TXGeR
 9qPpRlgCiD+wNwux7N2gIOGy6qNlyDaQ6QGJCJfFSw9sNI6DzboIDvG5LaxuAd+P5IkG
 7x1bb4vC2ydmV0rbQeoDEJZgmBY4d/Lo5VQ22ZSHmZ9aPuKTP0CBgMUvHCFovVV7IUiN
 CYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726068; x=1686318068;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rnf9Eoqgvr831wszE6QYdNiWnaNBmkEZZwX9tcpWpVw=;
 b=WddVyDrJ3r9TavER2Yb4WCl9rYUR9IVyWAhnUBuVFrx81l6HtmsMXbfmzMO6bC+kcB
 Nz/034b3rb1osTbOqgG/0i9mkHCMj975sLO2vsTQOcNf/APCfmU2E0Ebkbp/D84XPYkw
 5Y2jrOVhqE7yCHOrBQIVTC9fm1b2K3ppRBPr+mf83Is18ziQQofs31RfNY+2QSrbJO7v
 m2p7414sf2U8eJDAblnOizIkKSXTAbfYj3ekkXua/YYs+Fm+U498TfvuOULxaQ/+qAWB
 iEOLhJjAHwloRHpdVQFdCjpdP0MebyhuoMJ9VCljmMyO8RfazODmW5688mDz0hW9WKc/
 VSQA==
X-Gm-Message-State: AC+VfDwvT9L4CyZ2KHSP9hyFdg/hhucryQcEy73S6213ROUfTNC355tG
 3cJTWL+7I11zcI4GbI/P+d6quA==
X-Google-Smtp-Source: ACHHUZ6NWg9JbDWyzHw02oqmjmHT+PtyAg84hM8b6slhiKz0o7dizDc+CgnesqoqaV2Isp1U9X6zzA==
X-Received: by 2002:a05:600c:214f:b0:3f4:23b9:eed2 with SMTP id
 v15-20020a05600c214f00b003f423b9eed2mr7710410wml.38.1683726068589; 
 Wed, 10 May 2023 06:41:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a7bc44f000000b003f4e3ed98ffsm870308wmi.35.2023.05.10.06.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:41:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E45561FFBB;
 Wed, 10 May 2023 14:41:07 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-19-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 18/30] tcg/riscv: Convert tcg_out_qemu_{ld,
 st}_slow_path
Date: Wed, 10 May 2023 14:40:55 +0100
In-reply-to: <20230506072235.597467-19-richard.henderson@linaro.org>
Message-ID: <87lehw718s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

