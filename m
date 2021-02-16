Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610E31C616
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 05:58:42 +0100 (CET)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsRd-0007pj-EC
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 23:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQP-0006BT-C9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQN-0007mZ-88
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jl//LkhW2mV/cMAl/2CqjKy4i9x4BjapsaUaVpWKL1A=;
 b=ImXINI6BNzeOyMGwImWq5YshNOv6PetEU0tkrRhVJ9cGU4z2g5AdTtXTNvkz9mpmoTjKF5
 lg5HKHcsjjstQ4cMYgmxhYhvS3Z9G3yo1NolTR36gOAoCWuiQPPd/zfdt1H5vXby1EAas4
 FAkWH72RgMV2HusyVO9vYLaC0rk2tAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-uEbrna0uO0Op7UfSPM_1RA-1; Mon, 15 Feb 2021 23:57:20 -0500
X-MC-Unique: uEbrna0uO0Op7UfSPM_1RA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C17C801962;
 Tue, 16 Feb 2021 04:57:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA47672163;
 Tue, 16 Feb 2021 04:57:17 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/9] Python: close the log file kept by QEMUMachine before
 reading it
Date: Mon, 15 Feb 2021 23:56:59 -0500
Message-Id: <20210216045705.9590-4-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Closing a file that is open for writing, and then reading from it
sounds like a better idea than the opposite, given that the content
will be flushed.

Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210211220146.2525771-2-crosa@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 7a40f4604be..6e44bda337e 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -337,12 +337,12 @@ def _post_shutdown(self) -> None:
             self._qmp.close()
             self._qmp_connection = None
 
-        self._load_io_log()
-
         if self._qemu_log_file is not None:
             self._qemu_log_file.close()
             self._qemu_log_file = None
 
+        self._load_io_log()
+
         self._qemu_log_path = None
 
         if self._temp_dir is not None:
-- 
2.26.2


