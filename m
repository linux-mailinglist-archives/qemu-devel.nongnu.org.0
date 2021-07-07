Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AF33BE6DE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:06:11 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Na-00051N-PJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m15M4-0003CH-GP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m15M2-0003aA-OC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625655873;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybIdDlfMuZqTFsDh1dZHPOSaejuYX/IaRKfb2s+rvxE=;
 b=UftGXY6WzRV5QJveYGd3G7UFU6kw0A+bnFSfSgTdcKXj9qkfYpb+wOwLn7uBM2nFRbPeHD
 3pPmVIcj/mVcYOCAU0XuJdjq+akJczhPKbXDZckXCRL4oTvUtNCQN2gFegETH6flAd3MlY
 OFnlLUjaRGVxoj43/9YK4NNxfrxHKqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-SKcb_vQbM1S6sft6qY067A-1; Wed, 07 Jul 2021 07:04:28 -0400
X-MC-Unique: SKcb_vQbM1S6sft6qY067A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A4E362F8;
 Wed,  7 Jul 2021 11:04:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE96D60843;
 Wed,  7 Jul 2021 11:04:26 +0000 (UTC)
Date: Wed, 7 Jul 2021 12:04:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] osdep: fix HAVE_BROKEN_SIZE_MAX case
Message-ID: <YOWKN9Ypd2xFiNcF@redhat.com>
References: <20210707105600.342309-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707105600.342309-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Frederic Bezies <fredbezies@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 12:56:00PM +0200, Paolo Bonzini wrote:
> While config-host.mak entries are expanded to "1" for compatibility with
> create-config.sh, tests done directly in meson.build expand to the empty
> string and cannot be placed to the right of the && operator.  Adjust
> osdep.h after commit e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX
> to meson", 2021-07-06) changed the way HAVE_BROKEN_SIZE_MAX is defined.
> 
> Reported-by: Frederic Bezies <fredbezies@gmail.com>
> Fixes: e46bd55d9c ("configure: convert HAVE_BROKEN_SIZE_MAX to meson", 2021-07-06)
> Resolves: #463

FWIW, although gitlab allows these short references, it is generally
not desirable to use it.

When browsing commits in a fork, the hyperlink for '#463' will attempt
to be resolved against the fork's issue tracker, not the main repo.
It won't exist in the fork and thus won't get linked.

Thus it preferrable to include at least the project path too:

 Resolves: qemu-project/qemu#463

or simply the URL to the issue:

 Resolves: https://gitlab.com/qemu-project/qemu/-/issues/463

Personally I like the latter, since you can then click the issue
URL when browsing commits in your shell terminal.

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index c91a78b5e6..60718fc342 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -256,7 +256,7 @@ extern "C" {
>  /* Mac OSX has a <stdint.h> bug that incorrectly defines SIZE_MAX with
>   * the wrong type. Our replacement isn't usable in preprocessor
>   * expressions, but it is sufficient for our needs. */
> -#if defined(HAVE_BROKEN_SIZE_MAX) && HAVE_BROKEN_SIZE_MAX
> +#ifdef HAVE_BROKEN_SIZE_MAX
>  #undef SIZE_MAX
>  #define SIZE_MAX ((size_t)-1)
>  #endif
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


