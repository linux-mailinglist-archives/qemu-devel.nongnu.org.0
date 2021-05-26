Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0457A390D66
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 02:38:46 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llhZN-0007qd-4H
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 20:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhMo-0003yT-El
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llhMg-0006p5-1I
 for qemu-devel@nongnu.org; Tue, 25 May 2021 20:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621988731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yA4CF5Ey/D7VFRocqXfTbjfx8UMyvTMtS1LJPfjlxEM=;
 b=im5ry5IIwKmflds54xqb5pVhbvQo+onwa8Zuj9bX/p1cj0zQe887IREL3Ol6OIHgD0AKfv
 5boq2ui3MOjMIRO3UspLP+N93BMr8tP6X0FWLClxwtfhiFMUBjqWO8h26SVs6nY8D7r2ea
 k4WkIL6eTrLeBo78ZL3dDGjTkX6m0xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-ablEOfzjPrui8VdYA84CXQ-1; Tue, 25 May 2021 20:25:29 -0400
X-MC-Unique: ablEOfzjPrui8VdYA84CXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AAF501E0;
 Wed, 26 May 2021 00:25:28 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B73C6EF40;
 Wed, 26 May 2021 00:25:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/31] python/machine: disable warning for Popen in
 _launch()
Date: Tue, 25 May 2021 20:24:29 -0400
Message-Id: <20210526002454.124728-7-jsnow@redhat.com>
In-Reply-To: <20210526002454.124728-1-jsnow@redhat.com>
References: <20210526002454.124728-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We handle this resource rather meticulously in
shutdown/kill/wait/__exit__ et al, through the laborious mechanisms in
_do_shutdown().

Quiet this pylint warning here.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210517184808.3562549-7-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index c66bc6a9c69..5d72c4ca369 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -405,6 +405,9 @@ def _launch(self) -> None:
                   self._args)
         )
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
+
+        # Cleaning up of this subprocess is guaranteed by _do_shutdown.
+        # pylint: disable=consider-using-with
         self._popen = subprocess.Popen(self._qemu_full_args,
                                        stdin=subprocess.DEVNULL,
                                        stdout=self._qemu_log_file,
-- 
2.31.1


