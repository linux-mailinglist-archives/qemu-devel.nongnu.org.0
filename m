Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1814E4AE4F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 00:56:21 +0200 (CEST)
Received: from localhost ([::1]:34002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdN1Y-0004r8-BH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 18:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56921)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hdN02-0003l7-JS
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hdN00-0003fi-Dr
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43713)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hdN00-0003eO-8R
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:54:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F370F30821BF;
 Tue, 18 Jun 2019 22:54:42 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67C21173AF;
 Tue, 18 Jun 2019 22:54:41 +0000 (UTC)
Date: Tue, 18 Jun 2019 19:54:40 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Kagan <rkagan@virtuozzo.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org
Message-ID: <20190618225440.GM19178@habkost.net>
References: <20190615200505.31348-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190615200505.31348-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 18 Jun 2019 22:54:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] i386: Fix signedness of
 hyperv_spinlock_attempts
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 15, 2019 at 05:05:05PM -0300, Eduardo Habkost wrote:
> The current default value for hv-spinlocks is 0xFFFFFFFF (meaning
> "never retry").  However, the value is stored as a signed
> integer, making the getter of the hv-spinlocks QOM property
> return -1 instead of 0xFFFFFFFF.
> 
> Fix this by changing the type of X86CPU::hyperv_spinlock_attempts
> to uint32_t.  This has no visible effect to guest operating
> systems, affecting just the behavior of the QOM getter.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Queued on x86-next.

-- 
Eduardo

