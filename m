Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7049B44DB54
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:54:55 +0100 (CET)
Received: from localhost ([::1]:57424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEHm-00070e-44
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlEFk-0004yr-RY
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlEFi-0002P5-6S
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636653164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xk8ulXZ6sER9mCRaB+/kR4JDK6Eowu1q1hnqfABn9EI=;
 b=MfbeEvDmrndg8RKfidpl6MdMWkosBpHOt8wLdk7/UVa6bbkUGhZuwIiXeVhIGph7lUUIfd
 jHZa2M+08Oy/pnBF6g38PHbGnf4wToLECexv8gMjKEWxHmDYIPCo/QZq5mXgPaQZIZqWh5
 FIevZMEqOwv8yw0ADikIM6H3PMdULf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-7hfsbSx_ODiEW7G8r-RBsw-1; Thu, 11 Nov 2021 12:52:43 -0500
X-MC-Unique: 7hfsbSx_ODiEW7G8r-RBsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF73D100F942;
 Thu, 11 Nov 2021 17:52:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BA64180;
 Thu, 11 Nov 2021 17:52:31 +0000 (UTC)
Date: Thu, 11 Nov 2021 18:52:30 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Message-ID: <YY1YXrCPgt+Fcb2+@redhat.com>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-2-rvkagan@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20211111153354.18807-2-rvkagan@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2021 um 16:33 hat Roman Kagan geschrieben:
> vhost-user-blk realize only attempts to reconnect if the previous
> connection attempt failed on "a problem with the connection and not an
> error related to the content (which would fail again the same way in the
> next attempt)".
> 
> However this distinction is very subtle, and may be inadvertently broken
> if the code changes somewhere deep down the stack and a new error gets
> propagated up to here.
> 
> OTOH now that the number of reconnection attempts is limited it seems
> harmless to try reconnecting on any error.
> 
> So relax the condition of whether to retry connecting to check for any
> error.
> 
> This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
> during realize".
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

It results in less than perfect error messages. With a modified export
that just crashes qemu-storage-daemon during get_features, I get:

qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to read msg header. Read 0 instead of 12. Original request 1.
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: vhost_backend_init failed: Protocol error
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Reconnecting after error: Failed to connect to '/tmp/vsock': Connection refused
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=c: Failed to connect to '/tmp/vsock': Connection refused

I guess this might be tolerable. On the other hand, the patch doesn't
really fix anything either, but just gets rid of possible subtleties.

Kevin


