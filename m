Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80716509C6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:08:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7D3y-0006G6-9z; Mon, 19 Dec 2022 05:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7D3n-0006Es-CQ
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:07:51 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1p7D3l-0004j7-1E
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:07:50 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NbFhr21b1z6H7dv;
 Mon, 19 Dec 2022 18:06:04 +0800 (CST)
Received: from localhost (10.45.149.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Dec
 2022 10:07:26 +0000
Date: Mon, 19 Dec 2022 10:07:23 +0000
To: <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [RFC PATCH 3/6] hw/cxl/cxl-events: Add CXL mock events
Message-ID: <20221219100723.000021a9@Huawei.com>
In-Reply-To: <20221010222944.3923556-4-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-4-ira.weiny@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.149.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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

On Mon, 10 Oct 2022 15:29:41 -0700
ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> To facilitate testing of guest software add mock events and code to
> support iterating through the event logs.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

An FYI for the next version as I hit an issue with this when
testing resets (there are lots of other issues with resets
but this one crashed QEMU :)

> ---

> +static void event_store_add_event(CXLDeviceState *cxlds,
> +                                  enum cxl_event_log_type log_type,
> +                                  struct cxl_event_record_raw *event)
> +{
> +    struct cxl_event_log *log;
> +
> +    assert(log_type < CXL_EVENT_TYPE_MAX);
> +
> +    log = &cxlds->event_logs[log_type];
> +    assert(log->nr_events < CXL_TEST_EVENT_CNT_MAX);

This assert triggers on a reset as the function is called without
clearing the buffer first.

I'd suggest moving the setup of any dummy events over to a code
path that isn't run on reset.


> +
> +    log->events[log->nr_events] = event;
> +    log->nr_events++;
> +}


