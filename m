Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA537F990
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:19:04 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCB5-0007Ld-Lt
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC97-0005mM-Q3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:17:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC8x-0002u9-Iy
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:16:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p14-20020a05600c358eb029015c01f207d7so4721228wmq.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=O0KtU/ntbmIwYWih2FrovVTaY7CG2uh/OSjBKvrV+FQ=;
 b=GCLkBydEkas+coH1MJJFGjjWnOAYaiBeGXG1WgZzx7Cb6ytV5twP6X+pE9fD51V8Ai
 OoXBFFRwqF9DlGP3a17OQr4vo76txwilrVpBkiNAPtBuApF00CWzIDUgnne2f0BF/IUe
 /4mgl7X/LeG3//SZF82/Uc7C9UKs5yRxLVXqtEeIjflyLH4FEVCm/eY8aqq+EKKi/te/
 S4Y4Kwo1aIcg8biLRFsnUsiKrSbCWOFdaVls2RKQlCSGz7jGZLJ3mnyNqDIThIhb5ugY
 PrNnTo74wU/Xt6WFE4NPvFy1V2HJVZ37mpe7/IgAwS21OjxiB58qdFEcWJJKFTI3yCqj
 P9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=O0KtU/ntbmIwYWih2FrovVTaY7CG2uh/OSjBKvrV+FQ=;
 b=hFX4UVXv0zk9MINDvhxkn1tugPTjYI3WS1seV0qndPsQWxPmDYJcEI8u84npZg+slp
 I1jbYCucievlChefeZ0GCyZheMvqnDk/lZzC5EeOEBa3havgrgwS9XmECmtASLUu61KL
 rxriBaTZTwwg6GzbwIG0nI6FDF3EjGZiZGgF+9RR//TvkiL+VJZUKsojJDhcZ79HEUkK
 wcQFDwTwO83pjmkbl1bAy1mUA5EOaA7Z/TDspOcjDYMUhOmyhMm8ryf/LsfNuD2kRazb
 6Psc8WtrrWWyLml/dqsEbQY6P2NG77iWt1j7RbdpGJW/Sw8Ca3CSXuTOmY/QnrPH+exV
 cSiw==
X-Gm-Message-State: AOAM533u1ehTq+EjAoPiaaP82nGM3MLVZnJdDWPGy+IRHqyC0tq2hE/h
 OATBBIAXuI0nPbA/V9+QUcbdOA==
X-Google-Smtp-Source: ABdhPJx2sHPDyCC9EAvZwvL6yuUjQYSLhSxb38zPvDgB78RkP6nZYC6874gqS7DX2JaCyUJeRM9IRA==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr4083945wml.107.1620915405456; 
 Thu, 13 May 2021 07:16:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm2949721wrx.96.2021.05.13.07.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:16:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14F6A1FF7E;
 Thu, 13 May 2021 15:16:44 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Thu, 13 May 2021 15:13:45 +0100
In-reply-to: <20210508014802.892561-1-richard.henderson@linaro.org>
Message-ID: <87cztulnw3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reorg everything using QEMU_GENERIC and multiple inclusion to
> reduce the amount of code duplication between the formats.
>
> The use of QEMU_GENERIC means that we need to use pointers instead
> of structures, which means that even the smaller float formats
> need rearranging.
>
> I've carried it through to completion within fpu/, so that we don't
> have (much) of the legacy code remaining.  There is some floatx80
> stuff in target/m68k and target/i386 that's still hanging around.

I'm going to take a break from reviewing this now I've been through
about 2/3rds of the patches. Overall I think the series is in great
shape and while the performance modulations are interesting they are not
a blocker from my point of view. I'll happily take a small hit to
performance for a more unified (and correct!) code base. However the
frontend maintainers for those affected may take a different view.

--=20
Alex Benn=C3=A9e

