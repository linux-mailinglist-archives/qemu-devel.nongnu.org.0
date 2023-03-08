Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DC6B0357
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 10:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZqNn-0000h0-EP; Wed, 08 Mar 2023 04:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZqNl-0000gq-To
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 04:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pZqNk-0007Ez-G2
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 04:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678268807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUxty9YKFQNpP7yeM8nWFQoZgmLljx2dCjM+E79Cki8=;
 b=PN4wyTCmS0ase/VsD/Bmv8cHbwbO/NpCmLm5M+jIOOcgwNQ1isJr5wBnd+Qt5KfeZc8TgG
 4tRGFmv9GBHFeGDcbe+SLjB4Smrc62Hp6h0clOEVSlQBr2yq9NVOZEH/HnGf0gV2Z6IVua
 YjmZ3TbBoPsMzymiU8HkLSmYTdu3Y8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-qquNYdVIPCulhFh8tgBxfQ-1; Wed, 08 Mar 2023 04:46:44 -0500
X-MC-Unique: qquNYdVIPCulhFh8tgBxfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D21A85A588;
 Wed,  8 Mar 2023 09:46:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C11F40C83B6;
 Wed,  8 Mar 2023 09:46:42 +0000 (UTC)
Date: Wed, 8 Mar 2023 10:46:41 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/3] block: protect BlockBackend->queued_requests with
 a lock
Message-ID: <ZAhZgSwjWklpSfRV@redhat.com>
References: <20230307210427.269214-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307210427.269214-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 07.03.2023 um 22:04 hat Stefan Hajnoczi geschrieben:
> v2:
> - Use qatomic_fetch_inc/dec() for readability in Patch 1 [Hanna]
> 
> QEMU block layer multi-queue support involves running I/O requests from
> multiple threads. Shared state must be protected somehow to avoid thread-safety
> issues.
> 
> The BlockBackend->queued_requests CoQueue is accessed without a lock and will
> likely be corrupted when multiple threads queue requests at the same time.
> 
> This patch series make BlockBackend->queued_requests thread-safe.

Thanks, applied to the block-next branch.

Kevin


