Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D36ACD45
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFzI-0003bp-3o; Mon, 06 Mar 2023 13:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZFzF-0003ba-In
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:55:05 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZFzE-0001yF-02
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:55:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k37so6354099wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678128902;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RN4ljWUcVmcAIb87baj3q/9rBkxlP04OAD1086BFt1k=;
 b=o0NI+3uT/5ksYxLzKDEv7w4oDyKo1DNWWAqqvthcutb7aCd+QMRtn8Onee2cyJj73W
 QvGX+lVyTXd9+CwnIS/tQX3NrqDQa+u897YIccmnok532HmF3Cx9iu+kDjUl7CJ7rZN7
 NbiCxekJ+TiPeYsI1GwQaQ8ek/q8wleAUTJJ3mEZhiWGIeSEsN1LvwAPxetG0dt02W0F
 3FQc1dib5USR80QLkWY9Xg/IUDgWTgu2A4JRJQT44GZwWzk2YY+43VEWYJxtslRE94zO
 NJjvEVq+RI15xZ5OOdSX+UByDBF+U209+ympFydhtV7J6+HNjpkYIrFKR6CsIdmeI6Ui
 H8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678128902;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RN4ljWUcVmcAIb87baj3q/9rBkxlP04OAD1086BFt1k=;
 b=3VRa8V+UVFBzwus+hZ7U/lxNJPlAsdc8cJOUExJ/OwqwLKswWmOm3K3Ds5p9R82oyE
 /NAAqBOeIxM9ZmPK4t92ZvKP74FAkd5Sj9VpoHqmzL6XYNs3MqlZchw77T6gEhFFh1Do
 VsdCYolS2zQqbM3Q3tkCTZDWA5CsbFDHHbaqz8a+y6MP6/v7V3/QRHP/gZg142vo0gLf
 Xk1c+J12XmMRFGPZxZfm9QwIEQt8MBJ+Lf7A7An9AL8daDQ5u3Vo2dvm26mxDL4HcYB2
 /0rbX2cqgf19M0N2ZyceCgp+jPBD7A5SgqhQ/pfKu6lBX94LaQ62PMjkJAM+noHaxz5V
 0f8Q==
X-Gm-Message-State: AO0yUKVHo8BHQk0UFKQNGLUDkrTKQR+NLmTKpfLpG9LFsDueb6gTIqzu
 /Jaa5TxeZk20ITobkgyOY4bMTQ==
X-Google-Smtp-Source: AK7set/p1rNz84zTRNVaQxtjCTPuOqEhGm4QAOmP1jBURoQ/dTtRKzL0ahvA17WjjwGZhBPyAR7uDw==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id
 o5-20020a05600c4fc500b003eaf0d65d37mr10126206wmq.8.1678128902371; 
 Mon, 06 Mar 2023 10:55:02 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j39-20020a05600c48a700b003e21638c0edsm10576547wmp.45.2023.03.06.10.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 10:55:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A77001FFB7;
 Mon,  6 Mar 2023 18:55:01 +0000 (GMT)
References: <20230306175230.7110-1-anjo@rev.ng>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org
Subject: Re: [PATCH 00/23] Fix NB_MMU_MODES to 16
Date: Mon, 06 Mar 2023 18:54:51 +0000
In-reply-to: <20230306175230.7110-1-anjo@rev.ng>
Message-ID: <87pm9lr9q2.fsf@linaro.org>
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


Anton Johansson via <qemu-devel@nongnu.org> writes:

> This patchset fixes NB_MMU_MODES to 16 for all targets, meaning the
> macro is no longer target-specific.  16 mmu modes is large enough to
> cover all currently supported targets (12 arm, 10 ppc, ...), and is the
> maxiumum supported by the softmmu tlb api.
>
> As mentioned by Richard in response to our RFC, softmmu tlbs are
> dynamically resized and so the overhead of an unused mmu index is fairly
> low.
>
> The grand goal is to allow for heterogeneous QEMU binaries
> consisting of multiple frontends.
>
> RFC:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg04518.html

LGTM:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

