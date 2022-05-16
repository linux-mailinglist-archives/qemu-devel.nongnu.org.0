Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A223D527EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 09:52:02 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVWL-0006F4-HD
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 03:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGN-0000qV-VO
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGJ-0001rv-Qw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6odkDmNEPMpTBi89+VhNwNVeI9JFESO8XSYrY3k9i4=;
 b=SjjAZ71kekvclaEHS4OWIWFwUcfKX2MinO2yoOAmb3yhfC03SV2PBpj49JCQr1o7dRZNIf
 IecRDvm8hIsBQoP8DGNM1jmWIyYCDQEUU8L7Y8FSN1NjOZ8ijxhdbkWoHupJrc3jhMpQU/
 QmRv/z8jG9PVjoIktHCylSi9oZ851Z0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-EjNiLowPPWWudo7nz5xfLA-1; Mon, 16 May 2022 03:35:25 -0400
X-MC-Unique: EjNiLowPPWWudo7nz5xfLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32C0F1D9F882;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10CC57AE4;
 Mon, 16 May 2022 07:35:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E3AE521E68BF; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PULL 09/11] qapi/expr: Enforce feature naming rules again
Date: Mon, 16 May 2022 09:35:20 +0200
Message-Id: <20220516073522.3880774-10-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e42648dccd "qapi/expr.py: Remove single-letter variable"
accidentally removed the check for "only lower case letters and
hyphens".  Restore it.

Fixes: e42648dccdd1defe8f35f247966cd7283f865cd6
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220510061645.3209195-2-armbru@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 48578e1698..5a1782b57e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -443,7 +443,7 @@ def check_features(features: Optional[object],
         check_keys(feat, info, source, ['name'], ['if'])
         check_name_is_str(feat['name'], info, source)
         source = "%s '%s'" % (source, feat['name'])
-        check_name_str(feat['name'], info, source)
+        check_name_lower(feat['name'], info, source)
         check_if(feat, info, source)
 
 
-- 
2.35.3


