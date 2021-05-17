Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EABB383D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:25:06 +0200 (CEST)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liirR-0005r5-1X
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHx-0001K0-Fj
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHv-0006yx-UD
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGuqrqm51MoXkPciCqG5OPj563q/2p+OEhh+NKfsXDI=;
 b=ZEJviAuG0YKqtwVY51knDGM3rXyCWoKraCR+xpX32AYBhkHcUlPWZyPhDzf7fEcNvULdjM
 Vz5mF/3ctYwFUgA3e+wQG2q+ObnicSWCXyy3H9VN+QSOjYw8uz1KiUOGtiDaBkWJ/YIhcW
 by3yaEaJYMfw0OrIT5FZQEonSkivSZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-P7looOccNHyIeobd4AYj6Q-1; Mon, 17 May 2021 14:48:21 -0400
X-MC-Unique: P7looOccNHyIeobd4AYj6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72B3107ACCD
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 909C319C46;
 Mon, 17 May 2021 18:48:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] python/machine: disable warning for Popen in _launch()
Date: Mon, 17 May 2021 14:48:08 -0400
Message-Id: <20210517184808.3562549-7-jsnow@redhat.com>
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
References: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We handle this resource rather meticulously in
shutdown/kill/wait/__exit__ et al, through the laborious mechanisms in
_do_shutdown().

Quiet this pylint warning here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index f021127f0fc..06058d89e83 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -407,6 +407,9 @@ def _launch(self) -> None:
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
2.30.2


