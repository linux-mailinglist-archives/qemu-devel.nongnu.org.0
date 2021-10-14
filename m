Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745142D659
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:44:54 +0200 (CEST)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxID-0005Cp-6J
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxGp-0004Iw-Eg
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:43:29 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxGn-0004Ej-QZ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:43:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id e3so17325953wrc.11
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CW/i44+5GFci/CQCpEnbw0ZqdzEJ2QvR+WYnick/Z4Q=;
 b=rDVZi7G0U9+j7WgDSXbaeQjM8ZWVF7dZiVtFcogyLPKlgWwHjJxkJ0zAjNXd/bdRcg
 o3k/0viEhI0vwlcQ/jgF5WcY49twBO2o1GwYTvPO4pOImUkXWnAWk1jg8cNU6Mn8lm7F
 8se5VtjQdnwaI+jfPuQC4ZcBjRBXFLLaqE3y7g19+Cn1vcOno1J9iiCXbgl3290M5/x3
 cwx5a4UIs8isrgzCnoj1XaNUrMzQTP/BiG5cUad5DAJbZczpZrMnqslea0Ms4IDaJjH7
 nyCOQx9tGgPXg4MsZEPYSTFPvI/Ft12VeHnusxpzNZUYlGLmzQRL8gQZW0EKgUm730w4
 esgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CW/i44+5GFci/CQCpEnbw0ZqdzEJ2QvR+WYnick/Z4Q=;
 b=qo2Mf/dw+42pSqqsEMcRZqX068BIjv0XwxNslRmSulxV0SWCIzMV+Fg4zKR/q8JGmg
 ySEqbveCbWZrDesXt0atHoeLOsuKzKza4ClZhkMnvgNYOKFNahPPLVmemtf7VJ+WkRlc
 zJooKEVMv6GQr6wFnFRkkBq3WP4fSmp/3K5duiG2C7Q8iEt/kwSFuyqRzfleJ36QGEeI
 plg0g8mxEtowGReyLVB3fwKgcuumQgFhx9A+gH0gsgnRZ229ZGia3qLsIs2NqqnAYUE3
 EwvPlsYnjwR/FcFvnuP6y3GFGS7X9To/j2Y9NAlDu1j1OeYa9nzWMvGeT5OIVkMaMXqd
 0qmQ==
X-Gm-Message-State: AOAM532UUDgFuv/bJ80Vn+yxW2LbpRzkd+lkMqcSx2s1N1LoUwdXzfgR
 evsDFsGNuoJPXqma6PPZ0rBV6A==
X-Google-Smtp-Source: ABdhPJw9XV/lq2XtWtCLYtXAKmkbA3oUf06FjchZGpPmN+tXFHqRbuuasJpWiD3tW2SyX+tTSuKe2g==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr18364925wmj.84.1634204602939; 
 Thu, 14 Oct 2021 02:43:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z8sm1920994wrq.16.2021.10.14.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:43:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 55FEB1FF96;
 Thu, 14 Oct 2021 10:43:21 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/9] linux-user/nios2: Fixes for signal frame setup
Date: Thu, 14 Oct 2021 10:43:16 +0100
In-reply-to: <20211001153347.1736014-6-richard.henderson@linaro.org>
Message-ID: <87a6jcuekm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>, crwulff@gmail.com,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not confuse host and guest addresses.  Lock and unlock
> the target_rt_sigframe structure in setup_rt_sigframe.
>
> Since rt_setup_ucontext always returns 0, drop the return
> value entirely.  This eliminates the only write to the err
> variable in setup_rt_sigframe.
>
> Always copy the siginfo structure.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210924165926.752809-19-richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

