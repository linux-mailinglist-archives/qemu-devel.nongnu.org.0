Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C043D3C2588
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:04:30 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1r7F-0002MX-Q5
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1r6D-0001go-V1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m1r6B-0000wl-5u
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625839402;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJH2Slet6A41VFFUrqILdB8NxSo8j3gAlEhfM9VA6lg=;
 b=NyM7tLc7EcFuz9jm9El/3kdEVWCFRWmmXU9cyGQ0ml7DDw+9yKtZGJ6hf1lS7DBBwMM5lE
 uozFQS/hpfhsBistZ51JAD+YN5TUltTCnYyAl5oGxDMkPoFnSXDAKj2L2SGCMSm73deJab
 RyQ6b1yQ72xVhBFk1Om6UgkJYC2Txi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-D-HthgH1PmCvpev87J5SRw-1; Fri, 09 Jul 2021 10:03:19 -0400
X-MC-Unique: D-HthgH1PmCvpev87J5SRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A93804142
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 14:03:18 +0000 (UTC)
Received: from redhat.com (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6F4860CC9;
 Fri,  9 Jul 2021 14:03:12 +0000 (UTC)
Date: Fri, 9 Jul 2021 15:03:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 16/18] crypto: add gnutls hmac provider
Message-ID: <YOhXHAqlKgYU9Ch2@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-17-berrange@redhat.com>
 <20210708193519.yljm4vovvjup2e6y@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708193519.yljm4vovvjup2e6y@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 02:35:19PM -0500, Eric Blake wrote:
> On Tue, Jul 06, 2021 at 10:59:22AM +0100, Daniel P. Berrangé wrote:
> > This adds support for using gnutls as a provider of the crypto
> > hmac APIs.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  crypto/hmac-gnutls.c | 136 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 136 insertions(+)
> >  create mode 100644 crypto/hmac-gnutls.c
> > 
> > diff --git a/crypto/hmac-gnutls.c b/crypto/hmac-gnutls.c
> > new file mode 100644
> > index 0000000000..ea33b5753b
> > --- /dev/null
> > +++ b/crypto/hmac-gnutls.c
> > @@ -0,0 +1,136 @@
> > +/*
> > + * QEMU Crypto hmac algorithms
> > + *
> > + * Derived from hmac-gcrypt.c:
> > + *
> > + *   Copyright (c) 2016 HUAWEI TECHNOLOGIES CO., LTD.
> 
> Is this line correct?

This is referring to the statement above "Derived from..."


I should have /also/ added a Red Hat copyright before though

> 
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * (at your option) any later version.  See the COPYING file in the
> > + * top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "crypto/hmac.h"
> > +#include "hmacpriv.h"
> > +#include <gnutls/crypto.h>
> 
> Should you favor floating this to be right after "qemu/osdep.h"?

yeah good idea

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


