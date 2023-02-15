Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D333469822C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLep-0001Uw-28; Wed, 15 Feb 2023 12:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLen-0001UR-HS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:33:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSLel-0000OJ-S3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:33:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o36so13904291wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rdXwoM4rN1Ecq8SNcp05ArQ5wGy+n+9qKC2Z2MK2rKA=;
 b=PMd0xhCML+hpv/JeQWJvZgW7dQN1Vfl+oB8YUQ0hR728VWOyIcCnN2Mw/p+pkWgvnz
 aZNJXDc6+7aI1n/yBG4Pwgs2Xkk/V8fDyVMJ8dAknZ4RjGdRYs8b1s5vtbx3g+99IVSG
 vY1t60MztC4OBHA3nyrPHdBRs/ZrqCflxaRuxEmUfUG2Qkh876KOUbYn/IOzJvQBZGAo
 WGISrveJfvsI0i+8z3LQdF9zNwaQVNUqaHWLTXuBSrqq6Pj772gi3lkNE2ZVnKS2TtHF
 qReKVBXkkiKEoH4MLG7VmXOpYQ/zS1UaCE5kTqd/lMn8rdHRirhuWO0nSr68WNu6XI4/
 xyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rdXwoM4rN1Ecq8SNcp05ArQ5wGy+n+9qKC2Z2MK2rKA=;
 b=YwB+GOrLP6o5NO0mAdbW8/1e5ZboIUSLA8cjU6NAZe0twuUlwEJq7lBR7cJn+fQGO0
 SY5oQqTt0pjN6PxY3s/Nc4j58pKKWaTkb78qwUMi31qFi6OIFmhAszFKe9vJcd+7mcm/
 bbiPtcBJml1bNhC4j0GWJ4Dz8RSIVmJbIfwCrMC4QeTNzpKL/mVmXmabORQWChcufWKe
 90pQagoaah26q3BSd9xJG8wntwTMadhSnnolj4IrZ79iP9CDggZfWyNpNcACmTIFvDJX
 iog6f20xa2EuwsOKdUyUo4vrqArE8fj8VUUb+LAGm8GLSSa12BXjDczuUf11jBLMSPxq
 YPPQ==
X-Gm-Message-State: AO0yUKXbkioMYrv99vMHhB+++c5/wwqTUDkyZxUcVaOubU6irgeDddVl
 YdfxEs8u/5168qmcYQe4Aj9Scg==
X-Google-Smtp-Source: AK7set8XgeIzlPnRPSUPfXxOZxksN0/ZTYdsH4aXKvwBkDiW/byF0BPAF5HGV2JxnQssP4G8DuMZWA==
X-Received: by 2002:a05:600c:4d22:b0:3d9:f769:2115 with SMTP id
 u34-20020a05600c4d2200b003d9f7692115mr2514031wmp.26.1676482402064; 
 Wed, 15 Feb 2023 09:33:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b003dc47d458cdsm3088261wmo.15.2023.02.15.09.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:33:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5D4F01FFB7;
 Wed, 15 Feb 2023 17:33:21 +0000 (GMT)
References: <20230215152233.210024-1-thuth@redhat.com>
User-agent: mu4e 1.9.20; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Beniamino
 Galvani <b.galvani@gmail.com>, Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
Date: Wed, 15 Feb 2023 17:33:17 +0000
In-reply-to: <20230215152233.210024-1-thuth@redhat.com>
Message-ID: <87wn4i96la.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> pci_device.h is not needed at all in allwinner-a10.h, and serial.h
> is only needed by the corresponding .c file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

