Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222211599D6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 20:35:30 +0100 (CET)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1bJh-0008Mg-6F
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 14:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j1bHh-0007SC-Fn
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 14:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j1bHg-0008HU-7m
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 14:33:25 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40638)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j1bHg-0008AP-0F; Tue, 11 Feb 2020 14:33:24 -0500
Received: by mail-pl1-x641.google.com with SMTP id y1so4668328plp.7;
 Tue, 11 Feb 2020 11:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=aWltyIygR++XQS2oU6s22u496QY3iyGDI8+SIrPN/Hk=;
 b=h5krVA33bDfDvq6NC/JdJUgDRcr487HpZfEyN9ddRmqHVdtIm8LwNQGyvqweFR8O4t
 JSc3aLCK1Y6jXyUHqUYt9VJT6JogWXiAGxQnZjfr7kRoJfkscBUR8AGStfo13CTPFv86
 G6KHD/iHaj1ttmv0M2RYh/UaRoZqBfj0XAURm820F8CVh+tZaPJPtg9m4scSLPWoKEpg
 Lg5mlHLsf34aNDbJtNqwQjdf2XOvX2tPQjjouywvJCB6O5xvtL4M2DYphAKM87XkbuwM
 X71Vf7no2Tiq1HXzv2EM++RB7Spw58ozE2CI/V42etPTl4rTngXuU6PbucnXgX/KoSqw
 zgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=aWltyIygR++XQS2oU6s22u496QY3iyGDI8+SIrPN/Hk=;
 b=Vxvs9Q8diACGPzR+j3wRAmm/gfFkNHxKJXjwBw8MBwj1cbgk0rjIBtaFSeW/1/xrlP
 INXdW+tbH+RVxs6fKf+PCz69bg5o/f6SIud7+ZytzHpjdqwwvy5bgD1ai3QyQYdzzxqu
 EYAkai1n9RDuj+pjSgQ6nFI5m5C6t3O4NNAEZ59OknJqxrp13Uf1suplH/xWVSU55Stu
 FHYGNBJnZWk6sTXmyZaPPUbINcGB6qYVnT2BwmLoWILCihdCpAnAi5v1dCOPme2/ioy8
 XQUj9TwicL4Js4tyTZ2ub+i+9DvHuOde8XC3IqaSqlJe4WUQ8w10yyCIUP/2bTyolw2v
 g4Yg==
X-Gm-Message-State: APjAAAWmDN+LGkxokqmTdF2jY20rLypTtEQnhLJfurmVwzYX4iM9zj54
 rjEwGXg508ns21GAWjbG7xU=
X-Google-Smtp-Source: APXvYqzXm9c0gAT6ZeNFhgFrvBIRb0HLSHPqWYGcWLlX3ddfz3Xh2aQPkOgxteFyZujpzP7HpD0UOQ==
X-Received: by 2002:a17:90a:9416:: with SMTP id
 r22mr5519868pjo.2.1581449601037; 
 Tue, 11 Feb 2020 11:33:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q21sm5034212pff.105.2020.02.11.11.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Feb 2020 11:33:20 -0800 (PST)
Date: Tue, 11 Feb 2020 11:33:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] hw/arm: ast2600: Wire up EHCI controllers
Message-ID: <20200211193318.GA11891@roeck-us.net>
References: <20200207174548.9087-1-linux@roeck-us.net>
 <158111304888.591.9861885311267533100@a1bbccc8075a>
 <20200207224850.GA10890@roeck-us.net>
 <445cee18-5de3-3da4-fef4-2e3f4530d96b@redhat.com>
 <CAFEAcA-0Yea_c_YCGUnGqjsQ72MxzHfdbR2UfJYEPMGzvayKCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-0Yea_c_YCGUnGqjsQ72MxzHfdbR2UfJYEPMGzvayKCA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 11, 2020 at 07:13:48PM +0000, Peter Maydell wrote:
> On Tue, 11 Feb 2020 at 08:12, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> >
> > On 2/7/20 11:48 PM, Guenter Roeck wrote:
> > > On Fri, Feb 07, 2020 at 02:04:09PM -0800, no-reply@patchew.org wrote:
> > >> Patchew URL: https://patchew.org/QEMU/20200207174548.9087-1-linux@roeck-us.net/
> > >>
> > >>
> > >>
> > >> Hi,
> > >>
> > >> This series failed the docker-mingw@fedora build test. Please find the testing commands and
> > >> their output below. If you have Docker installed, you can probably reproduce it
> > >> locally.
> > >>
> > > I forgot to mention that the patch depends on the similar
> > > patch for ast2400/ast2500. Sorry for that. Not sure though how
> > > to tell that to the test build system.
> >
> > You mean the "Aspeed: machine extensions and fixes" series?
> 
> Seems unlikely given that series is from 2019 and went into
> master last year... Probably Guenter means
> "ast2400/ast2500: Wire up EHCI controllers"
> https://patchew.org/QEMU/20200206183437.3979-1-linux@roeck-us.net/
> 
> (which I had dropped from my to-review queue because I'd
> misunderstood Cedric's review and was expecting to see
> a v2 of that which covered all of ast2400/2500/2600 --
> I'll put it back on my list to queue before this one)
> 
Yes, that is correct; the patch for ast2600 depends on the patch
for ast2400/ast2500. Please let me know if I need to resend both.

Thanks,
Guenter

