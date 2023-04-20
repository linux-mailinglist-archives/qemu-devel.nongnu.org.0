Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F76E97EF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:04:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVp2-0002mb-8H; Thu, 20 Apr 2023 11:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVok-0002Nf-TY
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:03:29 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppVoa-0004px-Ne
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:03:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so7785025e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682002993; x=1684594993;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTn/5zskH5lBZExa9tznZTjeXPjkLjQSdbd1PZsWTkQ=;
 b=NXzIOgvR/sw/cnT4OeNsc07C1m8+txIWf4hZTMKQXmEGxEPFJjszXVnHEqERHUdi+E
 8jPqHjrx3f4ZcXowOovarXLlqpuCF20xic6540i44M9IgntRlO4v5jEI/+n6ikWZpvaN
 A6R35YeruNaBPH232LhbgNQQUozpjstyQcef6wuH4MGYLAM+7FD7DXTbGCoYHgr/CW8E
 RRNUfRVF9tsN7PGY7yYGuK5vzAln1JlCoyictan2M9Rw5idpH69CFyCicJQJjq2A1lfQ
 1CGsSxAfcvgY83EigC33vHGK3XrpMJPNZfpln7mAfMkhuLp4mH1JjKIpOighp1YuIv/K
 3VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682002993; x=1684594993;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lTn/5zskH5lBZExa9tznZTjeXPjkLjQSdbd1PZsWTkQ=;
 b=HqQWcAhQ2MCnuA56BM1+Lp15r7Y5ybxtHHmhhWB1K3Am3Cb6NOrkfsjCTqy94xkMiG
 5Qk3w23iTbrVaaWzLBDPKMfqLZ8Sr+yOyS2LXu2YuZZ40BvrQox6mgy8KAlRCG1+w5wI
 HcJNZ8wPjuetg2Su4qio7wyD6mXkRjQG/EAedhsLeeYmqnsx/CeUUz5fVSneYjiNET/6
 h2CJCCbXOHiGBfuQ4FSXCN8XMKxty066wZxGJIyl8/CEcuR/ggjabbve655FkZFjegGB
 5jT4u6A8/mY9QJQj6g6lEPuGpaK8RrLduQck8t6pdtjWCWgC5a8Gw+QO6TTM9OAPXd/R
 +ABw==
X-Gm-Message-State: AAQBX9d2yo59L6H66uc0Yn36ORQl85/Ynw2Grkfx/CwHzqCLxRhhDuE5
 HsmgrMdO24k+4JVQxEguw8cbUw==
X-Google-Smtp-Source: AKy350aFgTIhiQ1uVmzTU3hG8/vJti7HUb8NSaBNAJ8oa8NGoKjsrsIBXMUDNKtEA8ApY2lm9xjDaQ==
X-Received: by 2002:adf:f741:0:b0:2f8:1ed9:f0f8 with SMTP id
 z1-20020adff741000000b002f81ed9f0f8mr1350121wrp.61.1682002993549; 
 Thu, 20 Apr 2023 08:03:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6246000000b002feea065cc9sm2110162wrv.111.2023.04.20.08.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:03:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 314781FFB7;
 Thu, 20 Apr 2023 16:03:12 +0100 (BST)
References: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/2] Improve avocado code coverage for ppc64
Date: Thu, 20 Apr 2023 16:01:45 +0100
In-reply-to: <20230420125217.620928-1-kconsul@linux.vnet.ibm.com>
Message-ID: <87fs8ud2a7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for
> powerpc decreased by 2%. This patchset aims to make up this
> 2% code coverage by modifying the tuxrun_baselines.py test-case.

BTW did you see we have a basic tool to compare runs now in
scripts/coverage/compare_gcov_json.py if you want to see exactly what
the differences between a boot_linux and tuxrun_baseline test is.

Currently its only file granularity but it could be fixed up to do a
more detailed line by line breakdown.

>
> Changes since v1 and v2:
> - Modified the way and code that creates the temporary qcow2
>   image that the tuxrun_baselines.py is now using.
> - Factored out code in avocado_qemu/__init__.py to create
>   the get_qemu_img() function that will now get called from
>   tuxrun_baselines.py.
>
> Kautuk Consul (2):
>   avocado_qemu/__init__.py: factor out the qemu-img finding
>   tests/avocado/tuxrun_baselines.py: improve code coverage for ppc64
>
>  tests/avocado/avocado_qemu/__init__.py |  27 +++---
>  tests/avocado/tuxrun_baselines.py      | 120 ++++++++++++++++++++++++-
>  2 files changed, 132 insertions(+), 15 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

