Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F04234EF55
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:24:35 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRI6T-0005nj-Ui
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI1C-0000In-5U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lRI13-0003YR-9P
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617124735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Zs7bJ9iCN+tCvPmX1K3cDzPWx5yizxLZ7/b1MG1C1g=;
 b=QkXyaa+81/jJ/j9uStPQjWMUKN9GHFeX3qpX1Z/pDq77EDg/ZYagWnFk4QzGvHLhqhZD6D
 8B/oQWFGCSiAuyAemzrBxeOz72loP3ujuIO9nA4oE5lKNzCcU/Mb9g65nyyUVQd3YWMOcK
 FlEBfNRPZG3gjSSz8b6119n8o2QitI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-pX5Bj7JgMW2yaORBEtHi7Q-1; Tue, 30 Mar 2021 13:18:52 -0400
X-MC-Unique: pX5Bj7JgMW2yaORBEtHi7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC91D18C8C01;
 Tue, 30 Mar 2021 17:18:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB1060861;
 Tue, 30 Mar 2021 17:18:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 4/8] qapi/error: Change assertion
Date: Tue, 30 Mar 2021 13:18:40 -0400
Message-Id: <20210330171844.1197918-5-jsnow@redhat.com>
In-Reply-To: <20210330171844.1197918-1-jsnow@redhat.com>
References: <20210330171844.1197918-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eventually, we'll be able to prove that 'info.line' must be an int and
is never None at static analysis time, and this assert can go
away. Until then, it's a type error to assume that self.info is not
None.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d179a3bd0c..d0bc7af6e7 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
         self.col = col
 
     def __str__(self):
+        assert self.info is not None
         loc = str(self.info)
         if self.col is not None:
             assert self.info.line is not None
-- 
2.30.2


