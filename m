Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA16C5080
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 17:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf1Gb-0003Qw-BX; Wed, 22 Mar 2023 12:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pf1GW-0003Qm-FF
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:24:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pf1GU-0001TB-63
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 12:24:44 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pgqr51bNyz6Y1JL;
 Tue, 21 Mar 2023 19:58:29 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 21 Mar
 2023 12:01:48 +0000
Date: Tue, 21 Mar 2023 12:01:47 +0000
To: Dan Williams <dan.j.williams@intel.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH] hw/acpi/cxl: Drop device-memory support from CFMWS entries
Message-ID: <20230321120147.00003ea7@Huawei.com>
In-Reply-To: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
References: <167937891122.1510933.11055956062467467440.stgit@dwillia2-xfh.jf.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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

On Mon, 20 Mar 2023 23:08:31 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> While it was a reasonable idea to specify no window restricitions at the
> outset of the CXL emulation support, it turns out that in practice a
> platform will never follow the QEMU example of specifying simultaneous
> support for HDM-H and HDM-D[B] in a single window.
> 
> HDM-D mandates extra bus cycles for host/device bias protocol, and HDM-DB
> mandates extra bus cycles for back-invalidate protocol, so hardware must
> be explicitly prepared for device-memory unlike host-only memory
> (HDM-H).
> 
> In preparation for the kernel dropping support for windows that do not
> select between device and host-only memory, move QEMU exclusively to
> declaring host-only windows.
> 
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Hi Dan,

Can we have some spec references? I think the Protocol tables in
appendix C would work for that - but more specific examples called
out from them would be good.

I'm also not totally convinced it isn't a host implementation detail
- key here is that host bridge's are still part of the host so can
do impdef stuff as long as they look correct to CXL side and to
host side.

Time for some wild implementation conjecturing.

Imagine a host that has host bridges of above average smartness.
Those host bridges have HDM decoders (this doesn't work if not)

Host is using a single HPA window for HDM-D[B] and HDM-H.
The host bridge knows the target is HDM-H - it can get that form
the HDM decoder Target Type bit etc.  The HB can send (to the
rest of the Host) whatever replies are necessary / fill in extra
info to make it look like HDM-D[B] to the host interconnect protocol.

(after some fun with a white board we think you can make this efficient
 by potentially making the Host bridge HDM decoder setup visible to
 other parts of the host - relatively easy give lots of time allowed
 for a decoder commit).

Why would you do this?  Limited HPA space availability on the host
and wanting to be very flexible about use of the CXL windows.

Obviously this is all moot if there is a constraint we can point to
in a specification.

BTW. I'm carrying a patch (it's on the gitlab tree) that I haven't
posted yet that lets you configure this restriction at runtime as
a similar potential host implementation restriction occurs for
PMEM vs Volatile.  That is also needed to exercise the fun corners of
QTG etc.

Jonathan

> ---
>  hw/acpi/cxl.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
> index 2bf8c0799359..defb289e2fef 100644
> --- a/hw/acpi/cxl.c
> +++ b/hw/acpi/cxl.c
> @@ -103,8 +103,8 @@ static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
>          /* Host Bridge Interleave Granularity */
>          build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
>  
> -        /* Window Restrictions */
> -        build_append_int_noprefix(table_data, 0x0f, 2); /* No restrictions */
> +        /* Window Restrictions: Host-only ram and pmem */
> +        build_append_int_noprefix(table_data, 0x0e, 2);
>  
>          /* QTG ID */
>          build_append_int_noprefix(table_data, 0, 2);
> 
> 


