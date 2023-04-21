Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481B6EABA6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:29:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqoc-0004O7-W8; Fri, 21 Apr 2023 09:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqoZ-00043V-1A
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:28:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppqoX-00042h-1c
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:28:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so18578745e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682083715; x=1684675715;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEdrz3fYmKWEnebNHvbFXJHocxH3NRWGJKiBWDHyrY8=;
 b=nt6W3jC+ZFJWpJ1HADLgdokpvjIpzYVeqsLYKsT4BOjqiIEvn0FeM5CjGf2ILj81zt
 GfxWFWEfiQFmYJ7u1fzTMgWvBsYFbEtHDf+5XLhIo/49hCsTp57g6TlJe6UOKCMPCtAD
 +Ba0v82I6OkfJamK/mLQvwpcMsPEIwg3OLilHOLgMGkBgVP2eOIUgj72I8z7wJdhs/QH
 8zZxy1AGKK7sIJSplptcuwt3RvGeXrk9ukfOyps4xwFWaK0wefZX0ZW/c1kfSX0y4SmU
 xXOyESFOLiu4ZXtzOMSWil9/T1/1JwQU5AzK6deGyW5KryAdbkJ/YWB5hd9it/4XxM/e
 m0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083715; x=1684675715;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KEdrz3fYmKWEnebNHvbFXJHocxH3NRWGJKiBWDHyrY8=;
 b=Gz2Ky/38BKwjK2/YJTcU1MLI3lmELFHKuDbvntARFwqu6mguxhG0pnwlVpSfeAKWmf
 GJr/SsZH3iZJeK3OvXmRizruiqaASkHzw1m2cYFNgVIx7g0mXIS2RPCR7SfF5Kz6DGye
 prbGs5R4GP7fpvNyGmI7Mm5gsh6TxrhbBn2dh/EwCCfRiCsRBBKOiMWye7MxV5EGbZ8C
 8dNKyTu8+aTsCuo1P6t5ez4j2vfHWM8W4cfCx3O0AYBeggsRh7YKXURbF4zP2CERbZZ0
 sKvkMCi6ciYM9W61mA/skVaIUhVdIQ+Xc33O0zAcCXQ44uYvOXTW0oDVNV9slaiUuCCj
 VzXg==
X-Gm-Message-State: AAQBX9cD5S2f74utCGoprFcJ1b6+uvGOvzmuiMPBL4WqWP+ErbUu2ChV
 VlairK2vhtmYKcDetFX36lhLLA==
X-Google-Smtp-Source: AKy350acDhh2EiZeQL1VpZ/emitYqEfOBPYKYUQlw6t6y8Z8DExNelBfp1r95Tuqkgko9X71itkUJA==
X-Received: by 2002:a05:600c:acd:b0:3f1:69cc:475b with SMTP id
 c13-20020a05600c0acd00b003f169cc475bmr1943580wmr.36.1682083715273; 
 Fri, 21 Apr 2023 06:28:35 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm4765070wml.44.2023.04.21.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:28:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CCA01FFB7;
 Fri, 21 Apr 2023 14:28:34 +0100 (BST)
References: <20230421131547.2177449-1-clg@kaod.org>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Andrew Jeffery <andrew@aj.id.au>, Steven Lee
 <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] aspeed/hace: Initialize g_autofree pointer
Date: Fri, 21 Apr 2023 14:28:29 +0100
In-reply-to: <20230421131547.2177449-1-clg@kaod.org>
Message-ID: <87cz3xbbzx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
>
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
>
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

