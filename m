Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EC48A0D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 19:26:29 +0200 (CEST)
Received: from localhost ([::1]:50220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcvOm-0004TR-Ea
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 13:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41715)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hcvJ1-00089c-0m
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hcvJ0-0002Hj-39
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 13:20:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hcvIv-0002AN-1i; Mon, 17 Jun 2019 13:20:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D1C930872E5;
 Mon, 17 Jun 2019 17:20:22 +0000 (UTC)
Received: from localhost (ovpn-116-100.phx2.redhat.com [10.3.116.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 256F11001B3D;
 Mon, 17 Jun 2019 17:20:19 +0000 (UTC)
Date: Mon, 17 Jun 2019 14:20:13 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190617172013.GD19178@habkost.net>
References: <20190617160136.29930-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190617160136.29930-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 17 Jun 2019 17:20:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/msf2-som: Exit when the cpu is not
 the expected one
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 17, 2019 at 06:01:36PM +0200, Philippe Mathieu-Daud=E9 wrote:
> This machine correctly defines its default_cpu_type to cortex-m3
> and report an error if the user requested another cpu_type,
> however it does not exit, and this can confuse users trying
> to use another core:
>=20
>   $ qemu-system-arm -M emcraft-sf2 -cpu cortex-m4 -kernel test-m4.elf
>   qemu-system-arm: This board can only be used with CPU cortex-m3-arm-c=
pu
>   [output related to M3 core ...]
>=20
> The CPU is indeed a M3 core:
>=20
>   (qemu) info qom-tree
>   /machine (emcraft-sf2-machine)
>     /unattached (container)
>       /device[0] (msf2-soc)
>         /armv7m (armv7m)
>           /cpu (cortex-m3-arm-cpu)
>=20
> Add the missing exit() call to return to the shell.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

--=20
Eduardo

