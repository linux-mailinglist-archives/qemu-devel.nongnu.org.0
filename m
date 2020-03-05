Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3AA17A74C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 15:22:35 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9rOU-0000HZ-7b
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 09:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j9rNE-0007XD-8e
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j9rNC-0001l6-BR
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:21:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j9rNC-0001hu-89
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 09:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583418070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgiHdTwWq2BJ7jSvIn5hjBeU4NXqJk+81u1OgKO9k7g=;
 b=dTwmIz3lXijQpeHzuKZcOODl/QpSqhA2y/D3a7nWBNy4Io68L+6e4d2tVGEgCMuHY1ZwHj
 /3vFWrpzPbC87cS6LEpmPntxWtgyRrUqUbx/aUIHEjKJpCnGaueHOehFGhIP7k+fEQfwqz
 uwkNhvaW4PjD+KvN9xykkGTi6l9JPzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-izcVbNStN7mlV1Lq45IQig-1; Thu, 05 Mar 2020 09:21:06 -0500
X-MC-Unique: izcVbNStN7mlV1Lq45IQig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5509C1007268;
 Thu,  5 Mar 2020 14:21:05 +0000 (UTC)
Received: from [10.3.117.177] (ovpn-117-177.phx2.redhat.com [10.3.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0AAA5C21B;
 Thu,  5 Mar 2020 14:21:04 +0000 (UTC)
Subject: Re: [PATCH v2 0/9] hw, ui, virtfs-proxy-helper: Reduce QEMU
 .data/.rodata/.bss footprint
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20200305124525.14555-1-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d32c4278-5879-c485-6f02-bdd9d1f890d1@redhat.com>
Date: Thu, 5 Mar 2020 08:21:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305124525.14555-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/20 6:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since v1:
> - merged 2 series
> - reworked hw/usb/quirks
> - added R-b/A-b tags
>=20
> This series reduce the footprint of the QEMU binary:
> .bss: 106KiB (moved to .heap)

Why is moving stuff from .bss to .heap beneficial?  With .bss,=20
0-initialization is cheap (the OS gives it to us for free by mapping the=20
entire .bss to a copy-on-write zero page); but with .heap, we generally=20
have to zero it at runtime ourselves.

> .data: 1MiB
> .rodata: 4.34MiB

But reducing these sizes makes sense.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


