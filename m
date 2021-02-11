Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103103191BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:03:11 +0100 (CET)
Received: from localhost ([::1]:55160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGIw-0008DF-7V
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lAGGn-0006wa-MC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:00:49 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lAGGk-0005WT-KG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:00:49 -0500
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Dc44n72fSz67n8d;
 Fri, 12 Feb 2021 01:54:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Feb 2021 19:00:41 +0100
Received: from localhost (10.47.31.44) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Thu, 11 Feb
 2021 18:00:40 +0000
Date: Thu, 11 Feb 2021 17:59:39 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Ben Widawsky <ben.widawsky@intel.com>
Subject: Re: [RFC PATCH v3 07/31] hw/cxl/device: Add cheap EVENTS
 implementation (8.2.9.1)
Message-ID: <20210211175939.000079f3@Huawei.com>
In-Reply-To: <20210202005948.241655-8-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
 <20210202005948.241655-8-ben.widawsky@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.31.44]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David
 Hildenbrand <david@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Da?= =?ISO-8859-1?Q?ud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 16:59:24 -0800
Ben Widawsky <ben.widawsky@intel.com> wrote:

> Using the previously implemented stubbed helpers, it is now possible to
> easily add the missing, required commands to the implementation.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  hw/cxl/cxl-mailbox-utils.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> index 466055b01a..7c939a1851 100644
> --- a/hw/cxl/cxl-mailbox-utils.c
> +++ b/hw/cxl/cxl-mailbox-utils.c
> @@ -37,6 +37,14 @@
>   *  a register interface that already deals with it.
>   */
>  
> +enum {
> +    EVENTS      = 0x01,
> +        #define GET_RECORDS   0x0
> +        #define CLEAR_RECORDS   0x1
> +        #define GET_INTERRUPT_POLICY   0x2
> +        #define SET_INTERRUPT_POLICY   0x3
> +};
> +
>  /* 8.2.8.4.5.1 Command Return Codes */
>  typedef enum {
>      CXL_MBOX_SUCCESS = 0x0,
> @@ -105,10 +113,23 @@ struct cxl_cmd {
>          return CXL_MBOX_SUCCESS;                                          \
>      }
>  
> +define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, 0x20);
> +define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
> +define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
> +define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
> +
> +#define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> +#define IMMEDIATE_LOG_CHANGE (1 << 4)
> +
>  #define CXL_CMD(s, c, in, cel_effect) \
>      [s][c] = { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
>  
> -static struct cxl_cmd cxl_cmd_set[256][256] = {};
> +static struct cxl_cmd cxl_cmd_set[256][256] = {
> +    CXL_CMD(EVENTS, GET_RECORDS, 1, 0),
> +    CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
> +    CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
> +    CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),

CXL 2.0 spec says IMMEDIATE_POLICY_CHANGE for this rather than
IMMEDIATE_CONFIG_CHANGE.

> +};
>  
>  #undef CXL_CMD
>  


