Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F239BCEF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:21:01 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCZA-0002CC-M1
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAu-0001Ef-D2
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAl-0001Vp-V8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5vLY16QvF+td5iUGMjYO4zRXpAnwEeyKBzMDgKyfN4=;
 b=Cq5jAD08DOBmpJNYPLl21cgaggt5wWkpZEqeIErfKAK0VhznDOvzMTlY125RQmEaFHzuzJ
 Rfi7G2pHX8jjRkyluT7cAKw79ysCkIh5IxM/acOh27IXL7GnV4HI+p9cpNo+zk1sj7V9gk
 Herx7MEwniZGCZGmAyA0xPR3mKujm0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-g24e0QmAMKeRMTxRCM8D1g-1; Fri, 04 Jun 2021 11:55:44 -0400
X-MC-Unique: g24e0QmAMKeRMTxRCM8D1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2398042A9;
 Fri,  4 Jun 2021 15:55:43 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87CA05B4A4;
 Fri,  4 Jun 2021 15:55:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] scripts/qemu-ga-client: move to
 python/qemu/qmp/qemu_ga_client.py
Date: Fri,  4 Jun 2021 11:55:30 -0400
Message-Id: <20210604155532.1499282-10-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The script itself will be unavailable for a few commits before being
restored, with no way to run it right after this commit. This helps move
git history into the new file. To prevent linter regressions, though, we
do need to immediately touch up the filename to remove dashes (to make
the module importable), and remove the executable bit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client => python/qemu/qmp/qemu_ga_client.py | 2 --
 1 file changed, 2 deletions(-)
 rename scripts/qmp/qemu-ga-client => python/qemu/qmp/qemu_ga_client.py (99%)

diff --git a/scripts/qmp/qemu-ga-client b/python/qemu/qmp/qemu_ga_client.py
similarity index 99%
rename from scripts/qmp/qemu-ga-client
rename to python/qemu/qmp/qemu_ga_client.py
index a7d0ef8347..d2938ad47c 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -52,8 +52,6 @@
     Sequence,
 )
 
-
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 from qemu.qmp import SocketAddrT
 
-- 
2.31.1


