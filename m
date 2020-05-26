Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12BD19A9C5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 12:46:31 +0200 (CEST)
Received: from localhost ([::1]:57824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJatC-0002AJ-OG
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 06:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jonathan.cameron@huawei.com>) id 1jJasD-0001iv-P6
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1jJasC-0006w4-Bo
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:45:29 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2095 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1jJasC-0006uU-4v
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 06:45:28 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 24B4EC3766AF1A7F37CA;
 Wed,  1 Apr 2020 11:45:24 +0100 (IST)
Received: from localhost (10.227.96.57) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 1 Apr 2020
 11:45:23 +0100
Date: Wed, 1 Apr 2020 11:45:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 00/41] target/arm: Implement ARMv8.1-VHE
Message-ID: <20200401114522.00007335@huawei.com>
In-Reply-To: <2c29aaa9-0c92-ba48-e218-ab816044eec3@linaro.org>
References: <20200206105448.4726-1-richard.henderson@linaro.org>
 <CAFEAcA83vHKOYdxnAG9ouF9OJTGh+3z_RuB1yEc6dCpErZ4pZw@mail.gmail.com>
 <20200331163324.000020fb@Huawei.com>
 <2c29aaa9-0c92-ba48-e218-ab816044eec3@linaro.org>
Organization: Huawei tech. R&D (UK)  Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.227.96.57]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
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
Cc: Peter Maydell <peter.maydell@linaro.org>, salil.mehta@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Mar 2020 11:59:13 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 3/31/20 8:33 AM, Jonathan Cameron wrote:
> > Just wondering if there are any known issues with this?  
> 
> Nope.  It works for me.
> Can you give us any more details.
> 

Unfortunately not a lot more to add.

I ran some sanity checks that it wasn't something else looking like an issue
in these patches.

All with 5.6 kernel and 5.0.0 rc0 qemu

1) sve=off but VHE still on. failed.
2) sve=off + VH bit not set. fine but obviously no VHE.
(dance with SVE required because of kernel checks for SVE before allowing
 no VHE kvm).
3) above tests run on mainline qemu just after VHE patches applied (just in case
   we have a regression from some other change).  No change.
4) EDK2 for the guest.  Synchronous exception. (works fine with no VHE)
0x00..05F9B2208

I do get an additional error sometimes such as the ld.so one here.

[   16.539375] Run /sbin/init as init process
Inconsistency detected by ld.so: rtld.c: 721: init_tls: Assertion `i == GL(dl_tls_max_dtv_idx)' failed!
[   17.780596] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
[   17.847709] CPU: 0 PID: 1 Comm: init Not tainted 5.6.0 #356
[   17.897260] Hardware name: linux,dummy-virt (DT)
[   17.940007] Call trace:
[   17.962297]  dump_backtrace+0x0/0x190
[   17.993897]  show_stack+0x1c/0x28
[   18.022382]  dump_stack+0xb4/0xfc
[   18.050781]  panic+0x160/0x35c
[   18.077469]  do_exit+0x9a4/0xa08
[   18.105510]  do_group_exit+0x48/0xa8
[   18.136073]  __arm64_sys_exit_group+0x1c/0x20
[   18.173677]  el0_svc_common.constprop.0+0x70/0x168
[   18.218659]  do_el0_svc+0x28/0x88
[   18.247154]  el0_sync_handler+0x10c/0x180
[   18.281379]  el0_sync+0x140/0x180
[   18.310684] Kernel Offset: 0x2a67dcc00000 from 0xffff800010000000
[   18.362474] PHYS_OFFSET: 0xfffff79400000000
[   18.398314] CPU features: 0x40012,20c0a238
[   18.433416] Memory Limit: none
[   18.463648] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00 ]---


Jonathan


> 
> r~



