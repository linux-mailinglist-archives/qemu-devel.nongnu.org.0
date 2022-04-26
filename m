Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE250F36A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:08:24 +0200 (CEST)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGFD-0004Za-K4
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njG8L-0001OE-Ph
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njG8G-000166-7t
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650960071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPYF6DMXqMVM3EQlHZ0xwqfSdr8iMKfmmFcSMWLSJIg=;
 b=K1qMUtLFhYRF1t7LPyskvzNSKeoJnS+oZ4rnfPvfi8tdJI60mSE0jTlMWZYy1LE/ahqRjm
 VukVwenG0OpFvt+rHuxXUHVAoh9KxiFdJWlsuxXcchthK940cvnYod/UJm/eucRWtM+Qdc
 cFhk5wXBapm7P5PJFqWYdPeeK/OOOIo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490--GIR0SYGN66MeBcWvLjXdQ-1; Tue, 26 Apr 2022 04:01:08 -0400
X-MC-Unique: -GIR0SYGN66MeBcWvLjXdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA9EA1C08D2B;
 Tue, 26 Apr 2022 08:01:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A555F4021B7;
 Tue, 26 Apr 2022 08:01:04 +0000 (UTC)
Date: Tue, 26 Apr 2022 09:01:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v9 5/7] multifd: multifd_send_sync_main now returns
 negative on error
Message-ID: <Ymemvr2URRkZcEiM@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-6-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220425215055.611825-6-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 06:50:54PM -0300, Leonardo Bras wrote:
> Even though multifd_send_sync_main() currently emits error_reports, it's
> callers don't really check it before continuing.
> 
> Change multifd_send_sync_main() to return -1 on error and 0 on success.
> Also change all it's callers to make use of this change and possibly fail
> earlier.
> 
> (This change is important to next patch on  multifd zero copy
> implementation, to make it sure an error in zero-copy flush does not go
> unnoticed.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.h |  2 +-
>  migration/multifd.c | 10 ++++++----
>  migration/ram.c     | 29 ++++++++++++++++++++++-------
>  3 files changed, 29 insertions(+), 12 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


