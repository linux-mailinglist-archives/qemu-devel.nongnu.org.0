Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6CF60F253
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:29:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyGG-0006RH-P7; Thu, 27 Oct 2022 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyGE-0005tn-Io
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:29:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyGC-0005jc-KW
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:29:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so3557391wme.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTA9Gvnuv6UUxQ/qx4j/IHzRzEM+WOtsmlQcXVsIJpU=;
 b=z1eHKoq6NOEe3ZAEawObOpXlfYAANyqar2fozdDvagH7zf6fpgqZtFGlB4iJS9vXU9
 dBb0Nek2jbZqlMsOPth/9iIypnNqS8cF0cRC4YKCj4OacN5Nre+Cg1MO0mRfQ0+fCaoM
 UIw1L7mEKH4Q808fVeGNua6M4gFoyKbGS+QX3JMjhW1AYamt2SlNEZ0E3mnVjZpDHl1s
 nqTu2ChFDGCCfVytScSjtTJueuymC4vfou3Nuo/UZs/3e2FfzW4ulz6NmuaOND7VJa6K
 7UW47/KgxPta0YGANzSQDDveLIck6OOm3gUgxLL1StC8WVDZ3BLUkmb9z4VZDN0paNw1
 VfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wTA9Gvnuv6UUxQ/qx4j/IHzRzEM+WOtsmlQcXVsIJpU=;
 b=JPkTFQsvKyUHdUwFEKFfwwfepV6/RXxsa8vj9WRrWi90sHdUFIORlwms60QcjqbQqb
 2jKCLS6arvU1hjBEM4EWrGH1VSK77mOZBs/OtIWxbYmQzI9+PN2TMDYlVEQQeMvJw0EO
 K+/4FWbvBFwRttxH78Tjy98CCpyT5OoCfZs8iaT5f2eO0BoVhw9m1pw+FM3fTpWhHZdx
 XlwDyRmDDVUct7UBqXBSRv4OMkZD7RBEwzPHxBn8ebitfq98LHTICEA0f2xxAxsH1kUo
 XF11CJL0dO6Fd5K2rUIhPh0Cwrhf8SwFy08FirQn1ZztaVFfb9mcoBK5n1M1BZm+aaIQ
 CECg==
X-Gm-Message-State: ACrzQf3uI3DL4uNiaCR+MGsPITd5xzIq9J0SjcCkRUXsh8L0yARfzZ4g
 1Km2lqzwh3PemRlX3O3tHGgCFQ==
X-Google-Smtp-Source: AMsMyM57yUzw6PjyewkqmFllhAW/fCfvPiIpnILHF2Y50Z9kvnbKpXmHTOyw6Hbq20X/p/f1uWoCKQ==
X-Received: by 2002:a05:600c:19d1:b0:3c7:b52:3aa4 with SMTP id
 u17-20020a05600c19d100b003c70b523aa4mr5069674wmq.56.1666859346994; 
 Thu, 27 Oct 2022 01:29:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c5-20020adfef45000000b002366e8eee11sm549681wrp.101.2022.10.27.01.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:29:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98B041FFB7;
 Thu, 27 Oct 2022 09:29:05 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: stefano.stabellini@amd.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 00/12] Introduce xenpv machine for arm architecture
Date: Thu, 27 Oct 2022 09:26:52 +0100
In-reply-to: <20221015050750.4185-1-vikram.garhwal@amd.com>
Message-ID: <87o7tx3c1a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

> Hi,
> This series add xenpv machine for aarch64. Motivation behind creating xen=
pv
> machine with IOREQ and TPM was to enable each guest on Xen aarch64 to hav=
e it's
> own unique and emulated TPM.
>
> This series does following:
>     1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so th=
ose can
>        be used for aarch64.
>     2. We added a minimal xenpv arm machine which creates an IOREQ server=
 and
>        support TPM.

Now I have some CI minutes again:

  https://gitlab.com/stsquad/qemu/-/pipelines/677956972/failures

which broadly break down into:

  * GUEST_TPM_BASE define missing
  * #include <xenstore.h> failure on builds that don't enable Xen
  * CPUTLBEntryFull f; breakage (tcg bits in a non-tcg build?)

--=20
Alex Benn=C3=A9e

