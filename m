Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2F6B7D05
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 17:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkfb-00023V-DQ; Mon, 13 Mar 2023 12:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pbkfR-00021v-0T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:04:57 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pbkfO-0000zS-SO
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:04:56 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pb1fz1Hf6z6J7Ft;
 Tue, 14 Mar 2023 00:03:55 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 13 Mar
 2023 16:04:42 +0000
Date: Mon, 13 Mar 2023 16:04:41 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 "Ira Weiny" <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, 
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, "Mike
 Maslenkin" <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 2/2] hw/cxl: Multi-Region CXL Type-3 Devices
 (Volatile and Persistent)
Message-ID: <20230313160441.00000dc1@huawei.com>
In-Reply-To: <20230307194914-mutt-send-email-mst@kernel.org>
References: <20230227163157.6621-1-Jonathan.Cameron@huawei.com>
 <20230227163157.6621-3-Jonathan.Cameron@huawei.com>
 <20230307194914-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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


...

> > +    if (vmr) {
> > +        if (*dpa_offset < int128_get64(vmr->size)) {
> > +            *as = &ct3d->hostvmem_as;
> > +        } else {
> > +            *as = &ct3d->hostpmem_as;
> > +            *dpa_offset -= vmr->size;  
> 
> You can't do math on vmr->size, it's Int128.
> And generally please do not poke at mr->size use APIs.
> 
> Which one will depend ...

Good spot. In this case they are all sub 64 bit so
simple memory_region_size() is appropriate I think.

I'll add a precursor patch converting existing 
int128_get64(mr->size) users in this file over to that.

Thanks,

Jonathan

