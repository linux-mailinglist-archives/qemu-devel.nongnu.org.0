Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CD30C314
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:10:44 +0100 (CET)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xKF-0003lM-C2
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ww3-00072E-P0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:45:46 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wvu-0002rF-Su
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:45:41 -0500
Received: by mail-ej1-x630.google.com with SMTP id f14so6089169ejc.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NhvHs1THSPQDCVxBlFl2k8oaKMQ8i4aA7YKrysQJrcc=;
 b=fVrj+BC7/4LHldrN5r8CK7GO1jLox3LPlzqAGaat4bOv+ATT3BT2XLFNAcZga5S2lC
 QUda3avnzYGKv1v927mwVB2rqljYDMO8BBfJRKvnVC9Fs6mqHB07RVe0Rbui4JyoMcrE
 AwztcIGrRAt3m4X77Afbh/PJkSSFU/zgVRFD/kLu0z+nudS3Y03odNb2/Df95rgKg+AJ
 xxSXf20HRjNAYPY11Ms2hxtsVaKk3SsUtA37ZDzBB0NcgY2Ditd89QB6vfhkDzsLnrPw
 D/6MKGt7urTYtaAJrAGgPd4aKn2Bmk54W5Ove0ctn++yQ98BzDk0j8rqubb4Tmo7Sb+B
 21CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NhvHs1THSPQDCVxBlFl2k8oaKMQ8i4aA7YKrysQJrcc=;
 b=k+4DC9kuxSN8yvdHEa0Iw53isNEcdmW2jHgAmO1vxl6E9qBZfMMGN26VQH7FShkWRu
 ldLyIRNbDX+BBb1xV0bNikx3YqZXmfMU90tba67SIcKNSg0lnMQbAFsJeh37x3PaoXkp
 RO0mqjUIqJ3mYJa16+jLHG5VvAbBEQ3yEb9Rxzq3SGC3QO2ACVtHX9d9BO8QANz4LYFz
 GudF0BWaqi0FMjl5KM7wzqIE7nppAKkKcNGDwRv9llg4YNRGRx1cyZsixY7MIOwKlNkc
 E3ah3l7yZpy3tNtTUhxuQpzeNMw2rMJHRzc4Yyvpg94DRl+8kESYZbdH0VQ2yqqJH34T
 kmdw==
X-Gm-Message-State: AOAM530nHE1JJ21sprmZgsJo/epmR/zA7aZomC8WLo3e8DPereDf/5Zl
 +vWg3w26vVjXaAwwsWlXuELFdpqmshCwu372CK49sMG6hD0=
X-Google-Smtp-Source: ABdhPJwF4HWg1cNCUhAySVHdLRFj9Mhb23SV7hxDAnJgppAkXfMoff7jHOlO5qD64E3sTG/nAtVyKGJ8XBYa6FwUDxg=
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr22540063ejv.4.1612277132258; 
 Tue, 02 Feb 2021 06:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-20-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:45:21 +0000
Message-ID: <CAFEAcA-YGbEXDJB5HBHEihVL1h4bYcJ0AsHQ8LR8TOezPTYPFg@mail.gmail.com>
Subject: Re: [PATCH v4 19/23] linux-user/aarch64: Signal SEGV_MTESERR for sync
 tag check fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h | 2 ++
>  linux-user/aarch64/cpu_loop.c      | 3 +++
>  2 files changed, 5 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

