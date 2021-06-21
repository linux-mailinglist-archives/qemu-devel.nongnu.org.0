Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9F3AE4AD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:21:46 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFBf-0002gY-AL
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFAY-0001sD-NQ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:20:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lvFAW-000247-Uo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624263631;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juvxDUmJ1/b5xSFnPTCEfqyxkT9al9BWhWMi3cAI+vo=;
 b=Jlw9DVLSFP2qYg8sv7ZG9Dkw8tjK5VhHffIswcU4yh5K8uIdizW1Dw3he91/JYmuJIDhFw
 xU9VeHglHzthzRDVPxkoiJ8+ePZnfAt2wKgDU9o+2IDl618P/PUpy4QEHrWhwY+hIWGzzn
 NSDikckcVskvG4UqJXob7qaI/371Wss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-sAhwxjHeOF2ABEI_eRZQUQ-1; Mon, 21 Jun 2021 04:20:25 -0400
X-MC-Unique: sAhwxjHeOF2ABEI_eRZQUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 630A01084F57;
 Mon, 21 Jun 2021 08:20:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BBF85D703;
 Mon, 21 Jun 2021 08:20:23 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:20:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH 2/2] tests/migration: fix "downtime_limit" type when
 "migrate-set-parameters"
Message-ID: <YNBLxGpQ/V8OeT5n@redhat.com>
References: <584578c0a0dd781cee45f72ddf517f6e6a41c504.1622729934.git.huangy81@chinatelecom.cn>
 <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <31d82df24cc0c468dbe4d2d86730158ebf248071.1622729934.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 10:20:37PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> migrate-set-parameters parse "downtime_limit" as integer type when
> execute "migrate-set-parameters" before migration, and, the unit
> dowtime_limit is milliseconds, fix this two so that test can go
> smoothly.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  tests/migration/guestperf/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


