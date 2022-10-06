Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD85F6828
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:29:45 +0200 (CEST)
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQwa-0004u1-Hr
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=tIOp=2H=zx2c4.com=Jason@kernel.org>)
 id 1ogQlM-0000lz-07
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:18:09 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=tIOp=2H=zx2c4.com=Jason@kernel.org>)
 id 1ogQlJ-00020z-Ir
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:18:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD6396199A
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 13:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2841DC433D6
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 13:18:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Kuyx3SG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665062279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x4qWBNOnOyOrI4Af0BRuTqnV0/nwIZJ9mUT4GlCXzHY=;
 b=Kuyx3SG0if5sIOLGJ3E48zAqkjGkElPXU2y3WVXBel1XJvOaW+o+a5dWKOmaa0JUF3vSVM
 QstOr6S9Y/6vRmVw+HHxzQZ21PVSPqBnndP1qzNTjTfvIbYQlJN5kAN2+g0/GwzqcFlpLT
 wZQA8zrKmo82LLFRd68SLDP0CnSDZJE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1ee5d4d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 6 Oct 2022 13:17:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id n186so1942236vsc.9
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:17:58 -0700 (PDT)
X-Gm-Message-State: ACrzQf3DL0OBKJ6GPF0FK8xR9WcPHvPuDOBnLVM+/RMvGnAqij3OCm9C
 ad849MCoDUEeFixHYUzdt8NoprRAKeaD9gP9VYM=
X-Google-Smtp-Source: AMsMyM7xHTERCLSGmxnMxgeRYBOhpRWy7TaDoNJz9f+4g4Opihh3OGCbEp6rEpdZQSbh4fuWWRRNYp2BacCD58CSLaU=
X-Received: by 2002:a67:e401:0:b0:398:89f1:492f with SMTP id
 d1-20020a67e401000000b0039889f1492fmr2721264vsf.21.1665062278265; Thu, 06 Oct
 2022 06:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 6 Oct 2022 07:17:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9qZOBbC0aYJ2qpsuNphMV=v2i5y3_iywFX8mxm6nDNkrw@mail.gmail.com>
Message-ID: <CAHmME9qZOBbC0aYJ2qpsuNphMV=v2i5y3_iywFX8mxm6nDNkrw@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=tIOp=2H=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Thu, Oct 6, 2022 at 7:16 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 30 Sept 2022 at 00:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > When the system reboots, the rng-seed that the FDT has should be
> > re-randomized, so that the new boot gets a new seed. Several
> > architectures require this functionality, so export a function for
> > injecting a new seed into the given FDT.
> >
> > Cc: Alistair Francis <alistair.francis@wdc.com>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Hi; I've applied this series to target-arm.next (seems the easiest way
> to take it into the tree).

Thanks for taking it.

> PS: if you could remember to send cover letters for multipatch
> patchsets, that helps our automated tooling. (I think this is
> why the series didn't show up in patchew, for instance.)

Good call, will do.

Jason

