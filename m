Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E33C16B9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:02:24 +0200 (CEST)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WTn-0007aK-U7
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1VyU-0007v1-Cm
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:30:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1VyS-0003Ek-OC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:30:02 -0400
Received: by mail-ed1-x52f.google.com with SMTP id t3so9095859edc.7
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mhhp5tFep4SfuUVSXguFPY/eBbdCBKawA+hR5v8+UdY=;
 b=jwkch0h53gggd5mU+FM1VPd8e2pG2q2kVQ9Dghclm3fuBPvYPyA4ywVlweNvtxDg3N
 ka8zyH5eCIH8F3jj+6l/9LmI/aFfeYQQgjoc7tSD3j9rWUZkxfeey6E8H9e0NKogUBtb
 8csPV0AnW5HwLggTtQK92gddkvixh8w5zVjCdfzUihL3TBZIaxf0YbRt6y22XUX53s2n
 h4vy917dSyEPDKTucIvRs//ec7uc9smxGLUgjab7Q+3FmUNd88dHHkkYHFEcOp87AUu2
 1yI+2tuzKHe8PoPqK8rBmnVaOpBAuJIOVwLr0oVarKGcwSKLSbqJfpHVNc9uymmayJPg
 934g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mhhp5tFep4SfuUVSXguFPY/eBbdCBKawA+hR5v8+UdY=;
 b=C++DgdTEMBUKOcg0a7k5JUW754Wdil/JSReg46xnPIyVYPC4Y9d29LRxfS9rExUvCw
 UfAyQoX2bRlUxcwBkI32v7u0kG3L+Pq+YXdlf8W46Az0PHkf59f1VAMcTChf/9/5CiLk
 hT/NBjERmgfTwhGEHcVyD+g+lP/TqXuIke1vm6HcrKve40ugxHk3STeK438UEJnSoozB
 +n+LCAK0Yq7N5maAK95LuhaYPPPzaTSPaS8WZZCIKHfTPvrDipOSekHWRtEIdkIeWVnx
 8i2YIW4qdhLnjefiwRXGOxdc42rkS1/JdTlIXXVTmLXp/0PIOUFpDJmmSmgqBca6w5/q
 EZ/w==
X-Gm-Message-State: AOAM530/NWg/AcapWNRoM0uvoONCfGmHVOMLV0D/wXmKUqK/v9K8pWBN
 UFPg790WrBNg33O9EG7ugDVm0yAyKJF002g47vfo6Q==
X-Google-Smtp-Source: ABdhPJyXIp3x+bteyfo7Y6w0+XsoxrgO416lTYuHhPUkUpe4OLwND5wVQ/iTEBWFciqc1Bolp4LmHgtbz07SR5VjZOM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr38130670edt.100.1625758198634; 
 Thu, 08 Jul 2021 08:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-6-alex.bennee@linaro.org>
In-Reply-To: <20210706145817.24109-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 16:29:19 +0100
Message-ID: <CAFEAcA97hRqE2FbR3jnYVK7eTVCRECzHkun1YHd==dgC27u5OQ@mail.gmail.com>
Subject: Re: [PATCH v1 05/39] tests/tcg: generalise the disabling of the
 signals test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 16:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It turns out you push down in one place and failures pop-up elsewhere.
> Especially on CI. Disable for now for all targets.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/hppa/Makefile.target      | 3 ---
>  tests/tcg/multiarch/Makefile.target | 6 ++++++
>  tests/tcg/s390x/Makefile.target     | 3 ---

I've cherry-picked this one to reduce the intermittent CI failures.

thanks
-- PMM

