Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66EB11E37C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 13:20:47 +0100 (CET)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifjw6-0004xO-Fq
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 07:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ifjiE-00058x-T3
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:06:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ifjiD-0005vT-QD
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:06:26 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30643
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ifjiD-0005t0-It
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 07:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576238784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybCxVPi/asDJvxfkktV60iYeMlQIOmH/xlZLCacp65w=;
 b=VRpfmYc9D6E7yaybM1HJ7NvHOOgYj5yfdw46StFFMq0w8d1TYJrRD4KyG0fWii0At4Zjr9
 hdurX8MCiZVQNqvh2rFOMAMVLp+WOydv49/rWLrV7xwZ4QOR2mC2B5rQxI5LIzhCrZIu/9
 VXW0qoYuXE2O+as7Kq9Is32p4g6c77k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-MFFWTX86NCGJJ684eoiB3w-1; Fri, 13 Dec 2019 07:06:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0115800D48;
 Fri, 13 Dec 2019 12:06:19 +0000 (UTC)
Received: from gondolin (ovpn-116-226.ams2.redhat.com [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBDD61F37;
 Fri, 13 Dec 2019 12:06:18 +0000 (UTC)
Date: Fri, 13 Dec 2019 13:06:16 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] pc-bios/s390x: Fix reset psw mask
Message-ID: <20191213130616.7da8136c.cohuck@redhat.com>
In-Reply-To: <20191205111239.01e7b114.cohuck@redhat.com>
References: <20191203132813.2734-1-frankja@linux.ibm.com>
 <20191203132813.2734-5-frankja@linux.ibm.com>
 <20191205111239.01e7b114.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: MFFWTX86NCGJJ684eoiB3w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Dec 2019 11:12:39 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue,  3 Dec 2019 08:28:13 -0500
> Janosch Frank <frankja@linux.ibm.com> wrote:
> 
> > We need to set the short psw indication bit in the reset psw, as it is
> > a short psw.
> > 
> > fixes: 9629823290 ("pc-bios/s390-ccw: do a subsystem reset before running the guest")
> > Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> > ---
> >  pc-bios/s390-ccw/jump2ipl.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)  
> 
> Thanks, applied (together with a rebuild of the bios images.)

This unfortunately breaks 'make check-qtest-s390x':

   TEST    check-qtest-s390x: tests/boot-serial-test
   TEST    check-qtest-s390x: tests/pxe-test
ERROR - too few tests run (expected 1, got 0)

When I revert this, the rebuild, and "s390x: Properly fetch and test
the short psw on diag308 subc 0/1" (as it exposes the bug this commit
tried to fix), everything passes again. No idea what is wrong, though :(

For now, I've dropped the three patches mentioned above from the
s390-next branch (I plan to send a pull request later). Let's fix this
on top once we figured out whatever went wrong, no need to rush here.


