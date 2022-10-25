Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDCE60CD1C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:12:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJfz-0004eo-V6; Tue, 25 Oct 2022 09:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onJfw-00045Q-VQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:09:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onJfs-00074i-L6
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666703332;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ska4LDPSbbNLgt14f1o4g8Et9Q1qLfUcsSWJcU+Nag0=;
 b=ZlTOV9Wls54uImh1W2KJUZTp2stBZQcAGMo+eRDzD8t8nu5ZzaCdEKSEVItMvYlVyO8cHC
 uZU5+oQFCtIDDTiV1IYiFhVj4N3PzOs/pVWTe5JJPzHcZNcq1PMDkGjqWmHvmawCsThpVK
 G19F2mh2osrMZIpzabE/f6x5ppr1EUo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-FVmo-sLHOGe3LYLWZhnBXA-1; Tue, 25 Oct 2022 09:08:50 -0400
X-MC-Unique: FVmo-sLHOGe3LYLWZhnBXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7013629DD98C;
 Tue, 25 Oct 2022 13:08:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB7D410197;
 Tue, 25 Oct 2022 13:08:49 +0000 (UTC)
Date: Tue, 25 Oct 2022 14:08:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Create fifo for test-io-channel-command
Message-ID: <Y1ff32V9WXYH/hva@redhat.com>
References: <20221025105520.3016-1-quintela@redhat.com>
 <87mt9k6owd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mt9k6owd.fsf@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

CC'ing Marc-André as original author of the change

On Tue, Oct 25, 2022 at 01:57:23PM +0100, Alex Bennée wrote:
> 
> Juan Quintela <quintela@redhat.com> writes:
> 
> > Previous commit removed the creation of the fifo.  Without it, I get
> > random failure during tests with high load, please consider
> > reintroduce it.
> >
> > My guess is that there is a race between the two socats when we leave
> > them to create the channel, better return to the previous behavior.
> >
> > I can't reproduce the problem when I run ./test-io-channel-command
> > test alone, I need to do the make check.  And any (unrelated) change
> > can make it dissapear.
> 
> I was chasing a similar problem with this test although I don't see it
> timeout while running (I don't think our unit tests time out). I'm
> provisionally queuing this to testing/next unless anyone objects.

It won't build on Win32 since that platform lacks mkfifo.

The test normally works since socat will call mknod to create
the fifo.

I think the problem is that we have a race condition where the
client socat runs before the server socat, and so won't see the
fifo. This will be where high load triggers problems.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


