Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9462CC438
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:50:10 +0100 (CET)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWGW-00050N-W3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkWBI-0000gj-8d
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:44:44 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkWBF-0003EP-9s
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:44:43 -0500
Received: by mail-ej1-x641.google.com with SMTP id ga15so5678439ejb.4
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 09:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=52muobMKTD2ZY7fgkQ6h0IsUE8lrLpom0yTEeLt+vJA=;
 b=q25t9tT12fk0isFbu7THqbt3M54PDXl0XnNfFPSJkbL5hEMC0BrNCoPdfw+ipS9BhA
 pjadCbiIHilBdb4I+lPQJZr7dBPCoTk5D0TIWBTorZajXzp/+dd91hn6WOd2js7XxGfL
 BGKX/L0J0jQdnHGoi8hNJJ1kh6QkGKpEtWphH0rcaFWjtukUjJ6D2nFGa/S0vXtZR/UQ
 tjPiYc8eRPVa8dSaDubTIHpuyVzXy+udYw8fs1rP9cg1jpXzKo0xGC1RaF5OuluKB49P
 sgvVL/JGF/YEIGtdI1UEz8tkmomiRgO00mDgxOyYmbJgnixfxXeuZbWDMP8Kvi7Ne2Ls
 A00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=52muobMKTD2ZY7fgkQ6h0IsUE8lrLpom0yTEeLt+vJA=;
 b=M4zQAieJuoTVBBYsCQbzetSTE1sPaDoEQX/g+a2Sgh4FVuOhs7YdyIKB1qzH9omANH
 91d82z1HPa9EfhwMDXVOrhfnUm4fOlP8joxMM4b83BOpHbb6JZUfq2DRt3x9B4UaaQlT
 xTTf0rT3aIm/6unbCjQLyubSD/wIM9k4sOpMaoCk+joM2y3tUOknZguzScRUX/VUE2A6
 UJQLpN9xcpF6MR9uhHlwhpbkNCLAP4YRYcWF8uFCpV7i7yG9Xowl865P0NlBb/7/CLie
 /4HzGFx4YpqPP5M/gn9njAdhifTQsnincey4YRTUtVrQ+GXtQE6dWld2okeNAbxTqK6K
 HA5A==
X-Gm-Message-State: AOAM531nGsWX+xRtpd1a9+/+3RyYLVb3ibJRLEynsmf5e2GMiImrSDHx
 Roy1FW/vbOpaeowJXqF/EwDOXAoCXKudmXunG0G8vw==
X-Google-Smtp-Source: ABdhPJxaSrjNlolBUwCEJUOPcKpAOc8lrsB+NOedx6Tq3wCRoeZSSZPrQ83NPbMjVdtPo62cp8+HeuWA1BYyy7HfA+o=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr861211ejd.382.1606931079753; 
 Wed, 02 Dec 2020 09:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20201118165206.2826-1-steplong@quicinc.com>
 <20201124184754.247-1-steplong@quicinc.com>
 <874kldixlx.fsf@linaro.org>
In-Reply-To: <874kldixlx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Dec 2020 17:44:28 +0000
Message-ID: <CAFEAcA9Gmg2=q=1YvyxeL+GELCiTWBAxv0masJNLnbmfHNV4SA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stephen Long <steplong@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 at 09:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> How hairy is the generation of these binaries? If it's all doable with
> standard gcc/ldd command lines it would be useful to add them as a
> tcg/multiarch test case.

Rather than using C it might be simpler just to create a failing
binary by-hand, as the StackOverflow example does:

https://stackoverflow.com/questions/64956322/alignment-requirements-for-arm=
64-elf-executables-run-in-qemu-assembled-by-gas

thanks
-- PMM

