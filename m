Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952034FCBC7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:13:17 +0200 (CEST)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne55o-00072o-Ek
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ne548-0005a1-52
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:11:32 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:47068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ne546-000831-JF
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:11:31 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id x200so6815545ybe.13
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 18:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7lurkKn976U0gq0F18yG3B28PxsdF+YOUCENZxlniQs=;
 b=Hn5EJ3sQexe46/ByGuaSU7ljSTXAOiFOVqRsV/ncnNnb93ezadyD51jWK26J5A0vfv
 GZFhnMcwhcAlvkwunZKO8mhmURJH3EwRh+sUSi/K4MWzGOnVggUg/Xp9ixDscrOgycbc
 i8KVzw358ICCtOehILRxf7bfyJP6lUD7iEx4ZWV2k7ChoILokkCaLihDROGs+fstDx3W
 zpB+Lja6fIUKfrEb2ycw/+e0bQh7RrQbHoSP9x4CPLVKg2v+/QHEnFmzSpa1LKkF0lSZ
 ECTupSgFHXmXc9Y23RuhBVUPrrAWNGauTY0cvbaLJRX1yXovT8UHexYAbu/+LUy6Guud
 3F4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7lurkKn976U0gq0F18yG3B28PxsdF+YOUCENZxlniQs=;
 b=sVCwK78BScYFmuSAemXSbjd+fCGJfnDtJbpNSzMwnERIsZYKKaPAg9TcUPv+BPKGNH
 DAgD9eKIw1ESQtQIFOcN2BYoKesEtX0RI7iL3HBAt0aFM7E0nEdsKR9FMWbw2sonUgi1
 iwYyHCddn8pxrNGtEtAK/wADVO3dFrn+DotU+HNlAZRXJCpGb2dwnQPzwPYDqYAjixpJ
 9LWWqZUYYgKt4aIVdAwMDyCtHf7ryTSAuL7ZUFBEJxc87RFtdxXPs7aZiLl2/f7mJjP5
 3JoUFlf/wpC8m3IESzKmngNf2+c7Ys3P43ZkGX+ZImQp2F5I2DKKWpwzy6//UhN2Olqd
 kK+g==
X-Gm-Message-State: AOAM533ZaAOI/FZ3r6SB3ivan4sM8QwH7vSxgQF/FdQrypZfQLgfW9IK
 L7yuzSqk6bI+6XfsiZUNPngbZHcs9exONFr4PnFR4fSZ
X-Google-Smtp-Source: ABdhPJzthdr4FHAacRLxO8H+AKTmQzCqsgB70wcuAFZu/wfKAuxGdsy8dmJa5Rgg4YprgSPPpdc8/6flrpNrqIRK6JE=
X-Received: by 2002:a05:6902:708:b0:63d:dcb0:c73e with SMTP id
 k8-20020a056902070800b0063ddcb0c73emr28214338ybt.231.1649725889450; Mon, 11
 Apr 2022 18:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
In-Reply-To: <20220324134812.541274-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 12 Apr 2022 09:11:18 +0800
Message-ID: <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
>
> [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
>  1 file changed, 142 insertions(+), 71 deletions(-)
>

Ping?

