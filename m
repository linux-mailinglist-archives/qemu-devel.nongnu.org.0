Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B327C4CDF9B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 22:10:11 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQFBi-0006UY-IT
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 16:10:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQFAE-0005cX-Ed
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:08:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQFAB-0002Ot-9c
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 16:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646428112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce6cYPnlNGCfXsZWM3WWUy2pfFpe6nQ4NLG4G2np9+o=;
 b=KIxSk/sE/pv9WfNpsvTJjwSOo3YA0lSaMIFAF4EgbaABCxPDsaAlQHHwyue3tBl+jDWZMd
 cTYkN7CmUrYhJsUWWKoAtGydqV5RwtZyhss6AXSyn0yYVrf6Sa4m/DuQ5V9Jv/GEiOEpOA
 QT5JNZZvmdgjuLvX6ticyqAKZ2DPvfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-zZrzTitKMx2ldT9rw1l1ww-1; Fri, 04 Mar 2022 16:08:29 -0500
X-MC-Unique: zZrzTitKMx2ldT9rw1l1ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B9B4180A088;
 Fri,  4 Mar 2022 21:08:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FA345DB84;
 Fri,  4 Mar 2022 21:08:06 +0000 (UTC)
Date: Fri, 4 Mar 2022 15:08:04 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 11/12] tests/qemu-iotests: validate NBD TLS with UNIX
 sockets
Message-ID: <20220304210804.skzj45siodnw4suu@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
 <20220304193610.3293146-12-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304193610.3293146-12-berrange@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 07:36:09PM +0000, Daniel P. Berrangé wrote:
> This validates that connections to an NBD server running on a UNIX
> socket can use TLS, and require a TLS hostname override to pass
> certificate validation.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/233     | 24 ++++++++++++++++++++++++
>  tests/qemu-iotests/233.out | 15 +++++++++++++++
>  2 files changed, 39 insertions(+)

Rebase fail; but thankfully your earlier patch for regen made it an
easy fix:

diff --git i/tests/qemu-iotests/233.out w/tests/qemu-iotests/233.out
index d79a9ed3467c..6e55be779946 100644
--- i/tests/qemu-iotests/233.out
+++ w/tests/qemu-iotests/233.out
@@ -78,6 +78,7 @@ file format: nbd
 virtual size: 64 MiB (67108864 bytes)
 disk size: unavailable
 exports available: 1
+ export: ''
   size:  67108864
   min block: 1

With that squashed in,

Tested-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


