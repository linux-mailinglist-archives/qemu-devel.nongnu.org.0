Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FC661518
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 13:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEUtL-0002he-6T; Sun, 08 Jan 2023 07:35:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUt0-0002gv-Df
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:50 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEUsy-0006qO-Rj
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 07:34:50 -0500
Received: by mail-ej1-x632.google.com with SMTP id vm8so13755361ejc.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 04:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwn8dxGWP+CI96jFOwYjf5ABJEQvNnuQgr4tw/GFuzM=;
 b=nJ9MvhdQNd3CjrhAAFp3DHhHruu1/3h3Pbsed+CiIo4miIpTlkzomJfply+Mvko2US
 eT5LerbsITAZEw5iPGG+dHMqFHTSPRIZJsNP4WlEqZ5mD5va2XE/lLmJVGPrT7dJ2o7f
 zgw4uaqVBRduP43UopNIL9m+YEcegFQnwFXf0dDBvWz7TZPMEZ0QGx2tyWrXfXk1jzo3
 46lkdR35UU7Npvi0ptzTOm7stb/PFoSbFGafOPTDQ4JK+4+X1lmzbkqlls4jVILZHTi7
 Y4c4O244d1AYfCFs4ktTJAIPayJtlIeB8lutu+srV+6L3qtDoty3idbuYBYo7K6pDKHG
 ufoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwn8dxGWP+CI96jFOwYjf5ABJEQvNnuQgr4tw/GFuzM=;
 b=PufIT7fWQVdAFS1nJLBey3b+62OcWg3BIPV9EADEQP1hqPWeDxAY/UeHDjt//o5z+S
 jxgBjWNck1IDDuNpszPmM7XBm2OUF/i80s/G2YH+RbFkEYzycb8qa5D6nsutJLsCOzDM
 xMCvAOYwmZI97u8neBb2fSER1gMQDjFUXGdEyo+fgIsoPMaaU3YRb3eKKhB4eoivK67I
 XD4hSP0HN7efgdcR8bA8II5sgRDxT1w+sZNdx9r7iP4LahMHlfe9YwHe35Bp2+7zsCLq
 lGeIDIsMgMfLIxbtrgyJBxOXzyTRUjp4WxSv1dBwUUcV8cbycYIoD9G7QFg3zowuEJUK
 KAFw==
X-Gm-Message-State: AFqh2kpswvfPsw6+7UxpffuqQcHB5TPTx32beRbbT1R9vyO4cy/4IHbe
 BOjYGgD/SElfsY/f84Gqp2ws1Hg7paV3kybnrEPDfnAB
X-Google-Smtp-Source: AMrXdXsumjV3eP1D/Fsq238y0dfb45hnvBVn1KnjSFzh1hWA+OGTdcAapWXk0UdfeaxH1awOdeXf/rtgYhJJilPLysw=
X-Received: by 2002:a17:907:6d29:b0:84d:ed8:b9df with SMTP id
 sa41-20020a1709076d2900b0084d0ed8b9dfmr1241627ejc.26.1673181287619; Sun, 08
 Jan 2023 04:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-19-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-19-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 20:34:36 +0800
Message-ID: <CAEUhbmUccrFhzAM9KL4BGq2iCTXbi+Y4+zLrWMCVFx2ifBF8BA@mail.gmail.com>
Subject: Re: [PATCH 18/20] hw/sh4: Open-code pflash_cfi02_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 5, 2023 at 6:47 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi02_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi02_register() from the pflash API,
> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/sh4/r2d.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

