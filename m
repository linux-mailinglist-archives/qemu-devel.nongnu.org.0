Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15152A64B3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 11:07:59 +0200 (CEST)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i54n7-00010J-Oe
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 05:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i54lk-0000ID-Sa
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 05:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i54lj-0004Cd-R6
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 05:06:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i54lg-0004BZ-LN; Tue, 03 Sep 2019 05:06:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3E153082A49;
 Tue,  3 Sep 2019 09:06:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-195.ams2.redhat.com
 [10.36.116.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE141001947;
 Tue,  3 Sep 2019 09:06:23 +0000 (UTC)
Date: Tue, 3 Sep 2019 11:06:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190903090622.GA4582@localhost.localdomain>
References: <20190902193320.32233-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902193320.32233-1-mreitz@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 03 Sep 2019 09:06:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/5] vpc: Return 0 from vpc_co_create()
 on success
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.09.2019 um 21:33 hat Max Reitz geschrieben:
> (v2 for =E2=80=9Cblock: Let blockdev-create return 0 on success=E2=80=9D=
)
>=20
> Jobs are expected to return 0 on success, so this extends to
> .bdrv_co_create().  After some inspection, it turns out that vpc is the
> only block driver that may return a positive value instead (to indicate
> success).  Fix that.
>=20
> Without this patch, blockdev-create is likely to fail for VPC images.
> Hence patch 5.
>=20
> John indicated his preference for me to use iotests.script_main().  I
> did that; but I still wanted to retain some form of verify_protocol().
> Patch 2 adds @supported_protocols to execute_test() (and thus to
> iotests.script_main() and iotests.main()).  Then I noticed we should
> probably make all Python tests (that use either script_main() or main()=
)
> pass something for that parameter, because it=E2=80=99s a bit silly to =
run all
> Python tests for raw when you just want to run the nbd tests (which are
> five or so).  Enter patches 3 and 4.
>=20
> (There are two Python tests (093 and 136) which I didn=E2=80=99t change=
 to pass
> supported_protocols, because they use null-{co,aio} as their protocol.
> As these are not actually testee protocols for the iotests, I decided t=
o
> just keep running these tests for any protocol.)

Thanks, applied to the block branch.

