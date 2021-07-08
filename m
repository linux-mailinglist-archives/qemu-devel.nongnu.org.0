Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A23C199F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:10:24 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZPj-0002CB-6I
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZJu-0006A1-G0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZJr-00039M-MI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625771058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzJC1A+XWv+rWRwf9BkA0rMXMt8uPbNdzX3b6nTc7XI=;
 b=iQ1BZpkS2s5tRWesbxoo2gNAaeFXwiB5klr4gEymI4tBBYuehXv2U1hSn8TIJ9ObUMkcb+
 Dc7WR3koNu7cXF1kMJR1eWVVBHFuls+Vuu2WkA/DFBTX5kLXpy1msDxC14VaG45JJoKxlo
 Li8KUW2z64YVxNvyDN7ekUYf1e3H7zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-0ZKsgAO0MCaAA1qX6Se6Iw-1; Thu, 08 Jul 2021 15:04:17 -0400
X-MC-Unique: 0ZKsgAO0MCaAA1qX6Se6Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E91C81CCF7
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 19:04:01 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73D7478322;
 Thu,  8 Jul 2021 19:03:46 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:03:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 13/18] crypto: introduce build system for gnutls crypto
 backend
Message-ID: <20210708190344.3gbbkg4bn2z74noo@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-14-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-14-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:19AM +0100, Daniel P. Berrangé wrote:
> This introduces the build logic needed to decide whether we can
> use gnutls as a crypto driver backend. The actual implementations
> will be introduced in following patches. We only wish to use
> gnutls if it has version 3.6.14 or newer, because that is what
> finally brings HW accelerated AES-XTS mode for x86_64.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)

Again, take this with a grain of salt, since my meson skills are near
zero.  But the comments do a good job, and it looks sane.

> diff --git a/meson.build b/meson.build
> index 51b8f4ab75..6031f4f0b1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -811,11 +811,34 @@ if 'CONFIG_OPENGL' in config_host
>  endif
>  
>  gnutls = not_found
> +gnutls_crypto = not_found
>  if not get_option('gnutls').auto() or have_system
> -  gnutls = dependency('gnutls', version: '>=3.5.18',
> -                      method: 'pkg-config',
> -                      required: get_option('gnutls'),
> -                      kwargs: static_kwargs)
> +  # For general TLS support our min gnutls matches
> +  # that implied by our platform support matrix
> +  #
> +  # For the crypto backends, we look for a newer
> +  # gnutls:
> +  #
> +  #   Version 3.6.8  is needed to get XTS
> +  #   Version 3.6.13 is needed to get PBKDF
> +  #   Version 3.6.14 is needed to get HW accelerated XTS
> +  #
> +  # If newer enough gnutls isn't available, we can
> +  # still use a different crypto backend to satisfy
> +  # the platform support requirements
> +  gnutls_crypto = dependency('gnutls', version: '>=3.6.14',
> +                             method: 'pkg-config',
> +                             required: get_option('gnutls'),
> +                             kwargs: static_kwargs)
> +  if gnutls_crypto.found()
> +    gnutls = gnutls_crypto
> +  else
> +    # Our min version if all we need is TLS
> +    gnutls = dependency('gnutls', version: '>=3.5.18',
> +			method: 'pkg-config',
> +			required: get_option('gnutls'),
> +			kwargs: static_kwargs)

TAB damage.

With that fixed,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


