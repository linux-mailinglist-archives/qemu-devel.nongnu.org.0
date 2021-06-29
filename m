Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA743B73FF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:11:50 +0200 (CEST)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyESq-0002iK-An
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEQr-0000KS-MJ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:09:45 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyEQp-0005XV-2c
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:09:45 -0400
Received: by mail-ed1-x52a.google.com with SMTP id s15so31421333edt.13
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vGyuzy7Out9WLuYPTBx/yGq85eVpLEIcHYrNKiLagD8=;
 b=oCfpf2i+U+y6LH+tFCkApmc3gjSsIZHpCqX4Ep0Cm3mPdDC5woRMzm2wOec1HnoEQd
 1bc6Yz1RWJq4YvkgpgOVSHgEJ22B/Uc/BdMAgvapl0s2/J77Qh7j+0lLzVeQ05xJNJJb
 lMcmKQr5PalBwCLLgiqfXXskeN0zzfNGW6UnGw811s61FtKv+riev375eIQhd2eSq8HW
 /2I0wpdl1UQ3ZAsSMloUHfFBVJ+/MUVOb0269VR49tT5DdbB8lm078yftK1mAw4vwVt7
 4x2LHPuU2z/FZL0y232IahVcSW58kUXBq6tx+pC6W2nkTjGShpAjZpO2wEQ91lU4km41
 zEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGyuzy7Out9WLuYPTBx/yGq85eVpLEIcHYrNKiLagD8=;
 b=ZK2RgRHSt6uqwLH/tgekSxp79p6XR5cbpLBK2EksP5ZlpKxOxhfiTASMTFQtK5OH30
 oK7ebo+wDb2+MLWMxZS6UV/TVZxnfLfKv5uQrP66V1TsaZMd40m2cRQqqh5Cb8VCV/nW
 neQ61WfCurU88lIv9yXEcJHx5sad2wW1KwRuFSkzXHSloUOYtx8EJDvps8Ec1T+VtnmA
 qMup7/fqp07UMGgh7XIcONaR8WMxFoGeHiONKxsstd2dxiHwkvCmdmYZyauKbwIqo5ZH
 WHVMsZWicoeISfMayLD+B/VIIIohk1gorNP+EeV0XohpVrOUpdYaRvD2HxfSCLKbLox/
 2YDQ==
X-Gm-Message-State: AOAM5318KlmnAAb+Z2kIlXIX269daDO0CIDLC1/HNM/w17mmDL9pkMSs
 15QBYkDzLEfn+fs7Icn8qvEK+YodH2v29xtJcDdu5w==
X-Google-Smtp-Source: ABdhPJxXumwiptOMmAm6D7BdEn6U5kivM7kt6beVMRcT6rgqVb6K41YmnVOlioJr6TQXveL6OxoHDldvICwlB8RCesU=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr40054441edr.204.1624975781045; 
 Tue, 29 Jun 2021 07:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-6-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 15:09:04 +0100
Message-ID: <CAFEAcA91p7_PKvs3aJnqe2zy9MOv=y5pn6yp-SmwRVZow92tww@mail.gmail.com>
Subject: Re: [PATCH v2 05/23] linux-user/arm: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> ARM is more complicated than the others, in that we also
> have trampolines for using SA_RESTORER with FDPIC, and
> we need to create trampolines for both ARM and Thumb modes.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/target_signal.h |   2 +
>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 72 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I'm not 100% confident I checked all the details. Do you have
test programs that checked all the different trampolines ?

thanks
-- PMM

