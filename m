Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05562D2FAE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 19:36:22 +0200 (CEST)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIcMP-000232-2x
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 13:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iIcLJ-000195-AD
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 13:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iIcLH-0000xt-PE
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 13:35:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iIcLH-0000wm-I4; Thu, 10 Oct 2019 13:35:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61FFA1017C01;
 Thu, 10 Oct 2019 17:35:10 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70D381001B36;
 Thu, 10 Oct 2019 17:35:07 +0000 (UTC)
Date: Thu, 10 Oct 2019 19:35:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] eliminate remaining places that abuse
 memory_region_allocate_system_memory()
Message-ID: <20191010193503.097548e4@Igors-MacBook-Pro>
In-Reply-To: <20191008113318.7012-1-imammedo@redhat.com>
References: <20191008113318.7012-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 10 Oct 2019 17:35:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: deller@gmx.de, mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org,
 hpoussin@reactos.org, david@gibson.dropbear.id.au, atar4qemu@gmail.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  8 Oct 2019 07:33:15 -0400
Igor Mammedov <imammedo@redhat.com> wrote:

> 
> Series cleans up remaining boards that call memory_region_allocate_system_memory()
> multiple times, violating interface contract (the function should be called only
> once).
> 
> With that cleaned up, it should be possible to switch from adhoc RAM allocation
> in memory_region_allocate_system_memory()->allocate_system_memory_nonnuma() to
> memory-backend based allocation, remaining roadblock for doing it is deprecated
> -mem-path fallback to RAM allocation, which is scheduled for removal at 4.3
> merge window. So remaining patches to consolidate system RAM allocation around
> memory-backends and aliasing -mem-path/mem-prealloc to it are postponed till
> then.

Eduardo,

This patches are fixing various machines across tree, so series does not belong
to any particular arch specific tree, can you merge it via generic machine tree?


> 
> 
> Igor Mammedov (3):
>   sparc64: use memory_region_allocate_system_memory() only for '-m'
>     specified RAM
>   ppc: rs6000_mc: drop usage of memory_region_allocate_system_memory()
>   hppa: drop usage of memory_region_allocate_system_memory() for ROM
> 
>  hw/hppa/machine.c    |  5 ++---
>  hw/ppc/rs6000_mc.c   | 15 ++++++++++-----
>  hw/sparc64/niagara.c | 25 +++++++++++++------------
>  3 files changed, 25 insertions(+), 20 deletions(-)
> 


