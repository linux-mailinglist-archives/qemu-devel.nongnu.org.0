Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB05FD812
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:05:10 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiw1V-0006fc-E8
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiveJ-00052Y-V5
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:41:13 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oiveH-0000sC-VS
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:41:11 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp5Zl45yvz688tX;
 Thu, 13 Oct 2022 18:38:07 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 12:41:00 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 11:40:59 +0100
Date: Thu, 13 Oct 2022 11:40:58 +0100
To: Gregory Price <gregory.price@memverge.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, Huai-Cheng Kuo
 <hchkuo@avery-design.com.tw>, Chris Browy <cbrowy@avery-design.com>,
 <linuxarm@huawei.com>, <ira.weiny@intel.com>
Subject: Re: [PATCH v7 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <20221013114058.00003c8d@huawei.com>
In-Reply-To: <Y0bk8g2zn2tpUS3a@memverge.com>
References: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
 <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <Y0bk8g2zn2tpUS3a@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 12 Oct 2022 12:01:54 -0400
Gregory Price <gregory.price@memverge.com> wrote:

> This code contains heap corruption on free, and I think should be
> refactored to pre-allocate all the entries we're interested in putting
> into the table.

Good point on the heap corruption.. (oops. Particularly as I raised
that I didn't like the complexity of your free in your previous version
and still failed to notice the current code was wrong...)


>  This would flatten the code and simplify the error
> handling steps.

I'm not so keen on this.  Error handling is pretty trivial because of
the autofree magic.  It will get a tiny bit harder once we have
two calls to the factored out function, but not too bad - we just
need to free the handed off pointers in reverse from wherever we
got to before the error.

> 
> Also, should we consider making a union with all the possible entries to
> make entry allocation easier?  It may eat a few extra bytes of memory,
> but it would simplify the allocation/cleanup code here further.

An interesting point, though gets trickier once we have variable numbers
of elements.  I'm not sure it's worth the effort to save a few lines
of code.

> 
> Given that every allocation has to be checked, i'm also not convinced
> the use of g_autofree is worth the potential footguns associated with
> it.

After rolling a version with some of your suggested changes incorporated
the autofree logic is all nice and localized so I think it's well worth
having. Only slightly messy bit is we end up with 4 separate pointers
for the bandwidth and latency elements. 


