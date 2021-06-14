Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253DD3A6F3C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:37:38 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssOv-0006Nj-77
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lssLv-0008QH-4n; Mon, 14 Jun 2021 15:34:31 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lssLt-0005zZ-74; Mon, 14 Jun 2021 15:34:30 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so9636777ott.1; 
 Mon, 14 Jun 2021 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Vh5C5adlkwWDHCjhndqAphgFzNLlmqEewOmbcb8yvoI=;
 b=hPUUaTtqIoRXsXa3hSGT4GIffHInIqef8zcGvmcM/+fV/mKkHwKPKfCEMiJqmXSBkp
 hMSLxEtgvqJ3A5dv9r7KTQb+mYq9AKt8PPJsXT4U9I8zGV1I+T7wiO3owHqfI5ZFnmJs
 mtW3nSon7SFRWI1BpSPF2z4/EblKE7uxXC4j2jEeCs3Rn1JofPF+Xur17sBbgQ9BGJDA
 KthQfW6x15ub5gv4Fb+PguZiJrBlpL62/xICoghYoz9YM/l8zCYNdNeqnRJZZxnVs92K
 9bXj41+G+WnlvLA68DwgysPY3EtjT7n/+Yn/nGiwU8nrb4hMZOG5BLsv6OrYWQPUB1c0
 tH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Vh5C5adlkwWDHCjhndqAphgFzNLlmqEewOmbcb8yvoI=;
 b=bfOqqFMV8VF+hcLHMJJPsUSGlBOKTzF2fKWJv0txRwlymsnXMg9QlU/YhWRloIWsqw
 N5Y+mQsTYnaSzLdJ3JFyWtvO9yq4c6IIuL509VaDTYfsoooWPC6t4slZgdkxpYRqsM+p
 h88p66rwG//oijCgxnGxzR9cdwEbne0kQk/tbreJxNl5jZPWSMU4rx5BqqxlgPjKijNL
 slpxBuWvzUGm6rARyDULS02edcZRw8vmOWgMebuzxVdli3eCv4Ik3T7r6RWPhPhfzEI8
 6TkdN4RopyWyZ6BTXvhMCicr7K2IioZaP258JixItUmxSTB7hK0ZWOaQzzufpCt/oJe8
 6ORA==
X-Gm-Message-State: AOAM530XYxxlYsyZsnrgmdxbhcMx6otN4e2pttBdf7ovr0elFmRwWfQ3
 HoO3p4nIVcOSr25vM9UHXQ==
X-Google-Smtp-Source: ABdhPJwtu5vUQx3wwjeK7IK/fOkTI1gR8/hAaR7J4wJW9MIOmDXww0vD1KSzNHvmLBCKsXZ9AIVcQg==
X-Received: by 2002:a9d:945:: with SMTP id 63mr14917814otp.47.1623699266841;
 Mon, 14 Jun 2021 12:34:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id u42sm2886396oiw.50.2021.06.14.12.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:34:25 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:50dd:ab38:f475:bd86])
 by serve.minyard.net (Postfix) with ESMTPSA id 138AF181192;
 Mon, 14 Jun 2021 19:34:25 +0000 (UTC)
Date: Mon, 14 Jun 2021 14:34:23 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
Message-ID: <20210614193423.GE2921206@minyard.net>
References: <20200623063123.20776-1-f4bug@amsat.org>
 <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
 <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
 <b5f020d9-53e6-602c-74f8-d2695462a5c@eik.bme.hu>
 <df15b240-af9b-49d3-178a-d0fb8de63aa3@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df15b240-af9b-49d3-178a-d0fb8de63aa3@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Corey Minyard <cminyard@mvista.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 06:48:05PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/14/21 12:02 PM, BALATON Zoltan wrote:
> > On Mon, 14 Jun 2021, Philippe Mathieu-Daudé wrote:
> >> On 6/12/21 9:33 PM, BALATON Zoltan wrote:
> >>> Hello,
> >>>
> >>> On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
> >>>> This is v2 of Zoltan's patch:
> >>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
> >>>>
> >>>> - rebased
> >>>> - added docstring
> >>>> - include hw/misc/auxbus.c fix
> >>>>
> >>>> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>
> >>>
> >>> What happened to this series? I did not find it in patchew, only my
> >>> original patch:
> >>>
> >>> https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/
> >>>
> >>> I still have this in one of my branches so I think it was not merged at
> >>> the end. Could this be resurrected or should I forget about it and live
> >>> with the inconsistency in parameters instead?
> >>
> >> I suppose it was not queued because you asked to remove the
> >> "Reported-by" tag :/ I agree with you it would be nice to get this in
> >> the tree
> > 
> > I think I said only Reported-by is enough no need for Suggested-by as
> > well but I don't see this as a reason to drop these patches. So maybe
> > just nobody cared enough.
> 
> Ah OK now got it.
> 
> >> for good. However 1 year passed, so it might need adjustment.
> > 
> > Should I try to rebase it or will you do it eventually?
> 
> Found the branch and clean rebase, so no change needed.
> 
> Corey, if you are busy, I could send a pull request if you provide
> and Acked-by tag.

I'm somewhat worried about the silent semantic change.  I would much
prefer the functions to be renamed, as you mentioned in an email a while
ago.  I think that you mentioned this in an email in the chain listed
above, and I think I pulled it for that reason.

-corey

> 
> Regards,
> 
> Phil.
> 

