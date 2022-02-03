Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A04A82BD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 11:53:08 +0100 (CET)
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZjf-0002WQ-Ar
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 05:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZi6-0000Ov-KW
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:51:30 -0500
Received: from [2a00:1450:4864:20::330] (port=44863
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFZhy-0005wx-SF
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 05:51:30 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so1513295wms.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ELhWGSKbrI6B3I5WUff+QzhoQgFikpvy3Rhw2Cysrgo=;
 b=maCj2vb8RJPSouhTMVScQK/essegr99cBNEGEMsk/9EBfvRUFy5tuxWZF7VfZXFtOh
 mLd+Lb/Cs/j5R0muZ6+lS8CqFjZGEz4shSCi7aDJYXEZGrcqo6JXyscorSyRQDf5HWob
 1DLc8kwjUJ1iZB4oePzaXagXOnOgJ4C6oop0vHbrwOCGPl+bXdqOHqXdHwHX2iyOoS3z
 x0oRossjnDQrxrHprL5JVYFEgJL1rbX3hmXU/wqUP6PxlmSijeTeqGB3RqoIgUD7tTcS
 eWcggtrLi4RiFpVZUm5jw39zAUFXQSmAvZ74dDJWJGv49tLAveJYoBR1SWdFk9VP4GsV
 85+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ELhWGSKbrI6B3I5WUff+QzhoQgFikpvy3Rhw2Cysrgo=;
 b=ZGGShVEphoVI9NiKToR41sFpqBUsN3kY/+i3m7x6LMcehq4ElDS8bcNgMTno/8t2oz
 OD9R1lzALoQzmNpq3nz3ZapGNb98LhYQtXbER1dVekwhKpQJCqfGdFYe3UAQVuJAonZa
 zJbyjWf2FxK+TVHIP1dktU6yBLSyfe5/zsXXn/8JSu5VppkHj86HPQ3XSJs5ry1qFgnO
 mxe1E1d95ayxMt3pgNjuMwoWWZd68go30fsbT4r49EjWAoNfu1kRyQWjd9U2pn6Nq41D
 9EWy72Oymx8hNd17xDodqwTnBIHr7upG63MqNTgC6+3eTUQrFDT57853GYiKJbOTnjAv
 bwtw==
X-Gm-Message-State: AOAM530aKopRMDcbnmU2bQp16JSXYe/QLoAGDXUTu/1uu15Xf9BnadYG
 UC4mJcaWW3nW2pBjjw60KnIvug==
X-Google-Smtp-Source: ABdhPJzlpxc/qwXXbhHncDpRDCmvVuH3WNOmBDi11X4/CfM3Mwyq+swb3LfIlMcgjIyLwg1iqR/c/A==
X-Received: by 2002:a05:600c:3d8c:: with SMTP id
 bi12mr9824881wmb.109.1643885474599; 
 Thu, 03 Feb 2022 02:51:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g6sm19092392wrq.97.2022.02.03.02.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:51:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B93A71FFB7;
 Thu,  3 Feb 2022 10:51:11 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-21-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 20/20] tcg/i386: Implement bitsel for avx512
Date: Thu, 03 Feb 2022 10:51:06 +0000
In-reply-to: <20211218194250.247633-21-richard.henderson@linaro.org>
Message-ID: <87h79gte8w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The general ternary logic operation can implement BITSEL.
> Funnel the 4-operand operation into three variants of the
> 3-operand instruction, depending on input operand overlap.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

