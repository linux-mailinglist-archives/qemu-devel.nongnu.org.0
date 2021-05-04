Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D803727C4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:04:49 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqz2-0003Ke-Cc
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqoY-0008Kq-91
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldqoW-0005f2-9q
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso756087wmc.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 01:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2tdoE4RQRPI1nnm1Z5NMaQKWvhdBWyGIhcgeWTPCGB8=;
 b=gQke5CauWNx/lYhk1CZnErfOtF5l0UznJePKbMr3W8jtTJw4+FYElRdtuuGud35osy
 IwLHBXFog4zxtavn+BVdvz7h7ZtKUpjS6sVNhBzD8W2RwyeODBepNBCw8sjKJ43v3CXA
 ggIjNBTl+vUQmRaabHY2ZvjAAQXcs3BzwLK9/3fgtg38wcofyrgJfSJIEMI0+8QgBFor
 6/RZyNWU48SuIUZ3AuDSQOeBMN3hl/9LdNVqy5hBY+vS3Wk2ysa9IPwt3VcoboYkgqNz
 W0qzRZfrk0XeF98fsC8MSGjefLdd19iloJ3Cia2cHJX3Kt9AFc6Gac6VNksB4tCRjV8X
 +4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2tdoE4RQRPI1nnm1Z5NMaQKWvhdBWyGIhcgeWTPCGB8=;
 b=TZys7eyx38B9xegCCjZzOLYUDLFQLQevuq/hPZ5I4drxMR+FVlvtIqfofYNnHVYbKq
 jrnMYIsAl6UdchgH7XxDyaYdohN442oI9fRjHRMyuH3t4Zkzz66nk3R15u8BhZBDV35B
 sehsDdJfMMuLWekzpNZuKYJgg7KDR8N6dQx+3lOUp9bcG3eljckH6cf9uzSbz1mvxPal
 ZV3HbJbQElDAxuMzpNvtcdJyrgecyfKt/xcIyzFHbGhuHhEcMeo+4LpbgBe3jA3IzMVg
 XB6bV67xRcn7oMDP8tZXZkH08bfFCH5U9aXTKrYNc0vTkP0FbwX5AxWUD+acVG7Sk1N/
 IxyA==
X-Gm-Message-State: AOAM532nEAhRj0H5inWqc82J7fJW4gxeU7ZRH1p48JPLXIt7TCn6e30Q
 P14oW+6wbCFXYyKqu1Eav6U/Zw==
X-Google-Smtp-Source: ABdhPJzWZuARrgEGvRKVDeCfmA3RzyHXks0vOxSSDDnaDM9aiLXvRFzfs9TGPSJhswp90euLxMYjVw==
X-Received: by 2002:a05:600c:21d3:: with SMTP id
 x19mr5170702wmj.13.1620118434114; 
 Tue, 04 May 2021 01:53:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e38sm1660801wmp.21.2021.05.04.01.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:53:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 523171FF7E;
 Tue,  4 May 2021 09:53:52 +0100 (BST)
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-4-peter.maydell@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] tests: Avoid side effects inside g_assert() arguments
Date: Tue, 04 May 2021 09:48:39 +0100
In-reply-to: <20210503165525.26221-4-peter.maydell@linaro.org>
Message-ID: <87wnseop5r.fsf@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <minyard@acm.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> For us, assertions are always enabled, but side-effect expressions
> inside the argument to g_assert() are bad style anyway. Fix three
> occurrences in IPMI related tests, which will silence some Coverity
> nits.
>
> Fixes: CID 1432322, CID 1432287, CID 1432291
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/ipmi-bt-test.c  | 6 ++++--
>  tests/qtest/ipmi-kcs-test.c | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
> index a42207d416f..8492f02a9c3 100644
> --- a/tests/qtest/ipmi-bt-test.c
> +++ b/tests/qtest/ipmi-bt-test.c
> @@ -98,7 +98,8 @@ static void bt_wait_b_busy(void)
>  {
>      unsigned int count =3D 1000;
>      while (IPMI_BT_CTLREG_GET_B_BUSY() !=3D 0) {
> -        g_assert(--count !=3D 0);
> +        --count;
> +        g_assert(count !=3D 0);

This does seem a little weird - we are not asserting an interface
violation just that the read should have cleared in 1000 * 100 usec. If
it doesn't is that really a theoretically impossible situation or just
an example of a failed test.

That said looking at how deeply buried in the test these helpers are an
assert is probably better than a convoluted attempt to return out and
exit the test with a failure.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>          usleep(100);
>      }
>  }
> @@ -107,7 +108,8 @@ static void bt_wait_b2h_atn(void)
>  {
>      unsigned int count =3D 1000;
>      while (IPMI_BT_CTLREG_GET_B2H_ATN() =3D=3D 0) {
> -        g_assert(--count !=3D 0);
> +        --count;
> +        g_assert(count !=3D 0);
>          usleep(100);
>      }
>  }
> diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
> index fc0a918c8d1..afc24dd3e46 100644
> --- a/tests/qtest/ipmi-kcs-test.c
> +++ b/tests/qtest/ipmi-kcs-test.c
> @@ -73,7 +73,8 @@ static void kcs_wait_ibf(void)
>  {
>      unsigned int count =3D 1000;
>      while (IPMI_KCS_CMDREG_GET_IBF() !=3D 0) {
> -        g_assert(--count !=3D 0);
> +        --count;
> +        g_assert(count !=3D 0);
>      }
>  }


--=20
Alex Benn=C3=A9e

