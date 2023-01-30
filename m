Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD08680EF8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:30:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUAZ-0002RV-MT; Mon, 30 Jan 2023 08:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMU9h-00027i-5d
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:25:05 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pMU9a-0006UI-SR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:25:01 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4P585l08WQz6J9xg;
 Mon, 30 Jan 2023 21:23:55 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 13:24:52 +0000
Date: Mon, 30 Jan 2023 13:24:51 +0000
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <hchkuo@avery-design.com.tw>,
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [RFC v4 3/3] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Message-ID: <20230130132451.00002d5b@Huawei.com>
In-Reply-To: <20221128150157.97724-4-gregory.price@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
 <20221128150157.97724-4-gregory.price@memverge.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index e59ba22387..6893f54e28 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -40,32 +40,46 @@
>    "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
>    "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
>  
> -#define QEMU_T3D \
> +#define QEMU_T3D_DEPRECATED \
>    "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
> -  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
> +  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
>    "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
>  
> +#define QEMU_T3D_PMEM \
> +  "-object memory-backend-file,id=m0,mem-path=%s,size=256M " \
> +  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
> +  "-device cxl-type3,bus=rp0,persistent-memdev=cxl-m0,lsa=lsa0,id=pmem0 "
naming mismatch. I've fixed up with mem0 as the device name. 
The naming isn't totally consistent so I may tweak this some more before
sending for upstream.



