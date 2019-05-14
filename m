Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984D1CBC5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 17:24:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQZIY-0002Io-JX
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 11:24:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hQZHF-0001nq-TP
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:23:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hQZHE-0007e1-De
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:23:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hQZHE-0007bc-8P
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:23:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5CE7307EA8D;
	Tue, 14 May 2019 15:23:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.248])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE87D1001DE8;
	Tue, 14 May 2019 15:23:33 +0000 (UTC)
Date: Tue, 14 May 2019 16:23:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190514152331.GJ25916@redhat.com>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
	<877eatdq3w.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <877eatdq3w.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 14 May 2019 15:23:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 00/25] Add qemu_getrandom and
 ARMv8.5-RNG etc
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 14, 2019 at 05:15:31PM +0200, Markus Armbruster wrote:
> "make check-unit" fails for me:
> 
>   TEST    check-unit: tests/test-crypto-tlscredsx509
> Unexpected error in object_new_with_propv() at /work/armbru/qemu/qom/object.c:674:
> invalid object type: tls-creds-x509
> 
> and
> 
>   TEST    check-unit: tests/test-io-channel-tls
> Unexpected error in object_new_with_propv() at /work/armbru/qemu/qom/object.c:674:
> invalid object type: tls-creds-x509
> 
> I haven't looked further.

I have a nasty feeling it is caused by

  Subject: [PATCH v6 02/25] crypto: Merge crypto-obj-y into libqemuutil.a

The QOM objects are not directly used by most of the code. We rely on
the constructor registering the QOM object and then we request an
instance of it via the type name. So there's no direct function calls
from any code into the crypto object impls.

When we put the crypto objects into libqemuutil.a the linker is not
intelligent enough to see the constructor and so thinks all these
QOM object impls are unused and discards them when linking the final
binary.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

