Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5296995A7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeFZ-0008CX-Ft; Thu, 16 Feb 2023 08:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeFS-0008C8-VR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:24:32 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeFR-0005jx-HH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:24:30 -0500
Received: by mail-pf1-x436.google.com with SMTP id s20so1452842pfe.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VISz5i4uIp8ANgkLhq+YGuiRrpPZJPD6y+fAQIFxv2w=;
 b=foTvOk8CUcJwSJ6IpqCyV+xj+iUHOw5du99thQ+XDVbNEHXQ93qQLo8o/MQddVufNW
 u9rnXkARHBLrvcarIVqySbey2jhRBZYbHX2gNyg6xnjmz3HyEbhjRknSAdOMX0tDb6nN
 2yQbwjdG3huo/IVbp2vJ8+JHSWa1PtH9d5z2QyyxVNNpOFBSWzDLaFWz8xYwQg5CCC8O
 HllWu4yvvzL1tDJCVdFmqgKY+cqKsICDjvasD81ctGAwH5re+ccGv/G19RibrimC2gT3
 A0liS4eVu57y7zRnZLdtI/aDxFBefbj1Pws+DYoCPGuWws0dFVgzApSbbEy/yWCZcq6D
 YLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VISz5i4uIp8ANgkLhq+YGuiRrpPZJPD6y+fAQIFxv2w=;
 b=V+GD5FA8wZsF5G1ZUjGtJZKdzIbAXHX25cHRcmbxfugYsuU4b5BzBLfhjXO+8f4QEC
 STSgjpJcqLK8nSH1PMooXbrFJZizgdf5Hn0/0Vcxhh2v+Y0KcipXAKdb01zEClTZGwKt
 6zaQMvIm/q7H3kE1aoCHIfhFVdy/5A5g+lI1ANgU2FjpCinqdVLfqbEJTnZmtAdWoAKN
 bCe8Sku7KE7//NPhuyqGBMjIsRMIoyCaeBNq0GWlyfU5JNdQ4U5+7eA+h/ULBMDAPTu8
 Q/qyIh2YDYgelT8V6nTxZ6EjHM24jCz9FYlyD+jag4fekTNe3MRH5/XqdVGca1Ve2qXS
 cyEg==
X-Gm-Message-State: AO0yUKVU7GVjmIEZox9aXxT2MrI/k0+9vpYVik4eBjuswgEVucnGk3M9
 YyGE3yp3hFX/6mR6ooEFltKl6ptuwFrsfxd0cvhYiA==
X-Google-Smtp-Source: AK7set/38UKWig2aUC9oS6YnJXEkuCbg9dJw7naAvxrpiuRrvytuoPZpCbiXFe1XFeftY5xEmdkkEaI645TISrUR5NA=
X-Received: by 2002:a65:6941:0:b0:4fb:8fc2:afdd with SMTP id
 w1-20020a656941000000b004fb8fc2afddmr262061pgq.1.1676553867678; Thu, 16 Feb
 2023 05:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20230208235433.3989937-1-wuhaotsh@google.com>
In-Reply-To: <20230208235433.3989937-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 13:24:16 +0000
Message-ID: <CAFEAcA8O=YvQ5XZZHA79F5nHExANVUcckpZb8p8g4HzywAuQbw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Nuvoton Peripheral SPI (PSPI) Module
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 8 Feb 2023 at 23:54, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set adds peripheral SPI (PSPI) modules
> to NPCM7XX SoCs. These modules can be used to
> connect any SPI peripheral devices to the SoC.
>
> This module will also be used in the next generation
> NPCM8XX SoCs which haven't been merged yet.
>
> -- Changes from v2 --
> Change max_access_size to 2 to match the datasheet.
>
> -- Changes from v1 --
> A few minor updates for npcm-pspi.c according to
> Phillipe Mathieu-Daude's review.
>



Applied to target-arm.next, thanks.

-- PMM

