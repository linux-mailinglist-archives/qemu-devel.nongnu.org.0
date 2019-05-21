Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5525369
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 17:05:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT6KG-0004O3-FC
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 11:05:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT6JG-00047L-Su
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hT6JF-0007pO-Rf
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:04:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8281)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hT6JF-0007oi-M5
	for qemu-devel@nongnu.org; Tue, 21 May 2019 11:04:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08C38309266B;
	Tue, 21 May 2019 15:04:09 +0000 (UTC)
Received: from redhat.com (ovpn-112-26.ams2.redhat.com [10.36.112.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6AED5E7B6;
	Tue, 21 May 2019 15:04:05 +0000 (UTC)
Date: Tue, 21 May 2019 16:04:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20190521150402.GQ25835@redhat.com>
References: <20190517023924.1686-1-richard.henderson@linaro.org>
	<20190517023924.1686-3-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190517023924.1686-3-richard.henderson@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 21 May 2019 15:04:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 02/25] build: Link user-only with crypto
 random number objects
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 16, 2019 at 07:39:01PM -0700, Richard Henderson wrote:
> For user-only, we require only the random number bits of the
> crypto subsystem.  Rename crypto-aes-obj-y to crypto-user-obj-y,
> and add the random number objects, plus init.o to handle any
> extra stuff the crypto library requires.

If you pull in my authz patch first:

  https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg04863.html

then we can just kill crypto-aes-obj-y entirely, and make
linux-user reference crypto-obj-y as normal. My patch avoids
pulling in PAM, and your previous patch takes care of the
static linking problem.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

