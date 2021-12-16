Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCA477B43
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:05:26 +0100 (CET)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv89-00072i-Hf
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:05:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mxv5K-0003kP-VT; Thu, 16 Dec 2021 13:02:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mxv5J-0000N0-IU; Thu, 16 Dec 2021 13:02:30 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AFACB82586;
 Thu, 16 Dec 2021 18:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA5FC36AE5;
 Thu, 16 Dec 2021 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639677743;
 bh=yTnfNzGkZkOJEDFEiYtYBnfHSCaeUpCIk54Fxi5XtEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYg02t5XIQIy01MeYi4140bCjKXeOwQ93vy1SlzqlS+Ny4sD8rSvgo8265jEe2Hlr
 M1U6+kW+bYNvOt0tQmaplbhfMRG24PCFqAlF7zMekWNJo+nslDyih1bRenkXjpvSAk
 Xg/eLlhFtJToTDU7s9alGXcTYgAvnGcEPGzm7yteWtBZqJhKcOZQSArhYroDcriiPR
 AcjIL2agtZwf4Q8akUNIxQ7gfEFH4bRTR6Ey7yKyINyQj4MOmnya2r90MrPpRrjsC8
 Qpb8xZbVUY8Vm/bE3Of9OoBAZWBKG2jN4FB+I4sbCk4+VPvJlDsFpCM4I1wY91tEcu
 lhLIep2zWj3bg==
Date: Thu, 16 Dec 2021 10:02:19 -0800
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] hw/nvme/ctrl: Prohibit DMA accesses to devices
 (CVE-2021-3929)
Message-ID: <20211216180219.GB4165702@dhcp-10-100-145-180.wdc.com>
References: <20211216175510.884749-1-philmd@redhat.com>
 <20211216175510.884749-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216175510.884749-3-philmd@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=kbusch@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 06:55:10PM +0100, Philippe Mathieu-Daudé wrote:
> Async DMA requests might access MMIO regions and re-program the
> NVMe controller internal registers while DMA requests are still
> scheduled or in flight. Avoid that by prohibing the controller
> to access non-memories regions.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

