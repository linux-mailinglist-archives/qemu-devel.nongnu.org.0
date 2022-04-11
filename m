Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC694FB774
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 11:26:46 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndqJo-000435-W9
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 05:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqGT-00033u-6g
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:23:17 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqGR-0004eB-Gz
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:23:16 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id g34so6409038ybj.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jr62P3i98FkTTTfnNY1drZ+Q3dScyC7QAnHClbPPOro=;
 b=j65als5aiezQeNzS4vzBnks9j1XNVT+utF/SROFd7oW3nzIgD9iivh7AoPVYLwAnKe
 JZjaY5TFukVuUs2RRI0hthwCIJkjOIJHs3wrt/XUlirCGfdcmCOFduT4BMRYhU1ofBZI
 FsCO6/v6FSF9Vl5NItsOW5ky+M67dl9srI83ro2jTJ3CKNZtuuVPi3MD/rcbwsiHnYLx
 va/zmrx6VZMTP61TskRj+bAU7Y1/4kb5GWV4+qcEiBGx+vC5KEevPqeuldky421EK2Uz
 woBiWtqN9xYjD3mc+c6aSY+D3GryIineXxIWSWboaJL8iYcXhYTCSLySelhEbJrT7hje
 wBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jr62P3i98FkTTTfnNY1drZ+Q3dScyC7QAnHClbPPOro=;
 b=N9gbR4HxT8h09xbGta+3ICNUKK7ScF1TEZwriOxWNQ2PfRDIb6NQoIa9ZJYwWL/gRI
 3SaDFx2saerd+V2gLKtZzsEMht4pcq41S39TgXUDlZslfk9ruU7eu/p7GS0w8Mwpg1ac
 /WxAR2zMWEJzUjjGyFV2gFVDy0++YiV5dLlZbluVWHX2LmNM32QUiyI8ItHO3ll0rLCH
 +gH+2dPXekS1EUwU57rLC2fau+73RKLR1SICS2BTUM6GDemzL9cWJjRPwILBzbkc9Efb
 ukG5kj/Cs5aTfsXSGis+W7VXrKSZSTUaDJQdx4PgASCTxubCwX3PCeS9D/NbRuQMwjVY
 kUig==
X-Gm-Message-State: AOAM532iY8AZeGSyzdThXRiLaaUP/4rqPYXkWLJ+bz0XoRoXfYiqALy2
 NTUNecY4KJgqcrgw0kK0GETHoex/z5Sz5dt73SKJqg==
X-Google-Smtp-Source: ABdhPJwoQZ4x+j0pHfxJXks0bDj1/xDK2W2S7poKm6cOER4yg7LLSjaYByD1X6JVlbDW0Gjtmzo9efYFbffjpv/psDY=
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr6839275ybe.39.1649668990542; Mon, 11
 Apr 2022 02:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 10:22:59 +0100
Message-ID: <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: drjones@redhat.com, agraf@csgraf.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 07:59, Gavin Shan <gshan@redhat.com> wrote:
>
> There are two arrays for each CPU, to store the indexes and values of the
> coprocessor registers. Currently, 8 bytes fixed storage space is reserved
> for each coprocessor register. However, larger coprocessor registers have
> been defined and exposed by KVM. Except SVE registers, no coprocessor
> register exceeds 8 bytes in size. It doesn't mean large coprocessor registers
> won't be exploited in future. For example, I'm looking into SDEI virtualization
> support, which isn't merged into Linux upstream yet. I have plan to add
> several coprocessor ("firmware pseudo") registers to assist the migration.

So, can you give an example of coprocessor registers which are
not 8 bytes in size? How are they accessed by the guest?
If we need to support them then we need to support them, but this
cover letter/series doesn't seem to me to provide enough detail
to make the case that they really are necessary.

Also, we support SVE today, and we don't have variable size
coprocessor registers. Is there a bug here that we would be
fixing ?

thanks
-- PMM

