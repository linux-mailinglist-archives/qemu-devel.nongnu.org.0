Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F2F4563
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 12:08:42 +0100 (CET)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT289-0002IR-Ni
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 06:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iT26z-0001KM-3Z
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:07:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iT26x-0007RG-O4
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:07:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33076
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iT26x-0007PJ-JG
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 06:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573211244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sz8ElzisP+9vXO/hdYEzGDPj+rMedEwvWv7li5sP1Dk=;
 b=C8oF1TXXr85iyZ59X5A3fiu75BqU4M+CzWbs8mC2KMkbQKNYjL3kiROq9YFUaT9ZUyAh/p
 jEZvuuSQ3/zBZ11gTSVr7Bnil0JhJaVkX68QrfUErs5YYzCJQs7Lnk403Eu13i4UGUQZc6
 TyG5g6OnH9Z6NiY4uk4CXDSsOwHDA/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-8UV7TQyAPFemua4pVmUGog-1; Fri, 08 Nov 2019 06:07:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33FB31800D7B;
 Fri,  8 Nov 2019 11:07:20 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F9775DA70;
 Fri,  8 Nov 2019 11:07:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] s390x/cpumodel: Introduce "best" model variants
Date: Fri,  8 Nov 2019 12:07:12 +0100
Message-Id: <20191108110714.7475-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 8UV7TQyAPFemua4pVmUGog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Michael Mueller <mimu@linux.ibm.com>, Jiri Denemark <jdenemar@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was recently a discussion regarding CPU model versions. That concept
does not fit s390x where we have a lot of feature variability. I
proposed an alternative approach in [1], which might work for x86 as well
(but I am not sure if x86 still can or wants to switch to that), and
requires no real changes in upper layers.

[1] and patch #2 contains more information on the motivation for this.

E.g., specifying/expanding "z14-best" will result in the "best feature
set possible on this accelerator, hw and, firmware". While a "z13" does
not work under TCG and some z/VM versions, "z13-best" will work.

As I had a couple of spare minutes this week, I hacked a quick prototype.
I did not heavily test this (quick sanity tests under TCG only), but it
should be decent enough to get the idea and play with it. I'll not be
working next week, which is why I sent this out now for discussion.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg07222.html

Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Jiri Denemark <jdenemar@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Michael Mueller <mimu@linux.ibm.com>

David Hildenbrand (2):
  s390x/cpumodels: Factor out CPU feature dependencies
  s390x/cpumodel: Introduce "best" model variants

 target/s390x/cpu-qom.h    |   1 +
 target/s390x/cpu_models.c | 211 +++++++++++++++++++++++++++-----------
 2 files changed, 153 insertions(+), 59 deletions(-)

--=20
2.21.0


