Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B051D6A69ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXIvr-00063U-8N; Wed, 01 Mar 2023 04:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIvp-00063F-S8
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXIvo-0000Wd-3A
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677663567;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAQb4cILV97yIa/zVeSXNJwKFFPU8RWnqAqvtTrWpQs=;
 b=L0P6dLr4541itu/QhGi+H1kY3oKGJz4V5RYy/Q/0Bb9A1W/L+l5CgRG1HxA1rj5iC1w/0L
 jv69mhKI8DdASuvwAzxjdu+ovmiwRKaGxkosFVZra9QY4CLQUMeX5aMi6RX//WK4dv+a/k
 CsiQ3iN6mgX6LVAsboLmRHmtx9WvqqA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-7awV1pDmPWCYsBgnw84WPg-1; Wed, 01 Mar 2023 04:39:26 -0500
X-MC-Unique: 7awV1pDmPWCYsBgnw84WPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1C743C10EC1;
 Wed,  1 Mar 2023 09:39:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA5AE2026D4B;
 Wed,  1 Mar 2023 09:39:24 +0000 (UTC)
Date: Wed, 1 Mar 2023 09:39:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 08/12] cryptodev: Use CryptoDevBackendOpInfo for
 operation
Message-ID: <Y/8dSkEdL2vzTtuW@redhat.com>
References: <20230301025124.3605557-1-pizhenwei@bytedance.com>
 <20230301025124.3605557-9-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230301025124.3605557-9-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 10:51:20AM +0800, zhenwei pi wrote:
> Move queue_index, CryptoDevCompletionFunc and opaque into struct
> CryptoDevBackendOpInfo, then cryptodev_backend_crypto_operation()
> needs an argument CryptoDevBackendOpInfo *op_info only. And remove
> VirtIOCryptoReq from cryptodev. It's also possible to hide
> VirtIOCryptoReq into virtio-crypto.c in the next step. (In theory,
> VirtIOCryptoReq is a private structure used by virtio-crypto only)
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev-builtin.c |  9 +++------
>  backends/cryptodev-lkcf.c    |  9 +++------
>  backends/cryptodev.c         | 18 +++++-------------
>  hw/virtio/virtio-crypto.c    |  7 ++++---
>  include/sysemu/cryptodev.h   | 26 ++++++++++----------------
>  5 files changed, 25 insertions(+), 44 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


