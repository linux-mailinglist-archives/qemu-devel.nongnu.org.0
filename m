Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ABF5452CC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:18:32 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLnj-0007bO-CP
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKR9-0006YF-BR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:51:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzKR2-0005Hd-QT
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:51:03 -0400
Received: by mail-wr1-x436.google.com with SMTP id k19so32974946wrd.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Uc6zJq/YIqlpo5bfUaElkj5FEeGG7qb06TppnKbt5VM=;
 b=Hy1cFYTPxSYWxuKdMX0uxK647jnNIRcYNQ7Of9mFn9RVQbXJh9dmo0fwjDo1dPlDfF
 qg+IfaPXuSXipAvP9X1wVx7nKyKg2m2Ro6HqXs/doR9dTnopnFKfvil2Z+a9vFSgHypE
 tJXzWUn5mjkczEWxhHmFyjDyc1o0AfTGVbHqCvV23zcuVda8vbIG6P7yqy1TaKZ8u2Im
 OTmfaaov3Cnf2RQ3oP+wOMcPIxlYCbBF8FRVX0LVcD+MlDajmBOHMDgCtZzTZsmcA4LF
 qPJM9XBjdQEs24rt6BUmEkpQtR1tVWNnRqPS8Q+lB2eOoiY+S53cEX4qb3/DTrY4h7p+
 WTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Uc6zJq/YIqlpo5bfUaElkj5FEeGG7qb06TppnKbt5VM=;
 b=aMeucZtnDa5mB3sS+OZf9SuHy28lXSvX/SNQStxZ0Px4IKz97WuCt4CDK8wTksKZGB
 6EYkoZdqI0BOVS1xedCUsjuwPwigQUXihoxbGmW9PnF3OG48JdjMJQ2yHZPdgBn9Ldyf
 Pwo7CozremA0Bf5esATiRWp9jGTIzBfDUKBUcYuptwOsYFEqTpfmd5hhM5UF0L+xOjMa
 nTMiWezDSDSUwGhckUeqk/jCEbp2166R5ai0uJcr54hD6UI/bK6P8psMIDaz4uHcZURE
 hXx9k8BU9h88n9uNUnA2uJ6fFmkYyvitTN26gI/kkUCuCmtHfYI6SCdnjWRiCOW0h3FE
 +9nw==
X-Gm-Message-State: AOAM5321Gc0pTjURb/Zj9hPHeK97eQ/BFl7NrBKWrX5YMjfCX3ugywSY
 hRO2IF9U7HxkfKxtEENBB2z3BQ==
X-Google-Smtp-Source: ABdhPJzJINNV+RIXt01p2oJrcEHPifMluIjpm81t4EBVUBIxmXeOyquX5QH01B6gJpu2ORu64fQ+Og==
X-Received: by 2002:a5d:594f:0:b0:213:d715:cec7 with SMTP id
 e15-20020a5d594f000000b00213d715cec7mr34224801wri.44.1654789859117; 
 Thu, 09 Jun 2022 08:50:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b0039c5497deccsm3925965wms.1.2022.06.09.08.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 08:50:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 768641FFB7;
 Thu,  9 Jun 2022 16:50:57 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-19-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 18/53] include/exec: Define errno values in gdbstub.h
Date: Thu, 09 Jun 2022 16:50:52 +0100
In-reply-to: <20220607204557.658541-19-richard.henderson@linaro.org>
Message-ID: <87bkv1sun2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Define constants for the errno values defined by the
> gdb remote fileio protocol.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

