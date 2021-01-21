Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28F72FEFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:10:38 +0100 (CET)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cXd-000702-Tg
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2cUw-0005k6-1Y
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2cUs-0000Ha-K0
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245265;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbjqjmNOB56VRU1HcMxspHela8roPJnM61v+5mh1Otw=;
 b=aLLht1erUMDQJWqob8c+FJCSXIvk7/7VNSu3DZRBoO1+iCVSfxJye+8cK9I/6XTfkbZpV5
 7HmM6UN401yBZ23ROeH0lixheW921YW3Rtktik17sTnvafs2VV1k3e0AjxLkmdVLxv+t9Q
 JqqvcSBdjI/VeDaTi0ALjSyVAfUiXq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-FvqkQpjXPMyrigA5b15YOw-1; Thu, 21 Jan 2021 11:07:42 -0500
X-MC-Unique: FvqkQpjXPMyrigA5b15YOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C24A192CC44
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 16:07:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 849D62DACE;
 Thu, 21 Jan 2021 16:07:36 +0000 (UTC)
Date: Thu, 21 Jan 2021 16:07:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Thread safety of coroutine-sigaltstack
Message-ID: <20210121160733.GP3125227@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
MIME-Version: 1.0
In-Reply-To: <30457fa0-6d7c-4e81-2623-8551d8bf2674@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 04:14:21PM +0100, Paolo Bonzini wrote:
> On 21/01/21 10:27, Max Reitz wrote:
> > 
> > Sure, I can do that.
> > 
> > I agree that there probably are better solutions than to wrap everything
> > in a lock.  OTOH, it looks to me like this lock is the most simple
> > solution.  If Daniel is right[1] and we should drop
> > coroutine-sigaltstack altogether (at some point...), perhaps it is best
> > to go for the most simple solution now.
> > 
> > [1]
> > https://lists.nongnu.org/archive/html/qemu-block/2021-01/msg00808.html
> 
> Yes, between coroutine-ucontext and the upcoming coroutine-asm[1] (which I
> have shelved because it was mostly a requirement for x86 CET; but it will
> come back some day), sooner or later there will be no reason to keep
> coroutine-sigaltstack.  Porting coroutine-asm to a new architecture is easy,
> I even managed to do it for s390. ;)

FWIW The libucontext impl is all ASM based and has coverage for all the
arches we care about:

   https://github.com/kaniini/libucontext

so doesn't seem like there's a need for  coroutine-asm if we can rely
on libucontext for portability where neede.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


