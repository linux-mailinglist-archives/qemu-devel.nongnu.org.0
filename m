Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D168BE0A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1Rs-00015u-Ml; Mon, 06 Feb 2023 08:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1Rq-00015W-GV
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:22:18 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP1Ro-0001wn-US
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:22:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id k13so2930198wrh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDXQ38LgrhyamYuqpKfLoPIzxTL6b+fVv9MrvHsxPFg=;
 b=HS14VQ1DJQIpTS0w3UD31jsb47pLotFV+Sg1ACEpzdGX//fQcxrnSO/OtNGvwagG7O
 Fzsm3rRLMIiBGG/MseNmyqwIQTZGGtudHKwtQ+XlyCjypNTZroic/O1bcemZuvzlVfpF
 b5R1NHA6EVQ9fe+oJ+Mm4Or68kUoLVx6TB4Xfn65uieYCgyOvQsPhAzlYWbWLlPZi28s
 AzCson4/FTU2v/a4bQI0idwUucl7f8UuLXAec3FiN/85hmk+iqwk1CEajCErAWzjeBi8
 2/27T/VDasqzw/q3w8iBd34I4TFp1+Ong1Gxc12UTt8K2wBLl1frSIEhpzc5GTZoazO5
 NBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xDXQ38LgrhyamYuqpKfLoPIzxTL6b+fVv9MrvHsxPFg=;
 b=H3IntGk/mdF5VUkyF2nkg7KEzz7rUrlOeanc5JnhwbYIkPIIt/DzIeMNYfW9u7HWSc
 1GqFuWU95j0q++89bo62JJzdv5ry/2iQINfAazAKHeOczmYGLwTJlRlfwSFtt+q+t4sZ
 nwyRTjs+KWc04wmcY7oQgIyqdwraqZ+2UxtwC0VxI/fj9Fo2mInNjaXNKeTxugGyNtum
 1cZlNkdDIs/G1tTISxNyuNsBKxuVBr1v8ey+71ILOgjvW0swMSIEE/XMXpdFEs2D3p8m
 nIOMSSps/K1q2KsTCRuDkvax1EM+ZRxknbE13jOgL8oo6mxODSHorw5VIQFI6GNaCpsN
 uTGw==
X-Gm-Message-State: AO0yUKWw8DOt6URs0qf+GoS25LmGcxWFb6491MIm+CPAmJ64iS1U+1AT
 ws09Tg5hLpnwWi/ayXq6MPzRGw==
X-Google-Smtp-Source: AK7set/cI/6DgMY6PBlcRpD68rZocOH3YkqeksMq+gdnKwgRLfzJadn6QbMT9HP6olMn33Ikj2uI5g==
X-Received: by 2002:adf:b64f:0:b0:2bf:b6b9:f54e with SMTP id
 i15-20020adfb64f000000b002bfb6b9f54emr15936383wre.25.1675689735180; 
 Mon, 06 Feb 2023 05:22:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a5d69c2000000b002c3de83be0csm6088410wrw.87.2023.02.06.05.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:22:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A87D1FFB7;
 Mon,  6 Feb 2023 13:22:14 +0000 (GMT)
References: <20230206123247.16814-1-pbonzini@redhat.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org
Subject: Re: [PATCH] build: make meson-buildoptions.sh stable
Date: Mon, 06 Feb 2023 13:22:07 +0000
In-reply-to: <20230206123247.16814-1-pbonzini@redhat.com>
Message-ID: <875ycfq67t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> The library directory can change depending on the multilib setup of the h=
ost.
> It would be even better to detect it in configure with the same algorithm
> that Meson uses, but the important thing to avoid confusing developers is
> to have identical contents of scripts/meson-buildoptions.sh, independent
> of the distro and architecture on which it was created.
>
> So, for now just give a custom default value to libdir.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

