Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98633E7E2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:54:43 +0100 (CET)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNGc-0005U1-Un
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNFG-0003pS-N8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNFF-0003C6-3D
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615953196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GKG3PiDrEQBJLCs+5Ktm4SczTf0D+iveHDe3qTuE3A=;
 b=b88BBGutbFFnQcA35dvX+iSdKXJMW5lbb8k3o41PC6Q7KvTNn3UkMbEq/KJjs6Ua55ZvN9
 76cY8BdHUgR3vf1PsP1vTapRcwUeZqwJEBRVic14sYmSiKyhKmaWEnrx+fKSE9fj32KCNy
 CUkaVWLWpnIRFfdwG958gQPTbh+T6UM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-N-jETTgeO3aZjPj77ONdQA-1; Tue, 16 Mar 2021 23:53:13 -0400
X-MC-Unique: N-jETTgeO3aZjPj77ONdQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B2DB107ACCD;
 Wed, 17 Mar 2021 03:53:12 +0000 (UTC)
Received: from localhost.net (ovpn-113-107.rdu2.redhat.com [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 637475D9C0;
 Wed, 17 Mar 2021 03:53:05 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/5] tests/acceptance: linux-related tests fix
Date: Tue, 16 Mar 2021 23:52:42 -0400
Message-Id: <20210317035242.24418-6-crosa@redhat.com>
In-Reply-To: <20210317035242.24418-1-crosa@redhat.com>
References: <20210317035242.24418-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch allows cloudinit images download when ssh
key is not specified.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161373266228.1608713.7614311331725780044.stgit@pasha-ThinkPad-X280>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index ac8041821fa..83b1741ec85 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -317,8 +317,10 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
             self.phone_home_port = network.find_free_port()
-            with open(ssh_pubkey) as pubkey:
-                pubkey_content = pubkey.read()
+            pubkey_content = None
+            if ssh_pubkey:
+                with open(ssh_pubkey) as pubkey:
+                    pubkey_content = pubkey.read()
             cloudinit.iso(cloudinit_iso, self.name,
                           username='root',
                           password='password',
-- 
2.30.2


