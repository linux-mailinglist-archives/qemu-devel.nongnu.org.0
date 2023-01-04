Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D8365DBE0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:08:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8B5-0007vV-Pm; Wed, 04 Jan 2023 13:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pD8Az-0007vN-Jw
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:07:45 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pD8Ax-00010B-Dv
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:07:45 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NnHWW10zlz67M1h;
 Thu,  5 Jan 2023 02:02:47 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 18:07:30 +0000
Date: Wed, 4 Jan 2023 18:07:29 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 5/8] hw/cxl/events: Wire up get/clear event mailbox
 commands
Message-ID: <20230104180729.00002095@huawei.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-5-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
 <20221221-ira-cxl-events-2022-11-17-v2-5-2ce2ecc06219@intel.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 21 Dec 2022 20:24:35 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> CXL testing is benefited from an artificial event log injection
> mechanism.
> 
> Add an event log infrastructure to insert, get, and clear events from
> the various logs available on a device.
> 
> Replace the stubbed out CXL Get/Clear Event mailbox commands with
> commands that operate on the new infrastructure.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Hi Ira,

The ability to see the ret_code definitions relied on a patch that will
go upstream long after this one. I've dragged that down before this in
my tree, but the naming ret_code is neither compliant with QEMU naming
rules, nor specific enough given that definition is in a header.
Hence I'll also rename it as CXLRetCode.

I'll have a new tree up with that in place in a few days.
I'll carry your patches on that tree, with appropriate changes.

Jonathan


