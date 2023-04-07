Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99856DB4A2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 22:01:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pksGH-0005Kt-M0; Fri, 07 Apr 2023 16:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksG1-0005G7-CS
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pksFz-00049v-T8
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 16:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680897623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2/5INaA05F44KaDlbzl8O2ITzlHFw0INjYt+rltqpU=;
 b=Cnb6nrNqEn0m9KOdX8y9G41082KkOW3iQ/duzbe+UswWiqESKTxpueb39iuty2cekbuvwL
 P0QbKkk9eDlCoFW1s1DanrtrLW1xEGUqCYsyTIbYlXP0e8jrTuisYHFN5GToWNp621R7/+
 BouuMVq2Ld0u/iFXHUQPz5u1LOwjkYU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-SE5xQtM2OgOFXBAfVMpBMA-1; Fri, 07 Apr 2023 16:00:18 -0400
X-MC-Unique: SE5xQtM2OgOFXBAfVMpBMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8DE29DD988;
 Fri,  7 Apr 2023 20:00:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6404D40C83B6;
 Fri,  7 Apr 2023 20:00:17 +0000 (UTC)
Date: Fri, 7 Apr 2023 15:00:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, kwolf@redhat.com, 
 qemu-block@nongnu.org, hreitz@redhat.com
Subject: Re: [PATCH 7/8] block-backend: ignore inserted state in
 blk_co_nb_sectors
Message-ID: <zpcsnuz4sy2fxxgqiulny7wsdypm5ajqbofn2iioeven4r32pq@id5wqf5rncnr>
References: <20230407153303.391121-1-pbonzini@redhat.com>
 <20230407153303.391121-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407153303.391121-8-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 07, 2023 at 05:33:02PM +0200, Paolo Bonzini wrote:
> All callers of blk_co_nb_sectors (and blk_nb_sectors) are able to
> handle a non-inserted CD-ROM as a zero-length file, they do not need
> to raise an error.
> 
> Not using blk_co_is_available() aligns the function with
> blk_co_get_geometry(), which becomes a simple wrapper for
> blk_co_nb_sectors().  It will also make it possible to skip the creation
> of a coroutine in the (common) case where bs->bl.has_variable_length
> is false.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


