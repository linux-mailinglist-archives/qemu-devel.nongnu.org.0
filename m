Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C12FEFC6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:06:55 +0100 (CET)
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cU2-00041v-5J
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2cSB-000310-PF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2cS9-0006rm-Eu
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=U4VXwNM3yP1Pd06ut1KyJ/qoGEtR/Z9rA18OSI0FddM=;
 b=Cdms3YVHZgqoj2yGIjG9MXzz1fO8Awt2vm+9yI9N71TiT7+FfPPRx3qRtNUWX4UrgA1Y3z
 7bph2/0XFHswttdNLZUrSLxJSFRBSBbkEyEjrNT4VWIBdjjXNvbS2F7eK/+jxZbc/8fvZ2
 Lj+M5SJ+ryazaVbux0DC2mdAhAarjf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-OZgOnzEjPLillbQP29Jvtw-1; Thu, 21 Jan 2021 11:04:51 -0500
X-MC-Unique: OZgOnzEjPLillbQP29Jvtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D72D11015940
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 16:04:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3FED10016F5;
 Thu, 21 Jan 2021 16:04:46 +0000 (UTC)
Date: Thu, 21 Jan 2021 16:04:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: Thread safety of coroutine-sigaltstack
Message-ID: <20210121160443.GO3125227@redhat.com>
References: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
 <445268c9-d91f-af5a-3d7e-f4c6f014ca52@redhat.com>
 <62d5d33c-fe2a-228b-146d-632c84d09fd5@redhat.com>
 <823a843f-af47-f091-1bd1-e33487524eb9@redhat.com>
 <eb4fb436-e7d7-2f5c-c1a4-9f5e57804e54@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eb4fb436-e7d7-2f5c-c1a4-9f5e57804e54@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 04:42:09PM +0100, Max Reitz wrote:
> On 21.01.21 14:34, Laszlo Ersek wrote:
> > On 01/21/21 10:27, Max Reitz wrote:
> > SUSv3 marked ucontext functions obsolescent:
> > 
> > https://pubs.opengroup.org/onlinepubs/000095399/functions/makecontext.html#tag_03_356_08
> > 
> > and they are entirely missing from SUSv4 (aka the latest POSIX):
> > 
> > https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xsh_chap03.html#tag_22_03_01_07
> > 
> > So you can use ucontext if you #define _XOPEN_SOURCE as 500 or 600, but
> > (in theory) not if you #define it as 700. How this works out in practice
> > on OSX -- i.e. how long they intend to support _XOPEN_SOURCE 600 --, I
> > can't tell.
> 
> Daniel made it sound like there was a libucontext that might be the way to
> go forward.
> 
> > I don't disagree with Daniel though; you can always bring back
> > coroutine-sigaltstack from the git history, if Apple decides to drop
> > ucontext.
> 
> It may be a bit more hassle (the configure option has to be removed, then
> maybe readded), but, well, yes.

ucontext on macOS may be slightly harder than i imagined. While making
it compile is easy, the qtests then hang so there's something not quite
right on macOS with ucontext and it basically impossible to debug in
Cirrus CI


I still think it is worth exploring, but it will require someone with
direct access to a macOS env to debug this I think.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


