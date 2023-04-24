Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B86EC829
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:55:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrxG-0001jv-Rp; Mon, 24 Apr 2023 04:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqrxB-0001jH-Fm
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:53:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqrwz-0005An-FS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 04:53:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso2437856f8f.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682326411; x=1684918411;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuvtM1nDas+TYXWcaGsxpp1Jv6ixnjwWHOHmZGkpVUA=;
 b=doqygxPNyMxiwbhpBxNyL8d8ibWU/QMtG3tRz6pwZ2NlNfi99squ1z2pqZGM/3dYtB
 KgjCyZnNnn6U4gI+yWng94Re4tRxoJH+073MrfuJbfCTG1qVaf4Z/hmWfWP2ZWZscEnY
 Mv8mHuaiGHjonkZ5jrrP6af2YKHvxrYxmPraW72akW47yFeOZgc8cZqa/T7csChhwCPA
 sknqN0NvMoUGwwtSrWP0dAV/SQ0BvfQekr5Ieu0dSUBJFF2x46hjjxr7Q90+Aq9RtWVx
 h1hJjTWjCzkzje0yIffghiHei4gh+FdO8kkdYCp8jsRDVK1PxLsypfli7kVQeDiLQz59
 QDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682326411; x=1684918411;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IuvtM1nDas+TYXWcaGsxpp1Jv6ixnjwWHOHmZGkpVUA=;
 b=SJP3XXmWr0gQfn5ydlG7mq6PAaMPlGpahUZUIEErAw/oDegZ04CcSfTClwWHGZsiV9
 7i5U8q/m7UkHPVg+furL14GBBzQH/jmc4FQP0cxq5Qoa8qw6jqCaa1C0vMtwPMc6IyET
 R4BvAcRenkIYux8C2LRzB0zBsvD8ahl+W3Bpx7vLutnpyUtaks6cvjGbC4Q/OP9hkuVe
 bxUHkGkxwWjbFQGPAexXD3co+UanKxZURj/yHXSaruOXEIpoBQAkaohoh5SQJ8nCoe4G
 UBYV6wCWnyu49d/gN1CrkUAF/8aK49KXoBsQUT4OmJnLig8bFmY0bBOOPkgFOiyGHj4C
 REQA==
X-Gm-Message-State: AAQBX9dtdrKNiz7vOLdqFRylB/YLhYYV64BvOgvgrHcNyoeBr7LOww7i
 BdqrvdjIfaiHvwgtEP58yQSPfQ==
X-Google-Smtp-Source: AKy350YFQhHxuBYSWZSB61XTt06nXdkKSkM0+vDW+m2RA7BjP5d3MetTJVbl5++zqVyIpbsfm+xqRA==
X-Received: by 2002:a5d:6a49:0:b0:2f7:bced:9d6f with SMTP id
 t9-20020a5d6a49000000b002f7bced9d6fmr8322333wrw.62.1682326410957; 
 Mon, 24 Apr 2023 01:53:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003f198dfbbfcsm5919518wmr.19.2023.04.24.01.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 01:53:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BED11FFB7;
 Mon, 24 Apr 2023 09:53:30 +0100 (BST)
References: <20230424041830.1275636-1-kconsul@linux.vnet.ibm.com>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Harsh
 Prateek Bora <harshpb@linux.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] tests/avocado/tuxrun_baselines.py: improve code
 coverage for ppc64
Date: Mon, 24 Apr 2023 09:53:23 +0100
In-reply-to: <20230424041830.1275636-1-kconsul@linux.vnet.ibm.com>
Message-ID: <87wn21acfp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:

> Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
> boot_linux.py test-case due to which the code coverage for ppc
> decreased by around 2%. As per the discussion on
> https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
> was mentioned that the baseline test for ppc64 could be modified
> to make up this 2% code coverage. This patch attempts to achieve
> this 2% code coverage by adding various device command line
> arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
> test-case.
>
> The code coverage report with boot_linux.py, without it and finally
> with these tuxrun_baselines.py changes is as follows:

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

