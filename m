Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA661816FE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 12:41:36 +0100 (CET)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBzjz-0001g7-Ke
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 07:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jBziZ-00018W-E6
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jBziY-0000dJ-Fx
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:40:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20192
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jBziY-0000cW-BU
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 07:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583926805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAIZ0gNiizIlH4LkU1/e1zQjblG+huI5kTrWLMITuME=;
 b=Iq42FDyG8OU7holBS25bI4/Nl67Vu35jnGOcLZy8pStg/l3YQEmUcvXT7qQPSzv5rcQwni
 AYlVgEqxjJ5yc0wg3SaBS6YuR1FeCPBYo3cGOQ47QsGHRUktorMfvscbOOJrp4m1C/YAT4
 w0mNuBNUTVmBqI6gwW+KWoeEmrtU1WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-zMrooyaSMdaYBNfOcUsF7Q-1; Wed, 11 Mar 2020 07:40:04 -0400
X-MC-Unique: zMrooyaSMdaYBNfOcUsF7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB03013FC;
 Wed, 11 Mar 2020 11:40:02 +0000 (UTC)
Received: from localhost (ovpn-200-57.brq.redhat.com [10.40.200.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A08D5D9C9;
 Wed, 11 Mar 2020 11:39:57 +0000 (UTC)
Date: Wed, 11 Mar 2020 12:39:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v6 01/13] hw/i386: Introduce X86CPUTopoInfo to contain
 topology info
Message-ID: <20200311123955.29a4c0d1@redhat.com>
In-Reply-To: <158389400579.22020.10755767480575663831.stgit@naples-babu.amd.com>
References: <158389385028.22020.7608244627303132902.stgit@naples-babu.amd.com>
 <158389400579.22020.10755767480575663831.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 21:33:25 -0500
Babu Moger <babu.moger@amd.com> wrote:

> This is an effort to re-arrange few data structure for better readability.
> 
> 1. Add X86CPUTopoInfo which will have all the topology informations
>    required to build the cpu topology. There is no functional changes.
> 
> 2. Introduce init_topo_info to initialize X86CPUTopoInfo members from
>    X86MachineState.
> 
> 3. Update x86 unit tests for new calling convention with parameter X86CPUTopoInfo
> 
> There is no functional changes.

patch doesn't apply to current master, so I can't really test it
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
>  hw/i386/pc.c               |   12 ++++++------
>  hw/i386/x86.c              |   32 ++++++++++++++++++++++++--------
>  include/hw/i386/topology.h |   38 ++++++++++++++++++++++++--------------
>  include/hw/i386/x86.h      |    3 +++
>  tests/test-x86-cpuid.c     |   43 ++++++++++++++++++++++++-------------------
>  5 files changed, 81 insertions(+), 47 deletions(-)
> 
[...]
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 322fb6abbc..03b8962c98 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -57,6 +57,16 @@
>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
>  static size_t pvh_start_addr;
>  
> +inline void init_topo_info(X86CPUTopoInfo *topo_info,
> +                                  const X86MachineState *x86ms)

not aligned properly

[...]


