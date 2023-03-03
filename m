Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42836A9817
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY51K-0001zz-VY; Fri, 03 Mar 2023 08:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY51F-0001zJ-Ht
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY51D-00046r-Va
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677848413;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mQ3uwmSD6OwMK7FF2MUpN0Qyrv3A4dXLWx2+9GheU4U=;
 b=TZQEab8Xj4eRA+CXG22GHYck6fHUbCdPXV4a7SwjtROgf27tqVS8x3FIvfo4WmMcK3aGuu
 nk6Q0HEQM+3iu4iEiegnAbhb+/srEdXby/XUYmGjPjHE+iTHnW44kmjBzC3gL66Skeaz39
 zsubh46EVQYA/IVK9vr+SR1kN3FLuNw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-Ej4dHvGpOSe3-ekdo6EYrw-1; Fri, 03 Mar 2023 08:00:11 -0500
X-MC-Unique: Ej4dHvGpOSe3-ekdo6EYrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FF543C0F1A4
 for <qemu-devel@nongnu.org>; Fri,  3 Mar 2023 13:00:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B32EA2166B26;
 Fri,  3 Mar 2023 13:00:10 +0000 (UTC)
Date: Fri, 3 Mar 2023 13:00:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] test: Fix test-crypto-secret when compiling without
 keyring support
Message-ID: <ZAHvWGvHLXp1OLL5@redhat.com>
References: <20230301110058.1255-1-quintela@redhat.com>
 <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <029b545a-e814-5917-0a3f-edc578844dbe@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Mar 03, 2023 at 01:47:40PM +0100, Thomas Huth wrote:
> On 01/03/2023 12.00, Juan Quintela wrote:
> > Linux keyring support is protected by CONFIG_KEYUTILS.
> > Use CONFIG_SECRET_KEYRING.
> > 
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > 
> > ---
> > 
> > Previous version of this patch changed the meson build rules.
> > Daniel told me that the proper fix was to change the #ifdef test.
> > ---
> >   tests/unit/test-crypto-secret.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> This seems to cause failures in the CI:
> 
> https://gitlab.com/thuth/qemu/-/jobs/3870672310#L1443
> https://gitlab.com/thuth/qemu/-/jobs/3870672331#L2353
> 
> ../tests/unit/test-crypto-secret.c:29:10: fatal error: keyutils.h: No such file or directory
>    29 | #include <keyutils.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.

Hmm, so we actually have to test for both #ifdefs then

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


