Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5A58ADFF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:21:21 +0200 (CEST)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK04Z-00041h-V1
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJzxM-0006qF-9q
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:13:48 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJzxD-0008CF-V9
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:13:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32269d60830so28934897b3.2
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=BDH/HOUgAa+1mfTvk/cBkHMh91YLw9/7F281Z4YLrVg=;
 b=BTGmJAtlQ7xTn5g9nGhkOR1zZPLsrhmK4IbpUfNkYnq6pbCXYa6UsLSnnMbAJ0TQpy
 aPTJpj+/XkSlWZX1lcm3wvNChWuYriKlflOrRj+PosSE/4uZYj9eTbhWMdHNrfke1PkA
 6+eBoGCWHqBx+q5tp1GqjuGLtKarFdg2gaY8kCuCnwOLGdvKyONeWAqV1KRSdmi3rogq
 xY2ErLJDvHbqklKOs2U/C0Pzaw9iDIovb2EyZr5kWd/8U468gTHdjw2xE85xGesxFe8t
 Z5+B7Dpgx/eWqhmlS3ouvpyLnTn/gXnUhv1VQse1cFMtcw25IclA0UcABnDCyIzVnHWd
 bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=BDH/HOUgAa+1mfTvk/cBkHMh91YLw9/7F281Z4YLrVg=;
 b=6i0mHjIrKterSVVOscP+DQQTmo+UbPmKHScT+CG54kIWdImStkD+JVY1VkBqex3pkh
 wBIqJBiwwX/9p7OkZrgMt4S2IxS542bV6k9gvTD1nsv0s6qXQ54slGVHyBa+EuFufGTf
 kb3PiJqtX4HaqNOIfTxzqCN+ZOcaNwsYhty4CVD51ODLcAFeENjXIRhDisJwlY7FounP
 LKOr/9yb4NmCgGGuhBXk2uxqd96dGKrlaMFA6qAG3RIPHoBWTtkbIaRFJHUOBuzSCwLB
 P15t7bWPkbuyl9EI7FPZ2o8DU3IF8tje/MSSmtiwg1pbyTsRoW0TckwY4vzw3Epf8Nta
 QdLA==
X-Gm-Message-State: ACgBeo1uKlpvBuk0OheWOplywiL5WT5skzUsW2ZtPFq7f8uGURwVxAny
 KST++FzkJdku+I1IcazeADk/0/e4hXBx1UWdDSjVLHClQ2M=
X-Google-Smtp-Source: AA6agR4l07W7tAy3h5eZ2/Tdet3+zZWStiaLqfT7vkEsWciyU75G8agzA+DLzBPzxcKd/w4AlsNSxPsfWi7CFMR4CD0=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr4060199ywf.455.1659716018812; Fri, 05
 Aug 2022 09:13:38 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 17:13:28 +0100
Message-ID: <CAFEAcA87=Xs8vd8e+eHzSFboWOUcAhJUuFvuG1gzw+Zs_M-DyQ@mail.gmail.com>
Subject: libslirp and static linking
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

Hi; I noticed today that Debian's libslirp-dev package doesn't ship
a static library version of libslirp. I was going to file a Debian
bug about that, but then looking at upstream 'libslirp' I found
that its README.md
https://gitlab.freedesktop.org/slirp/libslirp
only documents how to build a shared library libslirp, and says
"(QEMU may build with the submodule static library using --enable-slirp=git)"

So:
(1) is it possible to build the separate libslirp package as
    a static library currently?
(2) if not, can it be enhanced to do so?
(3) otherwise, is upstream QEMU going to have to retain the
    git submodule just for the static linking case ?


I also found that at least the pkg-config file shipped with
Ubuntu libslirp-dev 4.1.0-2ubuntu2.2 results in 'configure --static'
incorrectly detecting that libslirp is present, even though that
package does not ship a static library. I'm not sure whether that's
a bug in the pkg-config file, in the Debian/Ubuntu packaging, or in
QEMU's library probing code...

thanks
-- PMM

