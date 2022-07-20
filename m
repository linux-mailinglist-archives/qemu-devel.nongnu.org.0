Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1B57B776
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:08 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9lD-00066K-AI
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oE9Zh-0002TU-AX
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:17:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:33914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1oE9Zf-0007hE-OB
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 09:17:13 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-98hfxF-UNRyDeHpvOMaPNA-1; Wed, 20 Jul 2022 09:16:52 -0400
X-MC-Unique: 98hfxF-UNRyDeHpvOMaPNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9882811E87;
 Wed, 20 Jul 2022 13:16:51 +0000 (UTC)
Received: from bahia (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 942BE18EA8;
 Wed, 20 Jul 2022 13:16:50 +0000 (UTC)
Date: Wed, 20 Jul 2022 15:16:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Subject: Re: [PATCH v2 1/1] hw/ppc: check if spapr_drc_index() returns NULL
 in spapr_nvdimm.c
Message-ID: <20220720151649.203abd3d@bahia>
In-Reply-To: <20220409200856.283076-2-danielhb413@gmail.com>
References: <20220409200856.283076-1-danielhb413@gmail.com>
 <20220409200856.283076-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Sat,  9 Apr 2022 17:08:56 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
> DRC object returned by spapr_drc_index() without checking it for NULL.
> In this case we would be dereferencing a NULL pointer when doing
> SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).
> 
> This can happen if, during a scm_flush(), the DRC object is wrongly
> freed/released (e.g. a bug in another part of the code).
> spapr_drc_index() would then return NULL in the callbacks.
> 
> Fixes: Coverity CID 1487108, 1487178
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index c4c97da5de..04a64cada3 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -447,9 +447,15 @@ static int flush_worker_cb(void *opaque)
>  {
>      SpaprNVDIMMDeviceFlushState *state = opaque;
>      SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
> -    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
> -    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
> -    int backend_fd = memory_region_get_fd(&backend->mr);
> +    PCDIMMDevice *dimm;
> +    HostMemoryBackend *backend;
> +    int backend_fd;
> +
> +    g_assert(drc != NULL);
> +
> +    dimm = PC_DIMM(drc->dev);
> +    backend = MEMORY_BACKEND(dimm->hostmem);
> +    backend_fd = memory_region_get_fd(&backend->mr);
>  
>      if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
>          MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
> @@ -475,7 +481,11 @@ static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
>  {
>      SpaprNVDIMMDeviceFlushState *state = opaque;
>      SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
> -    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
> +    SpaprNVDIMMDevice *s_nvdimm;
> +
> +    g_assert(drc != NULL);
> +
> +    s_nvdimm = SPAPR_NVDIMM(drc->dev);
>  
>      state->hcall_ret = hcall_ret;
>      QLIST_REMOVE(state, node);


