Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2146FDF6C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:01:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkNB-0003yU-5F; Wed, 10 May 2023 10:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkN6-0003wA-Uw
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:00:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwkN0-0004Y6-Fq
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:00:46 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso6916305e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683727241; x=1686319241;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvazdLH0Dp/i8fxXfLIDv97u3b+xTjxX4pJ1yXRagKA=;
 b=eGGcriTx3u3VpwnQbpqtamQd34NqKztYIydmpzsngQRTeOqjRXDGw8HanrkKAnV4HR
 bPkOoUDp+02JKGHsRypBCp8tGTaewcoPEfKmEZ8RLpMRbUhx9eLxhtvm2m7Tg/25pn9o
 ZRRKzqd11vkV7P9Hz6stv7SiNDTh9dSj+DR6RXq8LyCvQaicbfgQX3iLx3IOvi1nXpL8
 M+s2o+/fel6vTNSPGvl+9eb96vWwhLfaMUBFwGKf/jrGEY6iCu7s634CuOUb+VrkWYd9
 Ny6XR026n1RurDarwz3YXhPpkEeD4+ti1vk53WC6xcdLTFzk/DoQAi+WMvSYgD3G6gaB
 b+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683727241; x=1686319241;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JvazdLH0Dp/i8fxXfLIDv97u3b+xTjxX4pJ1yXRagKA=;
 b=VAqPL1Fvmo/1bBepOgQ9WCtStq7eM9YeSuaxHxCMzt8IaE5pdiNa8fY4LyB0ZErEyM
 XHel0s5c8Ytn/LOaGrylqMCTohPHUe8mQZkzj9s0GCQ1ZVidGFloIu63/dmj2HWLzvRf
 yADZFddy0+qk/GqHhCBgYZOoZQoptb5+yagg0wBH6f39ibIou46CE00Hq8rrlkVoQC/E
 ukCALSBUutAz2ho9WcrYf46IBnFJBwcXgpVGcmrl5W6tq16zDzeGPcoJuoaKXcgQd5AJ
 OhJA2E2RPllojUnqRTGLG/JQWrriO629VxOoR0shQ6CJKNqoYwzFG4VlhpN1QfXGrK3u
 dCQQ==
X-Gm-Message-State: AC+VfDx2yUY8Mikk643OMa1toRToi4n887bRKXFWqfjNBI1Bx5PUVF5r
 Lt1rAKMBhr+T66LXUQ4JADDlX/SUwHp+0+mZ/cObCQ==
X-Google-Smtp-Source: ACHHUZ7T3MxeS+ioK6IL1/9nai9yZuhANCsVjqWhFfXnoX8rEnydVqchvwvv9PIskY0hXO2NjTxm2Q==
X-Received: by 2002:a1c:ed13:0:b0:3f0:b095:15d9 with SMTP id
 l19-20020a1ced13000000b003f0b09515d9mr11013209wmh.40.1683727240827; 
 Wed, 10 May 2023 07:00:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003f43f82001asm2859898wmi.31.2023.05.10.07.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 07:00:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14B9B1FFBB;
 Wed, 10 May 2023 15:00:40 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-30-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 29/30] tcg/s390x: Use ALGFR in constructing softmmu
 host address
Date: Wed, 10 May 2023 14:59:29 +0100
In-reply-to: <20230506072235.597467-30-richard.henderson@linaro.org>
Message-ID: <87a5yc5lrr.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than zero-extend the guest address into a register,
> use an add instruction which zero-extends the second input.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

