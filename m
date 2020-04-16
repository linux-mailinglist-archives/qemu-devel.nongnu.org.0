Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976D1ABB2C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 10:29:58 +0200 (CEST)
Received: from localhost ([::1]:59304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOzuH-0000TK-Da
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 04:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jOztT-00083q-4x
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 04:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jOztR-0005wq-ON
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 04:29:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60685
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jOztR-0005vd-Ja
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 04:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587025744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxdmOOlDmbharo4ox9UEiQ+zPxmF8XXugYEGG9AFjxk=;
 b=NhQuuMO7y9AnRWEzIEyWV87nYBVEDVwk6rxBhupbAA8728YeZ3OlI+tl0ZOX0/pJsHEEqt
 CFiL4HPSX9bnTwUfIXO7PxsWkJUxrEF3qUwrhM5RMw2pD+OprHntDjf55HQlTU6ePKX0VV
 oF1Y6uZ2Y6DoO2TTBkcgKlYpGhL2W5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-0xcXpKZ6MEWIzfbABrifMQ-1; Thu, 16 Apr 2020 04:29:00 -0400
X-MC-Unique: 0xcXpKZ6MEWIzfbABrifMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AC2F19251A0;
 Thu, 16 Apr 2020 08:28:59 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7767E7C0;
 Thu, 16 Apr 2020 08:28:50 +0000 (UTC)
Date: Thu, 16 Apr 2020 10:28:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: qemu_coroutine_yield switches thread?
Message-ID: <20200416082849.GA6014@linux.fritz.box>
References: <5dde1955-49db-2626-1fa5-332e4d7a0928@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <5dde1955-49db-2626-1fa5-332e4d7a0928@proxmox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: vsementsov@virtuozzo.com, slp@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.04.2020 um 10:06 hat Stefan Reiter geschrieben:
> Hi list,
>=20
> quick question: Can a resume from a qemu_coroutine_yield happen in a
> different thread?
>=20
> Well, it can, since I'm seeing it happen, but is that okay or a bug?

Yes, it can happen. At least for devices like IDE where a request is
started during a vmexit (MMIO or I/O port write), the coroutine will
usually begin its life in the vcpu thread and then move to the main loop
thread.

This is not a problem because the vcpu thread holds the BQL while
running the request coroutine.

> I.e. in a backup-job the following can sporadically trip:
>=20
>   unsigned long tid =3D pthread_self();
>   qemu_get_current_aio_context(); // returns main context
>   qemu_coroutine_yield();
>   qemu_get_current_aio_context(); // still returns main context, but:
>   assert(tid =3D=3D pthread_self()); // this fails
>=20
> It seems to be called from a vCPU thread when it happens. VM uses no
> iothreads.

This must be a guest request that was intercepted by the backup job. I
think it wouldn't happen for the background copy, these requests already
start in the main loop.

Kevin


