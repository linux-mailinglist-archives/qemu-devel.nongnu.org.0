Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F868630F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 10:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN9eV-0007Le-0g; Wed, 01 Feb 2023 04:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9eB-0007LL-12
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:43:19 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pN9e9-0000Ga-EU
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:43:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id a3so10002539wrt.6
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgCgOmP179xwXNHKVUPIOlJ5FmwvdkWbAw7BxI4BVMM=;
 b=gTQZuTkNNvzumVIj+/OuR3KhsqlQ7cp4+8CaO8q/CoLUbXjnt+PxEOX2jueIcouy4k
 hL1e5URKnlHsgMgm2U90JOHOD/GC+oG6cIov1ZTG1ViUvD3lR6SF5fnurg5xDJ5RHvBB
 RRyDpx8CsjkL+vlUlhyvr8+8FHKX4TQmMWMQrgErSOJARkR9QyT4oLYs7axq86SIqBMq
 dTIPorWJSJwWKVbnwBP0v5D9DNN+PW4HEHwfM63Z3Gwyc10cIZGvMdeDzqnaQOWK9u0k
 i/7D+ZtPgpEBFUPUCCv8bob7wstFHZ0veQL3C+9DWQMwmuPLYx6oc4TCG9yWUTgawBHa
 jy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MgCgOmP179xwXNHKVUPIOlJ5FmwvdkWbAw7BxI4BVMM=;
 b=eZnxBe3SaPKiHEfIXVIZlRtlXBlNL84e+r3zeSI/HxT6yM0Z1Sd8cQB0LWiYGz23Kr
 +kAo0vhwblWdLvcLucvHmJLf34Pr9zZyjh9GSoQo61diGyOWTrzXFXY/27C1wvB9NCKg
 5D105Xp0jaa4nnD2PRpu+FiL2aWCMy0ZN4QPx34W1rRYh5bSiBliWNKsA5wvSkVio6zb
 +mPpbDBwUwPZN80Gtz90kxGsZkOQ4494bYvfA3e8v4o+wS25aQ7jDUUIDk+kphN2t41D
 Mz5YDeF1ebQHTD0VFo4g/tSSUawAdkn9bM5FGIpOf/52NUmb6eb+7dP0EtS1L+ndgC4n
 2wMQ==
X-Gm-Message-State: AO0yUKXIhb0zAiDZqVMrOlBi8HRa/ByKh8qgGlcs9WWQPgR0riZW6uQi
 7YKHqh4JTlpJDNTWbL8kC8lNZw==
X-Google-Smtp-Source: AK7set8NPlr7lPaGoEeRRI8v7Fmcybih693BrK578W56Sx9g1an2Kpez6s7pDWRn9KL+OPHAdpH/QQ==
X-Received: by 2002:a05:6000:789:b0:2bf:cb91:a40a with SMTP id
 bu9-20020a056000078900b002bfcb91a40amr1972303wrb.46.1675244594112; 
 Wed, 01 Feb 2023 01:43:14 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d51d1000000b002238ea5750csm3674005wrv.72.2023.02.01.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 01:43:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F9321FFB7;
 Wed,  1 Feb 2023 09:43:13 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v6 13/36] tcg: Add temp allocation for TCGv_i128
Date: Wed, 01 Feb 2023 09:43:09 +0000
In-reply-to: <20230130214844.1158612-14-richard.henderson@linaro.org>
Message-ID: <878rhhu3f2.fsf@linaro.org>
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

> This enables allocation of i128.  The type is not yet
> usable, as we have not yet added data movement ops.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

