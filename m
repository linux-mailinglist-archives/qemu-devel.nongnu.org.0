Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C11A1A0F14
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 16:23:18 +0200 (CEST)
Received: from localhost ([::1]:48110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLp8G-0005tp-Qy
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 10:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jLp7P-0005FA-HQ
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jLp7O-0003kq-Gb
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:22:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28463
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jLp7O-0003kB-D4
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586269341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/1cecht1Qs2J7Dhneq20jEH3tlvR4o0KGk7sJdOQ4w=;
 b=RFD4r+nl0dso13O8M5MhgOHWJ+JBYUa7nJ1Q/tFMyd9sVFoPrWV3a9JiGaKq4CAdyAPtVB
 63r//60crwXCzjlkVSB5n1HJtU+YiC9TCkK7NmmoHh7+MKbvu63tqxNktX62e7QA7EQhfM
 IT8LRD3Dl1yJOR1gXmMzWfQ9MIxLcQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-OhrUTZ_OPv6x2b5aG9ml3Q-1; Tue, 07 Apr 2020 10:22:18 -0400
X-MC-Unique: OhrUTZ_OPv6x2b5aG9ml3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9648017F4;
 Tue,  7 Apr 2020 14:22:16 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A19C5E000;
 Tue,  7 Apr 2020 14:22:08 +0000 (UTC)
Date: Tue, 7 Apr 2020 16:22:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH for-5.0 v5 0/3] Fix some AIO context locking in jobs
Message-ID: <20200407142207.GF7695@linux.fritz.box>
References: <20200407115651.69472-1-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20200407115651.69472-1-s.reiter@proxmox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: vsementsov@virtuozzo.com, t.lamprecht@proxmox.com, slp@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.04.2020 um 13:56 hat Stefan Reiter geschrieben:
> Contains three seperate but related patches cleaning up and fixing some
> issues regarding aio_context_acquire/aio_context_release for jobs. Mostly
> affects blockjobs running for devices that have IO threads enabled AFAICT=
.
>=20
>=20
> Changes from v4:
> * Do job_ref/job_unref in job_txn_apply and job_exit since we need the jo=
b to
>   survive the callback to access the potentially changed lock afterwards
> * Reduce patch 2/3 to an assert, the context should already be acquired s=
ince
>   it's a bdrv handler
> * Collect R-by for 3/3
>=20
> I've marked it 'for-5.0' this time, I think it would make sense to be
> picked up together with Kevin's "block: Fix blk->in_flight during
> blk_wait_while_drained()" series. With that series and these three patche=
s
> applied I can no longer reproduce any of the reported related crashes/han=
gs.

Thanks, applied to the block branch.

Kevin


