Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43A21009E9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 18:08:33 +0100 (CET)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWkVs-0007ze-EC
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 12:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iWkQp-0003UI-JU
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:03:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iWkQn-0002m2-IY
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:03:19 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42270
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iWkQl-0002iJ-E1
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 12:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574096593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FA/lTay4S60YUrBvocezR8r2XTSFFCGlkm59hr5jyyY=;
 b=M1sq5CkSO1rLVwYmHEQXl6b/eG8e2BjbeqmwSOVtkmWcfYRick2Otgo+XR43y6lTyP6eqp
 suflZET6f2izEW6a5QFBC+qDTiCwDrKsvQaF+5NKZdPrUXNChNmceKMmelgfpOy/i+5iTR
 +wdGXelpfXEg52E0n52FZ5UkIfFye5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-OMjn5gNwOJCYNRmR8tvftA-1; Mon, 18 Nov 2019 12:03:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 299818005B4;
 Mon, 18 Nov 2019 17:03:09 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-108.ams2.redhat.com
 [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D743608B5;
 Mon, 18 Nov 2019 17:03:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/4] iotests: Fix "no qualified output" error path
Date: Mon, 18 Nov 2019 18:02:54 +0100
Message-Id: <20191118170256.31477-3-kwolf@redhat.com>
In-Reply-To: <20191118170256.31477-1-kwolf@redhat.com>
References: <20191118170256.31477-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OMjn5gNwOJCYNRmR8tvftA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variable for error messages to be displayed is $results, not
$reason. Fix 'check' to print the "no qualified output" error message
again instead of having a failure without any message telling the user
why it failed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 71fe38834e..90970b0549 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -887,7 +887,7 @@ do
             if [ ! -f "$reference" ]
             then
                 status=3D"fail"
-                reason=3D"no qualified output"
+                results=3D"no qualified output"
                 err=3Dtrue
             else
                 if diff -w "$reference" $tmp.out >/dev/null 2>&1
--=20
2.20.1


