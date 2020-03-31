Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2D1999CF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 17:35:35 +0200 (CEST)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJIvO-0000Mq-CO
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 11:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jonathan.cameron@huawei.com>) id 1jJItd-0007BZ-Kz
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1jJItc-000578-DL
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:33:45 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2091 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1jJItb-00052K-9m
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:33:44 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 191D05CE4A493A008DEE;
 Tue, 31 Mar 2020 16:33:34 +0100 (IST)
Received: from localhost (10.47.93.255) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 31 Mar
 2020 16:33:33 +0100
Date: Tue, 31 Mar 2020 16:33:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 00/41] target/arm: Implement ARMv8.1-VHE
Message-ID: <20200331163324.000020fb@Huawei.com>
In-Reply-To: <CAFEAcA83vHKOYdxnAG9ouF9OJTGh+3z_RuB1yEc6dCpErZ4pZw@mail.gmail.com>
References: <20200206105448.4726-1-richard.henderson@linaro.org>
 <CAFEAcA83vHKOYdxnAG9ouF9OJTGh+3z_RuB1yEc6dCpErZ4pZw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.93.255]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
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
Cc: salil.mehta@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Feb 2020 11:52:46 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 6 Feb 2020 at 10:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Version 7 has one more tweak to the vhe tlb flushing
> > that Peter asked for.  All patches have reviews.
> >
> >  
> 
> 
> 
> Applied to target-arm.next, thanks.

Hi Peter / Richard.

Just wondering if there are any known issues with this?

I'm trying to test with mainline kernel 5.6, and the qemu rc0.
Host emulating 4 core cpu=max,virtualization=on, guest 1 core.

I get one of those lovely init died messages.
(copy typed between screens)

Run /sbin/init as init process
Kernel panic - not synching: Attempted to kill init! exitcode =0x0000000b

Nothing obvious in the trace for why.

Same kernel / image / setup etc works fine when tested with a real
VHE supporting machine as the host (kunpeng920).

Also fine running as a guest inside the emulated host without kvm.

This is a bit too much of a case of Russian dolls so I'm not even sure
how to get any useful debug information.

Thanks,

Jonathan


> 
> -- PMM
> 



