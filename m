Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B133089E1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:29:38 +0100 (CET)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ViL-0007GB-7K
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l5VgY-0006hb-Id
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:27:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l5VgT-000362-T4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611934056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UBYyUFLyFDeH7BiXzQ2qnK0qdB7nOPMc4rPUunvPq4=;
 b=QGIGp+N6DD0gS1Qe/W1LGe9JeSocLkWQGxPnBaoLMcJDtALuSgGJoQ6UOMRPcVo/MkSVPt
 EymIkjWseYh69jFduqvMzanJHG3zanqpsT4/u1Rqkx70jEcp9WwXZQJbGri0q7Wb1ttfNu
 xot0L6meseO53PmJVdFRA5UQ5ZvN7iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-1OtPJKqkPKmFZdeLfM7w0Q-1; Fri, 29 Jan 2021 10:27:34 -0500
X-MC-Unique: 1OtPJKqkPKmFZdeLfM7w0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF3C8107ACFE;
 Fri, 29 Jan 2021 15:27:32 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 661F710027A5;
 Fri, 29 Jan 2021 15:27:22 +0000 (UTC)
Date: Fri, 29 Jan 2021 16:27:19 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Yuval Shaia <yuval.shaia.ml@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH RFC] pvrdma: wean code off pvrdma_ring.h kernel header
Message-ID: <20210129162719.7438dea2.cohuck@redhat.com>
In-Reply-To: <20210122180029.575284-1-cohuck@redhat.com>
References: <20210122180029.575284-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 19:00:29 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> The pvrdma code relies on the pvrdma_ring.h kernel header for some
> basic ring buffer handling. The content of that header isn't very
> exciting, but contains some (q)atomic_*() invocations that (a)
> cause manual massaging when doing a headers update, and (b) are
> an indication that we probably should not be importing that header
> at all.
> 
> Let's reimplement the ring buffer handling directly in the pvrdma
> code instead. This arguably also improves readability of the code.
> 
> Importing the header can now be dropped.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Compile-tested only, needs both testing and more eyeballs :)

Friendly ping :)

Suggestions for a test setup to do some sanity checks (that does not
require special hardware) also welcome.

> 
> ---
>  hw/rdma/vmw/pvrdma.h                          |   5 +-
>  hw/rdma/vmw/pvrdma_cmd.c                      |   6 +-
>  hw/rdma/vmw/pvrdma_dev_ring.c                 |  41 ++++---
>  hw/rdma/vmw/pvrdma_dev_ring.h                 |   9 +-
>  hw/rdma/vmw/pvrdma_main.c                     |   4 +-
>  .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    | 114 ------------------
>  scripts/update-linux-headers.sh               |   3 +-
>  7 files changed, 38 insertions(+), 144 deletions(-)
>  delete mode 100644 include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> 
> diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
> index 1d36a76f1e3b..d08965d3e2d5 100644
> --- a/hw/rdma/vmw/pvrdma.h
> +++ b/hw/rdma/vmw/pvrdma.h
> @@ -26,7 +26,6 @@
>  #include "../rdma_backend_defs.h"
>  #include "../rdma_rm_defs.h"
>  
> -#include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h"
>  #include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h"
>  #include "pvrdma_dev_ring.h"
>  #include "qom/object.h"
> @@ -64,10 +63,10 @@ typedef struct DSRInfo {
>      union pvrdma_cmd_req *req;
>      union pvrdma_cmd_resp *rsp;
>  
> -    struct pvrdma_ring *async_ring_state;
> +    PvrdmaRingState *async_ring_state;
>      PvrdmaRing async;
>  
> -    struct pvrdma_ring *cq_ring_state;
> +    PvrdmaRingState *cq_ring_state;
>      PvrdmaRing cq;
>  } DSRInfo;
>  
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index 692125ac2681..f59879e2574e 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -262,7 +262,7 @@ static int create_cq_ring(PCIDevice *pci_dev , PvrdmaRing **ring,
>      r = g_malloc(sizeof(*r));
>      *ring = r;
>  
> -    r->ring_state = (struct pvrdma_ring *)
> +    r->ring_state = (PvrdmaRingState *)
>          rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>  
>      if (!r->ring_state) {
> @@ -398,7 +398,7 @@ static int create_qp_rings(PCIDevice *pci_dev, uint64_t pdir_dma,
>      *rings = sr;
>  
>      /* Create send ring */
> -    sr->ring_state = (struct pvrdma_ring *)
> +    sr->ring_state = (PvrdmaRingState *)
>          rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>      if (!sr->ring_state) {
>          rdma_error_report("Failed to map to QP ring state");
> @@ -639,7 +639,7 @@ static int create_srq_ring(PCIDevice *pci_dev, PvrdmaRing **ring,
>      r = g_malloc(sizeof(*r));
>      *ring = r;
>  
> -    r->ring_state = (struct pvrdma_ring *)
> +    r->ring_state = (PvrdmaRingState *)
>              rdma_pci_dma_map(pci_dev, tbl[0], TARGET_PAGE_SIZE);
>      if (!r->ring_state) {
>          rdma_error_report("Failed to map tp SRQ ring state");
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.c b/hw/rdma/vmw/pvrdma_dev_ring.c
> index f0bcde74b06a..074ac59b84db 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.c
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.c
> @@ -22,11 +22,10 @@
>  #include "trace.h"
>  
>  #include "../rdma_utils.h"
> -#include "standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h"
>  #include "pvrdma_dev_ring.h"
>  
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
> -                     struct pvrdma_ring *ring_state, uint32_t max_elems,
> +                     PvrdmaRingState *ring_state, uint32_t max_elems,
>                       size_t elem_sz, dma_addr_t *tbl, uint32_t npages)
>  {
>      int i;
> @@ -73,48 +72,54 @@ out:
>  
>  void *pvrdma_ring_next_elem_read(PvrdmaRing *ring)
>  {
> -    int e;
> -    unsigned int idx = 0, offset;
> +    unsigned int idx, offset;
> +    const uint32_t tail = qatomic_read(&ring->ring_state->prod_tail);
> +    const uint32_t head = qatomic_read(&ring->ring_state->cons_head);
>  
> -    e = pvrdma_idx_ring_has_data(ring->ring_state, ring->max_elems, &idx);
> -    if (e <= 0) {
> +    if (tail & ~((ring->max_elems << 1) - 1) ||
> +        head & ~((ring->max_elems << 1) - 1) ||
> +        tail == head) {
>          trace_pvrdma_ring_next_elem_read_no_data(ring->name);
>          return NULL;
>      }
>  
> +    idx = head & (ring->max_elems - 1);
>      offset = idx * ring->elem_sz;
>      return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
>  }
>  
>  void pvrdma_ring_read_inc(PvrdmaRing *ring)
>  {
> -    pvrdma_idx_ring_inc(&ring->ring_state->cons_head, ring->max_elems);
> +    uint32_t idx = qatomic_read(&ring->ring_state->cons_head);
> +
> +    idx = (idx + 1) & ((ring->max_elems << 1) - 1);
> +    qatomic_set(&ring->ring_state->cons_head, idx);
>  }
>  
>  void *pvrdma_ring_next_elem_write(PvrdmaRing *ring)
>  {
> -    int idx;
> -    unsigned int offset, tail;
> +    unsigned int idx, offset;
> +    const uint32_t tail = qatomic_read(&ring->ring_state->prod_tail);
> +    const uint32_t head = qatomic_read(&ring->ring_state->cons_head);
>  
> -    idx = pvrdma_idx_ring_has_space(ring->ring_state, ring->max_elems, &tail);
> -    if (idx <= 0) {
> +    if (tail & ~((ring->max_elems << 1) - 1) ||
> +        head & ~((ring->max_elems << 1) - 1) ||
> +        tail == (head ^ ring->max_elems)) {
>          rdma_error_report("CQ is full");
>          return NULL;
>      }
>  
> -    idx = pvrdma_idx(&ring->ring_state->prod_tail, ring->max_elems);
> -    if (idx < 0 || tail != idx) {
> -        rdma_error_report("Invalid idx %d", idx);
> -        return NULL;
> -    }
> -
> +    idx = tail & (ring->max_elems - 1);
>      offset = idx * ring->elem_sz;
>      return ring->pages[offset / TARGET_PAGE_SIZE] + (offset % TARGET_PAGE_SIZE);
>  }
>  
>  void pvrdma_ring_write_inc(PvrdmaRing *ring)
>  {
> -    pvrdma_idx_ring_inc(&ring->ring_state->prod_tail, ring->max_elems);
> +    uint32_t idx = qatomic_read(&ring->ring_state->prod_tail);
> +
> +    idx = (idx + 1) & ((ring->max_elems << 1) - 1);
> +    qatomic_set(&ring->ring_state->prod_tail, idx);
>  }
>  
>  void pvrdma_ring_free(PvrdmaRing *ring)
> diff --git a/hw/rdma/vmw/pvrdma_dev_ring.h b/hw/rdma/vmw/pvrdma_dev_ring.h
> index 5f2a0cf9b9fa..d231588ce004 100644
> --- a/hw/rdma/vmw/pvrdma_dev_ring.h
> +++ b/hw/rdma/vmw/pvrdma_dev_ring.h
> @@ -19,18 +19,23 @@
>  
>  #define MAX_RING_NAME_SZ 32
>  
> +typedef struct PvrdmaRingState {
> +    int prod_tail; /* producer tail */
> +    int cons_head; /* consumer head */
> +} PvrdmaRingState;
> +
>  typedef struct PvrdmaRing {
>      char name[MAX_RING_NAME_SZ];
>      PCIDevice *dev;
>      uint32_t max_elems;
>      size_t elem_sz;
> -    struct pvrdma_ring *ring_state; /* used only for unmap */
> +    PvrdmaRingState *ring_state; /* used only for unmap */
>      int npages;
>      void **pages;
>  } PvrdmaRing;
>  
>  int pvrdma_ring_init(PvrdmaRing *ring, const char *name, PCIDevice *dev,
> -                     struct pvrdma_ring *ring_state, uint32_t max_elems,
> +                     PvrdmaRingState *ring_state, uint32_t max_elems,
>                       size_t elem_sz, dma_addr_t *tbl, uint32_t npages);
>  void *pvrdma_ring_next_elem_read(PvrdmaRing *ring);
>  void pvrdma_ring_read_inc(PvrdmaRing *ring);
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 85935703322f..84ae8024fcfd 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -85,7 +85,7 @@ static void free_dev_ring(PCIDevice *pci_dev, PvrdmaRing *ring,
>      rdma_pci_dma_unmap(pci_dev, ring_state, TARGET_PAGE_SIZE);
>  }
>  
> -static int init_dev_ring(PvrdmaRing *ring, struct pvrdma_ring **ring_state,
> +static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
>                           const char *name, PCIDevice *pci_dev,
>                           dma_addr_t dir_addr, uint32_t num_pages)
>  {
> @@ -114,7 +114,7 @@ static int init_dev_ring(PvrdmaRing *ring, struct pvrdma_ring **ring_state,
>      /* RX ring is the second */
>      (*ring_state)++;
>      rc = pvrdma_ring_init(ring, name, pci_dev,
> -                          (struct pvrdma_ring *)*ring_state,
> +                          (PvrdmaRingState *)*ring_state,
>                            (num_pages - 1) * TARGET_PAGE_SIZE /
>                            sizeof(struct pvrdma_cqne),
>                            sizeof(struct pvrdma_cqne),
> diff --git a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h b/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> deleted file mode 100644
> index 7b4062a1a107..000000000000
> --- a/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -/*
> - * Copyright (c) 2012-2016 VMware, Inc.  All rights reserved.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of EITHER the GNU General Public License
> - * version 2 as published by the Free Software Foundation or the BSD
> - * 2-Clause License. This program is distributed in the hope that it
> - * will be useful, but WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED
> - * WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
> - * See the GNU General Public License version 2 for more details at
> - * http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program available in the file COPYING in the main
> - * directory of this source tree.
> - *
> - * The BSD 2-Clause License
> - *
> - *     Redistribution and use in source and binary forms, with or
> - *     without modification, are permitted provided that the following
> - *     conditions are met:
> - *
> - *      - Redistributions of source code must retain the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer.
> - *
> - *      - Redistributions in binary form must reproduce the above
> - *        copyright notice, this list of conditions and the following
> - *        disclaimer in the documentation and/or other materials
> - *        provided with the distribution.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> - * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> - * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> - * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> - * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
> - * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
> - * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> - * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
> - * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
> - * OF THE POSSIBILITY OF SUCH DAMAGE.
> - */
> -
> -#ifndef __PVRDMA_RING_H__
> -#define __PVRDMA_RING_H__
> -
> -#include "standard-headers/linux/types.h"
> -
> -#define PVRDMA_INVALID_IDX	-1	/* Invalid index. */
> -
> -struct pvrdma_ring {
> -	int prod_tail;	/* Producer tail. */
> -	int cons_head;	/* Consumer head. */
> -};
> -
> -struct pvrdma_ring_state {
> -	struct pvrdma_ring tx;	/* Tx ring. */
> -	struct pvrdma_ring rx;	/* Rx ring. */
> -};
> -
> -static inline int pvrdma_idx_valid(uint32_t idx, uint32_t max_elems)
> -{
> -	/* Generates fewer instructions than a less-than. */
> -	return (idx & ~((max_elems << 1) - 1)) == 0;
> -}
> -
> -static inline int32_t pvrdma_idx(int *var, uint32_t max_elems)
> -{
> -	const unsigned int idx = qatomic_read(var);
> -
> -	if (pvrdma_idx_valid(idx, max_elems))
> -		return idx & (max_elems - 1);
> -	return PVRDMA_INVALID_IDX;
> -}
> -
> -static inline void pvrdma_idx_ring_inc(int *var, uint32_t max_elems)
> -{
> -	uint32_t idx = qatomic_read(var) + 1;	/* Increment. */
> -
> -	idx &= (max_elems << 1) - 1;		/* Modulo size, flip gen. */
> -	qatomic_set(var, idx);
> -}
> -
> -static inline int32_t pvrdma_idx_ring_has_space(const struct pvrdma_ring *r,
> -					      uint32_t max_elems, uint32_t *out_tail)
> -{
> -	const uint32_t tail = qatomic_read(&r->prod_tail);
> -	const uint32_t head = qatomic_read(&r->cons_head);
> -
> -	if (pvrdma_idx_valid(tail, max_elems) &&
> -	    pvrdma_idx_valid(head, max_elems)) {
> -		*out_tail = tail & (max_elems - 1);
> -		return tail != (head ^ max_elems);
> -	}
> -	return PVRDMA_INVALID_IDX;
> -}
> -
> -static inline int32_t pvrdma_idx_ring_has_data(const struct pvrdma_ring *r,
> -					     uint32_t max_elems, uint32_t *out_head)
> -{
> -	const uint32_t tail = qatomic_read(&r->prod_tail);
> -	const uint32_t head = qatomic_read(&r->cons_head);
> -
> -	if (pvrdma_idx_valid(tail, max_elems) &&
> -	    pvrdma_idx_valid(head, max_elems)) {
> -		*out_head = head & (max_elems - 1);
> -		return tail != head;
> -	}
> -	return PVRDMA_INVALID_IDX;
> -}
> -
> -#endif /* __PVRDMA_RING_H__ */
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index fa6f2b6272b7..1050e361694f 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -215,8 +215,7 @@ sed  -e '1h;2,$H;$!d;g'  -e 's/[^};]*pvrdma[^(| ]*([^)]*);//g' \
>      "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h" > \
>      "$tmp_pvrdma_verbs";
>  
> -for i in "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_ring.h" \
> -         "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h" \
> +for i in "$linux/drivers/infiniband/hw/vmw_pvrdma/pvrdma_dev_api.h" \
>           "$tmp_pvrdma_verbs"; do \
>      cp_portable "$i" \
>           "$output/include/standard-headers/drivers/infiniband/hw/vmw_pvrdma/"


