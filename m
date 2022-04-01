Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA674EEDD7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:08:25 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naH0q-0006fe-KB
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:08:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1naGyn-0004wB-6W; Fri, 01 Apr 2022 09:06:17 -0400
Received: from [2607:f8b0:4864:20::72e] (port=44028
 helo=mail-qk1-x72e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1naGyk-0004Vd-Rt; Fri, 01 Apr 2022 09:06:16 -0400
Received: by mail-qk1-x72e.google.com with SMTP id p25so1993839qkj.10;
 Fri, 01 Apr 2022 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=mVDseWzN+HlrxL3HARbsfofjeBFHFWJXWmLN8j6f44w=;
 b=WVloQNIPT7NwHJlhutoCIdY5UqKVKzx+oCF1lNSNFldW8FcyJ7BS+kJMPEvr02QVLk
 dIePl4M3dy4IMQJk8G2/dsORgl+AYn4WTiXnREidqufLurYUeTLDslfMuUvQnS2qVtdQ
 NQ2bYYwNx284TwwH38CNR7o+r7aouw0LA0en0a/1OkYrM/mbkyCbMwZFPY+0N13COrXT
 izLm8ACwfZWNOlXiP5jBRoDVnvTimS+jkVST3FMslcTfnvlQJV5LooXdcUK8DjetlYQJ
 b1YeRykQAKe/XtYKfdubKpVA7RN8NUqt3nG6hRbvBqiqoGN6wXxRffPUuOyh8pbGMxi4
 Qz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=mVDseWzN+HlrxL3HARbsfofjeBFHFWJXWmLN8j6f44w=;
 b=QrUcY+f1HqMtU/qvgtB5X18aCeKi8EkY8x82BZFONj48MTJNbCWL1+Sg8lrgiWDG6U
 AKxZSwMVc+Xldq6B9Ui+1I7liLFtQrVuI223Y4QyaGR23B71gZYT2A2sGS7bW/1rjcqq
 1iBdtXY4Gf142A11Nd6JrO+Q66MUEsQm3sMgwztKFC7u17gFRnhzFeJYjELhu4wMd7ft
 bwtZWyJ/Guk+HvtqN69OcW9MKeZ5U3JFTPpYb5IDxkG71tw1oLZyibcirffnpXChffXu
 1s4hTrLXB9im+NWCiMljXjYaCHB8YWM4rAyqnbiqt4YWKZHl4JXuDuD8vUSfdyMLl+rn
 P0Ow==
X-Gm-Message-State: AOAM533T8lwEUKhqlNeY5KOXveButCPes6LItOB3Tr+q7WyJNbpprDki
 WFyYiZ4K+cI+K9B3WhaTKg==
X-Google-Smtp-Source: ABdhPJwTWIFiTd4zTfL3lSvVYl17vdHd+EEJakocBWyePlqR8B3CinAbAQB+XrA3SdWqWECS38IrfA==
X-Received: by 2002:a37:a18c:0:b0:67b:2d46:4db5 with SMTP id
 k134-20020a37a18c000000b0067b2d464db5mr6473380qke.67.1648818372049; 
 Fri, 01 Apr 2022 06:06:12 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
 by smtp.gmail.com with ESMTPSA id
 b13-20020ac85bcd000000b002e06856b04fsm1822635qtb.51.2022.04.01.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 06:06:11 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:18b8:c103:5b12:b0c4])
 by serve.minyard.net (Postfix) with ESMTPSA id 72D251800BB;
 Fri,  1 Apr 2022 13:06:10 +0000 (UTC)
Date: Fri, 1 Apr 2022 08:06:09 -0500
From: Corey Minyard <minyard@acm.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <20220401130609.GG29333@minyard.net>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331203205.GB29333@minyard.net> <Ykabr0wQe9VLISu2@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykabr0wQe9VLISu2@apples>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=tcminyard@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 01, 2022 at 08:29:03AM +0200, Klaus Jensen wrote:
> On Mar 31 15:32, Corey Minyard wrote:
> > On Thu, Mar 31, 2022 at 06:57:33PM +0200, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > Hi all,
> > > 
> > > This RFC series adds I2C "slave mode" support for the Aspeed I2C
> > > controller as well as the necessary infrastructure in the i2c core to
> > > support this.
> > 
> > I've been wondering when this would happen :).  I had put some thought
> > into how this would work, but hadn't come up with anything good.
> > 
> > The big disadvantage of this is you are adding an interface that is
> > incompatible with the current masters and slaves.  So you are using the
> > same I2C bus, but slaves written this way cannot talk to existing
> > masters, and masters written this way cannot talk to existing slave.
> > You could adapt the masters to be able to work either way, and I suppose
> > some slaves that could do it could have both an async send and a normal
> > send. 
> 
> Would it make sense to introduce a QOM Interface to differentiate
> between the slave/master types?

Yes, that would be a good idea, as Damien said.  You will have a type
that is capable of both for both sync and async for the master and the
slave, then types that are capable of one sync and async so the code
can sort out what can talk to what.

> 
> > But you could not adapt a slave device for the Aspeed to do both.
> 
> Exactly, the Aspeed must be able to defer the ack, so it cannot
> implement send(). Even if it buffered up the write, I don't think it
> would be correct to Ack the transfer until the host has Acked it.
> 
> > But that said, I don't know of a better way to handle this.
> > 
> > You don't have the ability to nack a byte in what you have currently.
> > That's probably something that will be needed.
> 
> True. Didn't consider that. Since the ack is basically defined as the
> scheduling of the bh, I guess I have to come up with something where I
> can also pass a "return value".
> 
> > 
> > This is obviously not something useful by itself.  How do you plan to
> > tie this in to something else that would use it?
> > 
> 
> This is specifically for implementing an NVMe-MI device which uses MCTP
> transactions (in which both requests and replies are master->slave
> transfers). I just wanted to get a feel for how you maintaines would
> envision this begin done before posting that. The NVMe-MI device will
> function exactly like the example i2c echo device (i.e. receive an MCTP
> transaction using the normal i2c slave interface, parse the
> transaction/request, master the bus and start a new transfer).

Ok, so you aren't planning to add some sort of interface that would
allow a net connection to hook up as an I2C master.

Someone submitted something a while ago for doing an I2C slave that way,
but there were some issues and nothing came of it.  It's tricky to do
because it has to be non-blocking.

IIRC, there was also some work that allowed two emulations to go on at a
time in a qemu instance, that could allow a BMC and a main processor to
run together.  This might be useful in that scenario.  My question was
really just more curiousity, wondering what else is coming in the
future.

Thanks,

-corey

