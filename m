Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71A3ADF0C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:34:46 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyX7-0003AD-19
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:34:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luyVt-0001Pm-Iq
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:33:29 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1luyVr-0006LB-NV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:33:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l1so24264806ejb.6
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hB1TJROco3OkCoZWPYr1T2Mw2tzH7jQYIQA1RrtMvM=;
 b=nn9ojapawHrBG0W+j0w1iySd9IXiM3D+NejPDorQgCNS8rTgmCkxAj+WO95tH1b/mE
 6SVTUGSsWROHewWluPukvqgKTc3EIQvjsSHQYTJj7gHa4HzVxgkj7ouzOO8TxBVDydcJ
 z1Bs8vEW8gpfLMahZ92nzpNcMRPpd+LZ2Gm0Dr1awtsOaiCeGxDCBwXXk+4h0o4Jc6Ys
 /uD8hPW1feX6ZTtJ2b6DY2dxZMOtjGFzNrKOUfoNAL4xYfE0VXu0D0WktrhFCBBD3jkv
 Cy9ODm1amynjYdWy2mrm53f8IC2rj5UU+eBUGOH8Zz32aoSl+SnxsHzF+xRGjHLsFCQ5
 Aw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hB1TJROco3OkCoZWPYr1T2Mw2tzH7jQYIQA1RrtMvM=;
 b=CVaFRygFZ42lvAEugcmaeJ0sgKJPFptq9/fEyrxasCgyeLKKM1gL53TzGNbRUZFeP3
 OlVMTHvZFgIoRIf2Kbn47MQSj0jFR+n7h3iEfvlBoKUf8naZpwDsIV7wDinCzmDag04j
 WIjceDVwN0Fz0Lkqp7xFRBu9ohoQ44cFfRIEdG/0rOIQ/LldJtIQIeYowFhOVNtu3HZc
 F/FoBoVHY1GbimX4X7j7FSHt9jjs9tptq6EZXuFnOyDPk8VIG1z59tZiUhlcT8jEu9Sx
 CkZ/KMpjQCAm0Vae8V6zC+nhmE/SjKT9U21s/1zyJt3Q2belpZ+pOVFhi3rtJzwk0mk1
 9rBA==
X-Gm-Message-State: AOAM531eel4JyrElQ6O3zloBakDdodC5PKArTNxXDKZnOzZNhCqj+xQ7
 50BH9i6+IF0hPRdKHhJte3A9caEdh0Mftyt4XUeamw==
X-Google-Smtp-Source: ABdhPJw92PdCVUIsusTDkUeclWitG/s7RE6P30qPwt1UYlMId+4zJ7sfZ74WCQbOg8bPX0EWIpXCRGjfmzRyEvBq8Y8=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr18544610ejc.85.1624199605032; 
 Sun, 20 Jun 2021 07:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210619172626.875885-1-richard.henderson@linaro.org>
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Jun 2021 15:33:13 +0100
Message-ID: <CAFEAcA_M-hkbiqw8k6uo-3Hb0+z+1L0oeLeRUz5Y62KKTtYFBg@mail.gmail.com>
Subject: Re: [PATCH 00/15] accel/tcg: Fix for #360 and other i/o alignment
 issues
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Jun 2021 at 18:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Short story is that the first two patches resolve the observed
> problem, by completely bypassing quite a lot of code in memory.c.
>
> Longer story is that we should either use that code in memory.c,
> or we should bypass it to an even lower level, so that we don't
> have multiple locations doing the partial-read assembly thing.

I haven't read the patchset yet, but my initial reaction is that
we ought to be handling this stuff in memory.c, because that
code is shared across all accelerators -- we would want the
same behaviour for accesses to a device that doesn't itself
handle a misalignment or a small access, whether we are using
TCG or KVM or HVF or whatever...

thanks
-- PMM

