Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699F24B179
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 10:56:14 +0200 (CEST)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8gMn-0001nP-3a
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 04:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8gM6-0001Jc-6j
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 04:55:30 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8gM4-0007w6-Lu
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 04:55:29 -0400
Received: by mail-ej1-x644.google.com with SMTP id t10so1566124ejs.8
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 01:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQVBDah8EuLjQCC3k644t7wKUAg3k/Jomc8EqA920nU=;
 b=hPKwkvKYv6DtWfICP6xupQIUPHXOQiMn5ozNCwKvUhZlC2IO5xyZr8PK/EJxmL5QNb
 ga1RzZS9LIee0ZikGxj1KW+q6QFCJt+zRnucLB+SEjx2v6Yq8a8FcsXRxtxx/MRQXFy/
 xGcU3FK0Fx369Jm0QF4SQJ8NpFAMCNl6LCReQLcDsKF2Qlrtr+yle8OtTmS4QZwrRIAS
 uQCy8gDX73My5KMLEqYf7r7V7ANMtfPFvKFMgc263azGRoe0eOrUp29TLmqGiqfuIKPb
 +05QzinH9SDNqp3nNAFNBeJ2BYD9UyxiwNn6Y8P5/zjtqHcwPjxzeTwlapkjaEhD/dC/
 dtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQVBDah8EuLjQCC3k644t7wKUAg3k/Jomc8EqA920nU=;
 b=NrWNrz8/tJu0MyfIwpfSNrhYvVk7sb8O2TP69XEmjxyRVmK1nNPu1KpC5HzgdI97Zi
 Ir/enN6qMyoa3faZM60XPHyaY4lSkQV4mM/FAK1SBhxc40ABcvLT20Zs2VwH1+54myYO
 yoFxn5gwhtEUxdVoyLTBLUWUn4KqWM/K3skIKrjTeKcPX2pS37wUtedBSgI2b277jAQP
 z3lS5zj8QmSIPxo6Sx5s8jWzztpaUEANA5NOS69Y0zY1YzowWSemASI3Pkv1QqwugzQE
 ZDqmvF1fWqYwctzHREfqn1GriI292Gx0kTdrpxh7L/m2LUmllI+HrM5rsAexXzrdctNw
 0Zwg==
X-Gm-Message-State: AOAM532X8ZDIiLbvyf92ngVCDX7LZoHVBo9NCV6yAqZ8XdCqECasLFF/
 uPgbUx1W8zxsm+++7nm1DQZ4aeus1AgAOEzLjpQKqQ==
X-Google-Smtp-Source: ABdhPJxqAHWfpElWxU/C++tPd2CBZORC6GkunxeIssrekE8mUr5wKjMdHbnsVNq3EFbiX54AOdMa6f6HakCBgSjc7iQ=
X-Received: by 2002:a17:906:b814:: with SMTP id
 dv20mr1605795ejb.4.1597913727175; 
 Thu, 20 Aug 2020 01:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200820045507.614288-1-punit1.agrawal@toshiba.co.jp>
In-Reply-To: <20200820045507.614288-1-punit1.agrawal@toshiba.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Aug 2020 09:55:16 +0100
Message-ID: <CAFEAcA-zRAzU_ZRE5Wfc1V9jtnnhNyHEkXF4+t2TFXJ26MKc8A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Default to architecture appropriate CPU
To: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Aug 2020 at 05:55, Punit Agrawal
<punit1.agrawal@toshiba.co.jp> wrote:
>
> The default_cpu_type for the Virt machine is set to "cortex-a15" for
> both the arm (qemu-system-arm) and aarch64 (qemu-system-aarch64)
> targets.
>
> As a result, starting the aarch64 target with "-machine virt" defaults
> to booting with a Arm v7 cpu which is counter to
> expectation. Debugging the issue is further hampered by lack of any
> output from a supplied arm64 firmware as it is now running on the
> wrong CPU type.
>
> Fix this by defaulting to the "max" capability CPU for the target
> architecture. After the patch both the arm and aarch64 qemu default to
> the equivalent of passing "-cpu max".

Hi; this kind of thing has been suggested in the past several times.
Generally we've taken the view that we prefer:
 * not to make changes that would break pre-existing command lines
 * to maintain the general behaviour that a command line used
   with qemu-system-arm will also work with qemu-system-aarch64

It is certainly true that these days the default CPU type for
virt is not what most users want, though.

thanks
-- PMM

