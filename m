Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E41C2E9F44
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 22:04:21 +0100 (CET)
Received: from localhost ([::1]:47556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwX1X-0007qL-MW
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 16:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwX00-0007E9-4e
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:02:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwWzx-0001mK-Pq
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 16:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609794159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cUhqcZRaKS5xAe18Wf8RiP2+ByBuYXY63XBxRUmEAms=;
 b=UGfS0B2UZbVuc/5O8QYqxVb05zfOQtd7wmoDdBDQxDONqOwqHxgS+nrqH24Eha/QtrF88h
 PCso/aVxf+GukLdNPPVk2pB/DHefsv6v6lNdNaoaiBKYOcGHdqvvqugqwCllYCLPJuIbTJ
 gI6MNoYVjvpu9YdCFmXQP1kuNdYIhDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-3bmf34cYOqiu2QwdUOCdfg-1; Mon, 04 Jan 2021 16:02:36 -0500
X-MC-Unique: 3bmf34cYOqiu2QwdUOCdfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C53180A093;
 Mon,  4 Jan 2021 21:02:34 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D197860CCE;
 Mon,  4 Jan 2021 21:02:27 +0000 (UTC)
Date: Mon, 4 Jan 2021 16:02:26 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/3] nvdimm: read-only file support
Message-ID: <20210104210226.GI18467@habkost.net>
References: <20210104171320.575838-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210104171320.575838-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, eric.g.ernst@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is anybody already going to merge this?  If not, I can merge it.

On Mon, Jan 04, 2021 at 05:13:17PM +0000, Stefan Hajnoczi wrote:
> v3:
>  * Produce an error when -device nvdimm,unarmed=off is used with -object
>    memory-backend-file,readonly=on instead of silently switching on
>    unarmed. [Igor]
>  * Use Object *obj instead of Object *o [Igor]
>  * Do not dereference MEMORY_BACKEND_FILE(o)->readonly directly, use a
>    local variable to hold the HostMemoryBackendFile pointer. [Igor]
> v2:
>  * s/the the/the/ in documentation [Philippe]
>  * Assign nvdimm->unarmed earlier [Philippe]
> 
> There is currently no way to back an NVDIMM with a read-only file so it can be
> safely shared between untrusted guests.
> 
> Introduce an -object memory-backend-file,readonly=on|off option.
> 
> Julio Montes sent an earlier patch here:
> https://patchew.org/QEMU/20190708211936.8037-1-julio.montes@intel.com/
> 
> Eric Ernst requested this feature again for Kata Containers so I gave it a try.
> 
> Stefan Hajnoczi (3):
>   memory: add readonly support to memory_region_init_ram_from_file()
>   hostmem-file: add readonly=on|off option
>   nvdimm: check -object memory-backend-file,readonly=on option
> 
>  docs/nvdimm.txt           | 24 +++++++++++++++++-------
>  include/exec/memory.h     |  2 ++
>  include/exec/ram_addr.h   |  5 +++--
>  include/qemu/mmap-alloc.h |  2 ++
>  backends/hostmem-file.c   | 28 +++++++++++++++++++++++++++-
>  hw/mem/nvdimm.c           |  9 +++++++++
>  softmmu/memory.c          |  7 +++++--
>  softmmu/physmem.c         | 18 +++++++++++-------
>  util/mmap-alloc.c         | 10 ++++++----
>  util/oslib-posix.c        |  2 +-
>  qemu-options.hx           |  5 ++++-
>  11 files changed, 87 insertions(+), 25 deletions(-)
> 
> -- 
> 2.29.2
> 

-- 
Eduardo


