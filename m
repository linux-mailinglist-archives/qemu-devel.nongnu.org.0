Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA115367279
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:23:54 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHVx-0004Mi-Vr
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT9-0002eS-A4
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSu-0003gS-CZ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcBJGdegvO/AYs+N+PZVdmRqPyoHH5bpc2pPaLtZeyc=;
 b=Q8DHZnDg7AWc6GPgtfMST8+lUuHIqkR5Pui7CC2t8Y9P1TqaHC8a1BcsfjfZuc3i8TzDR5
 Bcdh3sjV9MAGHZ88hLBorfbin2OI3Xx3eBtrpaZtkIKmoZmpVFo08eIGcmHaR2nzUBwG3l
 Le10Ff5fzTEWDnZBSbR7o/jdDQcLXDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-7RipSXBANmq0bY81FP6n8A-1; Wed, 21 Apr 2021 14:20:40 -0400
X-MC-Unique: 7RipSXBANmq0bY81FP6n8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74E7818B614A;
 Wed, 21 Apr 2021 18:20:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9AA19701;
 Wed, 21 Apr 2021 18:20:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 03/17] qapi/expr.py: Check for dict instead of OrderedDict
Date: Wed, 21 Apr 2021 14:20:18 -0400
Message-Id: <20210421182032.3521476-4-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OrderedDict is a subtype of dict, so we can check for a more general
form. These functions do not themselves depend on it being any
particular type.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 3fda5d50827..b4bbcd54c08 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -14,7 +14,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
-from collections import OrderedDict
 import re
 
 from .common import c_name
@@ -149,7 +148,7 @@ def check_if_str(ifcond):
 
 
 def normalize_members(members):
-    if isinstance(members, OrderedDict):
+    if isinstance(members, dict):
         for key, arg in members.items():
             if isinstance(arg, dict):
                 continue
@@ -180,7 +179,7 @@ def check_type(value, info, source,
     if not allow_dict:
         raise QAPISemError(info, "%s should be a type name" % source)
 
-    if not isinstance(value, OrderedDict):
+    if not isinstance(value, dict):
         raise QAPISemError(info,
                            "%s should be an object or type name" % source)
 
-- 
2.30.2


