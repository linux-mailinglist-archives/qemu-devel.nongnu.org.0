Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F83089D6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:21:23 +0100 (CET)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VaN-0003Hz-2D
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VZ5-0002jz-0z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:20:03 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VZ2-0008GA-G4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:20:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id z16so4812419wml.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lowfNjdilIp0qdz49l46VzomR9yYiuh9qmPzbuICOKQ=;
 b=LaEzzSKLdv2Vp9HLLlu3sLtkw3XvZ/41TEALhPAe0Mb34nJ+P7qrqeIxja6IazT9my
 fdXqZN7HoUXS5Bw/8MxUjRJmiufw9mjxf8CRCwCqYec+psq25g34IZvBL+xb/t86dSUX
 lV1z7wXNW2UQlzWcX9qgNqdoqGffmKL9OWxPAuyB1ymJu2kiRQKGDK9eIXzGnH6zMhLx
 6l5fayZOa+CfwzxqSw+hW9PgPUf3fsREpAAOzC56bzLJlSYU4xwt8+ur99XziPKjpcj9
 wQSvWrg4ZfezTkkXMfkVyLeOwi9qBDws41VhmrSf1I+JlLI7TPubBEvRIMM7utXRFtJV
 uwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lowfNjdilIp0qdz49l46VzomR9yYiuh9qmPzbuICOKQ=;
 b=FLSSvvEk/Sf0vD1WYVEJba1i0t0pHgPMtUpTD5vcxlsarfNdEvBYYy71Bc4t2MEcO/
 faOypkPoT7SdQKxvSzQcAw9Fb6dsmpgGrlUQK81OvYXF9cPfRXrhoDw8AvL+VrBGNWnB
 3LQLGaxtqmwm4VKfwo0Az0fhG6sgwmvNq5t7akV0uMkMX76eMQgFP/wH+02nr7MGtbVD
 hm6MjRjTtlLorVqkJUavqSuLC3MVtTlS6vF/3qaQ+qKz/zOda6zZBNR3L1G99e6ZYZsd
 EWyw/z5HXJPFatsrV4Js9acLJ06lm5U9aZXqPFFEMz5z5OMZhNV0ot3YvmwF70Qu084U
 rHKQ==
X-Gm-Message-State: AOAM531VRBBszHHizzRaUIz6ovN4zLugVPOyml2Pea5I8Ouzpy6emTrD
 TftYQI3hRr+AyNMAxlAZ+sDceQ==
X-Google-Smtp-Source: ABdhPJxf0KkgQD/8uevyZw7wXTg6ra+l1ON6YZcnAb5N8NRDeBKtLlap7G8k98O3/o/GJiWRA10RdQ==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr4315256wma.3.1611933594797;
 Fri, 29 Jan 2021 07:19:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f18sm9973264wmj.28.2021.01.29.07.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:19:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E87721FF7E;
 Fri, 29 Jan 2021 15:19:52 +0000 (GMT)
References: <20210129130330.30820-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] accel/tcg: Add URL of clang bug to comment about our
 workaround
Date: Fri, 29 Jan 2021 15:19:46 +0000
In-reply-to: <20210129130330.30820-1-peter.maydell@linaro.org>
Message-ID: <87y2gbsrc7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> In cpu_exec() we have a longstanding workaround for compilers which
> do not correctly implement the part of the sigsetjmp()/siglongjmp()
> spec which requires that local variables which are not changed
> between the setjmp and the longjmp retain their value.
>
> I recently ran across the upstream clang bug report for this; add a
> link to it to the comment describing the workaround, and generally
> expand the comment, so that we have a reasonable chance in future of
> understanding why it's there and determining when we can remove it,
> assuming clang eventually fixes the bug.
>
> Remove the /* buggy compiler */ comments on the #else and #endif:
> they don't add anything to understanding and are somewhat misleading
> since they're sandwiching the code path for *non*-buggy compilers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

