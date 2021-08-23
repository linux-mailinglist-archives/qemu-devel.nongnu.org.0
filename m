Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A53F511B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 21:16:19 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIFK6-00039k-Uj
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFJJ-0002Hv-5v
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:08:41 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFJH-0004xp-MQ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:08:40 -0400
Received: by mail-ed1-x52c.google.com with SMTP id q17so5888333edv.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J1TME3EzdCtiUqCg9EdHYhY8loGQM5BWIi5JacZCBBk=;
 b=OfbLWr4bujh7IDarkoqg0CUUpIBeyr1ECgxbfJMAWPKTOnvLNex9tfG8ZWNQWkOP3h
 lU571eIbk0i8uczIQwcvJ4+IVX4/FAlh8/s7k5+qK3LSzZMkkXAZnWneerqd+fR14/bw
 rv8yYO9eFnK/gxdZRY1ruXqbG2p9KeFaUyXDl5uVdbeJhkuCMv0fbmDdZKUHC8FbyWTh
 29ak8/357AXkv37ybj+3gi199EaDdfB5s4jo+RlqilSwgA1CyZ7EORMBkAGbFGMeQK6s
 FchJjlUm07+/Psl7MNTqLEkB3qoWZD/w1c9f2aLIMOGOWsfPJySbsGoBZzEeCaeQt9cz
 kSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J1TME3EzdCtiUqCg9EdHYhY8loGQM5BWIi5JacZCBBk=;
 b=CUU1mAsLxknO4J+SZ+XxRbHUiW1aLEdTcnT3kitB4/RxBJ9I1By03Pk7B490K2Qcz/
 XUeUz1t6dyq54n92qh5wDEOUcvnnlba35y0ubDxjT+h/ZWGHtSslUxiNY/QXfMpKrrQR
 Iw8M+7NgnTC4SdKrLX0CU5LsKOR+hVniDFrxpvR/j5/T5bHgJE052V2mEjA1gXEBOadR
 nR40U6f8L3qAtJHxlud26KNNd/g2b2psEaFfJKSjnvJ8DYZvGykTigQZHiR8lG1wwqxc
 XFlTxljSO+h1psW7dzz6MZpoJxzemXFVbAoyGXk5CEuCAMF2TK+EB1ytRn6rta1ym5Oj
 FJsQ==
X-Gm-Message-State: AOAM533g3Vrp/YvyX8EDQxuTX7CFhCytSKMRkQ72TnQDJGflwCfFjLJd
 TBJNd/lPM/r33HVqzR4+ilqyAFNfBVqEco/15ANghQ==
X-Google-Smtp-Source: ABdhPJy38TjwH4YGTmPlP69LNaP0SP5jRgvgSZeZuYkygjjRS9shuv2MiaPYy7PtGtp/utTvMCdKsU2zgKYrk/UWRxs=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr38370162edu.100.1629745717818; 
 Mon, 23 Aug 2021 12:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-3-philmd@redhat.com>
In-Reply-To: <20210823164157.751807-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 20:07:51 +0100
Message-ID: <CAFEAcA_KjiBySwKUvL_Rit5VAdvTU6JExHPOAapz=h5vS1jQbw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/5] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but note that these MEMTX_* aren't from the memory transaction
API functions; they're just being used by gicd_readl() and
friends as a way to indicate a success/failure so that the
actual MemoryRegionOps read/write fns like gicv3_dist_read()
can log a guest error. Arguably this is a bit of a misuse of
the MEMTX_* constants and perhaps we should have gicd_readl etc
return a bool instead.

thanks
-- PMM

