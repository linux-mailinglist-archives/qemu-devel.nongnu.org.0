Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7A2C3C35
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 10:32:49 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khrAO-0004X5-8e
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 04:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khr8c-0003XU-Uw
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:30:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khr8V-0006Ep-Jy
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 04:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606296648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZ9CfPUZCIkq6jL8KDCahWg9Ht1lNmSU1r5SS/fUy80=;
 b=Vxa6dWieOchRWPKZNeW+NrXwQMx1cGmBY6OlQpG8PzRL6WxPOB3c7IuZ+EzWn+3vmhx8NZ
 AIbBpGY0MQqgFBedSF/kJWmlxPnYfWArnepGsMEkbnK2UCkQwoqrmo2Ta3JeJGzxL4BHYJ
 xP4S2Uy/q+jiUnaNe6xqPqMSK7liuKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-i6cUEz0LNdiD2EXjWi4EwQ-1; Wed, 25 Nov 2020 04:30:44 -0500
X-MC-Unique: i6cUEz0LNdiD2EXjWi4EwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 930E7107ACFA;
 Wed, 25 Nov 2020 09:30:43 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41B3B5C1A1;
 Wed, 25 Nov 2020 09:30:39 +0000 (UTC)
Date: Wed, 25 Nov 2020 09:30:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 1/1] Fix to show vfio migration stat in migration status
Message-ID: <20201125093036.GA3222@work-vm>
References: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.williamson@redhat.com, cjia@nvidia.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kirti Wankhede (kwankhede@nvidia.com) wrote:
> Header file where CONFIG_VFIO is defined is not included in migration.c
> file. Include config devices header file in migration.c.
> 
> Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
> stats")
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>

Given it's got build problems; I suggest actually something cleaner
would be to swing populate_vfio_info into one of the vfio specific
files, add a stubs/ entry somewhere and then migration.c doesn't need
to include the device or header stuff.

Dave

> ---
>  meson.build           | 1 +
>  migration/migration.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 7ddf983ff7f5..24526499cfb5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>  
>  common_all = common_ss.apply(config_all, strict: false)
>  common_all = static_library('common',
> +                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
>                              build_by_default: false,
>                              sources: common_all.sources() + genh,
>                              dependencies: common_all.dependencies(),
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83f4..650efb81daad 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -57,6 +57,7 @@
>  #include "qemu/queue.h"
>  #include "multifd.h"
>  
> +#include CONFIG_DEVICES
>  #ifdef CONFIG_VFIO
>  #include "hw/vfio/vfio-common.h"
>  #endif
> -- 
> 2.7.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


