Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D72308D2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 13:37:04 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Nup-0006sC-MA
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 07:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k0NtS-0005cG-49
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:35:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42137
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k0NtP-0002H3-P0
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 07:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595936133;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=biCO1tIoW5FR2VBsAofJ7NQ4ssVcNdyZf1oahNpNN3w=;
 b=gliThXb150RcKit1ZHMHL4ewvSmX/gbKhnXHMf/qR7DucLKjCq0F3oOF+CGKX7+ziZJq6i
 6BuIy30zRDodeQ5mMJLyVZpDXjI8vw6jznak/9zp+zmd3+5BS7OD0/6iLZt1nJqIQT3b9F
 dcwj/d2Hh9oU5dr5IPE87t6LwoG8U2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-S_bNUdgbNceMZ6retdF0Mg-1; Tue, 28 Jul 2020 07:35:31 -0400
X-MC-Unique: S_bNUdgbNceMZ6retdF0Mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F688064AF;
 Tue, 28 Jul 2020 11:35:30 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C51C5DA33;
 Tue, 28 Jul 2020 11:35:25 +0000 (UTC)
Date: Tue, 28 Jul 2020 12:35:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v5 2/7] block/nbd.c: Add yank feature
Message-ID: <20200728113522.GB3437398@redhat.com>
References: <cover.1592923201.git.lukasstraub2@web.de>
 <3971e5cdc40d18e16c499560e2bf3ac8e5e42e26.1592923201.git.lukasstraub2@web.de>
MIME-Version: 1.0
In-Reply-To: <3971e5cdc40d18e16c499560e2bf3ac8e5e42e26.1592923201.git.lukasstraub2@web.de>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 06:05:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 04:42:45PM +0200, Lukas Straub wrote:
> Register a yank function which shuts down the socket and sets
> s->state = NBD_CLIENT_QUIT. This is the same behaviour as if an
> error occured.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  block/nbd.c | 101 +++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 64 insertions(+), 37 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


