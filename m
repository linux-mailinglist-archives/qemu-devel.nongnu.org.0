Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A53433C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:33:03 +0200 (CEST)
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs2w-0001GF-Qr
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrkM-00046d-Fi
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:13:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrkG-0004cu-Nk
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:13:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3655095wmd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BmFhrzlgU2vWA8l6AgAc0993Yj/LiIJ2/ti+ss5HpWk=;
 b=zZwaZwM87waF7C/Qj2uaCLe5eGEZ8QoU40c2yfVOyzjmQVnqmhwHej0dju4zLzYLpr
 /52UwT0/jSohkwYQcMrswV1jCL4zUzd4JtQHOzbMRQ1yMjW+HoJGueoRZdj1b3Q2Y+nl
 t/fOs4kv63ri1YmPSd4Uzdph2PTDK5JkIPgOuClBlYTBCPByNCW/BQ1XGOZYzmzEBUzz
 EGK5pNYQaO7JbmALWriVuGFHRssejUEqzpvJGIGoaCHGKl6EN4fmHtIjkUpmGh2rsXLv
 He4GWDBlMyEn3jPQqxujgLBJquoR7E1wgBZGGysHgw8PeVXg4Xp+uhHADoHdIBp8NMAJ
 8NXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BmFhrzlgU2vWA8l6AgAc0993Yj/LiIJ2/ti+ss5HpWk=;
 b=aDWudy19n9K40qTiIj0ESvwmA6krQwShykwFO/t+Mv1jYhlGxqtDAJ2pGefHfVZfCV
 JbQ+CHmbxBa95uRYqeegRDutAhmG5X7K1RpiCsIqLMG0FOpOjcW85MG6yfOEGYdJUpLt
 L/vRTIQ1ZzYxzM83yYIENXH5YekfOwH2+iNev/MQTWqkEfjcHUJXGWdhJYNMAU0UWxNf
 HxgMVegaWSf6DZxn86TSNe8Ar7vBwDyEw8FeT3rWDt69GteK4bHm7ZftsPcHXq3Ge32l
 WYrvY17pr0ffg2nbdJRbiAPwi9tXhMYLCWVmYpvF0rIeKSlT4tO7bFZiRespUIKYojIg
 egOQ==
X-Gm-Message-State: AOAM531GnQcvXKbcEw5sLyX3ctMMsXTLOpOO2JXztFf2ol7iE9dDRuhE
 ZVkaKDz3MEtSJVxMTjvVG3ZazQ==
X-Google-Smtp-Source: ABdhPJx2WAkH0Lw+s112HnmbqQJ470e71azlXn79X1GvF/iny87HD9wP+6Za1QwNtRPLBbu/uWjpJg==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr13408733wra.438.1634660023301; 
 Tue, 19 Oct 2021 09:13:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm2651383wmq.46.2021.10.19.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:13:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2BD11FF96;
 Tue, 19 Oct 2021 17:13:41 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/48] tcg/optimize: Split out init_arguments
Date: Tue, 19 Oct 2021 17:13:36 +0100
In-reply-to: <20211007195456.1168070-7-richard.henderson@linaro.org>
Message-ID: <875yttxaa2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There was no real reason for calls to have separate code here.
> Unify init for calls vs non-calls using the call path, which
> handles TCG_CALL_DUMMY_ARG.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

