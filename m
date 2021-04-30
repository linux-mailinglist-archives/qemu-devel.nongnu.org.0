Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B1A36FBA7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTR0-0005wk-Fg
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIs-0005Sx-Nd
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIo-000889-MI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFxTABUUrMBPoIvZTsVxL6ehkkwIZc4YfPakC/jdzS4=;
 b=M0Yb7bwMzx4yKIcMtB7k/Pq5bhQHi5D0XvC+VNLxHwbifJRdINMZHf3UYgPAjk7gDYC0el
 neUORdNtDuCbgD4ZdUUaF4fAGIuk3n7AiCZHLpiy/hOLSufssGjHPLDuSruQci0+myBcKF
 KrucH/EbPFXUkSoSKnrD4O7Qz13+yqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-jwCX5JV1Mcmg7Lu5untkjQ-1; Fri, 30 Apr 2021 09:35:25 -0400
X-MC-Unique: jwCX5JV1Mcmg7Lu5untkjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB4B218A08D4;
 Fri, 30 Apr 2021 13:35:24 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB075D9E2;
 Fri, 30 Apr 2021 13:35:19 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] tests/acceptance: Add set_vm_arg() to the Test class
Date: Fri, 30 Apr 2021 10:34:13 -0300
Message-Id: <20210430133414.39905-7-wainersm@redhat.com>
In-Reply-To: <20210430133414.39905-1-wainersm@redhat.com>
References: <20210430133414.39905-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The set_vm_arg method is added to avocado_qemu.Test class on this
change. Use that method to set (or replace) an argument to the list of
arguments given to the QEMU binary.

Suggested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 7f8e703757..14c6ae70c8 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -240,6 +240,27 @@ def get_vm(self, *args, name=None):
                 self._vms[name].set_machine(self.machine)
         return self._vms[name]
 
+    def set_vm_arg(self, arg, value):
+        """
+        Set an argument to list of extra arguments to be given to the QEMU
+        binary. If the argument already exists then its value is replaced.
+
+        :param arg: the QEMU argument, such as "-cpu" in "-cpu host"
+        :type arg: str
+        :param value: the argument value, such as "host" in "-cpu host"
+        :type value: str
+        """
+        if not arg or not value:
+            return
+        if arg not in self.vm.args:
+            self.vm.args.extend([arg, value])
+        else:
+            idx = self.vm.args.index(arg) + 1
+            if idx < len(self.vm.args):
+                self.vm.args[idx] = value
+            else:
+                self.vm.args.append(value)
+
     def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
-- 
2.29.2


