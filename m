Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BB736FB1C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:02:54 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSnF-0001a8-Ao
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdf-00032Y-Oa
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007c2-S5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11b1QMUVpG/RaoRPjejp/+besHwAC/Jx9yoFpHWltGQ=;
 b=ErNZszg467DWdyMh01xaWLuuUi6XogsucloW8W9P/sPOU+vgCM6SmfPLkTFdR59i3tmFLu
 BNkb2r6vyRrOQaBfbPANgyXzHfWkKlbCghb/hupymu9IbVynB9MjLurMdGQh9c34BrfFsv
 zeOrQ5WTGx6rJGE49Gxhhbw11uLvA7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ppvLXsMqOYyVSUnsm_Ol5w-1; Fri, 30 Apr 2021 07:48:42 -0400
X-MC-Unique: ppvLXsMqOYyVSUnsm_Ol5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E691A107ACE3;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B730060937;
 Fri, 30 Apr 2021 11:48:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8ED251141CBD; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] qapi/expr.py: Modify check_keys to accept any Collection
Date: Fri, 30 Apr 2021 13:48:22 +0200
Message-Id: <20210430114838.2912740-10-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This is a minor adjustment that lets parameters @required and
@optional take tuple arguments, in particular ().  Later patches will
make use of that.

(Iterable would also have worked, but Iterable also includes things like
generator expressions which are consumed upon iteration, which would
require a rewrite to make sure that each input was only traversed
once. Collection implies the "can re-iterate" property.)

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-10-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index f3a4a8536e..396c8126d6 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -102,7 +102,7 @@ def pprint(elems):
             "%s misses key%s %s"
             % (source, 's' if len(missing) > 1 else '',
                pprint(missing)))
-    allowed = set(required + optional)
+    allowed = set(required) | set(optional)
     unknown = set(value) - allowed
     if unknown:
         raise QAPISemError(
-- 
2.26.3


