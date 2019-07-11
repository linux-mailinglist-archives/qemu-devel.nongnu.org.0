Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B4656B6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 14:19:25 +0200 (CEST)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlY2m-0000GW-Jz
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 08:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50099)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hlY1s-0008Hz-Pg
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:18:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hlY1q-0007x9-Q5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:18:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39208)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hlY1n-0007tK-9c
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 08:18:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9071E30BC588;
 Thu, 11 Jul 2019 12:18:20 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CE919C69;
 Thu, 11 Jul 2019 12:18:19 +0000 (UTC)
Date: Thu, 11 Jul 2019 13:18:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Amol Surati <suratiamol@gmail.com>, berrange@redhat.com
Message-ID: <20190711121817.GB5846@work-vm>
References: <20190711052608.GA2619@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190711052608.GA2619@arch>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 11 Jul 2019 12:18:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] qemu compilation failure with nettle 3.5.1
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

Copying in Daniel

* Amol Surati (suratiamol@gmail.com) wrote:
> Hi,
>=20
> The qemu upstream (at commit 6df2cdf44a at the moment) fails to compile
> with nettle 3.5.1. It seems that Nettle has deprecated a few parts of
> its API.
>=20
> A workaround is to provide --disable-nettle during qemu configuration.
>=20
> A portion of the error log:
>=20
> error: =E2=80=98nettle_aes_encrypt=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_decrypt=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_encrypt=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_decrypt=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_encrypt_key=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_decrypt_key=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_encrypt_key=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_decrypt_key=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_encrypt_key=E2=80=99 is deprecated
> error: =E2=80=98nettle_aes_set_decrypt_key=E2=80=99 is deprecated
>=20
>=20
> The declaration of one of the functions from nettle's aes.h:
>=20
> void
> aes_encrypt(const struct aes_ctx *ctx,
>             size_t length, uint8_t *dst,
>             const uint8_t *src) _NETTLE_ATTRIBUTE_DEPRECATED;
>=20
> Thanks,
> Amol
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

