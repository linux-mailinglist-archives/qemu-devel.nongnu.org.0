Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EB52DA0B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 12:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVvWR-0004S2-AS
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 06:09:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVvVQ-00048T-Kf
	for qemu-devel@nongnu.org; Wed, 29 May 2019 06:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVvVP-0002As-P9
	for qemu-devel@nongnu.org; Wed, 29 May 2019 06:08:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36628)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hVvVP-0002Ac-Km; Wed, 29 May 2019 06:08:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9CB2DD9F4;
	Wed, 29 May 2019 10:08:22 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AB1B614E3;
	Wed, 29 May 2019 10:08:19 +0000 (UTC)
Date: Wed, 29 May 2019 12:08:17 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190529120817.54ce2441.cohuck@redhat.com>
In-Reply-To: <20190529072726.7875-3-david@redhat.com>
References: <20190529072726.7875-1-david@redhat.com>
	<20190529072726.7875-3-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 May 2019 10:08:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v1 2/2] s390x: Use uint64_t for vector
 registers
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
	qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 May 2019 09:27:26 +0200
David Hildenbrand <david@redhat.com> wrote:

> CPU_DoubleU is primarily used to reinterpret between integer and floats.
> We don't really need this functionality. So let's just keep it simple
> and use an uint64_t.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  linux-user/s390x/signal.c  |   4 +-
>  target/s390x/arch_dump.c   |   8 +--
>  target/s390x/cpu.h         |   4 +-
>  target/s390x/excp_helper.c |   6 +-
>  target/s390x/gdbstub.c     |  16 ++---
>  target/s390x/helper.c      |  10 +--
>  target/s390x/kvm.c         |  16 ++---
>  target/s390x/machine.c     | 128 ++++++++++++++++++-------------------
>  target/s390x/translate.c   |   2 +-
>  9 files changed, 97 insertions(+), 97 deletions(-)

Indeed, we only ever accessed them via ->ll anyway.

(Migration looks unaffected as well.)

