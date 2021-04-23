Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E893693D1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:38:43 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZw14-0008OK-8Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lZvyH-0006H0-Mt
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:35:49 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1lZvyF-0003P8-MN
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:35:49 -0400
Received: by mail-ej1-x62c.google.com with SMTP id w3so73989841ejc.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4+ZUZtd7Wz2Y4g3tyBh3Cmkj2Vf6fEjovYImQtdE9yg=;
 b=ytwToDO8sht1KiXK5VMg9kMrhztyfxm4r1tq5n2NAx/gdYT1L4bAu6YlU20z9Pxe0i
 wTaOXE2uSlZQQZ1nnHI4s8E/EwyNvKcglhUhSQ5BOkHBeaqQhS3Mtp+hGMvEH5iPiua9
 3C0vSNDoPDRVJf91Ro02DJgoXWVTuh64TGcKMGjo8rhUkrXiaSAFxJl9PoaN4SI+B+S8
 x3Ce2jY1zWDT4vf8AVXIN/McIRAC7oCBHHlWxempX+JWOaJCD0E0YCQsBWjYbcij89xE
 l8yvWWCNfnMasAcHS3e6dGm8F1+cNF/AkaVKSbr2GL//mRlqbdGAJ67dVxu0JS0EQ98M
 EBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4+ZUZtd7Wz2Y4g3tyBh3Cmkj2Vf6fEjovYImQtdE9yg=;
 b=QR0BLk+zbeRhTGocHmTDx0gQZPCGTUgjaBQJCsFh6rFY+qE7zpnEk0rHNp8XKuCu6P
 JvatxFG1J2jDbkmUdqEBCFhBf6TSK4SReEYkwre21vnBIC0aHxdy6fXVlZ0lo5MbqnrO
 hucSWqKneLtsic9KiUs7XLvcG2xjrKX2fPlUBErtBjxYp0shv5sBxMNjlDLvqE+xOwFc
 UGINqkZnDL7Daw/d6EiuOD+gJdjpZMKBJuf+VikeyE43iYJyXb8t2JIv+B5W8v31EJ5F
 p+3IXAchOYfejMRr3yBOIEVA6tzz8NKxsDA7VlGUdLBQ6mvqsOC/2d1EeaZenJWsMX36
 y3Nw==
X-Gm-Message-State: AOAM531nvxrGsCAX4CZUR17TYshVZ+Z7HE2bLuEIPHWZiN5Nf8ebYbIa
 SzHjHM9N2oZNgUvJ6d1KrQnTYg==
X-Google-Smtp-Source: ABdhPJzDa2Doibn6wHh/9IjWvXzL7E4Qeopqm72zQ1d2CUN0YW+fSZjlIMCUANafPBnjFkJJyTwtGQ==
X-Received: by 2002:a17:906:2808:: with SMTP id
 r8mr4310844ejc.140.1619184945549; 
 Fri, 23 Apr 2021 06:35:45 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y25sm4297063ejb.34.2021.04.23.06.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 06:35:45 -0700 (PDT)
Date: Fri, 23 Apr 2021 15:35:27 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/2] amd_iommu: Fix pte_override_page_mask()
Message-ID: <YILNH1DDTTV6TcFO@myrica>
References: <20210422222429.183108-1-mst@redhat.com>
 <20210422222429.183108-2-mst@redhat.com>
 <CAFEAcA9LLh7kkqujLpiXjRgRkua77kLAv=MbeG8yq3NP-w8uyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9LLh7kkqujLpiXjRgRkua77kLAv=MbeG8yq3NP-w8uyg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 02:01:19PM +0100, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 23:24, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >
> > AMD IOMMU PTEs have a special mode allowing to specify an arbitrary page
> > size. Quoting the AMD IOMMU specification: "When the Next Level bits [of
> > a pte] are 7h, the size of the page is determined by the first zero bit
> > in the page address, starting from bit 12."
> >
> > So if the lowest bits of the page address is 0, the page is 8kB. If the
> > lowest bits are 011, the page is 32kB. Currently pte_override_page_mask()
> > doesn't compute the right value for this page size and amdvi_translate()
> > can return the wrong guest-physical address. With a Linux guest, DMA
> > from SATA devices accesses the wrong memory and causes probe failure:
> >
> > qemu-system-x86_64 ... -device amd-iommu -drive id=hd1,file=foo.bin,if=none \
> >                 -device ahci,id=ahci -device ide-hd,drive=hd1,bus=ahci.0
> > [    6.613093] ata1.00: qc timeout (cmd 0xec)
> > [    6.615062] ata1.00: failed to IDENTIFY (I/O error, err_mask=0x4)
> >
> > Fix the page mask.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Message-Id: <20210421084007.1190546-1-jean-philippe@linaro.org>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Jean-Philippe, do you know if this is a regression since 5.2?

I don't think so, I can reproduce it with v5.2.0.

> I'm guessing not given that the function in question has been that
> way since the amd_iommu was introduced in 2016.

There has been a lot of work on the AMD IOMMU driver in Linux recently.
Maybe that exacerbated the problem but I can't find a relevant change.
It's also possible that this path hasn't been exercised before - I just
happened to run a SATA device under AMD IOMMU this week to debug an
unrelated Linux issue. The other devices in the VM don't seem to have a
problem doing DMA.

Thanks,
Jean

