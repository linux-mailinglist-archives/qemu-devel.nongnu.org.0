Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBB5FD828
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:13:44 +0200 (CEST)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiw9m-0006Ju-Qk
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oivhl-00086A-54
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:44:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oivhj-0001NU-7H
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:44:44 -0400
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp5fz4CBhz67Q1M;
 Thu, 13 Oct 2022 18:41:47 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 12:44:40 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 11:44:39 +0100
Date: Thu, 13 Oct 2022 11:44:38 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <mst@redhat.com>, <hchkuo@avery-design.com.tw>, 
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [PATCH 3/5] hw/mem/cxl_type3: CDAT pre-allocate and check
 resources prior to work
Message-ID: <20221013114438.00007de8@huawei.com>
In-Reply-To: <20221012182120.174142-4-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
 <20221012182120.174142-4-gregory.price@memverge.com>
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

On Wed, 12 Oct 2022 14:21:18 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> Makes the size of the allocated cdat table static (6 entries),
> flattens the code, and reduces the number of exit conditions
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>

Hmm. I don't entirely like this as it stands because it leads to more
fragile code as we don't have clear association between number
of entries and actual assignments.

So, what I've done (inspired by this) is moved to a local enum
in the factored out building function that has an element for
each of the entries (used ultimately to assign them) and
a trailing NUM_ENTRIES element we can then use in place of
the CT3_CDAT_SUBTABLE_SIZE define you have here.

I went with the 2 pass approach mentioned in a later patch, so
if cdat_table passed to the factored out code is NULL, we just
return NUM_ENTRIES directly.

> ---
>  hw/mem/cxl_type3.c | 52 ++++++++++++++++++++--------------------------
>  1 file changed, 22 insertions(+), 30 deletions(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 43b2b9e041..0e0ea70387 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -17,6 +17,7 @@
>  #include "hw/pci/msix.h"
>  
>  #define DWORD_BYTE 4
> +#define CT3_CDAT_SUBTABLE_SIZE 6

>  
>  static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>                                  void *priv)
> @@ -25,7 +26,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>      g_autofree CDATDslbis *dslbis_nonvolatile = NULL;
>      g_autofree CDATDsemts *dsemts_nonvolatile = NULL;
>      CXLType3Dev *ct3d = priv;
> -    int len = 0;
>      int i = 0;
>      int next_dsmad_handle = 0;
>      int nonvolatile_dsmad = -1;
> @@ -33,7 +33,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>      MemoryRegion *mr;
>  
>      if (!ct3d->hostmem) {
> -        return len;
> +        return 0;
>      }
>  
>      mr = host_memory_backend_get_memory(ct3d->hostmem);
> @@ -41,11 +41,22 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          return -EINVAL;
>      }
>  
> +    *cdat_table = g_malloc0(CT3_CDAT_SUBTABLE_SIZE * sizeof(*cdat_table));
> +    if (!*cdat_table) {
> +        return -ENOMEM;
> +    }
> +
>      /* Non volatile aspects */
>      dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
> -    if (!dsmas_nonvolatile) {
> +    dslbis_nonvolatile =
> +        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
> +    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
> +    if (!dsmas_nonvolatile || !dslbis_nonvolatile || !dsemts_nonvolatile) {

I don't like aggregated error checking. It saves lines of code, but leads
to generally less mantainable code.  I prefer to do one thing, check it and handle
necessary errors - provides a small localized chunk of code that is easy to
review and maintain.
1. Allocate structure
2. Fill structure.

We have to leave the assignment till later as only want to steal the pointers
once we know there are no error paths.

> +        g_free(*cdat_table);

We have auto free to clean this up. So if this did make sense, use a local
g_autofree CDATSubHeader **cdat_table = NULL;
and steal the pointer when assigning *cdat_table at the end of this function
after all the failure paths.

This code all ends up in the caller of the factored out code anyway so
that comment becomes irrelevant on the version I've ended up with.

Jonathan



> +        *cdat_table = NULL;
>          return -ENOMEM;
>      }
> +
>      nonvolatile_dsmad = next_dsmad_handle++;
>      *dsmas_nonvolatile = (CDATDsmas) {
>          .header = {
> @@ -57,15 +68,8 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .DPA_base = 0,
>          .DPA_length = int128_get64(mr->size),
>      };
> -    len++;
>  
>      /* For now, no memory side cache, plausiblish numbers */
> -    dslbis_nonvolatile =
> -        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
> -    if (!dslbis_nonvolatile) {
> -        return -ENOMEM;
> -    }
> -
>      dslbis_nonvolatile[0] = (CDATDslbis) {
>          .header = {
>              .type = CDAT_TYPE_DSLBIS,
> @@ -77,7 +81,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry_base_unit = 10000, /* 10ns base */
>          .entry[0] = 15, /* 150ns */
>      };
> -    len++;
>  
>      dslbis_nonvolatile[1] = (CDATDslbis) {
>          .header = {
> @@ -90,7 +93,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry_base_unit = 10000,
>          .entry[0] = 25, /* 250ns */
>      };
> -    len++;
>  
>      dslbis_nonvolatile[2] = (CDATDslbis) {
>          .header = {
> @@ -103,7 +105,6 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry_base_unit = 1000, /* GB/s */
>          .entry[0] = 16,
>      };
> -    len++;
>  
>      dslbis_nonvolatile[3] = (CDATDslbis) {
>          .header = {
> @@ -116,9 +117,7 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry_base_unit = 1000, /* GB/s */
>          .entry[0] = 16,
>      };
> -    len++;
>  
> -    dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
>      *dsemts_nonvolatile = (CDATDsemts) {
>          .header = {
>              .type = CDAT_TYPE_DSEMTS,
> @@ -130,26 +129,19 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .DPA_offset = 0,
>          .DPA_length = int128_get64(mr->size),
>      };
> -    len++;
>  
> -    *cdat_table = g_malloc0(len * sizeof(*cdat_table));
>      /* Header always at start of structure */
> -    if (dsmas_nonvolatile) {
> -        (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
> -    }
> -    if (dslbis_nonvolatile) {
> -        CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
> -        int j;
> +    (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
>  
> -        for (j = 0; j < dslbis_nonvolatile_num; j++) {
> -            (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
> -        }
> -    }
> -    if (dsemts_nonvolatile) {
> -        (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
> +    CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
Removing the paranoid checking makes sense if we are going to handle
the volatile / non volatile as 'whole sets of tables'.

> +    int j;
> +    for (j = 0; j < dslbis_nonvolatile_num; j++) {
> +        (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
>      }
>  
> -    return len;
> +    (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
> +
> +    return CT3_CDAT_SUBTABLE_SIZE;
>  }
>  
>  static void ct3_free_cdat_table(CDATSubHeader **cdat_table, int num, void *priv)


