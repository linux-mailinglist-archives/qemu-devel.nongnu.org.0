Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C719948B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 12:59:43 +0200 (CEST)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJEcQ-0002s5-QE
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 06:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jJEUs-00031e-Iz
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jJEUr-0006vu-Jy
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32021
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jJEUr-0006vG-9z
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585651911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkBjJmvYQDvhx8lqP/+sR1RjFDPNALLsRPCqfHWsd4g=;
 b=duHwkHgTS3UKF/sgBgbwEwQZFuAOVVFF54rSrGWs1GyV/QnBoNyB/GGvtG7JvbZ7kwdN8/
 FK8WcDbOQizyRrjtBvWtf3GMG5w63VvmHA1m4w4nrE6c4bt8/C8DGXiu3bKZuU4V0g+g72
 +TKlsRoWtcVYU5WKjpkN12AENDLtb4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-MPs-9FaLO7CffgnDv53zpQ-1; Tue, 31 Mar 2020 06:51:47 -0400
X-MC-Unique: MPs-9FaLO7CffgnDv53zpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9BFC13FE;
 Tue, 31 Mar 2020 10:51:46 +0000 (UTC)
Received: from work-vm (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8896F60BE0;
 Tue, 31 Mar 2020 10:51:43 +0000 (UTC)
Date: Tue, 31 Mar 2020 11:51:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alexander Yuriev <alex@corp.zubrcom.net>, marcandre.lureau@redhat.com
Subject: Re: Massive memory leak in 4.2.0
Message-ID: <20200331105140.GB2942@work-vm>
References: <CAJRb792WE-mhTDOCdEtP3kQJK8ie7v3LRJ3y28F2DMSabvfyMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJRb792WE-mhTDOCdEtP3kQJK8ie7v3LRJ3y28F2DMSabvfyMg@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alexander Yuriev (alex@corp.zubrcom.net) wrote:
> Hello,

Hi,
  (Copying in Marc-Andre for virtio gpu stuff)

> I was wondering if there is any interest in getting detailed reports/havi=
ng
> a tester for a reproducible massive memory leak in qemu 4.2.0 running a
> guest with X11 via virgl-0.8.1 acceleration to host using sdl.
>=20
> Guest limited to 2Gb has qemu RES grow to over 10Gb with while running
> Chrome within hours ( single gmail.tab + qemu archive page over last 20
> minutes expanded qemu res from 1.9gb to 2.6 gb).
>=20
> Both host and guest are amd64 debian 10. Qemu is built from source.
>=20
> Thanks,
> Alex
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


