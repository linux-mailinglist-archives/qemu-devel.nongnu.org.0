Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC44699660
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSehJ-0000XA-MM; Thu, 16 Feb 2023 08:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSehI-0000Wu-Bf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:53:16 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSehG-0006fb-LS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:53:16 -0500
Received: by mail-pf1-x42c.google.com with SMTP id bw10so1526853pfb.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A+QqRXMpaYZVQ9Gicgre5gq9JZrSFvw6aCTI66YFRKw=;
 b=uDVOK5RF/0PYFOxyy0NKuGuvNRXwJ43DvtDPpUrqANJC2OK5ZBQ+sIvlMwsaycG1pl
 M7XChx6Kaa2b2yyj5+1gUUcNl8J1/nt6CR62Nrz+FNqbbQB6eTJftrZLQXbEZKADJrJV
 P8SJcULnbWcmI+Xmtaqta16RuvEcGy91VoS62uNtj57xXVglP990mP31aXCNPSSb5Jqg
 5oBf5yFQPSZj9CdLw82FZP2kPDpNYXUfegsZHZ0NWdmJAsuKFwfBunRC8Egq/ewDZe12
 y1u6ILIbr0V4AXF8qE1j9/cmAtj2B8H0f+xR9G+irca92cYTL9W3IgeDcBP4kPvl95rS
 JrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+QqRXMpaYZVQ9Gicgre5gq9JZrSFvw6aCTI66YFRKw=;
 b=dRVngGbyv4D5Wvy8d1RSwMKMrn9mcCyrzInEBLDqUG890+pTJM5oGPEe1n9UC1MoOF
 /nIp8gkBiMNQtbaTLcup9b+f5ksJJ0+HjfTTw/tDk2zD8d2LVXno7IpPcoAw2Q5F3iD2
 QeEWW2pjDXC/NALU+jymGaFl5p3fy9k44hSduwdXdg09CUG/tcDGlnlwc0wnmeL4/U4W
 g6+hv7/ZKddIX4ecRIISj4UfPxqMSE/jl4W0LvxXdsBGe40bNbFjRwS0W0B469ojJbBq
 mu5ut3aBLQn62NmtbgZDl9MeFLjAOvyA4o9PB+DePEAbGqRCRfme44i89sa2MGb9kAz7
 Tqeg==
X-Gm-Message-State: AO0yUKXYlEmCjrEOw2psM+1cPjHgll7K/HVT15pE4u2R+GSJ4D6CacSc
 1Gnrf85JqEcM0yg2LJlOFHj/cP333fch3axy7VZJ3w==
X-Google-Smtp-Source: AK7set969Mh6ivxrtn7u154DnLBd08ITqdD5y8a1YiIj8tROlol3RLBCEs9vbztei91s0PhvwXTc/NadRT//CvdMV68=
X-Received: by 2002:a63:770a:0:b0:4fb:86d2:654b with SMTP id
 s10-20020a63770a000000b004fb86d2654bmr882083pgc.6.1676555593246; Thu, 16 Feb
 2023 05:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
In-Reply-To: <20230214171921.1917916-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:53:01 +0000
Message-ID: <CAFEAcA_iTkDhrY-rxg-BjMPsvOqdQWNN=TXOuDPSZo28gXEJjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/smmu: Fixes for TTB1
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, ola.hugosson@arm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 14 Feb 2023 at 17:21, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Two small changes to support TTB1. Since [v1] I removed the unused
> SMMU_MAX_VA_BITS and added tags, thanks!
>
> [v1] https://lore.kernel.org/qemu-devel/20230210163731.970130-1-jean-philippe@linaro.org/
>
> Jean-Philippe Brucker (2):
>   hw/arm/smmu-common: Support 64-bit addresses
>   hw/arm/smmu-common: Fix TTB1 handling



Applied to target-arm.next, thanks.

-- PMM

