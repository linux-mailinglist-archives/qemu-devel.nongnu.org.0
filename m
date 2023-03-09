Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DFC6B2B02
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJKA-0006OL-OH; Thu, 09 Mar 2023 11:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJK9-0006O1-5Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:41:01 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paJK7-0005EZ-M1
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:41:00 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso4049447wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678380058;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUjQ+3j3s+6oh/IxRMJkYAlvVQhcOxPk40Tcqfz+cgc=;
 b=DdyeruE+IRWU9/69ds9HYDaByJQ0hMzkLICvjd00wYhzonYr7qmcyvnOS4EmkHPEua
 jLQ/fvMi6BdpaNOI1lMYISDRXIRYFYCaYNH8M0Gq1c/D0MY1FetWR/vfFIeFv9GRXFEv
 m/nONHvUmtpbZwCqDb5ceLgxweIBD5c4T8tvjqBVX1wuXaUBfgNcHIut0jhURRDpPvl1
 jqNWl4og8Ib/OHtJJH2SWuwtbBKXnqkv+Fpyg3Y9Rv5w9uqWEJ5fSqtkhcyF1n8eRGzD
 ThnrETbrBh7TxS3nXfrRosEb7XTFDx1l3vHEQ85dwMyiI+jV/XXom2yuwk76abJ1nprc
 MapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678380058;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uUjQ+3j3s+6oh/IxRMJkYAlvVQhcOxPk40Tcqfz+cgc=;
 b=xevHxvwFeVgn3SygDt1lnkYTxIZwEv2bGvR4C9C5PYCdOFaE/t1fu0CB8mAKeEhuza
 0npQp8v96gkqlV0f9WEiClne2/Q+GhdtejbcTW2Tp0WYCQznEQleL2bCikUoUHaR/l1W
 ZVDy2oEPwCtIBprIXZQ7A3D4OCSSo1LSRTzMMyZXK+BEa1JpGybfM/ASoFETolxHULJt
 rEiLLnhGq6eCvaDgA3e4a7AxYpTgliA8vqFIrjfnST/TRlZHZQrPyfSlCmIMIBFZMm4J
 /wQDYL1ZAd0JSgBtmH9rq7p8culnDAtOFVf4MHgNlkleNtXFrNZaWdgvhZ0+yb5xSUEm
 NQpw==
X-Gm-Message-State: AO0yUKUBNA5AXCXIcwmRfSdjQxgMLHT3GdEKmes2B/BIj6cJm5KShLsF
 OOSi8vjijqGPF/S5edwlN2aTxQ==
X-Google-Smtp-Source: AK7set9WKRqmtaYsQDcVG1oibspAIR1pFGVUDw7TV8TD6EkbKVZbc8iaIQ9Nrph2ssuQGbaarl3gJA==
X-Received: by 2002:a05:600c:a03:b0:3e2:20c7:6544 with SMTP id
 z3-20020a05600c0a0300b003e220c76544mr20185677wmp.19.1678380058244; 
 Thu, 09 Mar 2023 08:40:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d48cd000000b002c5598c14acsm17963461wrs.6.2023.03.09.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:40:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91F771FFB7;
 Thu,  9 Mar 2023 16:40:57 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-9-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 8/8] tests: build and run QPP tests
Date: Thu, 09 Mar 2023 16:37:32 +0000
In-reply-to: <20221213213757.4123265-9-fasano@mit.edu>
Message-ID: <87a60lnahy.fsf@linaro.org>
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


Andrew Fasano <fasano@mit.edu> writes:

> From: Elysia Witham <elysia.witham@ll.mit.edu>
>
> These test plugins demonstrate the QPP API changes by exporting
> and importing functions and creating and registering callbacks.
> These tests are integrated into the `make check-tcg` tests.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>

I think this is fine for testing. I'd still like to see something useful
that uses QPP up-streamed into contrib/plugins.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

