Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E12103D61
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 15:37:11 +0100 (CET)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXR6U-00035n-2W
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 09:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iXR3n-0001UN-21
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:34:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iXR3i-0005Sd-8Y
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:34:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50376
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iXR3i-0005SJ-48
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574260457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwEGQmWwSURS6LqyTZz04FBKEE4AhZDQo9KoyV239cI=;
 b=J8jVwaFz85QEMRWoTl4309rBgZTVkJ16Y0qbEt2azk+ZsVhmMEShp1JsqQWkC82HGgXpDc
 GJeATk6j6XDUdvkhe+WI6lM88JD+eW737EF48rejKWuavvgwSAajqs+b4qC0eJXWLWnNAD
 FnWp+kRjgMoP2D78JtOAKH2FtiL4pa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-l4-2BaDcNw6XeHZlaDDHmA-1; Wed, 20 Nov 2019 09:34:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA41801E6A;
 Wed, 20 Nov 2019 14:34:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95DF35ED2D;
 Wed, 20 Nov 2019 14:34:11 +0000 (UTC)
Subject: Re: [PATCH] pseries: fix migration-test and pxe-test
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20191120142539.236279-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4052b075-f6b2-b304-f8f2-11dc059e8d50@redhat.com>
Date: Wed, 20 Nov 2019 15:34:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191120142539.236279-1-lvivier@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: l4-2BaDcNw6XeHZlaDDHmA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/2019 15.25, Laurent Vivier wrote:
> Commit 29cb4187497d ("spapr: Set VSMT to smp_threads by default")
> has introduced a new default value for VSMT that is not supported
> by old kernels (before 4.13 kernel) and this breaks "make check"
> on these kernels.
>=20
> To fix that, explicitly set in the involved tests the value that was
> used as the default value before the change.
>=20
> Cc: Greg Kurz <groug@kaod.org>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/migration-test.c | 4 ++--
>  tests/pxe-test.c       | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>

I assume this will go via the ppc tree?

 Thomas


