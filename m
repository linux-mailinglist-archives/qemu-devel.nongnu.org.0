Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202234847E0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:31:50 +0100 (CET)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ob6-0000Ux-Qm
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:31:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4oZl-0007qu-M2
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4oZi-000385-HD
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 13:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641321020;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=797Lc0owudeY1p0ygHC/XL6sEgENvJbIiaVsXSiObd4=;
 b=h1lcyncOAAcwiZSun4U0MX6vYC8nr5xrES5x5tLDRbMvTqREhpHbtcQz4nO2VqdkGTe8Nv
 gZ7YzWllrwA7cvkxKJa6VkMjkSGTm0H5WLvQS5956SKyJVQbE8VXjt6J9pdXPwb+cXpy4B
 FKtsokxfAj3ZtzEEzPZhfpc/JTi4WSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-AemAj2OWOzmeCD9FqXNtcQ-1; Tue, 04 Jan 2022 13:30:09 -0500
X-MC-Unique: AemAj2OWOzmeCD9FqXNtcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D29100C662;
 Tue,  4 Jan 2022 18:30:08 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F28437EE84;
 Tue,  4 Jan 2022 18:30:06 +0000 (UTC)
Date: Tue, 4 Jan 2022 18:30:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Henry Kleynhans <henry.kleynhans@gmail.com>
Subject: Re: [PATCH 1/2] [crypto] Load all certificates in X509 CA file
Message-ID: <YdSSLEA2njdoNEZg@redhat.com>
References: <20211222150600.37677-1-henry.kleynhans@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211222150600.37677-1-henry.kleynhans@gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Henry Kleynhans <hkleynhans@fb.com>, qemu-devel@nongnu.org,
 henry.kleynhans@fb.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 03:05:59PM +0000, Henry Kleynhans wrote:
> From: Henry Kleynhans <hkleynhans@fb.com>
> 
> Some CA files may contain multiple intermediaries and roots of trust.
> These may not fit into the hard-coded limit of 16.
> 
> Extend the validation code to allocate enough space to load all of the
> certificates present in the CA file and ensure they are cleaned up.
> 
> Signed-off-by: Henry Kleynhans <hkleynhans@fb.com>
> ---
>  crypto/tlscredsx509.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


