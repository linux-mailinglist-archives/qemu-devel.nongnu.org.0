Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC483280F4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:34:25 +0100 (CET)
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjcu-0002oO-QL
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGjGk-0003I2-4K; Mon, 01 Mar 2021 09:11:30 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:45502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGjGi-00082v-7N; Mon, 01 Mar 2021 09:11:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 51FFC246659;
 Mon,  1 Mar 2021 15:11:24 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 15:11:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00296d8af2e-fe0a-42b3-8b4c-334a91d6c693,
 479CA1392526D135F52AAC0E93683906E8F354F3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Mar 2021 15:11:22 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/5] spapr.c: assert first DRC LMB earlier in
 spapr_memory_unplug_request()
Message-ID: <20210301151122.6d17d3da@bahia.lan>
In-Reply-To: <20210226163301.419727-2-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: fb5fc366-b46f-4699-90ab-c93fc2a35f40
X-Ovh-Tracer-Id: 17729545833287490016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 13:32:57 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> We are asserting the existence of the first DRC LMB after sending unplug
> requests to all LMBs of the DIMM, where every DRC is being asserted
> inside the loop. This means that the first DRC is being asserted twice.
> 
> We will use the first DRC to simplify the code a bit in the next patch,
> so instead of removing the duplicated assert, let's do it earlier.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6eaddb12cb..74e046b522 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3664,7 +3664,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>      uint32_t nr_lmbs;
>      uint64_t size, addr_start, addr;
>      int i;
> -    SpaprDrc *drc;
> +    SpaprDrc *drc, *drc_start;
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
>          error_setg(errp, "nvdimm device hot unplug is not supported yet.");
> @@ -3677,6 +3677,10 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>      addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
>                                            &error_abort);
>  
> +    drc_start = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
> +                                addr_start / SPAPR_MEMORY_BLOCK_SIZE);
> +    g_assert(drc_start);
> +
>      /*
>       * An existing pending dimm state for this DIMM means that there is an
>       * unplug operation in progress, waiting for the spapr_lmb_release
> @@ -3701,11 +3705,9 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>          addr += SPAPR_MEMORY_BLOCK_SIZE;
>      }
>  
> -    drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
> -                          addr_start / SPAPR_MEMORY_BLOCK_SIZE);
> -    g_assert(drc);
>      spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
> -                                              nr_lmbs, spapr_drc_index(drc));
> +                                              nr_lmbs,
> +                                              spapr_drc_index(drc_start));
>  }
>  
>  /* Callback to be called during DRC release. */


