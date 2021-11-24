Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A96745B887
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:42:25 +0100 (CET)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppjM-0006kh-Mn
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:42:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mppJQ-00082d-42
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:15:36 -0500
Received: from [2a00:1450:4864:20::131] (port=37524
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mppJO-0002Nt-BB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:15:35 -0500
Received: by mail-lf1-x131.google.com with SMTP id c32so5877477lfv.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 02:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=uXdHbLiY97qpkDKo0yUC92NjVuxruPO6PUBwLp5WQyU=;
 b=C7zAwgIJjfODHRpfCztOoU+GCb1F/MP1VI0c+pv8kOTjL7NYY2WM7TQLmWQlwRXHd8
 CUWjfDX3sTpXrx3j5l9d5L8s0rZyqIipXwyd8/OCzWqg4TePrAWGguBMfRwzsbWYva4T
 F+asgl7tVUNseJm7K+nMU3FduAHZ1PlStkjmpIJmNd3ILOZViMj7fTVbaJYjOnkdhn33
 imIaUWZlehYdxQaQ+/cAYs7MGQxlgRszLW3LfaxUw+hIYWGr8gxkrFbojJ2Y87Ftvnbp
 NEw640NecA+mRuReFfNwrR+cXBE6W2X3yczufhq+xc5VQqw+aWbLcqpR4woQSakRJYOn
 sQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uXdHbLiY97qpkDKo0yUC92NjVuxruPO6PUBwLp5WQyU=;
 b=Vif4HW4NCyCZnG5FhA/v00YkAMqyOcH//d6UbEDkV4ke3cvXwMZqITGtyZB1FfNAKi
 qPhCOarpDCmWFrDI4A/qYs1wb5gfGS3v46Ph90WeNLEY8/3C6HW+Nv/oH+CTnGeGILys
 9a3qSaqUrPb0UzoKINNaKQNUuN9pBJkPg80d7dhbU2KgXRC6NTTTAZdAN7TYzS1dDikc
 pGJqHmaFZX9LVmQuOZyDJBNOdzOCDX2n+ufD5PwfKfmP6Oj9o+vVqSGqOEzWwMfmSJWr
 LOTUcUahvx1uOvfllrTXiHBNbcDwMe2PablVWlKGbQadn7njgxQevPC8ADCKdNUaWBRJ
 vHrg==
X-Gm-Message-State: AOAM532u5CJDew93j/xRucLwV2JIpM1Zii0EX/Y/YX5lbAI+2PtDk6Uv
 Klg2ps1TKLDU/FBpD5+KI9Y=
X-Google-Smtp-Source: ABdhPJwgLOzxypSLw6xmWWQoK78lKtL4YSL+jCy/abijfGkDFdz5QV9dhPMjUQWHYSxytyIOev/seA==
X-Received: by 2002:a05:6512:21cb:: with SMTP id
 d11mr12712678lft.579.1637748931778; 
 Wed, 24 Nov 2021 02:15:31 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 e17sm168935lfq.102.2021.11.24.02.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 02:15:31 -0800 (PST)
Date: Wed, 24 Nov 2021 11:15:29 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 03/10] include/hw/dma/xlnx_csu_dma: Include ptimer.h
 and stream.h in the header
Message-ID: <20211124101529.GB6734@fralle-msi>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
 <20211123103428.8765-4-francisco.iglesias@xilinx.com>
 <2a1e363c-a4f2-91d3-9ae7-971a7249335c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a1e363c-a4f2-91d3-9ae7-971a7249335c@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -1012
X-Spam_score: -101.3
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On [2021 Nov 23] Tue 11:45:45, Philippe Mathieu-Daudé wrote:
> On 11/23/21 11:34, Francisco Iglesias wrote:
> > Include ptimer.h and stream.h in the header for being able to build and
> > reuse the DMA model (the first usage of StreamSink, StreamCanPushNotifyFn
> > and ptimer_state is in the header).
> > 
> > Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> > ---
> >  include/hw/dma/xlnx_csu_dma.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> > index 9e9dc551e9..8c39e46f58 100644
> > --- a/include/hw/dma/xlnx_csu_dma.h
> > +++ b/include/hw/dma/xlnx_csu_dma.h
> > @@ -21,6 +21,9 @@
> >  #ifndef XLNX_CSU_DMA_H
> >  #define XLNX_CSU_DMA_H
> >  
> > +#include "hw/ptimer.h"
> 
> Yes, but arguably ptimer_state should be forward
> declared in "include/qemu/typedefs.h" IMO.
> 
> > +#include "hw/stream.h"
> 
> OK but you forgot these:

Thank you for reviewing! I updated and added in to also include sysbus.h and
register.h from the list below in v3! (memory.h looks to be included through
sysbus.h and memattrs.h through memory.h)

Best regards,
Francisco Iglesias

> 
> include/hw/sysbus.h (SysBusDevice)
> include/exec/memory.h (MemoryRegion)
> include/exec/memattrs.h (MemTxAttrs)
> include/exec/memory.h (AddressSpace)
> include/hw/register.h (RegisterInfo)
> 

