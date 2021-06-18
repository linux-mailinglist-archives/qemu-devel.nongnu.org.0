Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8E3AD5A3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:07:55 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNac-0001Zd-EN
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXw-0006of-Uz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXu-00064F-0N
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9muYMxej9UhJxv4tCL11rYcG/4KYPNJwDxbOE4hvprU=;
 b=DWSMt5rU7x9a6/td7RtDrytzkr8MDEEGLHcmiQdBZ5Wlvv6y2y5cc0k28Ob8Ggxl9769ey
 w6oygrxJD/ECLsAsopIsETTIYHSUInUdAmdrieDTyeoYUdKZScSfmuw1Lwr4Dhc1AWBs17
 3zzP6gdwkOYhv1Ukl5j037VR0djNwsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-Mwk3I_R-O5ePTMhCyON0MA-1; Fri, 18 Jun 2021 19:05:02 -0400
X-MC-Unique: Mwk3I_R-O5ePTMhCyON0MA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278DA1084F4B;
 Fri, 18 Jun 2021 23:05:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DE021017CE5;
 Fri, 18 Jun 2021 23:05:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/72] python/qmp: add qom script entry points
Date: Fri, 18 Jun 2021 19:03:48 -0400
Message-Id: <20210618230455.2891199-6-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the 'qom', 'qom-set', 'qom-get', 'qom-list', and 'qom-tree' scripts
to the qemu.qmp package. When you install this package, these scripts
will become available on your command line.

(e.g. when inside of a venv, `cd python && pip install .` will add
'qom', 'qom-set', etc to your $PATH.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210603003719.1321369-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 0fcdec6f32..a19029d538 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -37,6 +37,14 @@ devel =
     pylint >= 2.8.0
     tox >= 3.18.0
 
+[options.entry_points]
+console_scripts =
+    qom = qemu.qmp.qom:main
+    qom-set = qemu.qmp.qom:QOMSet.entry_point
+    qom-get = qemu.qmp.qom:QOMGet.entry_point
+    qom-list = qemu.qmp.qom:QOMList.entry_point
+    qom-tree = qemu.qmp.qom:QOMTree.entry_point
+
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-- 
2.31.1


