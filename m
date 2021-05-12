Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCCF37D4F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:48:54 +0200 (CEST)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwir-0003dq-US
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwh7-0000tN-Bg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgx-0007ih-OY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gY/lg29u2XDcIt+R2WUeT2vPrSCoSPMwfa90MHVVtL8=;
 b=L9Z7J7zBVroKcDnrs/kBjIWtKXDQwjU8vIrA93EL3fglY4xivMnTdIxGdSnQdJoCD3m0Ob
 aTKXzjBcvVry13tP+kStR6c4KrLa/X1oq0p1KMGkHbrxxczDIOfADSQvy5q8POZ/kkfveL
 ekDATbOUD2KA1vxW01eilR/v0ovt3JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-5LNvwarHMzahg6nFfdZ2_w-1; Wed, 12 May 2021 17:46:53 -0400
X-MC-Unique: 5LNvwarHMzahg6nFfdZ2_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D08F8015A8;
 Wed, 12 May 2021 21:46:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F6DE6267D;
 Wed, 12 May 2021 21:46:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] python/machine: disable warning for Popen in _launch()
Date: Wed, 12 May 2021 17:46:38 -0400
Message-Id: <20210512214642.2803189-7-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
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
index 8f86303b48f..0df5b2f386f 100644
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


