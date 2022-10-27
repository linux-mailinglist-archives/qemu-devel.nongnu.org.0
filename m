Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C88560F381
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:18:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyxN-0007Rr-6A; Thu, 27 Oct 2022 05:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyxK-0007Pd-S9
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:13:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyxJ-0004sD-1V
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:13:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 14-20020a05600c228e00b003cf4eaef74eso1616426wmf.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS0rjLTz40M3AsJ29aPDBSMzDYHq7x7cPB8LHs6U8zk=;
 b=nlpxJiCa05jGgEtwi76Gf2RpgeYQk48VgwP9ejZmPuqvLUvsW2akEe3coIISJZwVwq
 P3koiUW+bTAC7N9JmUKT6u2MG8njNXyB7NObpM/uY7ZD1GB7w5lJ2lLFi8ceXCEyZH74
 65AAy+YzfZO/HIj1hfxDKFswdcv/QtEF1IfUa3YzqhDvlOmp6we3ARYupPkvUpOmKp7V
 /WLzCg90fN1uWdG10Cwsv8E/bNjzh3AWfJwk3dchKn7GKsfQ5JuPCq7grbqcfesskw75
 zVeJs5j4+UG0RP8zRN5uWMh1H+3iNWSw21TY7nxlEPc90ZZI5CGEEHquc6z8mjpaHnE4
 GbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bS0rjLTz40M3AsJ29aPDBSMzDYHq7x7cPB8LHs6U8zk=;
 b=uAmz0zZs+BM0tqalOG77Ap+nESVLgCIJ8Rl1J0Z2ye+Wd3IO6Ef5t9M46zJjEng3La
 1+lugnxaP0zq5sj3v4yosDWJKltx5oTxsqVfthL0D/P1+lybEuxV7WS6Gz16C/BhsQjq
 pPHC4XMqjskB8WvgZgWkkPjBmJmm0MwMtcooHGgbKlF73xpyM8yeLnbFIphvb2Faruo2
 FwrFHIepwSJnkHeIZfR36OyAUGa6p31iGCcsTiqHcVGLmXWoULPXsE5rc6EDxUKeYAAf
 cFa3L7ineULvFdMvcsbSgmzsUWNeUYuMkJLgmvLyfIw7zsMycOG3LCRRdLDw75ev9BpM
 VLeg==
X-Gm-Message-State: ACrzQf3Bd6q1LYpmKl5YhpGG7aDVamMHE5D9X3wnNkk14N0NWLFjJfDc
 G/V+v5MERLbFYty/Ku7pV7yNlw==
X-Google-Smtp-Source: AMsMyM7t4PsKTnEsI8pnVWOMdRGMlywwFyWPnu3ffJlFHv57o9BhII52GUNXNKJPytzp90tsadS8FA==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:fa3c:32a9 with SMTP id
 j30-20020a05600c1c1e00b003c6fa3c32a9mr5057252wms.203.1666862019028; 
 Thu, 27 Oct 2022 02:13:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ba24-20020a0560001c1800b0022e57e66824sm823718wrb.99.2022.10.27.02.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 02:13:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B5581FFB7;
 Thu, 27 Oct 2022 10:13:38 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-12-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: stefano.stabellini@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 11/12] meson.build: enable xenpv machine build for ARM
Date: Thu, 27 Oct 2022 10:11:32 +0100
In-reply-to: <20221015050750.4185-12-vikram.garhwal@amd.com>
Message-ID: <87y1t11vel.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Add CONFIG_XEN for aarch64 device to support build for ARM targets.

So to be clear a --enable-xen only build for any of these binaries
essentially ends up being the same thing just with a slightly less
discombobulating name?

Maybe given there is no real architecture specific stuff we should just
create a neutral binary for --enable-xen (e.g. qemu-xen-backend)?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index b686dfef75..0027d7d195 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -125,7 +125,7 @@ endif
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i386 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
>    }
>  endif
>  if cpu in ['x86', 'x86_64']


--=20
Alex Benn=C3=A9e

