Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5D6B2693
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 15:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paH4l-0004Mw-9n; Thu, 09 Mar 2023 09:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paH4b-0004MO-9q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:16:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paH4Z-0003m2-Ji
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 09:16:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso1319843wmp.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678371403;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIQLmXseQZpe2X2GoWb66n0dmJKMfh4yQuGLUsKEuF4=;
 b=mouWYAm+2szOymzqwneG58seSQvHK6aZGDRr+5oCt/h8JczOFqK0VpgKjNPkeKciD8
 J2yquWXJzaN3b1Riu2sziClHTNVnG2vWI6wi5F9FPTnQbZlOgBRd76Duad4ZLqSBXYTv
 pLXrZUmaukNuY2sC7GHxv98ek9bZKUV1vT6pxVmYxMuQGdGnR6dxGr+BfzTZMNiJaEZm
 ogwog7C09xp9jLqg+bjejf9nygMOlMpbzdg5AKfJm64c+R8i3xPwfM36h1DPl+VAj2Lq
 BT95dmBM3e0ygCF8Ti4ZfLj+2XQQ0Z4Oomm7YX0hqxblMvIeqleLHx+4J3jHpoIesN8j
 gLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371403;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yIQLmXseQZpe2X2GoWb66n0dmJKMfh4yQuGLUsKEuF4=;
 b=J92hUZK0srdLePEzq0HB7YjUnTSldW5ETbVT5lpvEzR5gNROUmkQjAMYVj/l9osmw6
 S3ipc/sa/P3MDeZBvxafn+1AcikASfRPlEpNqbd3qiWw1S0iG4jigJCytMLdnsJEuFXO
 1vdZ5OyFLQeIwP3qkvCClE7I1nGMVIOKuNRD+1U2Sws2Aszm5Eq1Lq78S6Uzq1LqePwv
 nkqqBaGqWj7XUC/kvp9GKCZDc6xVwkgZH20PlND7SEpcEh9VsT9U3xmJjrrQAitpMRLr
 4soZB5AYadgpstHrqC26tV0jDW2GoqDTCPRb3Yn56BYUF+4a+ALJOQykjuD8KuIzqqbK
 miiw==
X-Gm-Message-State: AO0yUKW7CZDKV82KIdwZtL3SrMdOxBz9SWk0utezDG6Uh4YldDYZqBf9
 soU8CC8fjR7+f/0S82shc+owOQ==
X-Google-Smtp-Source: AK7set+cR8okYurAedQFUf67Rm5JDdJhF99MrE/Y4ZnnnZCkouTPmnz0iogNeRSP2vmtRtOEHKF74Q==
X-Received: by 2002:a05:600c:c11:b0:3df:d431:cf64 with SMTP id
 fm17-20020a05600c0c1100b003dfd431cf64mr20228704wmb.39.1678371403718; 
 Thu, 09 Mar 2023 06:16:43 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002c7163660a9sm17887279wru.105.2023.03.09.06.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:16:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 132C01FFB7;
 Thu,  9 Mar 2023 14:16:43 +0000 (GMT)
References: <20221213213757.4123265-1-fasano@mit.edu>
 <20221213213757.4123265-2-fasano@mit.edu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, elysia.witham@ll.mit.edu, erdnaxe@crans.org,
 ma.mandourr@gmail.com
Subject: Re: [PATCH 1/8] docs/devel: describe QPP API
Date: Thu, 09 Mar 2023 14:15:59 +0000
In-reply-to: <20221213213757.4123265-2-fasano@mit.edu>
Message-ID: <87zg8mm2lw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
> The new QPP API allows plugin-to-plugin interaction for creating
> and using callbacks as well as importing and exporting functions.
> The new test plugins qpp_srv and qpp_client demonstrate how
> plugins use the new API.
>
> Signed-off-by: Elysia Witham <elysia.witham@ll.mit.edu>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>

Sorry about the delay getting to look at this.

> ---
>  docs/devel/tcg-plugins.rst | 91 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 9740a70406..70ac09b96b 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -281,6 +281,14 @@ run::
>    160          1      0
>    135          1      0
>=20=20
> +- tests/plugins/qpp_srv.c & tests/plugins/qpp_client.c
> +
> +These plugins demonstrate QPP interactions. The qpp_srv plugin defines
> +a few exported functions and its own callback which are then imported and
> +used by the qpp_client plugin. The qpp_client plugin registers its own
> +function to run on qpp_srv's defined callback. The tests for these plugi=
ns
> +are modified as both plugins must be loaded in order to work.
> +

This section should be split to where the plugins are introduced.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

