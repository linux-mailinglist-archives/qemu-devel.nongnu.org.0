Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD926A3F07
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaI5-0006ml-CL; Mon, 27 Feb 2023 04:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWaI3-0006md-83
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:59:27 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pWaI1-0004EI-HK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:59:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3440289wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZX67iIsrdirOo6XUzx4qFE54kdhbTlQ0J2Ut7dWophU=;
 b=y/9y5wdNhyIUP+cW0HWBRWj4WFqXDixLH2+h0NHs/VN4szRH7IJe+rFVGUmGDoZ9NV
 HOBX0Cu6CiN9VkUMvzSZTW8F7QWVElIFDVaBkI5CUAJ0Fu6rFEGFIBoixxbK2iZw0rKW
 ZJHG5q0eN+56ohqRXHXQ6CAOcKawT60GzknzcS8d5UyM6iukEc3U81jBreGJgo6rbTZC
 bvxO2SwKB9wIV6g00Mol2G2UVXPaXfrV7wX96D59ARe77YQMXB8vqfakbA6jPTMj7kZZ
 mEXa1HsJa2mkvhB5ImmJ++qK2Go8e1ntgSYW7LPsKNEGtgV7j6i5D1H6Xr7+JZ4A9Iqd
 llpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZX67iIsrdirOo6XUzx4qFE54kdhbTlQ0J2Ut7dWophU=;
 b=b+TVoqRFaSM126JTqk3Y5dGGfnNpp+DnhfSKS9g6TRk/Xcu4geWqUtkkhZhGLzi5Ik
 DfjJJ0luSDp2ze6n5Ibh1KL2ViEbnnBI7SbGdhQ6s359Or4fXL7S3eFF7w4/kpaUgRDX
 2YS51fSeGHAyNetyILYRcDdnDLfze/lc2gut2sdQkz1ug3+EXnDkUVad/AmKGDPyGCSg
 r4BQqe+a40cNqDx1oNmqMFakUSxpQ0sXzJhJOjWvSoUut6gnnKEvi3d8uk80KQbOitAV
 vEDboueixOl+hmOCLagag+6k1K8PlstzFiVmGLlzOzC/4PX9vVdrxn7US1Gkkc3aZ6kS
 Ovpg==
X-Gm-Message-State: AO0yUKV6Jj1l3BkdNixHC/V8Z9ssNhXpfspiLVAVXTWM6PE6r4Ek4upv
 HgW2kWy2ICipNxGLG+5akLt9Cg==
X-Google-Smtp-Source: AK7set8P1JtT+iaFt5BBOTYl40EOVDST/p5v+atzr4PMPaT3T8Jy3ppTo6ghc3uE5k3TDcDpRmmnsg==
X-Received: by 2002:a05:600c:13d4:b0:3eb:2db4:c626 with SMTP id
 e20-20020a05600c13d400b003eb2db4c626mr6990229wmg.38.1677491963273; 
 Mon, 27 Feb 2023 01:59:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d4b10000000b002c56013c07fsm6565730wrq.109.2023.02.27.01.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 01:59:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94E8D1FFB7;
 Mon, 27 Feb 2023 09:59:22 +0000 (GMT)
References: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dinah B <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Adopting abandoned patch?
Date: Mon, 27 Feb 2023 09:57:33 +0000
In-reply-to: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
Message-ID: <874jr7juo5.fsf@linaro.org>
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


Dinah B <dinahbaum123@gmail.com> writes:

> Hi,
>
> I'm looking to get more involved in contributing to QEMU. I noticed that =
there are some issues in the tracker
> where a sample patch has been contributed but never got merged, like a pr=
oposal to add multiboot2 support:
> https://gitlab.com/qemu-project/qemu/-/issues/389

I couldn't see a patch attached to the bug report. Is it elsewhere?

>
> Is another dev allowed to "adopt" the patch as-is, with proper attributio=
n to the original dev and drive it to
> completion/merging (there are some features missing)? Or is "starting fro=
m scratch" required for legal
> reasons?

It's certainly possible to pick up a patch from someone else and take it
forward. Aside from addressing any review comments I think the minimum
requirement is the authors original Signed-off-by is intact which
asserts they could contribute code to the project.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

