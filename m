Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F24BABA0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:18:05 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKoA7-0004Iw-1Z
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:18:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nKo9H-0003cV-LX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:17:11 -0500
Received: from [2607:f8b0:4864:20::62a] (port=37764
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nKo9F-0005Kg-0l
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 16:17:11 -0500
Received: by mail-pl1-x62a.google.com with SMTP id x4so5554478plb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 13:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dEUdbmW2tKuN2fwU9r1NfDfQtkazatkLmR4PeWLryYY=;
 b=khlY/UuCq3nUhVkdD4xF/Mmu/JF0LdD49MQ/A2uW3t95PL8g2Er8TfjJlklFfS/mL3
 0gOk53tKVFsZugsnnwiBA9Z4OZR8vfAKJGzbQTSerpXsdYiqJc/0qmOx80Xd/tbdY19Z
 AV2/Xm3OP+Y7HfgaxuFYi9O0htAmjl2ML5jlEuZX5GooVaDDW+v6S4BiBHHINcm2w8Ye
 ArQ2lij19L7NrF1J3yS6nzQbDmVEPjVyfZKgm4WrkogdytOgMHo9gAydXYR9K0UIekYe
 9l6BZFdyltB4IvVaIqbAF6IcNcIucIhV5PLWuYfLUC24gc8GWMlUTxaUVnB6RxmKB11V
 xEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dEUdbmW2tKuN2fwU9r1NfDfQtkazatkLmR4PeWLryYY=;
 b=tA+NvkDswWnxGeFdcZwwUtvJ7n2wA+8FWXbkINnfek9nieWwqFaCHIgSJ+2OZypPXB
 Vr25ADFYyR67E0saQBkl5LtLkBkj6lIB8d9z8nCnepyoRPB77LJCDwYhEIhTeyTGztdb
 zQNBXMcsZo5riKH1fjXPP6eJYj4nF3qVWGr3AvDYfXIecjZDbYN2WR+nCewBr2jn12St
 ApQXDVc5CUk3KVHvndzEkYZy1rAZ+TXYAjYl1WmqRk+Ujxzv8vqo/1Vyp85m5ygr2ce6
 jOm/k+eGDjYf+n0VsIwxTl53lUX9sVQzq3/TbKIVplMIfHLRcXcR1uKx3cowXYakH+sa
 ohsw==
X-Gm-Message-State: AOAM532/FmxQ6Igh6DMhAFNJPuCDf40PANDUTb0zeP0ekyi4NmxC0lRl
 0J/5D8sCsZ12rAOaP47RJCw=
X-Google-Smtp-Source: ABdhPJxNgOMEXUoe2ISQEM1xObLxtRDvRee104iOjlDu+zh7FV6c/eF2BnIM57SCMEgcDZCtD05pVQ==
X-Received: by 2002:a17:902:bd43:b0:14b:4534:76d6 with SMTP id
 b3-20020a170902bd4300b0014b453476d6mr4507443plx.0.1645132625494; 
 Thu, 17 Feb 2022 13:17:05 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id mz16sm2389810pjb.53.2022.02.17.13.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:17:04 -0800 (PST)
Date: Fri, 18 Feb 2022 06:17:02 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 4/4] hw/openrisc/openrisc_sim: Add support for initrd
 loading
Message-ID: <Yg67Ti7/+ZAp/cAm@antec>
References: <20220210123403.2059926-1-shorne@gmail.com>
 <20220210123403.2059926-5-shorne@gmail.com>
 <CAFEAcA8Gn50VHK41M36OzbSYE5Z7WEoOFqsBweFFgCvsoC6DKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Gn50VHK41M36OzbSYE5Z7WEoOFqsBweFFgCvsoC6DKA@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:04:32PM +0000, Peter Maydell wrote:
> On Thu, 10 Feb 2022 at 13:13, Stafford Horne <shorne@gmail.com> wrote:
> >
> > The initrd passed via the command line is loaded into memory.  It's
> > location and size is then added to the device tree so the kernel knows
> > where to find it.
> >
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >  hw/openrisc/openrisc_sim.c | 32 +++++++++++++++++++++++++++++++-
> >  1 file changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index d7c26af82c..5354797e20 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -187,6 +187,32 @@ static hwaddr openrisc_load_kernel(ram_addr_t ram_size,
> >      return 0;
> >  }
> >
> > +static hwaddr openrisc_load_initrd(Or1ksimState *s, const char *filename,
> > +    hwaddr load_start, uint64_t mem_size)
> 
> Indentation here is off.

Ah, I was going off the indentation already in the file.  I will fix this.

i.e. should be:

static hwaddr openrisc_load_initrd(Or1ksimState *s, const char *filename,
                                   hwaddr load_start, uint64_t mem_size)

That's why its like that everywhere.  I might as well add another patch to fix
up indentation.

>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!

