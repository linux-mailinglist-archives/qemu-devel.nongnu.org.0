Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE66AB18F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYs29-0005MT-50; Sun, 05 Mar 2023 12:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYs20-0005Jz-TM
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:20:24 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYs1u-0005ux-Vf
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:20:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id r18so6672302wrx.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMoZFZqSABbgvw3tiXOu+mUiMejb07anQ1l5XcqL3HY=;
 b=P83Ondh+WbAW2aO9eqtotywgpwjtuKBPkyT8f+6jU5CwrU2ab2Rfu/G3J891slIL7P
 VBwOrWGxF/5vXX4iAYuQXiy1VNiLORUfGXPCwOea6HvTb91GBawe4fuZpB8knfItdmRo
 yGBfabPp2aNvqnaJqq4aBMkqHtAAZE8lduu8OHaDEZmWm/OxudXr1F3MGZHFilKsM+ql
 PRtWh8RMn3YutNZdGwdpMFpcvmbYmzdjiDB4rnRTY1PFJFR9EClnrB96l/Z+F4tK7H6E
 QkNoDwLtWDwJA5w/nbroBJ75lOK+miIZK8d7wUBaOHNbdWaowJwceo6xMp7m3T/JSVFf
 jKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kMoZFZqSABbgvw3tiXOu+mUiMejb07anQ1l5XcqL3HY=;
 b=Pwu7jHE3LT4mREkJIvZ/X8TN4my/zDuG0d7szbAYwx8ucI9FMGWuDZPhxlf5ji/GCR
 WUlw7acN0X3uJKh9K27MZiF/+4MM1RzWJF70q9khDiSuuiTXGpRE0d0dvd5lbngkaxAZ
 2vRC2xYCmkz32+ZL4p4ol8Gn7w9XumQbUBTWB33cNPKHjv3Rg2UF3xiBAeaClHSPRDWr
 xDMWB5P2OEeng3Gy9HlkfO/3eDfgckwu6DHwg9GtHJs0e+nSg+mCcwy2XqaPrPCgI3LP
 8dFQqqABAqOtKG7iJARG/q8+HhZN/cUviO/NPurL8nODgXXlFiNjalU70IODR3h6y3PS
 Cjpg==
X-Gm-Message-State: AO0yUKX9cGCVNPtHk0gkkfr9tlI0uLDdjip+KQ9KUkC6RTYetVOYmb8m
 CWdgXN9SgmiTjnCv5CeDm8nwDke5vsUMKb90sgU=
X-Google-Smtp-Source: AK7set/9KxWjdCRMCQAf1c/qpMpgXwaveYC5QK4MDcJ4CM6HRhVFcpBBB2SDckkqlLQAxijNLuDHpA==
X-Received: by 2002:adf:ee4c:0:b0:2cd:8237:345b with SMTP id
 w12-20020adfee4c000000b002cd8237345bmr5855038wro.9.1678036806564; 
 Sun, 05 Mar 2023 09:20:06 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4581000000b002c55551e6e9sm7833415wrq.108.2023.03.05.09.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 09:20:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 047AD1FFB7;
 Sun,  5 Mar 2023 17:20:06 +0000 (GMT)
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-21-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 20/20] tcg: Create tcg/tcg-temp-internal.h
Date: Sun, 05 Mar 2023 17:20:01 +0000
In-reply-to: <20230304181900.1097116-21-richard.henderson@linaro.org>
Message-ID: <87bkl72jzt.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> Move the tcg_temp_free_* and tcg_temp_ebb_new_* declarations
> and inlines to the new header.  These are private to the
> implementation, and will prevent tcg_temp_free_* from creeping
> back into the guest front ends.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

