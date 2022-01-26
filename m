Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0A49CC2B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:19:46 +0100 (CET)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCj9F-0001kn-DR
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:19:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1nCiaQ-0005xe-D2
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:43:50 -0500
Received: from [2a00:1450:4864:20::236] (port=36544
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1nCiaO-0008AC-3A
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 08:43:45 -0500
Received: by mail-lj1-x236.google.com with SMTP id j14so19831619lja.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gMni9wn2lI5Ay+Ji6nDoLzcxqxpYyMWJcG/nvWMzgec=;
 b=bK37PTttXv4jaPZFDghvL5yZRHV1HKeDh+hXrHE6+P2MKRtM2aJAnxNQlu3tJ0inqv
 Vhj56HIU4kBYTudwKYY98HwtCxOCnGxnqR2a8wnYktNlInmtLM26ewY9P2uEEiRvXeJL
 gq8aGcLnEZFhk+HJvITKq7s7U3J9EuYuqTpwk47pTn0K1IESMsy6STDjiXUCAfFEUKsU
 UmysZeqI7jbKETSTQMwH1c9Z/cPVDhUAIqSvKrs3gyfGOxcn/zvHbj2dm65kfqsv4Z0/
 wwynxO6eblSxARqrcAqEddDjh+CeuQhB9zhimzjbsYPVE8qSb6gaQQkzNh6BREATZ2M0
 U8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gMni9wn2lI5Ay+Ji6nDoLzcxqxpYyMWJcG/nvWMzgec=;
 b=q2BDPeV6MLPtVuHNcdhaYq8t+bLsQ4TNtvsai9scfNkU2e/8L3JAJmNh/FsH/ytOlE
 dX8qjV/D7UlItRD91q+Qa3JfqZFOl/bYf7LLX9KSMunCzlN6hFQqFqDxDxFv/ctSESDq
 6larXw4GWJdLutOOKNjyr2zyBH9XPEM8YOE0Ryeb9aFk6ZIgkGKWC2exaVPgfYjcpc2y
 vG3m1KesXEyC5gFLSKnvjoHbonpzLEkAop9+HUll1HCv9l3+bsBnk4o8sNuGrphOb620
 u20oDGpAGNwKc0vBndQAXuyG2EjTp6+z3VEv14dLkozjSyWJ/kFEaouCfGQ0VFvp8YNM
 7udQ==
X-Gm-Message-State: AOAM533dReUoxX4b4ah5SOFUSZ5IbcjXbp8nSDqhKKuiRu+NCjlqOH3Z
 EVeeGz7+2Rmlrr5r94tOLJo6vyFL7Wl9acDTWuE=
X-Google-Smtp-Source: ABdhPJx//VB5lloxzuc+JaSBuwksC5FZfWbpvzfPHPGA+tJE0rT0Vfw5y5CD72i7G5Vxu1w6RvfeqhVzfViG6JiUVoA=
X-Received: by 2002:a05:651c:1241:: with SMTP id
 h1mr18260308ljh.459.1643204621863; 
 Wed, 26 Jan 2022 05:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20211210193434.75566-1-jandryuk@gmail.com>
 <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
In-Reply-To: <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Jan 2022 08:43:30 -0500
Message-ID: <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=jandryuk@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>
> On 10/12/2021 11:34, Jason Andryuk wrote:
> > commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> > coded setting req.count = 1 during initial field setup before the main
> > loop.  This missed a subtlety that an early exit from the loop when
> > there are no ioreqs to process, would have req.count == 0 for the return
> > value.  handle_buffered_io() would then remove state->buffered_io_timer.
> > Instead handle_buffered_iopage() is basically always returning true and
> > handle_buffered_io() always re-setting the timer.
> >
> > Restore the disabling of the timer by introducing a new handled_ioreq
> > boolean and use as the return value.  The named variable will more
> > clearly show the intent of the code.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, Paul.

What is the next step for getting this into QEMU?

To re-state more plainly, this patch fixes a bug to let QEMU go idle
for longer stretches of time.  Without it, buffer_io_timer continues
to re-arm and fire every 100ms even if there is nothing to do.

Regards,
Jason

