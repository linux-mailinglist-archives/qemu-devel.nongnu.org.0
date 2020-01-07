Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5C1326A2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 13:44:25 +0100 (CET)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iooDf-0001tT-AN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 07:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ionmy-0004U8-EE
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:16:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ionmx-0003kW-7P
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:16:48 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21184
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ionmx-0003jg-3T
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578399406;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7MowAdUkC5KlrKN79Gp346Zw+R/vmWdHj8PXkVakM60=;
 b=h5BpePB7AW5rpfDcP0xkQTecE3t1KIvfGhyS0npl8xJqWJQ2aUq6QifzahWInRy8WQ/NFo
 lW3Y/LLvhyOq0yvXy2wVHNTBuUnRAwTAYJbkE8MjJNnww9rookeHpMt6039KzONiLZgeHI
 nXldWqdjmfHcaC6kKkeEwUJgYqJW+AE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-4KAA_oELPmOu1NFe_x1FKQ-1; Tue, 07 Jan 2020 07:16:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CBE800D41
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 12:16:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D249B5C1B0;
 Tue,  7 Jan 2020 12:16:39 +0000 (UTC)
Date: Tue, 7 Jan 2020 12:16:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 095/104] virtiofsd: convert more fprintf and perror to
 use fuse log infra
Message-ID: <20200107121636.GE3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-96-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-96-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 4KAA_oELPmOu1NFe_x1FKQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:38:55PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Eryu Guan <eguan@linux.alibaba.com>
>=20
> Signed-off-by: Eryu Guan <eguan@linux.alibaba.com>
> ---
>  tools/virtiofsd/fuse_signals.c | 6 +++++-
>  tools/virtiofsd/helper.c       | 9 ++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


