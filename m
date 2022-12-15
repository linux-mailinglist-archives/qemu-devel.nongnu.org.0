Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B264DEF7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 17:48:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5rP2-0000EN-8f; Thu, 15 Dec 2022 11:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5rOs-0000DZ-S1
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:48:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p5rOr-0006Ta-6O
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:48:02 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so2227378wmh.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVHH7e2einbtQO7C5pzRZ5CHemFduqGFgZBAqzwPa1c=;
 b=KXPKPnJ1Rk+sTeHAm+TJT5RuiMkyHnFDcuRsQ/BFXuEotbtO9kmsk+vqalrGIi3kWD
 Ct27D46aRsDM/a/uZ6dY2TEcczceV5p2rDUB7AzwwAAJH10LUldP/TktM8Xt5thUan87
 Ss8O2wIJxUFxB6RuvKoPqVnSuzlMCoPx0HwCUSqL5r8d/VYnW4ILAenDDYsVLIuq2hfB
 AgLZG0lwC9YcOX0aiN9ID7A5uh3IGfEGd2euEZgLa78bH9TLjE3ed54VKm2d36ftULey
 /QRX/e9rLXdM/WdqlPeM5Pct94mA9NZmu31ZGK9ZqwGvhloeSUMiJN2pXHGE2nz6SkPu
 78pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WVHH7e2einbtQO7C5pzRZ5CHemFduqGFgZBAqzwPa1c=;
 b=JTTSPYQeoWFMD2qx0mMp3GnkqJLl+JrVyRabdzXy9gHUk46unM/If4XhEk1/Htn5qw
 4K5XpPZr+/dRynq6/YvwwFni1Lg13n/k0YJll5Mm405nUrXYCekkywvANAWePeaUURYK
 9RRMhq8l3JQcwTLWZMs7mT4K2Y4RRFZt6bvztfOXYoS9fZywfRBLQ10Ibvy165SOeqXE
 bb+vIiix0xRDo5NJJ3qM3MU2i7KHlN3YiuIZayxr0r+nmQzgY6Zl6pxV9v3oSFY4Ic7e
 8qlh3/WMvm+4H2LgyZ3kOa0TbN8AHXQkDDNxagtikg27UmgQSr7YqY+uNvihxg1ynPGS
 u8PQ==
X-Gm-Message-State: ANoB5pnFUtq/Nve3TWT6G5SyjZyVfnU2i36C8cB8PY3LkyJac4IisQmn
 kVFG3vs7VO1pmLV2m+szB0oh6w==
X-Google-Smtp-Source: AA0mqf4V7JxqiksfFGeR3MpIOiBm3sk6PgMT4keUEpxTQZBgFKLv5NGdemV9DQdsABkHwn5Ggc3N5A==
X-Received: by 2002:a05:600c:4f89:b0:3d1:caf1:3f56 with SMTP id
 n9-20020a05600c4f8900b003d1caf13f56mr22295217wmq.9.1671122878842; 
 Thu, 15 Dec 2022 08:47:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003c6bbe910fdsm7548524wmp.9.2022.12.15.08.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 08:47:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06E431FFB7;
 Thu, 15 Dec 2022 16:47:58 +0000 (GMT)
References: <20221215140933.2337853-1-alex.bennee@linaro.org>
 <f0ae5daf-ec43-aede-12d1-a6dd4406c28b@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] includes: move tb_flush into its own header
Date: Thu, 15 Dec 2022 16:46:56 +0000
In-reply-to: <f0ae5daf-ec43-aede-12d1-a6dd4406c28b@linaro.org>
Message-ID: <87r0x0ipfm.fsf@linaro.org>
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 12/15/22 06:09, Alex Benn=C3=A9e wrote:
>> This aids subsystems (like gdbstub) that want to trigger a flush
>> without pulling target specific headers.
>> [AJB: RFC because this is part of a larger gdbstub series but I
>> wanted
>> to post for feedback in case anyone wants to suggest better naming].
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   include/exec/exec-all.h     | 1 -
>>   linux-user/user-internals.h | 1 +
>>   accel/tcg/tb-maint.c        | 1 +
>>   accel/tcg/translate-all.c   | 1 +
>>   cpu.c                       | 1 +
>>   gdbstub/gdbstub.c           | 1 +
>>   hw/ppc/spapr_hcall.c        | 1 +
>>   plugins/core.c              | 1 +
>>   plugins/loader.c            | 2 +-
>>   target/alpha/sys_helper.c   | 1 +
>>   target/riscv/csr.c          | 1 +
>>   11 files changed, 10 insertions(+), 2 deletions(-)
>
> It appears as if you forgot to add tb-common.h.
> That said, if this is intended to have exactly one thing, tb-flush.h
> might be better.

I'll rename and include when I send the gdbstub stuff. I don't know how
far you want to go to eliminate target specific handling from the rest
of TB maintenance - indeed I'm not sure anything else is possible?=20

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

