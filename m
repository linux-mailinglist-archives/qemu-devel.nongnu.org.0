Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D691D2DB061
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:46:56 +0100 (CET)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCXP-0000eX-O1
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kpCT4-00054H-JT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:42:26 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kpCT2-00056i-In
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:42:26 -0500
Received: by mail-lf1-x141.google.com with SMTP id s26so5828668lfc.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hrbLZEtTqYFiwbDwyFZNWzVUQeaqPOCNSZYaXH3T7QE=;
 b=frZEVx2D6KCVc0tHH7OLM94W+XPLwkGebVDUP5Y0I3Ea7zhd1KaNou9zrXNlz6kEAd
 XxXjcpmAynpf+pwHWObFdO6nNuzIFMcivqJ3jMV4e3jyo2sV+lcHuXXz39E6e6FzEBMu
 u+5XkfRH9st5W8xn/pLi5PdvKZUEwaxAtHtbrEvuZjFEQZC+uN/Zs5u+DuWPH9rymKYv
 /oUv6dzQLsPxr3K8UzV4V+oGnqSAy8EveYo9cWY0Vwtye7oFYGiPkTxgif9KdxAaW8tr
 KG7ZSLU63RH5QVr2ls1qyHGK5haCbi0JmsPk4DSOrsZzl8l9JVGX0agjf6dBnakvtiFM
 Itrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hrbLZEtTqYFiwbDwyFZNWzVUQeaqPOCNSZYaXH3T7QE=;
 b=qDP91TW4SePzhe++cOUePLz3vMne+ldfGajBvXj7/YIhJqHfyYAj2wEAawJckVW8Wg
 MyVNgMV6eyceaUonXUu1VMJnwinWrJ0jVd3IrYsuqHyIhNKYlUykQmw+HViPm+t2/jtE
 su0s+PVXy61P6OwTMDtvdhRVjJUOlQ6Is1S/+2RS/OJTolZKekGP3PYckoBBxo3ArvFX
 ANtShXmMujBIScXcSlAYGVPzgAvgG7QeuQ0mJcCX+WfeKOH2R1u+gJF1zlJwCPDl8jGP
 APbo4U2SYEOWE5CVSx9nyDVOpOE3cZJyq+isHwIzwByJYoZal0L9HvtVbP0Fv2AOSFiS
 odHA==
X-Gm-Message-State: AOAM533Gdf1VbOaaLOlQ3YUTYNy5Y93zUJ8pgAvbCbdHd1zyaD4/wdCm
 OOXD2YmO7+y0/9SO/RDt7A8=
X-Google-Smtp-Source: ABdhPJzmieh24DbdCkRfJsqWqCgVMsPWov1eoexoN5hw+0g5PM7yxQrpJaPCrbisXvQeaABsIwtrAg==
X-Received: by 2002:a19:be0c:: with SMTP id o12mr11610030lff.479.1608046941753; 
 Tue, 15 Dec 2020 07:42:21 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 m14sm245788lfq.183.2020.12.15.07.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:42:21 -0800 (PST)
Date: Tue, 15 Dec 2020 16:42:19 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 20/20] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
Message-ID: <20201215154218.GA19541@fralle-msi>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
 <20201215141237.17868-21-peter.maydell@linaro.org>
 <CAEUhbmUgROy8OTSkz6hv7YexMXT_U-iAF2O5Y_9RdZJcco_WGw@mail.gmail.com>
 <CAFEAcA93oDGjpmW4T4Qa5WLswui6C_dfVYxzW3UaJCSPi_XrDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA93oDGjpmW4T4Qa5WLswui6C_dfVYxzW3UaJCSPi_XrDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x141.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On [2020 Dec 15] Tue 15:11:00, Peter Maydell wrote:
> On Tue, 15 Dec 2020 at 15:06, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Joe,
> >
> > On Tue, Dec 15, 2020 at 10:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > From: Joe Komlodi <joe.komlodi@xilinx.com>
> > >
> > > Numonyx chips determine the number of cycles to wait based on bits 7:4
> > > in the volatile configuration register.
> > >
> > > However, if these bits are 0x0 or 0xF, the number of dummy cycles to
> > > wait is 10 for QIOR and QIOR4 commands or when in QIO mode, and otherwise 8 for
> > > the currently supported fast read commands. [1]
> > >
> > > [1]
> > > https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_02g_cbb_0.pdf?rev=9b167fbf2b3645efba6385949a72e453
> > >
> > > Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> > > Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > > Message-id: 1605568264-26376-5-git-send-email-komlodi@xilinx.com
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/block/m25p80.c | 30 +++++++++++++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 3 deletions(-)
> > >
> >
> > Sorry for jumping in, but I just noticed this patch.
> >
> > I believe you tested this with Xilinx SPIPS but not some other controllers.
> > Francisco and I had a discussion about dummy cycles implementation
> > with different SPI controllers @
> > http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/
> > I would like to hear your thoughts. I think we should figure out a
> > solution that fits all types of controllers.
> 
> I don't have an opinion on the technical question. Do you want me
> to drop this patch from the pullreq ?

The patch is correct, it hasn't changed anything regarding how dummy cycles are
modelled in m25p80 (nor this command currently works), it just corrects the
situtation for when the volatile configuration register contains 0x0 or 0xF (as
the commit message mentions).

Best regards,
Francisco Iglesias

> 
> thanks
> -- PMM
> 

