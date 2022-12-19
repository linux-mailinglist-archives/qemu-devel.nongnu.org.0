Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B59651362
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 20:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7LyB-00070d-1r; Mon, 19 Dec 2022 14:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Ly8-00070V-Q8
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:38:36 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7Ly7-0005km-1f
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:38:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so9621030wma.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5JKIH3DBpt1h5XYV89Ello+q2JgIHRN6wSuLinqjLE=;
 b=EovxyWv2xslRiwm9lqxt4391GVQkwB5lsj/U25Tge8pQSk3mTUeou9mW+YxPbWlyvG
 ERn19oZ/o/+Rzb4DsqXcEwyqPX6cQ7G7mdvyWp4QdSbqNPdBJCLW6F+guHDugqw/+FEy
 5+CYwjX1O2HeZ40HFfBz9qbfQZop+D819IJvToUZTOmKm98ZymI1rVHOW6DQnUc4V+8L
 /0rzKE3k7COviRlnPS6j8T5e4/sLbNXZvsFd5lG/N84g4aoUZBzr3uXAgzeW4acTjyyJ
 hTahBQQCx+S27kfRZlNcjEBuhs/U1d9AS62wFwk+XUADdFiv2nJ/8wPLa8jHfi6f3nKX
 p5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X5JKIH3DBpt1h5XYV89Ello+q2JgIHRN6wSuLinqjLE=;
 b=Oo9fCEZ1M6mlSSdBHyiraD7bGXq7wMHHATj/MnNzKJElNzgStOX/FpzmyrSDcaYdLh
 Roce4GngEJaDpdOY1mB9mxyVXpasaVoTXBjrsBztjt2EJmVUHKy7Eq+m6PzBp2zLdXSC
 JNbs6hNXPdHiUUIWrPk+Uwjp1FsRTaLymsA7Dyy/M02NiKgb2TuWKjmja+ufQdQxVztG
 O9KNChG0BDkGBDn5sapjKZHgRPUjH1LVT1qUNBAMGEEG1Pn9rbQrlJI1eYXD+0x7g5S2
 RmgmsPO8xTWPXZAYGVS1Si6ucwvoCPaSFG423zcoaKVKf7PHRdgWk8x4cpwTwM2DqEHT
 3bhQ==
X-Gm-Message-State: ANoB5pnPQJofRckms7Qnj60hs/HBfun6cRM1peOX4WSLA6RwMQrVyv4C
 0S82NvZB/0yiHKVLLSYeaPwyBw==
X-Google-Smtp-Source: AA0mqf4m/qn30+VPj4FhH+x+kQCjjyWCya2+N7jNhNt+mAF46V8NcY0gRqSCqiO+pJgytjpDDl+VzQ==
X-Received: by 2002:a05:600c:3c92:b0:3cf:a851:d2f2 with SMTP id
 bg18-20020a05600c3c9200b003cfa851d2f2mr33206654wmb.21.1671478712770; 
 Mon, 19 Dec 2022 11:38:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b002258235bda3sm10761952wrr.61.2022.12.19.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:38:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE7C31FFB7;
 Mon, 19 Dec 2022 19:38:31 +0000 (GMT)
References: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Wainer dos Santos  Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, anjo@rev.ng,
 tsimpson@quicinc.com, bcain@quicinc.com, ale@rev.ng,
 quic_mathbern@quicinc.com--annotate
Subject: Re: [PATCH] tests/docker: use prebuilt toolchain for
 debian-hexagon-cross
Date: Mon, 19 Dec 2022 19:38:26 +0000
In-reply-to: <20221219144354.11659-1-quic_mthiyaga@quicinc.com>
Message-ID: <87r0wvi3pk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com> writes:

> The current docker image for cross compiling hexagon guests
> is manually built since it takes >2 hours to build from source.
>
> This patch:
>  1. Solves the above issue by using the prebuilt clang
>     toolchain hosted on CodeLinaro [1] and maintained by QUIC [2].
>  2. The dockerfile is also switched from multi-stage to single stage
>     build to allow the CI docker engine to reuse the layer cache.
>  3. Re-enables the hexagon-cross-container job to be always run in
>     CI and makes it a non-optional dependency for the
>     build-user-hexagon job.
>
> The changes for 1 & 2 together bring down the build time to
> ~3 minutes in GitLab CI when cache is reused and ~9 minutes
> when cache cannot be reused.
>
> [1]: https://github.com/CodeLinaro/hexagon-builder
> [2]: https://github.com/quic/toolchain_for_hexagon/releases/
>
> Based-on: <20221215095820.13374-1-quic._5Fmthiyaga@quicinc.com>
>  tests/tcg/multiarch: remove unused variable in linux-test
> Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

