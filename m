Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7E5B0B78
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 19:28:54 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVyr7-0003ff-DX
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 13:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVynK-0007a0-QQ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:24:58 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVynJ-0002DP-Ac
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 13:24:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id d2so4452899wrn.1
 for <qemu-devel@nongnu.org>; Wed, 07 Sep 2022 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=nkHphKCf+4Kpfme9TiB1Tcu3cyXLTAHH4vXwvQHDTVk=;
 b=RlUwM7SZJfQrjawswY4X+BZPxDtOLwR7gzwnzVBKAA6jRCI1UdKM0rRhc6GlHN1qt5
 o7eU3uaT/rAWcVSt9shUcsLE5GzhVrd6Rje5Tx2+XM/1xvkPTMCKzBc+IwWAZPkx5giQ
 Q38hsuQX4/3uq54GZNUA94rpUUPGJRmBwyfQ3/os4S2L44uatWKTBcZYtBXbOQ1B9XgF
 4KgKlgTolqXwiTreHyFab9N7vkvFDTiDs2JoYeFOBexhaYfAiPL47qriMjzJE+HOC3je
 VkDTmfziVdfaU+YXxmovDIpdhyMVR50dNq/Uyo2JcX3SCwz278cFg31wghj1JcG+V6lc
 fQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=nkHphKCf+4Kpfme9TiB1Tcu3cyXLTAHH4vXwvQHDTVk=;
 b=wtMhkNL3OZ9Zcb/3g4HZENL224gaK9xBUogsYzA0Y2I4G1ekIjZEv0N2zeOgFoFgVX
 DVkoRaaR/S4s5YXMt+V0Z8E63Brw3ACCHDXNs8l6aI7h4rbVWXZ7LiXBsydV+9EJOFs4
 7wm2QeKwrEknJCEdGuAqxUpReycU880QPedA6GhqlvNTbftK/2hh2cMu77qUo3/CtUWd
 lN6W6e6xEYnMhlqXnLBoxX1CyPbSrJ/3pW1Yei1x6uPvxQGnlZ41Z1vVlq6YShrcnfsh
 m4qd68Hh9Ogr7sawTno5gHbkQYIgVxLBCMMvvLQMu3YTZVJU4x8RntKE1D/ThUfx5CPL
 fw4Q==
X-Gm-Message-State: ACgBeo2FCub5lUBYHjKe7kcCvhQeH36QF1UZluIVSYzvgkBCNNhNwmHO
 OtER4RYRUeVxvZxuWm3ilyXJsQ==
X-Google-Smtp-Source: AA6agR4kTHMxtuG0Md3GIuuiFod/Roikv+4kKrzilg+63ubaDizJdoaxBJTEc3h+oS9YsoRAGEn8cA==
X-Received: by 2002:a05:6000:18a2:b0:221:7d99:5d22 with SMTP id
 b2-20020a05600018a200b002217d995d22mr2724009wri.248.1662571493433; 
 Wed, 07 Sep 2022 10:24:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b0020e6ce4dabdsm17869758wro.103.2022.09.07.10.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:24:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 25DEF1FFB7;
 Wed,  7 Sep 2022 18:24:52 +0100 (BST)
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-4-lucas.araujo@eldorado.org.br>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Willian Rampazzo <willianr@redhat.com>
Subject: Re: [PATCH 3/8] scripts/ci/setup: Fix libxen requirements
Date: Wed, 07 Sep 2022 18:24:47 +0100
In-reply-to: <20220727163632.59806-4-lucas.araujo@eldorado.org.br>
Message-ID: <87illzjdwb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


"Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br> writes:

> XEN hypervisor is only available in ARM and x86, but the yaml only
> checked if the architecture is different from s390x, changed it to
> a more accurate test.
> Tested this change on a Ubuntu 20.04 ppc64le.
>
> Signed-off-by: Lucas Mateus Castro(alqotel)
> <lucas.araujo@eldorado.org.br>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

