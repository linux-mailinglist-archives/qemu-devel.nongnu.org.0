Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045955541FE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 07:07:04 +0200 (CEST)
Received: from localhost ([::1]:49556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3sZy-0008No-JY
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 01:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3sYi-0007ho-IO
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 01:05:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3sYg-0001yp-HS
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 01:05:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w17so21659185wrg.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zh4gXytghVEuiXS6XTFcK41jggTkHaLkJ9UBzSqVguA=;
 b=ypZNm6CSFrBZSg1mETZN2f+DLqm7Zt7dtkUbqMKd3kZaJft2AVA7Nn9GdiUu2i9tyR
 +H20m/abg1PTdSZjfaOkE5UiP6Hc4dQ2I2A/Ph70ZKsxxJxF9QBVSsfCqZ2f5hgo2cP8
 aqBP00BRv+ra3DR37TUpuBwwiWk9DGfb0a7ZZMHbNo+Jlee27Gt+zvyJzkYx0tSzM2ls
 rkslVSyF8nizjmXzDFKO4l8GzXd98fMHiLTl9EmPE5HX0CDoKLxgrE/6ncA5AXZjUHyx
 8P+BeAr1VMqeJvu/XJdAOn+om5YhkSLl/Yo9tZum9tqZtkepNXEAn9VRSndnOhwplP8E
 5ypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zh4gXytghVEuiXS6XTFcK41jggTkHaLkJ9UBzSqVguA=;
 b=PZ0sGTQYWLL2iYtqPRTZAiu+BgMJPox3cYFvuWJe1x6gGbUltzXBj0jTnBJ08OPQVS
 BCBWu73Xj+sJoSecfatiaw0rZBg8LK4GsEcSlXQScWFaXmHRBbjZco0sCkAnVsvIB8g/
 x1ZpDrI9YceLPwaY5QfpqSJKfAhjEl5OAnvRnfEJP7R0z9dQ4azD+Mm+JwjdII/CB+LC
 6pkoDlNMuRMOT29MZONtkNAd9ZwTRcduMXOO0VG46Cwi+7OeEDVYHXiVVcMOhgNUMtzy
 pBfJQGnhKvWzlGFyMCdHtIwxnXCKkpFiUHBxp6bSQeaEgwiAqrVNpn1qyePtcoFXLISN
 L6HA==
X-Gm-Message-State: AJIora/AD/LtTU2s47JTTLxxDKEgsXBvTp6UC2fM2mE7u51WpCYgCJza
 wLXlPsPcuiEdiUVwokMxY8yDWQ==
X-Google-Smtp-Source: AGRyM1uxotBA5ZX1LEog1JIoxb7Q93ski7sup+MM/rPVVXHAh6u0rw1lKVXeTTg7BgIm65enWh22zQ==
X-Received: by 2002:adf:e448:0:b0:21b:80e4:e0e2 with SMTP id
 t8-20020adfe448000000b0021b80e4e0e2mr1271161wrm.133.1655874340102; 
 Tue, 21 Jun 2022 22:05:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c5-20020adffb05000000b002102b16b9a4sm8506wrr.110.2022.06.21.22.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 22:05:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6118A1FFB7;
 Wed, 22 Jun 2022 06:05:38 +0100 (BST)
References: <dbf7e57b-a57e-8ed8-67b9-6d43c534a317@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Machado <luis.machado@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [RESOLVED] aarch64 edk2 + linux kernel crash with gicv4
Date: Wed, 22 Jun 2022 06:03:54 +0100
In-reply-to: <dbf7e57b-a57e-8ed8-67b9-6d43c534a317@linaro.org>
Message-ID: <87tu8dqod9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Hi Luis,
>
> Cc'ing qemu-devel just in case someone else runs into this problem:
>
> The symptom is an early-ish crash booting the linux kernel -- without
> earlycon there is no output at all.  Reproducing it requires both
> -bios QEMU_EFI.fd and -kernel Image.gz. Using only one of the two
> options works.

What should the combination of the two options mean? Usually the
firmware loads the kernel and -kernel is a shortcut hack to avoid the
firmware setup. If you specify both does the firmware still run but
somehow find the kernel mapped in memory?

>
> I tracked the crash to the qemu commit that enabled GICv4.  So I tried
> using -M gic-version=3D3, and that works.
>
> I wondered if the problem is that the edk2 image from Ubuntu 20.04 is
> too old and can't properly handle GICv4, leaving the device in an
> inconsistent state for the kernel.  So I tried an image from
> https://retrage.github.io/edk2-nightly/ with gic-version=3Dmax, and that
> works.
>
> So... solved.
>
>
> r~


--=20
Alex Benn=C3=A9e

