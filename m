Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CF10413E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 17:46:26 +0100 (CET)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXT7Z-0003wV-CI
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 11:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iXT2U-0007bA-EN
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iXT2S-0000ED-Lu
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:41:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30172
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iXT2S-0000Dk-Hp
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 11:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574268067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+04ApiQitCXocLjL7A2pQ36+TcsC+4h7V84Cey+GE8w=;
 b=h+YJYm+scEZ/ibCDJ7/pOJPG7KpAe9Tws4fbmwypg+BIG8unrn0efA0egYGMwgA0AIn5p/
 qa/CpnFIsCXPXbZvOkt+WjI70Ni0AhOU6uvGHU+nLya/+mITOs0MIfideIufuh0WR9ulC8
 Z7C+nabOz05HaSZRTzBs/W1em5wCCq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-uGynr_RkOkGv3BXDRzQ4yg-1; Wed, 20 Nov 2019 11:41:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44343107ACC7;
 Wed, 20 Nov 2019 16:41:02 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D651F1001902;
 Wed, 20 Nov 2019 16:40:55 +0000 (UTC)
Date: Wed, 20 Nov 2019 16:40:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] virtio-pci: disable vring processing when
 bus-mastering is disabled
Message-ID: <20191120164053.GC2858@work-vm>
References: <157423033042.2797.15950947649776190513@37313f22b938>
 <157426700550.3335.16748606368540493053@sif>
MIME-Version: 1.0
In-Reply-To: <157426700550.3335.16748606368540493053@sif>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: uGynr_RkOkGv3BXDRzQ4yg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: no-reply@patchew.org, aik@ozlabs.ru, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael Roth (mdroth@linux.vnet.ibm.com) wrote:
> Quoting no-reply@patchew.org (2019-11-20 00:12:11)
> > Patchew URL: https://patchew.org/QEMU/20191120005003.27035-1-mdroth@lin=
ux.vnet.ibm.com/
> >=20
> >=20
> >=20
> > Hi,
> >=20
> > This series failed the docker-quick@centos7 build test. Please find the=
 testing commands and
> > their output below. If you have Docker installed, you can probably repr=
oduce it
> > locally.
> >=20
> > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > #!/bin/bash
> > make docker-image-centos7 V=3D1 NETWORK=3D1
> > time make docker-test-quick@centos7 SHOW_ENV=3D1 J=3D14 NETWORK=3D1
> > =3D=3D=3D TEST SCRIPT END =3D=3D=3D
> >=20
> >   TEST    check-unit: tests/test-thread-pool
> > wait_for_migration_fail: unexpected status status=3Dwait-unplug allow_a=
ctive=3D1
> > **
> > ERROR:/tmp/qemu-test/src/tests/migration-test.c:908:wait_for_migration_=
fail: assertion failed: (result)
> > ERROR - Bail out! ERROR:/tmp/qemu-test/src/tests/migration-test.c:908:w=
ait_for_migration_fail: assertion failed: (result)
>=20
> Seems to be an unrelated issue noted in this thread:
>=20
>   https://lists.gnu.org/archive/html/qemu-devel/2019-11/msg01326.html

Yeh, Jens has a patch series that's fixing that.

Dave

> I'm running the centos docker test in a loop but haven't been able to rep=
roduce
> so far after 7 attempts
>=20
> > make: *** [check-qtest-aarch64] Error 1
> > make: *** Waiting for unfinished jobs....
> >   TEST    check-unit: tests/test-hbitmap
> >   TEST    check-unit: tests/test-bdrv-drain
> > ---
> >     raise CalledProcessError(retcode, cmd)
> > subprocess.CalledProcessError: Command '['sudo', '-n', 'docker', 'run',=
 '--label', 'com.qemu.instance.uuid=3Dc863e15882a747a88c290575505cc1de', '-=
u', '1001', '--security-opt', 'seccomp=3Dunconfined', '--rm', '-e', 'TARGET=
_LIST=3D', '-e', 'EXTRA_CONFIGURE_OPTS=3D', '-e', 'V=3D', '-e', 'J=3D14', '=
-e', 'DEBUG=3D', '-e', 'SHOW_ENV=3D1', '-e', 'CCACHE_DIR=3D/var/tmp/ccache'=
, '-v', '/home/patchew/.cache/qemu-docker-ccache:/var/tmp/ccache:z', '-v', =
'/var/tmp/patchew-tester-tmp-wg70rgpu/src/docker-src.2019-11-20-01.02.57.12=
412:/var/tmp/qemu:z,ro', 'qemu:centos7', '/var/tmp/qemu/run', 'test-quick']=
' returned non-zero exit status 2.
> > filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3Dc863e15882a747a88c=
290575505cc1de
> > make[1]: *** [docker-run] Error 1
> > make[1]: Leaving directory `/var/tmp/patchew-tester-tmp-wg70rgpu/src'
> > make: *** [docker-run-test-quick@centos7] Error 2
> >=20
> > real    9m13.236s
> > user    0m8.131s
> >=20
> >=20
> > The full log is available at
> > http://patchew.org/logs/20191120005003.27035-1-mdroth@linux.vnet.ibm.co=
m/testing.docker-quick@centos7/?type=3Dmessage.
> > ---
> > Email generated automatically by Patchew [https://patchew.org/].
> > Please send your feedback to patchew-devel@redhat.com
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


