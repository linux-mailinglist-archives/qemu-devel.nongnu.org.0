Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA916FDF3C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:52:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkFB-0007kf-S2; Wed, 10 May 2023 09:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkF6-0007Mw-Gb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:52:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkF4-0002qa-TD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:52:32 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so19979605e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726749; x=1686318749;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Km2O0No0UgZfIRs2u+pBqXOPOwwviK+3JtQciljq2iw=;
 b=v52eUy8h5qBIN3XIzLajGvZJqS/VrnLvwm7oRZIucVUKDlyV+c9TBUbO+XNkZPOPE/
 uvKt3u/9X3kZ1Xo+JdejO+2vree1IgvA/44O8nULWcrkA1BEaJIl6IzuEB5zw9RNVUFU
 HUfDNDRn7z954DiPmZPvivDPpQ7LKz/0f+mC14+BCLcb7QJ0tttZvfnb1zRvvWp8dq6e
 KNEM0vaLgl3dCrzogA0dLbvCzfoy6eo67HimujHDFiyz2p84sg9rerZ5l5eCgLgcFIYm
 COtTWOC8S/JQTagkhWjLTgI3SuES1lgBg1vMHl1hZWgE8Lnfxf/8mCsuiClmxkCwspZt
 JAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726749; x=1686318749;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Km2O0No0UgZfIRs2u+pBqXOPOwwviK+3JtQciljq2iw=;
 b=Z+KAQsIhqF7DaMppRnFJj/NR9TXOWF3jCMslq8X/iYAPSKnrixyi7hzEaO1akcPi0m
 oVrj8QI2cyG78MRQ4uWf7prX9TGyNy7L+k/EBY15fZasTnD90kM/AppNvu2bPTw8K2aT
 Mun0w+hTe9XOKe5P3TF3oomnMGfbgq5OaeQDKAVTioplHY6y7Xs2L4rm8Vgg19A666XI
 AbcfEFeR02fnVoIKI6GcU6ENHPfyPb+GOo8ATwYwIWXHa1rOzCoQG5w3GunNlifxC/36
 jc7Bmg9/PHhW7taZLvMykdkffN31qXmx3R7JRqMGyuhe8JmotalvwO6IawNUQ6uEIxEh
 6X3g==
X-Gm-Message-State: AC+VfDxa5thXyWGKsEot61ZSqsTl9DjpyJEZ5H/ejVdQYKymCwsAbOdv
 dh3ksLcS8m5kujupw3E0VpCvcw==
X-Google-Smtp-Source: ACHHUZ4UrJyqQVjvk1kxnTVRcV3TDO5FwpStybvINgjZAQgylFoNmrMXYp3O3GDgKSTST4a1SRH06Q==
X-Received: by 2002:a1c:750a:0:b0:3f1:72fb:461a with SMTP id
 o10-20020a1c750a000000b003f172fb461amr11760747wmc.2.1683726749482; 
 Wed, 10 May 2023 06:52:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adff789000000b002c71b4d476asm17629555wrp.106.2023.05.10.06.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:52:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6EBB1FFBB;
 Wed, 10 May 2023 14:52:28 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-27-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Daniel
 Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 26/30] tcg/ppc: Remove unused constraints A, B, C, D
Date: Wed, 10 May 2023 14:52:19 +0100
In-reply-to: <20230506072235.597467-27-richard.henderson@linaro.org>
Message-ID: <87mt2c5m5f.fsf@linaro.org>
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

> These constraints have not been used for quite some time.
>
> Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

