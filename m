Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7EB358E00
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:04:22 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUat2-0000iL-6w
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUart-0008OE-6B
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUarp-0003AS-Om
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617912184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JFRgKxGH5NTpCtdAvzCYo5JEqzCCKwdBjkCyhW28bUU=;
 b=Mg6EM8K/qQqpxHgwm+Ad/EHHFB/Duu/Wm0niS9H0N1xYFaCIaW32bZoCywqLzWcFK2lBf4
 vU3ts2BrKDDuHJmEfwB2R21/Sc9FKcmBbYVSWDpnMexexQtrM3efntpm7ouqwX7aP3LCnz
 pfmQzV3R08m2++xb1N7+TCwzpOjWnFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-x0l4MlphPmOmc8DV46sJtw-1; Thu, 08 Apr 2021 16:03:03 -0400
X-MC-Unique: x0l4MlphPmOmc8DV46sJtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CB881B86ECE;
 Thu,  8 Apr 2021 19:53:55 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-57.gru2.redhat.com
 [10.97.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2105560853;
 Thu,  8 Apr 2021 19:53:43 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] python/qemu: Add args property to the QEMUMachine class
Date: Thu,  8 Apr 2021 16:52:35 -0300
Message-Id: <20210408195237.3489296-6-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-1-wainersm@redhat.com>
References: <20210408195237.3489296-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This added the args property to QEMUMachine so that users of the class
can access and handle the list of arguments to be given to the QEMU
binary.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/machine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..1c30bde99d 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -302,6 +302,11 @@ def _base_args(self) -> List[str]:
                 args.extend(['-device', device])
         return args
 
+    @property
+    def args(self) -> List[str]:
+        """Returns the list of arguments given to the QEMU binary."""
+        return self._args
+
     def _pre_launch(self) -> None:
         self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
                                           dir=self._test_dir)
-- 
2.29.2


