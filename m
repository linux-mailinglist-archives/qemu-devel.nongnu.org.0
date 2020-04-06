Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D266A1A010A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 00:23:51 +0200 (CEST)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLa9m-0008Ra-DS
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 18:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jLa8u-0007q1-7t
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 18:22:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jLa8t-0001FE-4X
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 18:22:56 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24177
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jLa8t-0001Ev-1l
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 18:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5IjOwIKqhePb0WKGj5+RctAOQIuGeNKL5ypNtINB18=;
 b=iVCIWuT+uGYPTunJgGqIE2aqsBd9RE4frr5F9HXNk3SY4OHTSYf5RSR6fB3LoDlJCTLQN+
 VJjYzJfCKfHLu1BosAC5QEalDoFLUcnT/3g3ot8cprQcwR0TXZwJ7bhjxhDPIJ8PM0KruE
 OnuS/j83dZVwsiTYMaZf5TVeberk/Pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-lR28G-3gMGSjPj1M0h0XGw-1; Mon, 06 Apr 2020 18:22:48 -0400
X-MC-Unique: lR28G-3gMGSjPj1M0h0XGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CB01005509;
 Mon,  6 Apr 2020 22:22:47 +0000 (UTC)
Received: from [10.3.114.49] (ovpn-114-49.phx2.redhat.com [10.3.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8D41000325;
 Mon,  6 Apr 2020 22:22:46 +0000 (UTC)
Subject: Re: qcow2: Zero-initialization of external data files
To: Max Reitz <mreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <db0b4b5c-d564-f003-bbbc-9afdcac07cc4@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <50080252-ff22-78ed-0002-1742c694471b@redhat.com>
Date: Mon, 6 Apr 2020 17:22:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <db0b4b5c-d564-f003-bbbc-9afdcac07cc4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 10:56 AM, Max Reitz wrote:
> Hi,
>=20
> AFAIU, external data files with data_file_raw=3Don are supposed to return
> the same data as the qcow2 file when read.  But we still use the qcow2
> metadata structures (which are by default initialized to =E2=80=9Ceveryth=
ing
> unallocated=E2=80=9D), even though we never ensure that the external data=
 file
> is zero, too, so this can happen:
>=20
> $ dd if=3D/dev/urandom of=3Dfoo.raw 64M
> [...]
>=20
> $ sudo losetup -f --show foo.raw
> /dev/loop0
>=20
> $ sudo ./qemu-img create -f qcow2 -o \
>      data_file=3D/dev/loop0,data_file_raw=3Don foo.qcow2 64M
> [...]
>=20
> $ sudo ./qemu-io -c 'read -P 0 0 64M' foo.qcow2
> read 67108864/67108864 bytes at offset 0
> 64 MiB, 1 ops; 00.00 sec (25.036 GiB/sec and 400.5751 ops/sec)

This looks like a bug (and we should fix it for 5.0 if possible) - read=20
of a data_file_raw=3Don should not treat unallocated clusters as reading=20
0, but rather as reading whatever the raw data contains.

>=20
> $ sudo ./qemu-io -c 'read -P 0 0 64M' -f raw foo.raw
> Pattern verification failed at offset 0, 67108864 bytes
> read 67108864/67108864 bytes at offset 0
> 64 MiB, 1 ops; 00.01 sec (5.547 GiB/sec and 88.7484 ops/sec)
>=20
> I suppose this behavior is fine for blockdev-create because I guess it=E2=
=80=99s
> the user=E2=80=99s responsibility to ensure that the external data file i=
s zero.
>   But maybe it isn=E2=80=99t, so that=E2=80=99s my first question: Is it =
really the
> user=E2=80=99s responsibility or should we always ensure it=E2=80=99s zer=
o?

I'd argue that requiring the user to pre-zero the raw data file is=20
undesirable; and that we should instead fix our code to not report the=20
image as reading all zeroes when creating with data_file_raw=3Don.

>=20
> My second question is: If we decide that this is fine for
> blockdev-create, should at least qcow2_co_create_opts() ensure the data
> file it just created is zero?

Having an option to make qemu force-zero the raw image during=20
qcow2_co_create_opts seems reasonable, but for performance reasons, I=20
don't think the flag should be on by default.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


