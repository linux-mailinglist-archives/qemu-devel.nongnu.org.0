Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D9250319
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 18:39:25 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAFVD-0002cE-T3
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 12:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFUF-0001et-6U
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:38:23 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:40073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFUD-0007dK-RU
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:38:22 -0400
Received: by mail-ed1-x542.google.com with SMTP id w2so8638137edv.7
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j69Ra+GltMdvMqa3E47KAbR3OofjBojR6kWy3Sz1HnU=;
 b=gokuci+hVONN5p4dfhFKZZk3IJAnAMUTNGW1PeHzrHMn4M7sy404KxjAbrJDczZYTZ
 JKoznlm6qRaSx6MLnxzQhqIeGHc+382UhssxhUcEqrqbtge+egchPzpYTwc5Z/t18iMM
 QgHskrTdrafrOLVakmuyDGGnNSENw38l+y73hPxMwE7dVfDtzU+0diilrz8WluAIe+U4
 +slKHlxBSBwBfkzqBELwD4MJ7CLgirr4X0SYProlBZDd9dgNhGJYuURh+MqnZHH+JprK
 DOVKHxrJ6rB/Mh3LP5Z5M4VDJahB5j9BRCETHKBxQNdYOygN/0CEMbwne4UKi65KS904
 rK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j69Ra+GltMdvMqa3E47KAbR3OofjBojR6kWy3Sz1HnU=;
 b=RzT9ba+CB6rnnpQM0Dmh51T6N/Q0UADuOf33wIedb1QFrvtml6GltI8qN5JOPD4sD8
 SGPctafwFupGLv9bJ57FUuGE+1fDWujLtO4JKCw7qIjYjczdZrDFR/I/juLzoiRKSbMq
 pvCjdm+TOTnv014aGnbbly45OXJwstxWtv1ObLBRSvhJfnmSgVUz/KFsQ5E3AP4zJpoa
 N+5U3/Dqh2vx2g1uAmEdsjwb2yXX+/CjzLLGQ9Henb3qOwMpittlJSE+FuEo/TLONSwi
 cz6aeR5rpVJ/2b8oZLRo9eJBLjtEmn29mVvaPX86hiOln4QMEpaFsgZq5t0bAVA8eioo
 ss2g==
X-Gm-Message-State: AOAM533Tl+w41VaxQZq7R45cBBQYw+pX0PZ6i+DCgphHBQZGXkahB0T3
 qBPFxE5/lag12MjVLWb1saevvdY3OfvOH6OlA0v+cA==
X-Google-Smtp-Source: ABdhPJwhE161WME9uo/uXs2hgVTME7qJwl2NsbtRYS0SEdf3l9ezRYQwifI0x32UtgbX55oL5PA4WJ0giNMuk9icAwg=
X-Received: by 2002:aa7:de0e:: with SMTP id h14mr6031972edv.146.1598287100379; 
 Mon, 24 Aug 2020 09:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200814122907.27732-1-f4bug@amsat.org>
In-Reply-To: <20200814122907.27732-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:38:09 +0100
Message-ID: <CAFEAcA-knFj=Eg-+XdgUVsaTQNtHeQ9RO=0fT=N5Y0vE3WFQ7g@mail.gmail.com>
Subject: Re: [PATCH] hw/net/allwinner-sun8i-emac: Use AddressSpace for DMA
 transfers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Aug 2020 at 13:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Allow the device to execute the DMA transfers in a different
> AddressSpace.
>
> The H3 SoC keeps using the system_memory address space,
> but via the proper dma_memory_access() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


Applied to target-arm.next, thanks.

-- PMM

