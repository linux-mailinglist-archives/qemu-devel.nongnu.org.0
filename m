Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40216952FE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 22:26:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRgJS-0003ZJ-0R; Mon, 13 Feb 2023 16:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRgJO-0003WA-Ap
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:24:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRgJL-0004QY-Fs
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 16:24:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so118956wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5BAEvk9GuuH5nuiL6jIp/agnFquMU56XMsn7/gl2sY=;
 b=P1fVFA40vemG/QaOvlqtA+isgE7YH8LeDugilGcpjo08a1qNWVgEFgSw0isABlm8Bu
 pDmg9XGsRTGDxBwtzZNEx5NWe5eGiZIpVlW/xU1NV75iyRtrkmbiW0QlOn0MJ0at4f0D
 EoPsx8SzOatD0yEc3op+9920MvTPYK4zuv2TGAeKWDLZkM+SOAxh/djFC7ynU6DU0LPo
 Fr4DZTZSojn8rEoP+2w/inu7luRtsr1SFH5j2maobpwq3ybMpXdiHqMDGYTGb16ujP2+
 vfRrZn0IeY7AL+hjzttq+/GHYmuCW6NdrA/co7s5UAxjjMlMg06oiKQS17aabA9nrdbm
 XBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d5BAEvk9GuuH5nuiL6jIp/agnFquMU56XMsn7/gl2sY=;
 b=el4lPKorBGrYQWHc1BsXrSnDLvfXHR4ydwJ8Ypl6meN/cUGKcY0QwgWVwsVRHt84lI
 5pnnIE0dJ7vsmKM3MBR2jDBVWOlKO/APUo9FCRqqLpuh2OZ96xIKVQxfdLDZHcmgnPqH
 9+Od5+KtTwO3NvppJN3NfQjj6uMdU+ykNqSwzgMirscm9BH3D4ocSbDZfnrD1gasw8LX
 rwWPAOasXnPNLYpcb1ghEHAQa0jf+KrVEDwE3dkDDyW65hwtIuvmzI05A4FzkG3Nf8D9
 i8yoPiweW0bTHJW1BWK1EPX9HSgfFw62wWeTPFO8egiwHT6yzw9O53ld6+xg5+YAN020
 y2aw==
X-Gm-Message-State: AO0yUKWzhE0xVl4AILy6dZvElCxmszNcSHQQfKW7HWEvP4qUMIHfYTGA
 CU9msWD94uvJvUIc7NNOriSaAg==
X-Google-Smtp-Source: AK7set8nyCTV+wA9SHEqiV8Y7Iad/iUajgpjm3Hq8I5ZHfvJLQCv6CKfEi5tZdoKNTbRG23U1ROAtQ==
X-Received: by 2002:a05:600c:703:b0:3dc:16d2:ae5e with SMTP id
 i3-20020a05600c070300b003dc16d2ae5emr44531wmn.32.1676323462752; 
 Mon, 13 Feb 2023 13:24:22 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003de8a1b06c0sm18036073wml.7.2023.02.13.13.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 13:24:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC12A1FFB7;
 Mon, 13 Feb 2023 21:24:21 +0000 (GMT)
References: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org
Subject: Re: [PATCH v3] tests/docker: Use binaries for debian-tricore-cross
Date: Mon, 13 Feb 2023 21:24:15 +0000
In-reply-to: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
Message-ID: <87lel1b6nu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:

> since binutils is pretty old, it fails our CI repeatedly during the
> compilation of tricore-binutils. We created a precompiled version using
> the debian docker image and download it instead of building it ourself.
>
> We also updated the package to include a newer version of binutils, gcc,
> and newlib. The default TriCore ISA version used by tricore-as changed
> from the old version, so we have to specify it now. If we don't
> 'test_fadd' fails with 'unknown opcode'.
>
> The new assembler also picks a new encoding in ld.h which fails the
> 'test_ld_h' test. We fix that by using the newest TriCore CPU for QEMU.
>
> The old assembler accepted an extra ')' in 'test_imask'. The new one
> does not, so lets remove it.
>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

