Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163203B73D1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:07:35 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEOh-0005Vc-TM
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lyEN9-0004me-Ll
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lyEN1-0002wc-Jz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624975545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yyKBzY1u+7WoBXz7puZkI5+VVBewthF9rgnrId1DYHM=;
 b=guPrIT7yyxhjYFLDtBLUkPd+kBZhxwYErQXlVCEWOjQptAh2akniKkI6uP9iEvlZ3J3xhC
 5SCOtV5j2qnjq+XkidwsDues6ygSLuJkx3lJ7PeEVa83gQg09zA/A1Gvk/dnoJqWatFVxk
 VdQNAKt4s8xAWJNurmaoohMV/oyFDiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-ViyrT8y3MI-djbwR-WCzTA-1; Tue, 29 Jun 2021 10:05:43 -0400
X-MC-Unique: ViyrT8y3MI-djbwR-WCzTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01721018725;
 Tue, 29 Jun 2021 14:05:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D02560C13;
 Tue, 29 Jun 2021 14:05:35 +0000 (UTC)
Date: Tue, 29 Jun 2021 16:05:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] nvdimm: release the correct device list
Message-ID: <20210629160534.208b56ad@redhat.com>
In-Reply-To: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
References: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, xiaoguangrong.eric@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 19:04:15 +0800
Li Zhijian <lizhijian@cn.fujitsu.com> wrote:

> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/nvdimm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e3d5fe19392..ff317263e85 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -355,10 +355,10 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
>  
>  static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>  {
> -    GSList *device_list = nvdimm_get_device_list();
> +    GSList *device_list, *list = nvdimm_get_device_list();
>      GArray *structures = g_array_new(false, true /* clear */, 1);
>  
> -    for (; device_list; device_list = device_list->next) {
> +    for (device_list = list; device_list; device_list = device_list->next) {
>          DeviceState *dev = device_list->data;
>  
>          /* build System Physical Address Range Structure. */
> @@ -373,7 +373,7 @@ static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>          /* build NVDIMM Control Region Structure. */
>          nvdimm_build_structure_dcr(structures, dev);
>      }
> -    g_slist_free(device_list);
> +    g_slist_free(list);
>  
>      if (state->persistence) {
>          nvdimm_build_structure_caps(structures, state->persistence);
> @@ -1339,9 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>  
>  void nvdimm_build_srat(GArray *table_data)
>  {
> -    GSList *device_list = nvdimm_get_device_list();
> +    GSList *device_list, *list = nvdimm_get_device_list();
>  
> -    for (; device_list; device_list = device_list->next) {
> +    for (device_list = list; device_list; device_list = device_list->next) {
>          AcpiSratMemoryAffinity *numamem = NULL;
>          DeviceState *dev = device_list->data;
>          Object *obj = OBJECT(dev);
> @@ -1356,7 +1356,7 @@ void nvdimm_build_srat(GArray *table_data)
>          build_srat_memory(numamem, addr, size, node,
>                            MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
>      }
> -    g_slist_free(device_list);
> +    g_slist_free(list);
>  }
>  
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,


