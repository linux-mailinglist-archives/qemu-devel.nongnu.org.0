Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECD6FDF89
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:04:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkP5-0004xL-Qm; Wed, 10 May 2023 10:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkP3-0004vz-9I
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:02:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkP1-0004yu-Qx
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:02:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3063891d61aso6915514f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683727366; x=1686319366;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqTktqbT64wCFpBBNTFOe+yFwPu7SuysEIyyHMreew0=;
 b=n+Iu5doqias/uqxcKLkQfT1+nMMc3F4ssXLi/F0V1T/L1I+YNtAtNdAN50Kt2oORyc
 mwyD39+s2QxE0R9BuYqKm2dJDFBezCM93lA1kOj1wh9JjoBnKkOQ6Eah5Y1pnycRhvib
 lMCED1BWzZiLAryDMGP6DY6K0ZfkG20jfY+b3a4tKXWHaNM//u9Je+88M95PUhWY6dF9
 Sq3k9V4KyuKccGxpO7lH0obdQx8A9MJrw5iY8wpiEfJFhSgNVEi8ZDsAX0cB88tUZ8+f
 iT0jozGbAxuiieWMeGG3/7D7YW0vebHIH6NK2yXjoEDWC4DdNhC0lwdis/Enk+E1aS0l
 dbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683727366; x=1686319366;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gqTktqbT64wCFpBBNTFOe+yFwPu7SuysEIyyHMreew0=;
 b=ach6LTIHzssWOU9FRBspmTnO1Yba2iwkvX8xxcdGC9fkP/zU+7rZo9Fxu38FzhTmDK
 47SzoYGQvZ+gOSiCBISdBfuU0Taq/FQocG6rbn7MIiEehYk0K79HEeoUeo6fDinXcGfb
 PlDw+Nu6mXxx+QAG5QkAAZ5/MUkLw5i+AOgT4hlJJx+9BAKHUz2dpvYudiJy05OqpOSm
 DcjJB10ib7QB08SgA2zPFAMtak1eOkUHZoYxcSdHIA1l93HSKlTHsb6Q7DW8U5sFwuXy
 hyZH3qyqmDO7SdurhmEjEotXQF4OvzSO4qceYlNmX/f0LJVoDTwandx99fHmWuzmCRvV
 QZwA==
X-Gm-Message-State: AC+VfDzxxo64yp/jSHfGbUkazJPhGW6Y2t6p3cpPFL5lnTQm+u21HTHM
 lkiADdGJ03lL6XpAM0b86Z3rzg==
X-Google-Smtp-Source: ACHHUZ7xmA40vexMlmjH1ggyCcUDbo/R0ATKP2zhWayvWWa7S6IsTAPyXiPwNYf8yqH/qMfJqB9XtQ==
X-Received: by 2002:a5d:4c47:0:b0:306:3a16:1c2 with SMTP id
 n7-20020a5d4c47000000b003063a1601c2mr10037615wrt.12.1683727366160; 
 Wed, 10 May 2023 07:02:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c219300b003f173419e7asm22680787wme.43.2023.05.10.07.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 07:02:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6C0B31FFBB;
 Wed, 10 May 2023 15:02:45 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-31-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 30/30] tcg/s390x: Simplify constraints on qemu_ld/st
Date: Wed, 10 May 2023 15:02:36 +0100
In-reply-to: <20230506072235.597467-31-richard.henderson@linaro.org>
Message-ID: <875y905loa.fsf@linaro.org>
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

> Adjust the softmmu tlb to use R0+R1, not any of the normally available
> registers.  Since we handle overlap betwen inputs and helper arguments,
> we can allow any allocatable reg.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

