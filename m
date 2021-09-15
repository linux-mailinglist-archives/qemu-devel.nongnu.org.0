Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E19B40CA35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:33:50 +0200 (CEST)
Received: from localhost ([::1]:36194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXr3-0006JN-6A
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoF-0003JM-71
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoD-0004f1-FK
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTCO6MzTVMFV93dahv8Luzq4wfhHGWqsHf3nDvYq+0o=;
 b=WiYCOBRK1OgnerAMJNtASCEq3pqBC3NTc7pYoqMezhuvxDyt2huWFz5ku28JUxMkpWwUqT
 gXY7s4XxDw1/P79vc/OUQqcSJyD2LOIvW0EK7Rpl+R+pnPO77WUnfKJuZ1GM15EAwqBunc
 A+IkP3p+1R2b2MlkJP2pnwloG9LZQqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-27K3VRJ9Mhaiaa41JV-9-A-1; Wed, 15 Sep 2021 12:30:50 -0400
X-MC-Unique: 27K3VRJ9Mhaiaa41JV-9-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F671802C8F;
 Wed, 15 Sep 2021 16:30:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 708F67771A;
 Wed, 15 Sep 2021 16:30:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/27] python/pylint: Add exception for TypeVar names ('T')
Date: Wed, 15 Sep 2021 12:29:31 -0400
Message-Id: <20210915162955.333025-4-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'T' is a common TypeVar name, allow its use.

See also https://github.com/PyCQA/pylint/issues/3401 -- In the future,
we might be able to have a separate list of acceptable names for
TypeVars exclusively.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index dfce732e83..e8f3261691 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -101,6 +101,7 @@ good-names=i,
            fh,  # fh = open(...)
            fd,  # fd = os.open(...)
            c,   # for c in string: ...
+           T,   # for TypeVars. See pylint#3401
 
 [pylint.similarities]
 # Ignore imports when computing similarities.
-- 
2.31.1


