Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2976344818A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:23:59 +0100 (CET)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5Yy-0004bM-Bc
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5Xf-0003uP-3x
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:22:36 -0500
Received: from [2a00:1450:4864:20::534] (port=44834
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mk5Xd-0000RD-10
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:22:34 -0500
Received: by mail-ed1-x534.google.com with SMTP id j21so62954199edt.11
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R74r8Qa5QVcJoIVcE5bHlwBHeeseAGJmUak8PJIPs28=;
 b=GbgE8YiCpbJ9FGYFsZWA2BHTZ4xJz5O78mkoq3yu+R0Bvi54Y8zZrsu3HU8tYwFuQ1
 4aJQyIrfsfPjMMjaoWsE5K369FNylo1TjPvbYENJzPtVldP9s8NH4MdJ9SwfIW7T4wv/
 TBNaqhPdW4elkrUNqn+jqnOqOOLUffE5brYfkcdE2UxruBPaAIbh/PVJqCY9PxCodqLU
 PkcJ7ttY1EW4a5mcoAwb/6RKekaNDGfeKsyJOkG1Ra42BDN6+DeiWhEtpWyJJ+9Y9Anb
 MJxxG4MgLYXguKIJSxXqSoPmjRD+reRJz1EOp8ABtGJCChTwfSDop5byK19vf5zCZAWl
 L4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R74r8Qa5QVcJoIVcE5bHlwBHeeseAGJmUak8PJIPs28=;
 b=wP418DydUMTjob7Xw+qZV/UCyIibYK4X7DDWpxW/VE26Ey57AqQRcwx869iTTFj8hp
 bSTE2/H8/ioarAGhL3K6wUC82WZSvZ98nktJLPgo4L5RGrtEtLGXpnqjhKyokHAIqGQm
 mnOyfkoD4aMICA1e7x9YIKPyiGw40jVi/Crd1GIStoi3xWdz478dPLZXOL/J28ECTCRJ
 petGyPF7pzU6yuO03UeVdEPVPro4rzOHnLACRaXriui7o9PSdB66bAyF6gg6IDnUOZ8y
 I8bwJSofGccD8XrKoBRi6L9L/y0x+OfZIBtgWk/PQU5E7I0QWDEiQ+k+TstERQxwu8r6
 vG7Q==
X-Gm-Message-State: AOAM5327VU6BD+jwac4Gtcz+ItWRN2MRUy52tEFkELX9qny+cDwYkLfH
 yL4gqnDozevo6EneJZw4JmOiibficWyZNZ2FJZameVHfVrM=
X-Google-Smtp-Source: ABdhPJwfm3NXtfpylhNGYq11ILHboNPRJ9apHybf0H0NkLez/h4KJJzTJFxaLO1yEreRQaNhM5hcumPecLav42Wz08E=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr118960wrf.302.1636381026365; 
 Mon, 08 Nov 2021 06:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Nov 2021 14:16:55 +0000
Message-ID: <CAFEAcA_xNteFJzgmGjmzpEZUNQnV8yiEHojL-ocsX4Zj0VamHQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] target/arm: Fix insn exception priorities
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Raise pc alignment faults.
> Fix single-step and pc-align priority over breakpoints.
> Not yet fixing insn abort priority over breakpoints.

Do you have a view on whether we should put this into 6.2
or hold it for 7.0 ?

-- PMM

