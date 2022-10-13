Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDAD5FD827
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:13:20 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiw9O-0005Pz-TN
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oivin-0000Mu-Tb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:45:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oivik-0001lJ-AN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:45:49 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Mp5jf5TMGz67PjK;
 Thu, 13 Oct 2022 18:44:06 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 12:45:42 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 13 Oct
 2022 11:45:41 +0100
Date: Thu, 13 Oct 2022 11:45:40 +0100
To: Gregory Price <gourry.memverge@gmail.com>
CC: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>,
 <alison.schofield@intel.com>, <dave@stgolabs.net>,
 <a.manzanares@samsung.com>, <bwidawsk@kernel.org>,
 <gregory.price@memverge.com>, <mst@redhat.com>, <hchkuo@avery-design.com.tw>, 
 <cbrowy@avery-design.com>, <ira.weiny@intel.com>
Subject: Re: [PATCH 4/5] hw/mem/cxl_type3: Change the CDAT allocation/free
 strategy
Message-ID: <20221013114540.00006027@huawei.com>
In-Reply-To: <20221012182120.174142-5-gregory.price@memverge.com>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
 <20221012182120.174142-5-gregory.price@memverge.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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

On Wed, 12 Oct 2022 14:21:19 -0400
Gregory Price <gourry.memverge@gmail.com> wrote:

> The existing code allocates a subtable for SLBIS entries, uses a
> local variable to avoid a g_autofree footgun, and the cleanup code
> causes heap corruption.

Ah good point (particularly given I moaned about how you were handling
the frees and still failed to notice the current code was broken!)


> 
> Rather than allocate a table, explicitly allocate each individual entry
> and make the sub-table size static.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>

I'll integrate a change in the spirit of what you have here, but
without aggregating the error handling paths.

> ---
>  hw/mem/cxl_type3.c | 49 ++++++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 0e0ea70387..220b9f09a9 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -23,13 +23,14 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>                                  void *priv)
>  {
>      g_autofree CDATDsmas *dsmas_nonvolatile = NULL;
> -    g_autofree CDATDslbis *dslbis_nonvolatile = NULL;
> +    g_autofree CDATDslbis *dslbis_nonvolatile1 = NULL;
> +    g_autofree CDATDslbis *dslbis_nonvolatile2 = NULL;
> +    g_autofree CDATDslbis *dslbis_nonvolatile3 = NULL;
> +    g_autofree CDATDslbis *dslbis_nonvolatile4 = NULL;
>      g_autofree CDATDsemts *dsemts_nonvolatile = NULL;
>      CXLType3Dev *ct3d = priv;
> -    int i = 0;
>      int next_dsmad_handle = 0;
>      int nonvolatile_dsmad = -1;
> -    int dslbis_nonvolatile_num = 4;
>      MemoryRegion *mr;
>  
>      if (!ct3d->hostmem) {
> @@ -48,10 +49,15 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>  
>      /* Non volatile aspects */
>      dsmas_nonvolatile = g_malloc(sizeof(*dsmas_nonvolatile));
> -    dslbis_nonvolatile =
> -        g_malloc(sizeof(*dslbis_nonvolatile) * dslbis_nonvolatile_num);
> +    dslbis_nonvolatile1 = g_malloc(sizeof(*dslbis_nonvolatile1));
> +    dslbis_nonvolatile2 = g_malloc(sizeof(*dslbis_nonvolatile2));
> +    dslbis_nonvolatile3 = g_malloc(sizeof(*dslbis_nonvolatile3));
> +    dslbis_nonvolatile4 = g_malloc(sizeof(*dslbis_nonvolatile4));
>      dsemts_nonvolatile = g_malloc(sizeof(*dsemts_nonvolatile));
> -    if (!dsmas_nonvolatile || !dslbis_nonvolatile || !dsemts_nonvolatile) {
> +
> +    if (!dsmas_nonvolatile || !dsemts_nonvolatile ||
> +        !dslbis_nonvolatile1 || !dslbis_nonvolatile2 ||
> +        !dslbis_nonvolatile3 || !dslbis_nonvolatile4) {
>          g_free(*cdat_table);
>          *cdat_table = NULL;
>          return -ENOMEM;
> @@ -70,10 +76,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>      };
>  
>      /* For now, no memory side cache, plausiblish numbers */
> -    dslbis_nonvolatile[0] = (CDATDslbis) {
> +    *dslbis_nonvolatile1 = (CDATDslbis) {
>          .header = {
>              .type = CDAT_TYPE_DSLBIS,
> -            .length = sizeof(*dslbis_nonvolatile),
> +            .length = sizeof(*dslbis_nonvolatile1),
>          },
>          .handle = nonvolatile_dsmad,
>          .flags = HMAT_LB_MEM_MEMORY,
> @@ -82,10 +88,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry[0] = 15, /* 150ns */
>      };
>  
> -    dslbis_nonvolatile[1] = (CDATDslbis) {
> +    *dslbis_nonvolatile2 = (CDATDslbis) {
>          .header = {
>              .type = CDAT_TYPE_DSLBIS,
> -            .length = sizeof(*dslbis_nonvolatile),
> +            .length = sizeof(*dslbis_nonvolatile2),
>          },
>          .handle = nonvolatile_dsmad,
>          .flags = HMAT_LB_MEM_MEMORY,
> @@ -94,10 +100,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry[0] = 25, /* 250ns */
>      };
>  
> -    dslbis_nonvolatile[2] = (CDATDslbis) {
> +    *dslbis_nonvolatile3 = (CDATDslbis) {
>          .header = {
>              .type = CDAT_TYPE_DSLBIS,
> -            .length = sizeof(*dslbis_nonvolatile),
> +            .length = sizeof(*dslbis_nonvolatile3),
>          },
>          .handle = nonvolatile_dsmad,
>          .flags = HMAT_LB_MEM_MEMORY,
> @@ -106,10 +112,10 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>          .entry[0] = 16,
>      };
>  
> -    dslbis_nonvolatile[3] = (CDATDslbis) {
> +    *dslbis_nonvolatile4 = (CDATDslbis) {
>          .header = {
>              .type = CDAT_TYPE_DSLBIS,
> -            .length = sizeof(*dslbis_nonvolatile),
> +            .length = sizeof(*dslbis_nonvolatile4),
>          },
>          .handle = nonvolatile_dsmad,
>          .flags = HMAT_LB_MEM_MEMORY,
> @@ -131,15 +137,12 @@ static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
>      };
>  
>      /* Header always at start of structure */
> -    (*cdat_table)[i++] = g_steal_pointer(&dsmas_nonvolatile);
> -
> -    CDATDslbis *dslbis = g_steal_pointer(&dslbis_nonvolatile);
> -    int j;
> -    for (j = 0; j < dslbis_nonvolatile_num; j++) {
> -        (*cdat_table)[i++] = (CDATSubHeader *)&dslbis[j];
> -    }
> -
> -    (*cdat_table)[i++] = g_steal_pointer(&dsemts_nonvolatile);
> +    (*cdat_table)[0] = g_steal_pointer(&dsmas_nonvolatile);
> +    (*cdat_table)[1] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile1);
> +    (*cdat_table)[2] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile2);
> +    (*cdat_table)[3] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile3);
> +    (*cdat_table)[4] = (CDATSubHeader *)g_steal_pointer(&dslbis_nonvolatile4);
> +    (*cdat_table)[5] = g_steal_pointer(&dsemts_nonvolatile);
Moving to simple indexing makes sense now they are all in one place (making
introducing a bug much less likely!)

I've introduced an enum so that we have an automatic agreement between
number of elements and these assignments.

>  
>      return CT3_CDAT_SUBTABLE_SIZE;
>  }


