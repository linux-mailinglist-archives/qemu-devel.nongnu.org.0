Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D594192D0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:10:43 +0200 (CEST)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoWw-0004iv-C5
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUoUS-00026E-Uz
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:08:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUoUN-0006O4-MY
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:08:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c21so21534799wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uoC0PrkrIEnvx99vmjou31CoKxnUniJJGeiNkd1T9r4=;
 b=sVFkRdMxLlM5WOCXjo8MPqc3gLV6KuV2ldGaeszZ4qN6kHZz1hPl1LJGCocuNG2fOo
 Dw0XgOIH2yI6pyYLAUy4VfUdMrNOS969BQkMfQx4BHS+ghz+uBLmUSAkMBp7lur1LHHM
 Ua/ZPzxtY+xdT4BDXKvBA9gI66Q01w1a4wcFh26JOQID636paLf9O1nqpuDe/ci9naHU
 U+k+mFVss8dlV3AEoBZ7zdG/KCPGfPZnmJQ1Irv0MT7pze/utugMlPn2oa0cm/9EWLP/
 GRL9HgJQZXvNL0pVE8999aWLjHtjX9vHO7kC4ib6dHozrvKFjAk9lrEZutwPpzlCJVyC
 0cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uoC0PrkrIEnvx99vmjou31CoKxnUniJJGeiNkd1T9r4=;
 b=iYe+NhyF1fyRvh2H+ETqXHuDrL/94zzztqzF3UE0sP7E00OQmyyxSmy1ZXoJZAtoVt
 QC63F9gGBuC3WDVMNOF2j0PnlpowRB6Gi6uHlaXJFUqqffs63yID3b1llN/pb9cQOEJq
 iFSaAl7dgUHfex2MqZ9+ueT37zy9iaNq9zVemcTLOUgYmNXwVKwE6UUou1Ms0r5wV4o2
 qCi/bFeUExotX3+KsD5jM9qAhCMdM50S+eiv1bymsEsdEm8MlEO9jblr1gXHDukYjky/
 KI0umrdMsdorKwNxXBP/dFmEEzIQEFR7cDCCJ7whlRjPq9fZl/+jiF47pKhIIGQC/57Q
 urvw==
X-Gm-Message-State: AOAM531kebUWH00uo2+t6D3idqtM/QC2giROf1WF2uxJjwocszTN/C8D
 SRmtubtPBCAEbPOC/XA29FMXl4C/soeEuyoqhAkgJ6IkokI=
X-Google-Smtp-Source: ABdhPJzw8Ul2ZzmOKLy7idWFMpst0F3qMHSURZA8YwnRwXaU7bqOj8PK0JPC7MshzupKS/o0szbziQF25dsL31yO/oI=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr18495990wrn.275.1632740880466; 
 Mon, 27 Sep 2021 04:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 12:07:07 +0100
Message-ID: <CAFEAcA-uYp1o-fNEbmDq2WT-b-gfwVcL7-wshtbCOc=L=U4wTQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Sept 2021 at 06:24, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This series implements the Xilinx eFUSE and BBRAM devices for
> the Versal and ZynqMP product families.
>
> Furthermore, both new devices are connected to the xlnx-versal-virt
> board and the xlnx-zcu102 board.
>
> See changes in docs/system/arm/xlnx-versal-virt.rst for detail.
>
> ---




Applied to target-arm.next, thanks.

-- PMM

