Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F65332E5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 23:17:59 +0200 (CEST)
Received: from localhost ([::1]:37436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntbug-0002hk-RK
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 17:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntbrt-0008TQ-0Z
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntbrp-0004BC-O5
 for qemu-devel@nongnu.org; Tue, 24 May 2022 17:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653426900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Jm/BvyUMXPHxPjLD+aYoEAk5H64QeB7AqVOFxPiknY=;
 b=W4lJxtzrJ4f3RkhnIS5D4y2mRWlVOKE3S9wkMNOVcl9nZaZBzZT6qD5aycJNqvvbAveb7F
 JD+rzUksqkj8iNb4KKOujFm/aYOLh+8J3G674Qjx31yD/urhEhpemqD8HbGsOrJ0PyK1lH
 0Epdg7hOTMC6nkDUzGMKJqW6Pvzw0T0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-FCYg74ccNI-Zuj6PZH0jmg-1; Tue, 24 May 2022 17:14:57 -0400
X-MC-Unique: FCYg74ccNI-Zuj6PZH0jmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27590858EEE;
 Tue, 24 May 2022 21:14:57 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 331292026D64;
 Tue, 24 May 2022 21:14:56 +0000 (UTC)
Date: Tue, 24 May 2022 16:14:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org,
 qemu-stable@nongnu.org, vsementsov@virtuozzo.com, sgarzare@redhat.com
Subject: Re: [PATCH v3] block/gluster: correctly set max_pdiscard
Message-ID: <20220524211454.i7sq4w3pwhgmpk7q@redhat.com>
References: <20220520075922.43972-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520075922.43972-1-f.ebner@proxmox.com>
User-Agent: NeoMutt/20220429-77-e284d5
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 20, 2022 at 09:59:22AM +0200, Fabian Ebner wrote:
> On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
> results in a negative value, and the following assertion would trigger
> down the line (it's not the same max_pdiscard, but computed from the
> other one):
> qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
> `max_pdiscard >= bs->bl.request_alignment' failed.
> 
> On 32-bit platforms, it's fine to keep using SIZE_MAX.
> 
> The assertion in qemu_gluster_co_pdiscard() is checking that the value
> of 'bytes' can safely be passed to glfs_discard_async(), which takes a
> size_t for the argument in question, so it is kept as is. And since
> max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
> fine.
> 
> Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


