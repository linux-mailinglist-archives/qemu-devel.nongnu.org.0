Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D099539BDE9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:02:05 +0200 (CEST)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDCu-0006WN-TN
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqt-00055h-7c
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCqp-000585-IA
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622824755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3IM2q0LzgrouGp2vGThiaRl54X+krhSSpSKs3IzzDM=;
 b=h8PAcUJubjvsB3O1va/Bub/Jm0fFIdJpbPrhhZXoi21/rpuiPJpPgaK5EnmIIP265d4WUO
 pDYJrQ1Bj4Qv3BRXCYTWaXSlrPOM09UWMRbALduyVdzahDMhJLCH49DZ/wlBL3+eoKBkzn
 dtep+vITWaSfSPSTRdMxviAjYYcXfZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-hHziJ7YjNiu8NXH_vFVvOg-1; Fri, 04 Jun 2021 12:39:11 -0400
X-MC-Unique: hHziJ7YjNiu8NXH_vFVvOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6CC803624;
 Fri,  4 Jun 2021 16:39:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71C3419D61;
 Fri,  4 Jun 2021 16:39:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/3] python: expose typing information via PEP 561
Date: Fri,  4 Jun 2021 12:39:05 -0400
Message-Id: <20210604163907.1511224-2-jsnow@redhat.com>
In-Reply-To: <20210604163907.1511224-1-jsnow@redhat.com>
References: <20210604163907.1511224-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create 'py.typed' files in each subpackage that indicate to mypy that
this is a typed module, so that users of any of these packages can use
mypy to check their code as well.

(Note: theoretically it's possible to ditch MANIFEST.in in favor of
using package_data, but I genuinely could not figure out how to get it
to include things from the source root into the package root. I
tried!...)

https: //www.python.org/dev/peps/pep-0561/#specification
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/py.typed | 0
 python/qemu/qmp/py.typed     | 0
 python/qemu/utils/py.typed   | 0
 python/setup.cfg             | 3 +++
 4 files changed, 3 insertions(+)
 create mode 100644 python/qemu/machine/py.typed
 create mode 100644 python/qemu/qmp/py.typed
 create mode 100644 python/qemu/utils/py.typed

diff --git a/python/qemu/machine/py.typed b/python/qemu/machine/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/qemu/qmp/py.typed b/python/qemu/qmp/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/qemu/utils/py.typed b/python/qemu/utils/py.typed
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/python/setup.cfg b/python/setup.cfg
index 0fcdec6f32..a1f9e9d76d 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -37,6 +37,9 @@ devel =
     pylint >= 2.8.0
     tox >= 3.18.0
 
+[options.package_data]
+* = py.typed
+
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-- 
2.31.1


