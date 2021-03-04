Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FA32DA53
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:25:21 +0100 (CET)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtb5-0001HA-Os
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lHtZF-0000hF-3L
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:23:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lHtZB-0007gg-Le
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:23:24 -0500
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ds0z143pvz67rtL;
 Fri,  5 Mar 2021 03:18:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 4 Mar 2021 20:23:08 +0100
Received: from localhost (10.47.94.223) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 4 Mar 2021
 19:23:08 +0000
Date: Thu, 4 Mar 2021 19:21:58 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
Message-ID: <20210304192158.00004296@Huawei.com>
In-Reply-To: <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.94.223]
X-ClientProxiedBy: lhreml745-chm.china.huawei.com (10.201.108.195) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, mst@redhat.com,
 imammedo@redhat.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Feb 2021 15:35:49 -0500
Chris Browy <cbrowy@avery-design.com> wrote:

Hi Chris,

One more thing hit whilst debugging linux side of this.

> +static void pcie_doe_irq_assert(DOECap *doe_cap)
> +{
> +    PCIDevice *dev = doe_cap->doe->pdev;
> +
> +    if (doe_cap->cap.intr && doe_cap->ctrl.intr) {


need something like

doe_cap->status.intr = 1;

I think or anyone checking the status register is going to think
this interrupt is spurious.

Otherwise all seems to work. I need to do a bit of tidying up on
kernel code but should be able to send out early next week.

> +        /* Interrupt notify */
> +        if (msix_enabled(dev)) {
> +            msix_notify(dev, doe_cap->cap.vec);
> +        } else if (msi_enabled(dev)) {
> +            msi_notify(dev, doe_cap->cap.vec);
> +        }
> +        /* Not support legacy IRQ */
> +    }
> +}

