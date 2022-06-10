Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C135466F1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 14:56:48 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeBz-0001KW-Dw
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 08:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze8X-0007ps-4w
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:53:14 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:44973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze8U-0001iH-Rr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:53:12 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y188so17373374ybe.11
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C352zPwY+y8qyLidDVABt3DBbNONoM/YbKmD+TaPkfA=;
 b=C2C5I0IEVNjqT4G9J4BI2RiJ2/k5RTTx5bCX26WfKoVmuSLj82Q0mUxX68zcodVAjL
 o5T7a/o3ccwLxpZ9IcOZXcQZE5QnYWp8KhZ6+YG7IxfmBO5u6HlEdjDUkh4AKzZOBfkP
 OiSzkABblv+/62FAKKhyZKlk7JlKSJDcOjBwqysNgeI2R6zzTT2Ajz+M/K7w7yWrvrXr
 d3z1Etj3Blz4h1ZUURj4C/C/ZYwHDhptSVCN5dVdokKg/8B2qzV7Qu69e3f0LB061B+6
 gFzwAFcRJBT42KPh7nWZWU5OB8VupzVseHeMX2b57NPWbUUhTiWycHxfCrsyJAq8ljM+
 5i3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C352zPwY+y8qyLidDVABt3DBbNONoM/YbKmD+TaPkfA=;
 b=35vcdseKduNJOvTcUvZ99NXz08kz3pioqDJS9W2hjTKc+eob/tLbLh/ZM7EFfQCLLT
 ReGPjiKdrvypOdUhIjeicrutkvpVqEGJ/qSGBefQHAJdGdGVdqQzDda+VXgOH4ldbrlj
 wdSAgx2sHGu/lg45Pe4c5zFnyVoFDL9D299w7++YMmap5nTebjslZdug5x9/J4ZHszf/
 Dt/y8OLmOMszBnuhREcuExzP/+9vlC+heyLicaxPt12570pzLr1ToBk+v82mjqlcai2G
 mvuKWPWQvwPItP6Z3wQwSQPmPy1RULbzbhD/CQVHLplFEfD3JLxUPououuIlEp9HMKRi
 TH/g==
X-Gm-Message-State: AOAM533K6+Ipfg0hcTIkfRdmruzYjxca2s3ENX1t1jH65yutuxDiFS7u
 rHSZ/FmqyG1yZj0KfwPteHYxA9NwgZvysbGl9J20eQ==
X-Google-Smtp-Source: ABdhPJyt2WVHD4u5gWF6+KzQE81X6K0us9dsrAltziBiPigilJmTg2yaIIYRD8PiW4AByoKFGqKn+fMy6rTIWyRru5c=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr42541436ybb.140.1654865586586; Fri, 10
 Jun 2022 05:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:52:56 +0100
Message-ID: <CAFEAcA9A5SZLuuScyAvYnCc-4aANKr7b10FEp_o4aN43WSbH=A@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] target/arm: tidy exception routing
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Jun 2022 at 21:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is mostly code movement at this point, out of headers
> and into op_helper.c and debug_helper.c.
>
> Changes for v3:
>   * Drop helper_exception_advsimdfp_access.
>   * Drop Rearrange Secure PL1 test in arm_debug_target_el.
>   * Improve patch comment for helper_exception_swstep.
>
> All patches are reviewed.
>



Applied to target-arm.next, thanks.

-- PMM

