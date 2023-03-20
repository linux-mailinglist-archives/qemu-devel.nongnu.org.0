Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF686C0FDD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDBe-0002fw-4c; Mon, 20 Mar 2023 06:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peDBc-0002fN-7q
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peDBa-00052j-Lf
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679309778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VBAAZznd0DUWx2xXEdpqwH01OtfEaV1B5K6T5rtqaa8=;
 b=IaBEavFuHpyKePHQKKjXYocU3aPVSeiOIqT3LKkcOStktECpeoq9GAFfMzbl91rk2vRvtN
 QUNBkOeblfuzvB+KhglKuqDhGH8W4XiU0LeU/s8fW/TvN64F4AjUr5wATu5596CMIV01M8
 jjgB8d7iUYrXQo+1fZ7l04VAVlSdK0k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-jjj95ZrgPgu31W4YSY956Q-1; Mon, 20 Mar 2023 06:56:14 -0400
X-MC-Unique: jjj95ZrgPgu31W4YSY956Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48D6D2A59569;
 Mon, 20 Mar 2023 10:56:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E52DB492C14;
 Mon, 20 Mar 2023 10:56:12 +0000 (UTC)
Date: Mon, 20 Mar 2023 10:56:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Maksim Davydov <davydov-max@yandex-team.ru>
Subject: Re: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
Message-ID: <ZBg7ylBOK44/XUzM@redhat.com>
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
 <20230111080101.969151-4-marcandre.lureau@redhat.com>
 <70b83c92-c11d-0715-97e1-b2dd6f6dfffd@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70b83c92-c11d-0715-97e1-b2dd6f6dfffd@yandex-team.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Fri, Mar 17, 2023 at 10:36:37PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
> 
> By my investigation, this commit (bd4c0ef409140bd1be393407c04005ac077d4574) breaks long qmp output again.

> 
> ./test.py 1000 /tmp/sock
> 
>   - works, but if use default behavior (socketpair) we get:
> 
> $ ./test.py 1000
> Traceback (most recent call last):

snip

>   File "/usr/lib/python3.10/asyncio/streams.py", line 534, in readline
> ValueError: Separator is not found, and chunk exceed the limit

After going off in the weeds I realized this message is the key bit. We
failed to pass the raised recv limit to asyncio when using a pre-opened
socket. Since the QMP reply was greater than 64kb asyncio raised an
exception. This was a pre-existing latent bug, exposed with the patch
to enable use of socketpair(). I've CC'd you on a patch to fix this.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


