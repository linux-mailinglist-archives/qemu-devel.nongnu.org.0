Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9828673B56
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIVb3-0008G0-8e; Thu, 19 Jan 2023 09:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIVat-0008CK-C7
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:08:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIVal-0008AS-MD
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:08:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id m15so1624459wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JL1SMttpj19w2ErFMwOyVgiuXmFT0epzkZciEVlAPrI=;
 b=OqqY2Fa3KMlTvIopfHlCiT5ruc0VmXiYJwGxmgYKiwFTgNcZFHaQudlkK0luONffiL
 wdgvupUtXZc4idMO4/awE8IOfU2F0IlcPKwlzIn5c7fYavNtZ4SCqorG4gWf9+QwBVXT
 HSdNXnlYkgAZxy6IHTeCdCgbj3/6e+DuEMl58ziOhs6D7B/8IcpdyfRHFOODq2Qjjn67
 8Qwo34T49imMh7hJ0ufbzATTgrWXfu3Plrxd9un1syuy5JbqyFE8WNhQE4w0CJDvdT1d
 B9/qXeLWYVWMKv7dg4UbqQJPipw+V5SQHJ0yVA7xiebetxCfT6Hn+z7ZRRWspQVsLTHS
 x8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JL1SMttpj19w2ErFMwOyVgiuXmFT0epzkZciEVlAPrI=;
 b=OIxhjyKHSxprtjfhomC8xCybyQk5XxOml0AAdBscR6bJYEgy3zGhMS5YHQ5KxOU980
 fELqzQW+3fl0VllI07HFpe8O4UUJUYVG3xJRRm2RkMnJJtsfAfckGdGmXdWZAoWzFvYj
 UXpx0frzQK/hctalgugyhMeDxEPekktAiifv+TZNVKv9tQ4VjZfjI0EfQ5Tg1lgQBP5S
 E36RhILXRol6H05He2dMZ+TDZfs3H2fQqdVtR7kADlebgRwgO3LbrDWz1YAA2uS20VQN
 /26Y1urHGxzGGYKbsuLhZd4DzlZeByEy8yJxhv5T4KomaiiMTGlFFZBD3jLF9S8JlcPY
 CGxw==
X-Gm-Message-State: AFqh2kqCR4Y4yYPpKN2/QqJKr7VHMLkctxiBFyXVkJc/T0+lYelNiUgc
 xle9YLjbU6fco/EYKD/vKlqA3g==
X-Google-Smtp-Source: AMrXdXvgxzDvLfzT2IIKh1NFgfiua6zOi3rNg44KKUG096TcrY0/wTqx3M+rtSRTKPJS26eYwNaWtg==
X-Received: by 2002:a05:600c:1c86:b0:3da:fa75:ce58 with SMTP id
 k6-20020a05600c1c8600b003dafa75ce58mr14442007wms.21.1674137313872; 
 Thu, 19 Jan 2023 06:08:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a05600c218c00b003d9ddc82450sm4775204wme.45.2023.01.19.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:08:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC6B71FFB7;
 Thu, 19 Jan 2023 14:08:32 +0000 (GMT)
References: <20230119130326.2030297-1-thuth@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Thu, 19 Jan 2023 14:08:26 +0000
In-reply-to: <20230119130326.2030297-1-thuth@redhat.com>
Message-ID: <875yd2zkf3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> tests/tcg/nios2/Makefile.target has accidentally been added
> to the Microblaze section. Move it into the correct nios2
> section instead - and while we're at it, it should also cover
> the whole folder, and not only the Makefile.
>
> Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test buildin=
g")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

