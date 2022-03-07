Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231D4CFBF9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:54:30 +0100 (CET)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB0X-0002Zw-GE
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRAIU-00042J-65
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRAIS-0003gc-K9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WXLqovaGx6aS87XzOFEHExK2B/CPs+8Sjbj/XMZvyY=;
 b=hXKOa6dgugPHz05N0vcTfTnEaOjbuFEZ5XrHjyM3jZfUgQVU2BwB9FjVsqSjx7ry36feTI
 4piYEmsam4YS8n/hXRKnBZ7hW0zq0dBlh1WQwQVzCve3VpXW/u2XXJWqbvRKpTbhKj1R6P
 O+SrA2IzhEWoGxjKPKA+0LGlc6r/gjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-v7-yYoxNMtOCH4IjLptiTw-1; Mon, 07 Mar 2022 05:08:54 -0500
X-MC-Unique: v7-yYoxNMtOCH4IjLptiTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04AAC1006AAC
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 10:08:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CC3D77D52;
 Mon,  7 Mar 2022 10:08:05 +0000 (UTC)
Date: Mon, 7 Mar 2022 10:08:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 07/18] migration: fix use of TLS PSK credentials with a
 UNIX socket
Message-ID: <YiXZg3AfrK8kEM3r@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-8-berrange@redhat.com>
 <YiWvhXEZrC/p4/2j@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YiWvhXEZrC/p4/2j@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 03:08:53PM +0800, Peter Xu wrote:
> On Wed, Mar 02, 2022 at 05:49:21PM +0000, Daniel P. Berrangé wrote:
> > The migration TLS code has a check mandating that a hostname be
> > available when starting a TLS session. This is expected when using
> > x509 credentials, but is bogus for PSK and anonymous credentials
> > as neither involve hostname validation.
> > 
> > The TLS crdentials object gained suitable error reporting in the
> > case of TLS with x509 credentials, so there is no longer any need
> > for the migration code to do its own (incorrect) validation.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Do we need a Fixes tag for this?

It is fuzzy as we never really intended for UNIX sockets to use TLS
originally.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


