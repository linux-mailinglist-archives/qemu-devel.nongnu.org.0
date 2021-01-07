Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054612ED4BA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:49:10 +0100 (CET)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxYTE-0002WP-M8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYQf-0001hZ-MR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:46:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxYQd-00073c-4Y
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:46:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id dk8so8442758edb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QORxvQQGcqsCzWuVmsLL8k9lF5JX+K+N8q2BxtmPHPs=;
 b=ackduXaFQRFn+Cz5PxZJqBKKSTElw+nreiULK7avFHw6q2PSmtl1zdY9kI+DnGxeGn
 T8o56CD7jMGy0gsHch3vGDv9bdRMszh3CLPKnJj3PhcAa4UAzin+94aXjKvCb8DbbzzU
 sViKh9u1OMRwJSK/KC2vJEKZz19tndThWKVB7jq+7sXP7QIvHke2Y/YEV+UJX/4DZWcc
 SeJC3KD+/mMr6nnpFEeb+RovLkuZLHPU1UEdsFDnxr6G5TkajX1lKrF4cY+M7aHRBxCL
 oWxg1f450/Oj8wTHGqps2GgIpPw51bBEfu8XF7UUVR0zdXHYRKlPHesXWm9TGMhm7f4o
 BlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QORxvQQGcqsCzWuVmsLL8k9lF5JX+K+N8q2BxtmPHPs=;
 b=AJNY09dqsFlfy7LhvU17MJHbHv2/0OdJqh8AGP1rtAux7Hqd9k1+mNkhHlqBu7Casl
 GFxkc4XfA2fq4WF8n19f6Qd1sGYpfnq3LXuK5xsjYlp15bW33k9suPkwD0qIcWXwmi30
 7WZZWDF30reQ8q3D/+pR0sn3lm7BqPdAflpg5bOX5vo8gr7r1VmBD2j6pNoNLVnatXwo
 Th0Aep0OYoJSjdbUSSznCK1cHco7VTnmazaDD0MQXnFLZ/wpESV7IGm5kFWi6mICJav0
 ovNvFLGOmf1p0m67NnlECNxCzUFKHn5F2UoxrfFxJwI6dsGEXEqN1n8vDTauSpjyrb1K
 tSsw==
X-Gm-Message-State: AOAM532OK0yUJKpTvDhXIUzsxh2Qz/rJRVm03GHUsrYwUAortulcc/T1
 /04lbSyvCWwI8vj/jG1zqj+9LOb7lG/RZYWIDosacQ==
X-Google-Smtp-Source: ABdhPJwBLUeXOxHyz0Py2exTXugxSfPAnZhe5LJ5H9ItkIMZtyDnWnLn8ifyJV7JxMl+Eju3PTATIu25xVrojoHFdBs=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2281070edw.52.1610037985683;
 Thu, 07 Jan 2021 08:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-17-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:46:14 +0000
Message-ID: <CAFEAcA_uSEmN-RmKVRT-+7XNOh05NF4j8MbqAWdrheoZ88fwGw@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] target/arm: Enforce alignment for VLDn/VSTn
 (single)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c.inc | 48 ++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 6 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

