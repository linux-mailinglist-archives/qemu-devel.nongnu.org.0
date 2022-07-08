Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1056B92F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 14:06:21 +0200 (CEST)
Received: from localhost ([::1]:38930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9mkX-0007Lr-1e
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 08:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org>)
 id 1o9mjC-0006JM-U7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:04:59 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:60136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org>)
 id 1o9mjA-0005dW-SL
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 08:04:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 268D762557
 for <qemu-devel@nongnu.org>; Fri,  8 Jul 2022 12:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480A5C341C0
 for <qemu-devel@nongnu.org>; Fri,  8 Jul 2022 12:04:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Yjw5UuiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1657281892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyGnfi76NOHGBCCBzBEr48LA+JfZZSsFDU5gqCM/jTk=;
 b=Yjw5UuiOQOX1Ko6vB+e1fFOH+Li/0IaHGtfi9nw/P6AuoECzNyNGJiiDmq2Pwyn1nb/6nL
 ba+zeM+dKte2/FLFoCDsUBzJMwsYjN82fmZxExiK8syGuZpK1UTXFFI0QKjADTqlryXY+m
 PVF3wcJ036fxnV0PEZi6DFR7Wi9ouns=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7f170f93
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 8 Jul 2022 12:04:52 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id n9so8566807ilq.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 05:04:52 -0700 (PDT)
X-Gm-Message-State: AJIora/jfEWF4sCNVIr+UYLwLwxcA8dQIth5ycTGczjZbC3LVoLTgHoA
 DHqnSiW91FlXEJX8pW5d0OvW5qI62jqgfW18HxM=
X-Google-Smtp-Source: AGRyM1saE6uSYwgSRAfijxB6DGLXsAocI5FgZV7wRkcCXLXANwPt1HNIg6XcFKFziTMqfTpO41sBrqJw9b8DwNyz9AM=
X-Received: by 2002:a05:6e02:1c05:b0:2dc:26e3:a758 with SMTP id
 l5-20020a056e021c0500b002dc26e3a758mr1930582ilh.133.1657281891476; Fri, 08
 Jul 2022 05:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220630113717.1893529-1-Jason@zx2c4.com>
 <YsgcXWuE2HIbFvN6@redhat.com>
In-Reply-To: <YsgcXWuE2HIbFvN6@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2022 14:04:40 +0200
X-Gmail-Original-Message-ID: <CAHmME9rp0_6_pw=btXwuMEVthunnose6UZb4JWBYCUk+mo8WCA@mail.gmail.com>
Message-ID: <CAHmME9rp0_6_pw=btXwuMEVthunnose6UZb4JWBYCUk+mo8WCA@mail.gmail.com>
Subject: Re: [PATCH] hw/i386: pass RNG seed to e820 setup table
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=2dMv=XN=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Daniel,

On Fri, Jul 8, 2022 at 2:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Jun 30, 2022 at 01:37:17PM +0200, Jason A. Donenfeld wrote:
> > Tiny machines optimized for fast boot time generally don't use EFI,
> > which means a random seed has to be supplied some other way, in this
> > case by the e820 setup table, which supplies a place for one. This
> > commit adds passing this random seed via the table. It is confirmed to
> > be working with the Linux patch in the link.
>
> IIUC, this approach will only expose the random seed when QEMU
> is booted using -kernel + -initrd args.
>
> I agree with what you say about most VMs not using UEFI right now.
> I'd say the majority of general purpose VMs are using SeaBIOS
> still. The usage of -kernel + -initrd, is typically for more
> specialized use cases.

Highly disagree, based on seeing a lot of real world deployment.
Furthermore, this is going to be used within Linux itself for kexec,
so it makes sense to use it here too.

> Can we get an approach that exposes a random seed regardless of
> whether using -kernel, or seabios, or uefi, or $whatever firmware ?

No.

> Perhaps (ab)use 'fw_cfg', which is exposed for any x86 VM no matter
> what config it has for booting ?

That approach is super messy and doesn't work. I've already gone down
that route.

The entire point here is to include the seed on this part of the boot
protocol. There might be other opportunities for doing it elsewhere.
For example, EFI already has a thing.

Please don't sink a good idea because it doesn't handle every possible
use case. That type of mentality is just going to result in nothing
ever getting done anywhere, making a decades old problem last for
another decade. This patch here is simple and makes a tangible
incremental advance toward something good, and fits the pattern of how
it's done on all other platforms.

Thanks,
Jason

