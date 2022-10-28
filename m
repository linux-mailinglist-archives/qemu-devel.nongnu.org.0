Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7961145E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 16:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooQFP-0001ez-R3; Fri, 28 Oct 2022 10:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ooQEt-0001dP-F0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 10:21:45 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ooQEr-0005uR-Pd
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 10:21:39 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 14-20020a05600c228e00b003cf4eaef74eso3581129wmf.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fkHxA3Mf/IYw86oUgnrIAfDqw+uub+V8n7v8t5zA3U=;
 b=chXw963IoDznHqvCqd68KDWF6k0brL2vX2BJ+M8RDPziC4lox9aRmQzTQSQZDtbW2D
 r8/90TKNWJbXC6qsssSdwCmr9r05fNAORQvud5Lx3aKjNaaa/dsJnNR4ml685T/o2EW7
 uw35KjFLtJCnB7NKbWgWHoyVENljPG2tu98/FfgfqMq+hj/d+WaZUpbbZbMqUnQdGlWF
 ClEDhtto3rmMXnsKajpKYoa+u4FMaik9WmgeKthQnK8afjy4TL0CmB9z0siTncr7yk6u
 /qt02r0nYpHKR++5QMWhshkOFMCR45omm47kOR75cb5S17LwchONrFR2eEFCxZ/KGLgv
 Z61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9fkHxA3Mf/IYw86oUgnrIAfDqw+uub+V8n7v8t5zA3U=;
 b=kh56jXvkpiMubzXwH4v2UCGd9VyPgx8yJnt1MI77Co1zcSiqf0kgEJk2XgO6lQUmXw
 xxMdAoYfjHA03kTm5sc2zdLP1spLQODWiYuVhGAIGy2hnqzcIExF/adfkl50dcFfPdz4
 GrfDxF8t7D54yiAjPU7oiQp6bG7NZelHRhvzySwlZAgLxpsKuOR74KbeFLpDpIhHQTOd
 HwWrnp5Hv8Rp+u43dggaGfWbISdl23Y5x5jth9BvnMWML4jU+o1LcVfsVaCIl2uXwr4M
 hGBOJBHKxN/Z7avbBjxuBLy1NoI3/7SLcl2EQadIgXksp4C3tBWjfKaOkse9JE1QiI2Y
 pQcg==
X-Gm-Message-State: ACrzQf0jIpU04fl5Tv6f1nrm5HidOwSveHAPFLQEB2aLGR1cNgQEmSrK
 wHeWTgmRQ7r8RrH0syfGTne5aw==
X-Google-Smtp-Source: AMsMyM7Whq1xlRg6RbXQ9HIaiOAhJtQrYTpC5bYEswsHeoyzwTphxuKjzRPgv2e8bztoVDnqfPNpWA==
X-Received: by 2002:a05:600c:3d08:b0:3c6:fb56:ac9f with SMTP id
 bh8-20020a05600c3d0800b003c6fb56ac9fmr9935939wmb.193.1666966894986; 
 Fri, 28 Oct 2022 07:21:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a5d6345000000b002368a6deaf8sm3722384wrw.57.2022.10.28.07.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 07:21:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A1F471FFB7;
 Fri, 28 Oct 2022 15:21:33 +0100 (BST)
References: <20221028124227.2354792-1-iii@linux.ibm.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] accel/tcg: Fix concurrent pthread_create() and
 munmap()
Date: Fri, 28 Oct 2022 15:14:59 +0100
In-reply-to: <20221028124227.2354792-1-iii@linux.ibm.com>
Message-ID: <87h6zoyqoi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Hi,
>
> This is a fix for the issue reported in [1].
> Patch 1 is the fix itself, patch 2 is the test/reproducer.
>
> By the way, I noticed that there is no code to free tb_jmp_cache, and
> object_finalize(CPUState) is never called - in case of system emulation
> this is fine, but what about linux-user?

We definitely have a memory leak here. The last attempt to properly
finalize CPUState failed because we have duplicate pointers to the
cpregs structures that end up in generated code. See:

  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02819.html

>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05181.html
>
> Best regards,
> Ilya
>
> Ilya Leoshkevich (2):
>   accel/tcg: Fix concurrent pthread_create() and munmap()
>   tests/tcg/multiarch: Add munmap-pthread.c
>
>  accel/tcg/tb-maint.c                 |  5 ++
>  tests/tcg/multiarch/Makefile.target  |  3 ++
>  tests/tcg/multiarch/munmap-pthread.c | 71 ++++++++++++++++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 tests/tcg/multiarch/munmap-pthread.c


--=20
Alex Benn=C3=A9e

