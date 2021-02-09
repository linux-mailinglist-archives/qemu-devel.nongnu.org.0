Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643C31547F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:57:29 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9WKM-0004KC-Fl
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9WFW-0000qn-7O
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:52:26 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9WFT-000852-GD
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:52:25 -0500
Received: by mail-wm1-x329.google.com with SMTP id t142so3874556wmt.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 08:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cA+zyl5zHAWOjtqd0gcRdklJMxfmrOSCUuAqpQDHGNg=;
 b=oQHov+45V5omw2rWG4sLHDcjbuQJm6ZAPmGTeTrzBB+FsWX1TKt6uynl7NEJgMY2Kk
 zG8OFcYEF8eGAhpn6cUrgpV2ODVb/mODYAUcIZeae/DQ4kcMALh9QX819St/+Lm4/ppF
 cfIUMu6xSUBikYADlEY3S7kEYu9bywZy20XeYfDpWGZ57CvGUk2rI/xX5Te8cmIJ1jpO
 AKM30CC5WaeqptSt9R+M60BjDQzbMeowbG0wJHCOR3Zh5CXrsl4TftBUdv31Z4DesY+c
 WH8M+4OOURDojFb9qb7OdRGDNckBgT4zctannt2HpyxuRSACan2wxnxLNb2sQab1U1pl
 7HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cA+zyl5zHAWOjtqd0gcRdklJMxfmrOSCUuAqpQDHGNg=;
 b=s64+jledxGRJxnUMriwcTwTeyxlvu+22G3G4Vr9ZP/osvRtliMMolZ2hJRb8uyGqJC
 lnKx2q7RxgJRxLT3yFLtuVtxBcX/fhDsbHTYNQjf7ni+grAaK5aFKj7zAQy+8t2kY+YW
 h2myz8v5eC3qlA9VrBLA0vfEKy+JT5UWaK7BA8swnpvO+bsV2AvHlYkD+BQWuLOgrsS5
 OCqgR7AkWXCNPTa4df3hc7LIU3baYlltkyyyEwcIz+5AgwdNRRedqC9D9YigYqUSCRzC
 EHjA8Dte2/9LbH+LY/gqqs8XNJ7MulhR67e8Tk8DM/F/++z+fqp9vjOAIUf2gntenxpO
 gVoQ==
X-Gm-Message-State: AOAM532Gbv335kJpjmLjRpnt7UkMWEwcLvHKXktc9S2cocs+AXmlwvmU
 ON0mVxouskeEPuwhPLf+3nGfTg==
X-Google-Smtp-Source: ABdhPJwOBcvL3IiGiUSBFpd7nURBmg6Do6/flb9pZ1pYHpHm7XQmvP3NFLBcNl894Dcbb0HMQtDmKQ==
X-Received: by 2002:a1c:f60b:: with SMTP id w11mr4252277wmc.3.1612889540330;
 Tue, 09 Feb 2021 08:52:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m131sm6003096wmf.41.2021.02.09.08.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 08:52:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 696E21FF7E;
 Tue,  9 Feb 2021 16:52:18 +0000 (GMT)
References: <20210208233906.479571-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/4] accel/tcg: Create io_recompile_replay_branch hook
Date: Tue, 09 Feb 2021 16:51:31 +0000
In-reply-to: <20210208233906.479571-1-richard.henderson@linaro.org>
Message-ID: <87blct9oal.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> I noticed this today while Alex and I were discussing cpu_io_recompile.
> This cleanup seems much easier now that Claudio has split out TCGCPUOps.
>
> I see that mips has a ReplayKernel test, but sh4 does not, so this
> probably has non-zero testing.

All looks good to me so have a:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for the series. I'm going to re-post with the patches I've added to make
one nice clean-up patch ;-)

>
>
> r~
>
>
> Richard Henderson (4):
>   exec: Move TranslationBlock typedef to qemu/typedefs.h
>   accel/tcg: Create io_recompile_replay_branch hook
>   target/mips: Create mips_io_recompile_replay_branch
>   target/sh4: Create superh_io_recompile_replay_branch
>
>  include/exec/tb-context.h     |  1 -
>  include/hw/core/cpu.h         |  4 +---
>  include/hw/core/tcg-cpu-ops.h | 13 +++++++++++--
>  include/qemu/typedefs.h       |  1 +
>  target/arm/internals.h        |  3 +--
>  accel/tcg/translate-all.c     | 31 ++++++++++---------------------
>  target/cris/translate.c       |  2 +-
>  target/lm32/translate.c       |  2 +-
>  target/mips/cpu.c             | 18 ++++++++++++++++++
>  target/moxie/translate.c      |  2 +-
>  target/sh4/cpu.c              | 18 ++++++++++++++++++
>  target/unicore32/translate.c  |  2 +-
>  12 files changed, 64 insertions(+), 33 deletions(-)


--=20
Alex Benn=C3=A9e

