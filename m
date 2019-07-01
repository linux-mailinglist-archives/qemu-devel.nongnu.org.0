Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1238620
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 10:28:40 +0200 (CEST)
Received: from localhost ([::1]:46810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZAEq-00085p-7Q
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 04:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56928)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hZADe-0007Ht-Fw
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:27:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hZADd-0000vU-Kh
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:27:26 -0400
Received: from 17.mo6.mail-out.ovh.net ([46.105.36.150]:49956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hZADd-0000sk-Ef
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:27:25 -0400
Received: from player788.ha.ovh.net (unknown [10.109.160.251])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 6EC851CFCDA
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 10:27:22 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id C8CDB6917401;
 Fri,  7 Jun 2019 08:27:16 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <155984093894.2803172.8618224129384655510.stgit@bahia.lan>
 <20190607001901.GC3760@umbus.fritz.box>
 <2d02c8d1-d9f4-efd0-5059-6ca24e622107@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <47163b65-3e3e-09a9-c80a-ac894b865de4@kaod.org>
Date: Fri, 7 Jun 2019 10:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2d02c8d1-d9f4-efd0-5059-6ca24e622107@kaod.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2299650563298200403
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegiedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.150
Subject: Re: [Qemu-devel] [PATCH] spapr: Don't use the "dual" interrupt
 controller mode with an old hypervisor
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>                         kernel_irqchip
> 
>            (default) 
> ic-mode     allowed           off            on 
> 
> dual        XICS KVM       XICS emul.(3)   XICS KVM         (default mode)
> xics        XICS KVM       XICS emul.      XICS KVM    
> xive        XIVE emul.(1)  XIVE emul.     QEMU failure (2)
> 
> 
> (1) QEMU warns with "warning: kernel_irqchip requested but unavailable: 
>     IRQ_XIVE capability must be present for KVM" 
> (2) QEMU fails with "kernel_irqchip requested but unavailable: 
>     IRQ_XIVE capability must be present for KVM" 
> (3) That is wrong I think, we should get XIVE emulated.
> 
> 
> what you would want is XIVE emulation when ic-mode=dual and 
> kernel_irqchip=allowed, which is the behavior with this patch (but there
                                                 ^
                                              without
> are reboot bugs)

