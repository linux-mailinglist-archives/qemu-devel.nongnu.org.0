Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE054CED92
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 20:59:17 +0100 (CET)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQx2C-0002Ir-Dk
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 14:59:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQwzX-0000m1-Ac
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:56:31 -0500
Received: from [2607:f8b0:4864:20::112a] (port=36385
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQwzV-0003um-3C
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:56:31 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2dbfe58670cso142946807b3.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 11:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xyQVjVpy7iRj/xSjAvV8GJslFat/bnxcyTLAXoanDAA=;
 b=oS8V1reIck7YnUeFlrVPIercXbcvA1+nAV/FbPfw9WOiwBasHDVaAHMk3CymVPjvZZ
 EgaY3sWRknYZz48F1kDjrLCVCLoQVL731MU6GkYOrpkXFAMiCQciQ9FNQinHZuCTMXWN
 DTkajb4jph2mJul7KD8LAUUIKechLHQ2bldYV1DLAlScTI5wK4vvWpm9bweH8mzUTnEF
 Ml9eaBBz2cAO2f2AaGA0cSr+WSpYW6/PkTApk4JrbTDYQEA8d24oscdi3zP2QleidIde
 ZDklAKfgz050Mbnfc3ATKaCtZ3HPJ/0vdE1Y35mRtDm/5XJNu/DK1eKrzgI7gMBdB1vD
 a+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xyQVjVpy7iRj/xSjAvV8GJslFat/bnxcyTLAXoanDAA=;
 b=gbEPEiyGy2zD+M1NhHpTChMouehB7RTgPQUc1/Vbs09WbHH/hMXeyNS9KNgiRdC+2i
 tSOdleK7ZC4ovSkdEFL5sYZiJHWD8hccX02uByhDWlNzKtpFaXQraIR/Tw+MB6zAr5JV
 OsssbMqZx86GTST/aFSv6S3x367vM5+TrWunYSuxmw5cqcQdt3SjloIYLiVfgaAmzINL
 X7wmx8UKQDgpvErkPxr2mHmKJ15L3+li0cBWeD7JES1LP3/oJFiEdwuSA6l7OK5HcqrY
 9aBGljLe+yc1gmv4xiQ2cARfRLqvdIjvWToRgPD64wyZ/WYjNmHU0e8w9v5n4BdKX3SM
 96SQ==
X-Gm-Message-State: AOAM533r//P0px68w2lcXLvwTF2z+VDgzTYaP5K+aRGeoLO1vtpyoVNK
 u0IiD6yLPJbGSyqXwFgYLfuT9jNk0mmbwkFQoK4Ffg==
X-Google-Smtp-Source: ABdhPJyvJFATPFlU21Rb0aGS3WDhYXWsW9XGjvHkWvtDYV9TqWrKQU/ksKEJ2KmOA3tQfAmMbsX2PVGQSKvot36NJk0=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr6315003ywf.469.1646596588207; Sun, 06
 Mar 2022 11:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
In-Reply-To: <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Mar 2022 19:56:17 +0000
Message-ID: <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
Subject: Re: [PULL 00/33] Abstract ArchCPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 19:06, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> I see. I only have access to aarch64 Darwin, not x86_64; I was relying
> on our CI for that (my GitLab CI is green). I'll work a fix, thanks.

This was on my ad-hoc stuff -- I guess our gitlab CI for macos
doesn't build hvf ?

-- PMM

