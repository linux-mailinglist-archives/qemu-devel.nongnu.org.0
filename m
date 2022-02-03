Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827E14A82D1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:02:50 +0100 (CET)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFZt3-0004xh-ES
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFZqa-0003k2-8m
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFZqM-00076d-SV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:00:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643885999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0TIqe/cGRzEX4Izfvzgine/IdnHCG3xMi6YcFdp9gE=;
 b=X91rFxpgDMel/6teiuNMRQIs5yUcprtacnJXcEROVYOiHQyltGZf+rklFL1xhsni/Q2FKo
 lNB8MA0DGfS0QG8MnF6UYoRcPK8tHDw4WniM5Fd2/RXXrPxFwwbDwpU46sjsMaG1+od1bA
 hmg6jJpN6Uk1lIvb4DeG8fW25GIm35E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-W9Sm2U2_McSXq6INJTRiTQ-1; Thu, 03 Feb 2022 05:59:58 -0500
X-MC-Unique: W9Sm2U2_McSXq6INJTRiTQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 z1-20020adfbbc1000000b001df54394cebso514819wrg.20
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 02:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=x0TIqe/cGRzEX4Izfvzgine/IdnHCG3xMi6YcFdp9gE=;
 b=wtBHXmk6PF5qBIxz5k/iqLmfueEScbEXZG2rWXs3PoVjrI+6JX/q4O8tutUueHSEr3
 U4ipmT+EyyNE7S4MHcN8nMoDVghOqMfBzINCvFaBHnyHr8XMadgCNjvifIkQ6dgY3ArS
 6n0YH03wE7il4JXUSZQP+dtL4Xav7uk7JwuOXHGIRXEjHlt0MCD9tehYxtbVuy5QtXxb
 Y+dY9p9VNZaz7Ccx4zeUK5NJKRTSS7dhCnEF0EhQd222WAnlqOwz+sFH6BivWFiVmUjq
 gc0VzO9P/M6qTjDlP81velFMGnrFvrEGCjAw4PoOmieUNjghz86m2EWSEyZGcOshKF/b
 UZuw==
X-Gm-Message-State: AOAM532jBnWUQ24uhKcf11s+I8itB7PgWZ0DqrMajrBVLkh8aFPXPRyf
 amNG8HPCQfIJG7/qRBj87kTnIyolwDpY9C1STyO3eZ2dqJzeZM729R0O+ihqYUne0qoMsU7Vk2R
 lomEtYZkL/nX/6nM=
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr29002046wrs.236.1643885996764; 
 Thu, 03 Feb 2022 02:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3uL/ax4Zt2sU0H+lbsyq/8uxbjSF1o1MMdr9NurfOfWNY1WvFocxlA6GR+TOnftCvqiHGNA==
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr29002029wrs.236.1643885996521; 
 Thu, 03 Feb 2022 02:59:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o14sm6812942wmr.3.2022.02.03.02.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 02:59:55 -0800 (PST)
Date: Thu, 3 Feb 2022 10:59:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] Fix %#0 misuses
Message-ID: <Yfu1qfCH73D4zA1l@work-vm>
References: <20220202183417.116478-1-dgilbert@redhat.com>
 <77c6899b-5892-5aaa-97ee-a79a74928c09@amsat.org>
MIME-Version: 1.0
In-Reply-To: <77c6899b-5892-5aaa-97ee-a79a74928c09@amsat.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, shorne@gmail.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> On 2/2/22 19:34, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Joe Perches pointed out on lkml [1] that the format special %# (which
> > adds 0x) is included in the character count, i.e.:
> > 
> >    printf("0: %#08x\n0: %#08x\n", 0xabcdef01,1);
> > gives:
> > 0: 0xabcdef01
> > 0: 0x000001
> > 
> > rather than padding to the expected 8 data characters.
> > 
> > Replace all the '%#08' cases by '0x%08' and
> > also handle a '%#02'; there are some other cases mostly
> > in testing and a few that look like the authors have
> > thought about the size, that I've ignored for now.
> > 
> > (Note I've not managed to test most of these)
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > [1] https://lore.kernel.org/lkml/9499203f1e993872b384aabdec59ac223a8ab931.camel@perches.com/
> > 
> > Fixup %#
> > ---
> >   chardev/baum.c          | 2 +-
> >   disas/alpha.c           | 2 +-
> >   disas/sparc.c           | 2 +-
> >   hw/arm/omap1.c          | 2 +-
> >   hw/timer/a9gtimer.c     | 4 ++--
> >   include/hw/arm/omap.h   | 5 +++--
> >   softmmu/device_tree.c   | 2 +-
> >   target/openrisc/disas.c | 2 +-
> >   8 files changed, 11 insertions(+), 10 deletions(-)
> 
> Few more:
> 
> $ git grep -E '\%#[0-9]{1,2}[dDxX]'

Thanks, actually 1,3 is worth it :-)

> chardev/baum.c:369:            DPRINTF("Broken packet %#2x, tossing\n",
> req); \

Interestingly without the 0

> disas/alpha.c:1854:  (*info->fprintf_func) (info->stream, ".long %#08x",
> insn);
> hw/audio/ac97.c:244:    dolog ("bd %2d addr=%#x ctl=%#06x len=%#x(%d
> bytes)\n",
> hw/dma/i8257.c:265:        linfo ("write_cont: nport %#06x, ichan % 2d, val
> %#06x\n",
> hw/dma/i8257.c:290:    ldebug ("read_cont: nport %#06x, iport %#04x val
> %#x\n", nport, iport, val);

So some of these are a bit weird and might need thinking about; I
*think* they're 06 because the author realised the 0x was counted and
bumped it up from 04; but that actually means I'd need to understand the
device code before changing it.

> softmmu/device_tree.c:372:        error_report("%s: Couldn't set %s/%s =
> %#08x: %s", __func__,
> target/openrisc/disas.c:48:        output(".long", "%#08x", insn);
> tests/qemu-iotests/nbd-fault-injector.py:187: print('unrecognized command
> type %#02x' % req.type)
> tests/tcg/arm/fcvt.c:60:    printf("%02d   HALF: %#04x  (%#x => %s)\n",
> tests/tcg/multiarch/libs/float_helpers.c:72:    asprintf(&fmt, "f16(%#04x)",
> num);
> 
> In mood to add a regexp to checkpatch? :)

I think it already has one for new patches.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


