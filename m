Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2535ADCA9B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 18:13:50 +0200 (CEST)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLUsu-00010W-Sd
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 12:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iLUq8-0007MU-Jq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iLUq7-0007QJ-GA
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:10:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iLUq4-0007NF-UV; Fri, 18 Oct 2019 12:10:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E259C7FDF0;
 Fri, 18 Oct 2019 16:10:51 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90E7F3CC8;
 Fri, 18 Oct 2019 16:10:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/6] s390x/tcg: Vector instruction fixes
Date: Fri, 18 Oct 2019 18:10:38 +0200
Message-Id: <20191018161044.6983-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 18 Oct 2019 16:10:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Ivan Warren <ivan@vmfacility.fr>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ivan reported that a simple
    $ go get -v -d github.com/FactomProject/factom

Will result in errors when vector instructions are in use. Turns out
golang makes excessive use of vector instructions, e.g., for crypto, hash=
es
but also basic math.

I tracked the involved vector instructions and started writing more
tests for them (will upstream them once they are in a better shape). Turn=
s
out there are quite some issues remaining. golang uses instructions not
yet used by the kernel or by glibc.

With these patches, "go get" works again. It wouldn't surprise me if ther=
e
are more BUGs in the vector instructions. Will continue writing more test=
s.

Cc: Ivan Warren <ivan@vmfacility.fr>

David Hildenbrand (6):
  s390x/tcg: Fix VECTOR MULTIPLY LOGICAL ODD
  s390x/tcg: Fix VECTOR MULTIPLY AND ADD *
  s390x/tcg: Fix VECTOR SHIFT RIGHT ARITHMETIC BY BYTE
  s390x/tcg: Fix VECTOR SUBTRACT COMPUTE BORROW INDICATION
  s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW INDICATION
  s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW COMPUTE BORROW INDICATION

 target/s390x/helper.h           |  2 -
 target/s390x/translate_vx.inc.c | 78 +++++++++++++++++++++++++--------
 target/s390x/vec_int_helper.c   | 32 ++++----------
 3 files changed, 68 insertions(+), 44 deletions(-)

--=20
2.21.0


