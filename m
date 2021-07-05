Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6F3BBCB5
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:10:36 +0200 (CEST)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NQp-00087J-Jg
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NO1-0006xb-L1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:07:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NNz-0004Pv-5V
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:07:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso8958917wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=v76+C4pJ8r5/rwrf4KqqsST204RexWLX9OvflMPrlQw=;
 b=UfzyMU9BSW3Jve03XYYwHSoag3cG5QXaRPql21nZMxttjgW7Ow57yn4iFtu+Ai+9iW
 Kz9bFvG1LkEQoJ3XblFagRRnDjcKDBtMmJYgjL2g7QrqwyJOBtf6GFRrisK7HvtYhAtX
 7Wi0SeX0A/J/mkx9KPwovAVkryUVWP9qO6k3ubD/VXDNomF2nM/n9xYc46NeMJr5youw
 lZoPJ+k6PXz63YwCPeCxeyGr4OjslQyEVcZwqZqMxy+jM5mV4bF6CTNgL4X3eAuJyohp
 sV3gM3E4hmFaHO549VW1zBs0nobjbuhbpyHtoccW+MEpFtSu4bMYcDXx2xDZRC6ydshH
 uHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=v76+C4pJ8r5/rwrf4KqqsST204RexWLX9OvflMPrlQw=;
 b=m9WMhV21xjPxVp7t8CVKtZJzn6y0pmK+jk7Th52KiuAdA53vMJgpih6HVSOo+nxp90
 UbMc7a2rL5OPeN6M82iU54jVOYguFzTa94+VjR+JGHGQUFi9gN8QjYY4hig3yBP1gSHE
 lMWogS8+4woNfrRdVWetFP3E8sE2PYHpLC/2G9DE6OdvGkwi2UXQTfTbGjYLoJMBdj0Q
 Q+4zMk/Ae+9FvVr206sTP06LB7naQo3CUnt2yu09Ry7NuR6i1grNsPTAsWsXmqLtOz73
 v9QDMqiVNL4gBoj/XE8PoTkwdBl2ZVn5npR72wWf8Ep4keq0II9rVHB7wht1aezOQXM2
 PlOw==
X-Gm-Message-State: AOAM53052nmBx6SnPj4RBnmN5/6WgcTjuEt3qEOdfwORGIzB/bTqPvAz
 DtRyhJP063DQxRDF5flD3Hbhow==
X-Google-Smtp-Source: ABdhPJzBxY9HyIBabs8BVVliC7LJnK/vNDXaCrIqJsuxCP1nlOeMoWV+ibqfROCWz7gMa7ZzS6wQOA==
X-Received: by 2002:a1c:1dc6:: with SMTP id
 d189mr14703920wmd.154.1625486857709; 
 Mon, 05 Jul 2021 05:07:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm21572249wmc.44.2021.07.05.05.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:07:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5F521FF7E;
 Mon,  5 Jul 2021 13:07:34 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-4-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 03/22] tests/docker: use project specific container
 registries
Date: Mon, 05 Jul 2021 13:07:29 +0100
In-reply-to: <20210623142245.307776-4-berrange@redhat.com>
Message-ID: <871r8d55h5.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Since Docker Hub has started to enforce pull rate limits on clients, it
> is preferrable to use project specific container registries where they
> are available. Fedora and OpenSUSE projects provide registries.
>
> The images in these registries are also refreshed on a more regular
> basis than the ones in docker hub, so the package update should
> generally be faster.
>
> While CentOS also has a registry it is considerably outdated compared
> to docker.io, and also only provides x86 images, while docker.io images
> are multi-arch.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

