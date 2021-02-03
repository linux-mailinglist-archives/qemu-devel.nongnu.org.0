Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F4330D8EC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:41:17 +0100 (CET)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GX6-0002IW-KC
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7GSO-0005JQ-UX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:36:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1l7GSL-0006JU-Bx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:36:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id z6so23770829wrq.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 03:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kCe0wrxhIixQPpuqfAk/hnqjmpLhcYOLtawH01e4W7k=;
 b=NVwcNH6jfteO/c6zKUhsc2YB5yzzHbyiC7Kbe1TcwqsbREccFgjB2/IPt4PBX2Vjg5
 zcXP5gL+fPTt/SFOpBBePwb23D4MQpsH5aVrhIh1U0TSDEQ17gU++XHC+INKgWEs5POn
 EJvywQAaBcqMlg++0A7012anlaphxXwbEh4vul6GxW7W55URXg9ilnHvJ77UZ3mFs/us
 W5Nn5OtxSgrLgNcdEXrX15GdrsB4tOB6OSdOHZGFeY9HRL1H4Nm/BOT4EQat6dJEgMAJ
 Z4J7Lj9+xg89oKyolHAJ5ypmoAaGWDVF/0PxaLYjcJmbiPz7CzdRAGvgPHcyd1MlLCCh
 l0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kCe0wrxhIixQPpuqfAk/hnqjmpLhcYOLtawH01e4W7k=;
 b=jHpbzHS/AZYpPjLx+f8MUWo5P1gmGX8dMQd55ytLtC8khYPUqv0WFUa0x8AtC/olqe
 0fEeoK5FnXGbrMlpLll43hK2Xx0nfbQZuD8suhcQUUR1sM3dZ8HeyAXZQwkavTJqIDvR
 3X8vBxIMkb/P8/IW2bVPyqig7FgZHNGJdo+94oEq22OpUtz6y1NHd+TCOnOvoToQ1Nr+
 wmLycPcU91GqehWOERITCF/99mN6vrB7T+5Q477+1nSFW7wyhUWNo/gj+HSCUOU4S0rt
 2iGI8KURIGPrFwckkidqg6iva8It/Ot+x8Yyqrk+iQJUVQ4knjDlNVRu0f3rjCgLZVWS
 9Qvw==
X-Gm-Message-State: AOAM532NK6MlaVlgXYlEvXFHMjrxzeo0/L/BPO+BMwTxXJMgmq+G1VlM
 vcylAgE5XkbXuvTlAZYmdemL5g==
X-Google-Smtp-Source: ABdhPJxxaLQiumtcIHW7t2vedrG49PZnDSQvmxahoP9HRMzBu+9niDGOkiw68Ikej6y7IQGOUi59JQ==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr2959944wro.383.1612352179576; 
 Wed, 03 Feb 2021 03:36:19 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id c18sm14955709wmk.0.2021.02.03.03.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:36:19 -0800 (PST)
Date: Wed, 3 Feb 2021 11:36:17 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 4/4] hw/intc: make gicv3_idreg() distinguish between
 gicv3/gicv4
Message-ID: <20210203113617.GV1664@vanye>
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-5-leif@nuviainc.com>
 <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 10:31:16 +0000, Peter Maydell wrote:
> On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
> >
> > Make gicv3_idreg() able to return either gicv3 or gicv4 data.
> > Add a parameter to specify gic version.
> >
> > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > ---
> >  hw/intc/arm_gicv3_dist.c   |  2 +-
> >  hw/intc/arm_gicv3_redist.c |  2 +-
> >  hw/intc/gicv3_internal.h   | 12 ++++++++++--
> >  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> > -static inline uint32_t gicv3_idreg(int regoffset)
> > +static inline uint32_t gicv3_idreg(int regoffset, int revision)
> 
> I would prefer to pass in the GICv3State* and let the function
> look at s->revision.

Yeah, that'd be neater.

> >  {
> >      /* Return the value of the CoreSight ID register at the specified
> >       * offset from the first ID register (as found in the distributor
> > @@ -331,7 +331,15 @@ static inline uint32_t gicv3_idreg(int regoffset)
> >      static const uint8_t gicd_ids[] = {
> >          0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> >      };
> > -    return gicd_ids[regoffset / 4];
> > +    static const uint8_t gicdv4_ids[] = {
> > +        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x4B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> > +    };
> > +
> > +    if (revision == 3) {
> > +        return gicd_ids[regoffset / 4];
> > +    } else {
> > +        return gicdv4_ids[regoffset / 4];
> > +    }
> >  }
> 
> Updating the comment "These values indicate an ARM implementation of a GICv3"
> to add a note about what the new values are indicating would be nice.

Will do.

Regards,

Leif

