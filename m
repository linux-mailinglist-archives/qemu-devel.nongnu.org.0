Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68033488BF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:08:19 +0100 (CET)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJAI-0003to-M8
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6K-0002AT-UI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6J-0008OV-9V
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7f/AvFdr21PpuGtG6YguoqEBpnXCTo9cGd7OW2vyeec=;
 b=ZXSEavHg5cfbjhNubmf61foxK2KSwIMFPGSkx2MZ1+ZQT3ssQA74t87xk9by3Fa9nC6Rva
 i/1SUNOP7Y0Ve8cwOCDXKlVMUOUn0ZkHYpwWLYY7XZEExXuVTj7QsWzojfeZbivLpADLsX
 VCvW7iHdpJw5/vQZRAWiczld0t00xvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570--AIr5BErPmCTVGA5viBpPg-1; Thu, 25 Mar 2021 02:04:07 -0400
X-MC-Unique: -AIr5BErPmCTVGA5viBpPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AD2F108BD06;
 Thu, 25 Mar 2021 06:04:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A212F866C7;
 Thu, 25 Mar 2021 06:04:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 07/19] qapi/expr.py: move string check upwards in check_type
Date: Thu, 25 Mar 2021 02:03:44 -0400
Message-Id: <20210325060356.4040114-8-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For readability purposes only, shimmy the early return upwards to the
top of the function, so cases proceed in order from least to most
complex.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/expr.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2a2cf7064f..73e7d8cb0d 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -169,6 +169,10 @@ def check_type(value, info, source,
     if value is None:
         return
 
+    # Type name
+    if isinstance(value, str):
+        return
+
     # Array type
     if isinstance(value, list):
         if not allow_array:
@@ -179,10 +183,6 @@ def check_type(value, info, source,
                                source)
         return
 
-    # Type name
-    if isinstance(value, str):
-        return
-
     # Anonymous type
 
     if not allow_dict:
-- 
2.30.2


