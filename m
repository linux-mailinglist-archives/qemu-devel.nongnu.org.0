Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2B23F25
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmBe-0000zU-8h
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSlpP-0007aB-W3
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSlpO-0005zi-IQ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:11:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11517)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSlpO-0005xG-DA; Mon, 20 May 2019 13:11:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 362B030833C5;
	Mon, 20 May 2019 17:11:43 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C805C297;
	Mon, 20 May 2019 17:11:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:55 +0200
Message-Id: <20190520170302.13643-48-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 17:11:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 47/54] s390x/cpumodel: ignore csske for expansion
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	qemu-devel@nongnu.org, qemu-stable@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

csske will be removed in a future machine. Ignore it for expanding the
cpu model. Otherwise qemu falls back to z9.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20190429090250.7648-3-borntraeger@de.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu_models.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index e5afa1551269..b4bb5de6358e 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -1322,6 +1322,8 @@ static void init_ignored_base_feat(void)
          S390_FEAT_KM_TDEA_192,
          S390_FEAT_KIMD_SHA_1,
          S390_FEAT_KLMD_SHA_1,
+         /* CSSKE is deprecated on newer generations */
+         S390_FEAT_CONDITIONAL_SSKE,
     };
     int i;
=20
--=20
2.20.1


