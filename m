Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743136A83E1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:54:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjNH-0002FI-J9; Thu, 02 Mar 2023 08:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXjND-0002F3-Bi
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:53:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXjNB-00026E-NZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:53:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1538000wmi.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RbXU2vj0IY0hDAFlf1iKe9fCzrKJhIF9m2xoBHeQ8sM=;
 b=nzZGz0EFBELApdZdc294t+3VMNK80yqkMxRFyQt8bxLf7A00opB9NFPpVAMlFebgpc
 vtxitShyyRYLKv0IWJl6UKEo4xek5nXKi1DYQtxZ2GIwCy0WfPpLfYyD/8JVh+vVw2qv
 1PzQHhP5wGypk5fy8ZKyCJ0AXCutqG4BG7wSoVyO+D1rlR30IiVfbvtex+mrGIBvus5a
 yFIj4HMHdFTUfk1os8zwOCgKOx24gg0jZ5/QO6SWgi2+ydMsnkU0tFw6Ftp6YgpFdVnS
 LnDzNY1RthZfPufv6l++CCRYGXtRG06Ekri3mVSaL9hF/GnCXlPKy0uelkLgDKT6uzSN
 WqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RbXU2vj0IY0hDAFlf1iKe9fCzrKJhIF9m2xoBHeQ8sM=;
 b=sjWXzd6xKJ71IFOtkUs+bytx173AUpFOfwy1pHIKBxH1p9GZHBs58DKatQiV9tOdy4
 lmMc0f6XC+8xHwap7POevVnp9bwMTah6ablUkqZ13TDhKQuxid7pxrbmf/4TVV5ZpC48
 JIRb74JarDy6qoKqC5CeU0OOV9TUr6S/JDduI5EcA5axgHNbiOMJz6/etJlghdwEapLm
 OCU/1GB+ZyNyhjxJLuoiuIHYekq2oB0fRP8Vu/5Jok3npNcixE8Nrgsffq3GJ1u4Z+LN
 qY5pazFBsQo4YLZqM42uq19+lPfDo3mraWNF00gEj6Q3zETjJ+oPzAebt+Qz2YEmfgX+
 EGfw==
X-Gm-Message-State: AO0yUKWT2Ze6080ePOWV6H5Ng3eEXzmN5CLYh9djLkoFvaLPvu5iuDiz
 E8xwgK0vdGg0N31Pa7PXlldtpw==
X-Google-Smtp-Source: AK7set+WFnV3eoB2pGaqVNAcQyx5YnDuMwI0evXG+gQim0dd76evQ+KvVdy7Wg7HwfjMHB311tEU9Q==
X-Received: by 2002:a05:600c:3c89:b0:3eb:39e2:9157 with SMTP id
 bg9-20020a05600c3c8900b003eb39e29157mr7683004wmb.22.1677765207984; 
 Thu, 02 Mar 2023 05:53:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcde8000000b003dc521f336esm3088826wmj.14.2023.03.02.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:53:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D6141FFB7;
 Thu,  2 Mar 2023 13:53:27 +0000 (GMT)
References: <20230207131721.49233-1-mads@ynddal.dk>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 kvm@vger.kernel.org, Yanan Wang <wangyanan55@huawei.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2] gdbstub: move update guest debug to accel ops
Date: Thu, 02 Mar 2023 13:53:21 +0000
In-reply-to: <20230207131721.49233-1-mads@ynddal.dk>
Message-ID: <874jr3b6p4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Mads Ynddal <mads@ynddal.dk> writes:

> From: Mads Ynddal <m.ynddal@samsung.com>
>
> Continuing the refactor of a48e7d9e52 (gdbstub: move guest debug support
> check to ops) by removing hardcoded kvm_enabled() from generic cpu.c
> code, and replace it with a property of AccelOpsClass.
>
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>

Queued to gdbstub/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

