Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC348D8A0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 14:16:55 +0100 (CET)
Received: from localhost ([::1]:36262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7zyI-0007wN-MZ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 08:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7ztF-0005Y5-73
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:11:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7ztC-0001Fm-3R
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 08:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642079493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59+r5Ft7mZBJbxq/w1iODCzCVOcgPLq58CtVg7zQfW4=;
 b=i9EoMzOhJwdr3ir5rjdQ+IjU21+Rg96FcRF25NG9ABjYMv2sqkoF1HcUU3FyskzTHy0KYu
 Bx7qQXk+POCmWrKooJoZx0ub6soGYD0cBK78kWQEa+jx8KR2XzZXg9UPQQQgroiIkqNQWw
 U9T4o8dD7RqggZHFuxZODXchRua6Bko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-XblXsP4wMEimwnHLwJen5g-1; Thu, 13 Jan 2022 08:11:31 -0500
X-MC-Unique: XblXsP4wMEimwnHLwJen5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3088336393
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 13:11:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB68C1059A59;
 Thu, 13 Jan 2022 13:11:01 +0000 (UTC)
Date: Thu, 13 Jan 2022 13:10:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v7 4/5] migration: Add migrate_use_tls() helper
Message-ID: <YeAk48s3ckQrd1F0@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-5-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106221341.8779-5-leobras@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 07:13:41PM -0300, Leonardo Bras wrote:
> A lot of places check parameters.tls_creds in order to evaluate if TLS is
> in use, and sometimes call migrate_get_current() just for that test.
> 
> Add new helper function migrate_use_tls() in order to simplify testing
> for TLS usage.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.h | 1 +
>  migration/channel.c   | 6 +++---
>  migration/migration.c | 9 +++++++++
>  migration/multifd.c   | 5 +----
>  4 files changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


