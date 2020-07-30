Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B013232EDD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 10:49:23 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k14Fe-00009S-9A
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k14Eq-00089H-WA
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 04:48:33 -0400
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k14Ep-0000Qp-0s
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 04:48:32 -0400
Received: by mail-oo1-xc43.google.com with SMTP id z10so2212962ooi.10
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THzxCDK6ckoEJ1AXUT7Uj8DkpZOgjaPC+67L7H1MV1A=;
 b=yzZkrwI+sHNjcTbcdD2kwjBkrwcKChngjKWmTHIMPElPpDdVZFt1bdYuzSxBrAJprA
 C8mEPXXklvEKqqY56S761pQugYa3zQuhMQrTz+Bk5xGXuPLMX2F6IKSF1MsrjGcmMtb6
 cUdqq8nHUhUS75YlBOtOTYXmICJyfmgzYC18H/c/Qf1hRLvLSeBJPUBamGOpR+qhxv99
 LKBEDiq/45b+ucB91wLk0ZHozswCZwINmaUgywK0oZWqobp8CkI0ghArfUXM1C62iEQV
 +sJPHz0DvdF5rjL0YlWS3ivAAlsGU5ZDdUU5AT9wXOal+KM13aogWFbsiXxAnAfidvlv
 hYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THzxCDK6ckoEJ1AXUT7Uj8DkpZOgjaPC+67L7H1MV1A=;
 b=qh5HOTGhgL2ywJ+G5wWgFOCkvKsHATOxgcJcRHwaJXexTukhWJtwNZFPL5U1QGSRL4
 Agoyq/D9JVRsSHWNEsnDSwTqW50GXpmUWDSQXJbE9RNM4p6lkPFktipB9fK31wFIuve1
 Y+ixANG1K1VGOsS4gZkgCybJTKnQsQuqf1Fmx9CQhBBWDtfRpteGZ1g+jLJZgpKMe6gv
 DImVpN7mgc6atFKfLoZh/RS8ChrFGLGxbpMjld+bmrA0oWtJlbUHY6Jzg/ZYfn03sOs+
 sgB14VvyQTDBV3jcOuRLROoybsktSyRPndeaHY583it4MxOScEaaptDBdR7hYyng3+LM
 mncQ==
X-Gm-Message-State: AOAM531hwzw5ONZCwTI11qkv7WB7pZEr2gK6Zh6l9pO6STPqBAsHzEUn
 pWI2oUd9DT+HVGaQvxc25fW+MHewlqFex1KqdABFmg==
X-Google-Smtp-Source: ABdhPJzEPpokM+fwyqmaj9pTF9nYRZJ+8P8TfWD03ZvoV884KWCV2dkofNM8E2MYQFUV1wC9KyeRr/EXdJhkFbMKtbs=
X-Received: by 2002:a4a:8dc1:: with SMTP id a1mr1536001ool.69.1596098909964;
 Thu, 30 Jul 2020 01:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200729221732.29041-1-e.emanuelegiuseppe@gmail.com>
In-Reply-To: <20200729221732.29041-1-e.emanuelegiuseppe@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 09:48:19 +0100
Message-ID: <CAFEAcA_XfRWFSp3X03=g_FrjL3eqRG_DY8AZE1crxDGKnJKNnQ@mail.gmail.com>
Subject: Re: [PATCH] pci_dma_rw: return correct value instead of 0
To: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c43;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jul 2020 at 23:19, Emanuele Giuseppe Esposito
<e.emanuelegiuseppe@gmail.com> wrote:
>
> pci_dma_rw currently always returns 0, regardless
> of the result of dma_memory_rw. Adjusted to return
> the correct value.
>
> Signed-off-by: Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>

We also have the equivalent patch from Klaus Jensen back in 2019
which got reviewed at the time but seems to have gotten lost along the way:
https://patchwork.kernel.org/patch/11184911/

thanks
-- PMM

