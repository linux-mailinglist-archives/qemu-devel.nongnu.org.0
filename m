Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FBA153F1A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 08:08:02 +0100 (CET)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izbGb-0005aw-MY
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 02:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1izbDM-0004nJ-Rv
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 02:04:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1izbDL-0006iq-Rf
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 02:04:40 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:32907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1izbDG-00066f-CR; Thu, 06 Feb 2020 02:04:35 -0500
Received: by mail-qk1-x742.google.com with SMTP id h4so4584335qkm.0;
 Wed, 05 Feb 2020 23:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h672+PvYOg4F9GqkfTlAyYdpuih/rH914wY/nGyuogk=;
 b=jq/HND09rlub7v5VE0z/kEmhohKZ7Zbx+9C64fiKh/8UGEk8U3gMAOTkXE/+jF8ii9
 WTirQjCUn8/LLu3FyKwP4SYEmQjQnj6pfhiBmN+j2t8V4Xg9CTgaO5pxCDweekfJEyVE
 5NzYK1u6Slg8xcb1Xv/r+2qFloNcpdndi5rJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h672+PvYOg4F9GqkfTlAyYdpuih/rH914wY/nGyuogk=;
 b=qYJlfXIUcevBaGymcDBsNeIL/mVkPKzHWIeQk4hdLWQBJtpcIUjejiLCXIwowA/NYU
 3XWRzMH1J0z6kTso/BuvYbTAPCLCDldCVZ9oSZ1kxHFAknirwuCJhD/vC0Qh/l24YPmN
 lVpSVF4wDD6xhFJYaDCHXhqzSSOtiaLIXquXfL7k2a+uep9uKHl7RdG9z8k1yHdz0x1U
 Sjjtiq9Bppah0SQ9hqnqPiqsW5oMfCKE1bpGKQJO8xCFIWZbY6Ue2TxnXIQJ4hvALf5d
 +DwlPHyjyrmggRbWW6B4XmoiupfRSlfV6jZwuS+zKtVfPJPAiFXUu+mIXfZeKtHvFp1r
 c+YQ==
X-Gm-Message-State: APjAAAWH++HvBd/Vhc1UyYue/HWlT3SDNBwBDIBDERTk9GaBZkPxRbUc
 RA1S54wdzaVT2xECaw5xogdkPmoEdttLJ2oQ1Ck=
X-Google-Smtp-Source: APXvYqzSXLBmi3QBSPnlEc4j3Wq0TD3bDTWxaSi4tJZuX7iDtm2uxaigOnt4Q5cIcS70ILuHVb3rMtK0/BvCp9hn+ZQ=
X-Received: by 2002:a37:dd8:: with SMTP id 207mr1266280qkn.292.1580972673487; 
 Wed, 05 Feb 2020 23:04:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203180904.2727-1-linux@roeck-us.net>
 <20200203180904.2727-2-linux@roeck-us.net>
 <accf297f-0c54-7475-8817-c1014999a57d@kaod.org>
 <7fe70871-c0e3-4ff6-bfda-17b45aa50c5e@roeck-us.net>
 <22a96987-9548-1335-8b04-00167ed9491d@kaod.org>
 <20200205174345.GA7754@roeck-us.net>
In-Reply-To: <20200205174345.GA7754@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2020 07:04:20 +0000
Message-ID: <CACPK8XesxroZii2-r-HTigW4-7Ahw4TQNG1r-YO2K09S7Ap9=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] m25p80: Improve command handling for Jedec and
 unsupported commands
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::742
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 Feb 2020 at 17:43, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Feb 05, 2020 at 11:08:07AM +0100, C=C3=A9dric Le Goater wrote:
> >
> > ok. we will need to model SFDP one day.
> >
> > Are you using the OpenBMC images or do you have your own ?
> >
>
> I am running images built from upstream/stable kernel branches.

I think C=C3=A9dric was wondering which flash images and therefore
filesystems you were using in your testing.

I had a poke around here but I couldn't work out where 'mtd32' came from:

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-=
arm.sh

Cheers,

Joel

