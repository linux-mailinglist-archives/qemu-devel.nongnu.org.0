Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B299AB8DE2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 11:37:44 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBFMF-0006vA-F8
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 05:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iBFDS-0005Ax-GY
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iBFDR-0008Hx-Dz
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:28:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iBFDR-0008Hb-9k
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:28:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B05E641C7;
 Fri, 20 Sep 2019 09:28:36 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-165.rdu2.redhat.com
 [10.10.120.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83B0F60C80;
 Fri, 20 Sep 2019 09:28:23 +0000 (UTC)
Subject: Re: [edk2-devel] [Qemu-devel] [PATCH 1/2] q35: implement 128K SMRAM
 at default SMBASE address
To: Igor Mammedov <imammedo@redhat.com>
References: <20190917130708.10281-1-imammedo@redhat.com>
 <20190917130708.10281-2-imammedo@redhat.com>
 <561f4440-7c06-10d7-80ce-bbfa810fec59@redhat.com>
 <20190920102855.3fe2b689@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a581abbc-ec03-c332-b225-6f7cd3cfadae@redhat.com>
Date: Fri, 20 Sep 2019 11:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190920102855.3fe2b689@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 20 Sep 2019 09:28:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: yingwen.chen@intel.com, Brijesh Singh <brijesh.singh@amd.com>,
 devel@edk2.groups.io, phillip.goerl@oracle.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, jiewen.yao@intel.com, jun.nakajima@intel.com,
 michael.d.kinney@intel.com, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rfc@edk2.groups.io, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/20/19 10:28, Igor Mammedov wrote:
> On Thu, 19 Sep 2019 19:02:07 +0200
> "Laszlo Ersek" <lersek@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> (+Brijesh)
>>
>> long-ish pondering ahead, with a question at the end.
> [...]
> 
>> Finally: can you please remind me why we lock down 128KB (32 pages) at
>> 0x3_0000, and not just half of that? What do we need the range at
>> [0x4_0000..0x4_FFFF] for?
> 
> 
> If I recall correctly, CPU consumes 64K of save/restore area.
> The rest 64K are temporary RAM for using in SMI relocation handler,
> if it's possible to get away without it then we can drop it and
> lock only 64K required for CPU state. It won't help with SEV
> conflict though as it's in the first 64K.

OK. Let's go with 128KB for now. Shrinking the area is always easier
than growing it.

> On QEMU side,  we can drop black-hole approach and allocate
> dedicated SMRAM region, which explicitly gets mapped into
> RAM address space and after SMI hanlder initialization, gets
> unmapped (locked). So that SMRAM would be accessible only
> from SMM context. That way RAM at 0x30000 could be used as
> normal when SMRAM is unmapped.

I prefer the black-hole approach, introduced in your current patch
series, if it can work. Way less opportunity for confusion.

I've started work on the counterpart OVMF patches; I'll report back.

Thanks
Laszlo

