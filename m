Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4B14AC7E8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:49:43 +0100 (CET)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH88z-0004ql-Ir
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:49:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7Xw-0008EN-4k
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:11:24 -0500
Received: from [2a00:1450:4864:20::336] (port=39913
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH7Xu-0003hS-2E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:11:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso14776128wmh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IYBjSkPqiF1Q7aroSmlVM5LkIt2KNzS/cz62frb4mK4=;
 b=Mamss0LO8TnR91E1sfSb0j4AdQZ2KWMaBb+LRt8UpMKsDjeHjbxhOSGVpqDJoRqNKZ
 QqPPmE8E2b2wVE/x6W2VjWyFr1KfCdyn8zuRZEOUm/NV8fawdA4iyp1z2Bu72dNi6ipp
 yukQApR8HydO6O2I0L7qsNuwI5JedSdhnA/KmUkZ6DWceDCBGCXlynhwCjc6uuxUrHlV
 ISNBXskhoRMCoj1Qw7EOGLZcf4kM5GwOCwvDz4Tce3J4BoGKF3dTZ1whim5M4OsQXf4V
 dNqF1g0YLpqIIkOYqabgAyV0r6SPlzvi4yI6kfVHUtc8kFDSjskfUwkbiu0snfHFjJkF
 6IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IYBjSkPqiF1Q7aroSmlVM5LkIt2KNzS/cz62frb4mK4=;
 b=DCbNZtaEB+DWiOocBjcNjeWJtMMkdRiT3i6hy5Erh7YsM2nYz72IdcAooff67j06Bn
 60Lx53pELNHPum4dbnIo/yWZxt2X/27Hkr6g7gjSr5DXuI7/yXY4URPa188sVSa9fdMs
 jBEWTPN4XGk4ImYQpXIc68zlH6WyDTJMF0KgDnJE+MzxK97vuQboiPEVgirPeOGipxsQ
 8692JKkAFOkqpg6bsproX/2f3IIF4vqNDrcn0piVFkeO+9oQTSPNeUzZxmVgGVWUqbLq
 Uk7Ar88Tge0X2/XD8fbIulEnWAb4HaXEFW9sXTdAJdoHssLvW3fcT937y8FrUP7GK7jF
 mZtA==
X-Gm-Message-State: AOAM533rQtnrhGE01/rbmdfvYhW3V6DwOcCndxARnwAjM27DO63cqA8g
 f3XGIw5CLgE5kmIlJO2hDq8+xM2KWME4R8mEmslcDA==
X-Google-Smtp-Source: ABdhPJwG3ozAcGcz6p8MgWq64qv+wz5Zx88WLQR6dI8+yyQgdFs9T1lsiUjKUqIQNt0ARsQdyBXBtQglQBufK4WSZy8=
X-Received: by 2002:a05:600c:3552:: with SMTP id
 i18mr15440359wmq.21.1644253880510; 
 Mon, 07 Feb 2022 09:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20220202122353.457084-1-alex.bennee@linaro.org>
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:11:09 +0000
Message-ID: <CAFEAcA93k6k7LaX0jk=j5PXZRs769OhRKuObv5VTsMSb0=X0MA@mail.gmail.com>
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 12:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/helper-a64.c | 2 ++
>  1 file changed, 2 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

