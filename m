Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746C4CE01F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:13:27 +0100 (CET)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGAw-0002Ai-8z
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQG9p-0001VH-6R
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nQG9n-0006vv-PT
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646431935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kj5Ka98u0yVRzNjiqe2NMpE9D1pkvAPPSG8LfB4jsBM=;
 b=ZWahlota7/RNFy70Dw31j706SQcOkl6jLHnh+fLjKCKDEROZDgxz6UcMVGRAowanH+FbTo
 LmFb5Rt3wd5XUBvzgJ+XISrSH99/S8qlAOe7D54qEeDEAkR2jfGjQi8Npd8oWNn9yGlRux
 YnkrN3oKkcGKAW3/x5vMFGcTCkpmsTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-4Nwp-GYvN1mrmMPNuE01aA-1; Fri, 04 Mar 2022 17:12:14 -0500
X-MC-Unique: 4Nwp-GYvN1mrmMPNuE01aA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A5A824FA9;
 Fri,  4 Mar 2022 22:12:13 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B83535DB8F;
 Fri,  4 Mar 2022 22:11:36 +0000 (UTC)
Date: Fri, 4 Mar 2022 16:11:34 -0600
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2 8/8] softmmu: remove is_daemonized() method
Message-ID: <20220304221134.femukcdzzz3darsn@redhat.com>
References: <20220304185620.3272401-1-berrange@redhat.com>
 <20220304185620.3272401-9-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304185620.3272401-9-berrange@redhat.com>
User-Agent: NeoMutt/20211029-383-c6e293
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 06:56:20PM +0000, Daniel P. Berrangé wrote:
> There are no longer any users of this method, so it can be removed to
> prevent future accidental (mis)use.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  include/sysemu/os-posix.h | 2 --
>  include/sysemu/os-win32.h | 5 -----
>  os-posix.c                | 5 -----
>  stubs/is-daemonized.c     | 9 ---------
>  stubs/meson.build         | 1 -
>  5 files changed, 22 deletions(-)
>  delete mode 100644 stubs/is-daemonized.c

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


