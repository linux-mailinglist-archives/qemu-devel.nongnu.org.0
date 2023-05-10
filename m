Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029D6FDEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:44:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwk6a-0000In-Q3; Wed, 10 May 2023 09:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk6I-0000Gx-DK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:43:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwk6F-0000Qp-W5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:43:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso5418315e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683726201; x=1686318201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkdhEp5KLEKdXOq61mIo8u70VbTpAeq0C8R08mAZ3PA=;
 b=M7mkloJmByrwFy9/aVAiU0Mo4y2T/hqN1UOU8OICoAw/l7B0txlL5Qq4WaCUu+V0n6
 s+yj+u7en9M6ib7IG6zQ4KKl2LaNIFmvrfyiXU36/qeRJNVAgJn1bmAEfyg18RSdllpp
 AT6cipyqPJOpz7wm5D8H7+v/6snVhSdQJAVP0yB1Ocpws9BkH8VBMczFmJEK9shFSkRo
 LIZ0TpGmElNNmWwLrq66aUvClm0uV/73yNAV+WJdjgjMpAOreauUMJDJt54Pm/ssgEAS
 ViBUwBz8AGeABRqwtDi57NDMYIE0w4ziDSturtUytkn0IFXRP3JRYN8KobTcz+2PKiQq
 jnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683726201; x=1686318201;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WkdhEp5KLEKdXOq61mIo8u70VbTpAeq0C8R08mAZ3PA=;
 b=dOzTEgwfQsNIvkagvvep/LyqD4tcYzee3sVrWIm3QkfLc86dEjqkwt0O2xXZAUiI8r
 r/MQ4GwXP2/FX2aQgoa9n4eD0P/Q8IGG7bkYXixG1kFxWsvvw30VshHkWjPbJpgZcNjj
 8q4IPdjv4CiTPv5DTdDvD4htRDQgODI+JAuepF+xCTXF3X9dFBVlnt6Siqrdcgb1TjgK
 UnyRUOrHmbRIHPB2K5vEEmUgtrN7mYWU07WzvbjDvLf4QfXyPUECBbpThKnsRIPtIeOb
 WJ0LAqBRYWZDL52I0xM2MNVA/XXbMX0tTNSOhHm3GHbaPZBZH3eNPa9zeoROMIdQv2G+
 fLFQ==
X-Gm-Message-State: AC+VfDxR6diz1Ra/CEqyDgd7R9HpAP4KsIx08LWWOjVMDgOn7KplSxua
 suT0P1aDvSFEYBY1sv3FsTAmeg==
X-Google-Smtp-Source: ACHHUZ6rJepGcEv7K4sWITs+/dbZS5wFj+Zx3PUny8bhgzBL7GGc8WcFLtmQ0r+kVOgtjQeM+qDx9Q==
X-Received: by 2002:a7b:c855:0:b0:3f4:23e5:5bb0 with SMTP id
 c21-20020a7bc855000000b003f423e55bb0mr8350887wml.5.1683726201283; 
 Wed, 10 May 2023 06:43:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a05600c114900b003f4069417absm20013355wmz.24.2023.05.10.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:43:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DEF1FFBB;
 Wed, 10 May 2023 14:43:20 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-21-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 20/30] tcg/loongarch64: Simplify constraints on
 qemu_ld/st
Date: Wed, 10 May 2023 14:43:10 +0100
In-reply-to: <20230506072235.597467-21-richard.henderson@linaro.org>
Message-ID: <87cz387153.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> The softmmu tlb uses TCG_REG_TMP[0-2], not any of the normally available
> registers.  Now that we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

