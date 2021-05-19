Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FC2388767
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 08:14:53 +0200 (CEST)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljFTo-0005t2-OG
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 02:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljFSp-0005DZ-1A
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ljFSl-0006xe-Mv
 for qemu-devel@nongnu.org; Wed, 19 May 2021 02:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621404827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0zGwIVGw6Xc38sijwyqjGAATkPO5z9gs2cB8RWbvRhU=;
 b=Vil5hlk1EI4jd3mbeiH0fGN+Rdo7uQujnJt1dLkOUV4pVFsukZRl2HpMbXkH/fEsvh7VZB
 aqJvOIMv4Gf4qJDy68of6rgVXV5EeFMe4ZBynvMyN3Zth40EvRf3a1x49BRxaPK+DoJhBG
 tq0YnRon8b+ONiJeXizOjb9Sjbz67zU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-0eqgJdxsPcud9jFrqZCTKg-1; Wed, 19 May 2021 02:13:45 -0400
X-MC-Unique: 0eqgJdxsPcud9jFrqZCTKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 444786D249;
 Wed, 19 May 2021 06:13:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA6D5C255;
 Wed, 19 May 2021 06:13:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EE9918007A2; Wed, 19 May 2021 08:13:39 +0200 (CEST)
Date: Wed, 19 May 2021 08:13:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v5 03/13] virtio-gpu: Add udmabuf helpers
Message-ID: <20210519061339.dq4yfrc7j42jdj5g@sirius.home.kraxel.org>
References: <20210519001414.786439-1-vivek.kasireddy@intel.com>
 <20210519001414.786439-4-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210519001414.786439-4-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +#ifdef CONFIG_LINUX

> +void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)

> +#else

> +void *virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
> +{
> +    /* nothing (stub) */
> +    return NULL
> +}

Fails to build for !linux ...

You can place the stubs in a file in the stubs/ directory instead.
They'll be used via weak symbol references instead of #ifdefs then.

Advantage: the stubs are compiled unconditionally so errors like this
don't go unnoticed that easily.

take care,
  Gerd


