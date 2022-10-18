Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490116024E5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:01:36 +0200 (CEST)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgbW-0002Bn-OY
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6L-0005jq-1p
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg64-0001Ei-JY
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+n6IBLpdeiLDJCxgtwJ/yp0DVhy47gMopQmVNq6ID0=;
 b=V+rnX5WKSv0Q4grBUX9aWCFVYvLcH9lOYzcDsGq8KeCaUWnZJREPUNnGsa4dEFSkujMuuY
 kwIhAeIKHej+/bWxoSWeTvatthKh9E9hE403gUoeHNncSxu9awo31LK9u3HjoiY7tDssMk
 +I7++Q74PcNsSUWnNHnJaLiSNjkcXfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-FnOLvLGNPPG6glwIHTus4Q-1; Tue, 18 Oct 2022 02:28:50 -0400
X-MC-Unique: FnOLvLGNPPG6glwIHTus4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93922811E7A;
 Tue, 18 Oct 2022 06:28:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D212166B41;
 Tue, 18 Oct 2022 06:28:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2AB8C21E6928; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 01/28] docs/devel/qapi-code-gen: Update example to match
 current code
Date: Tue, 18 Oct 2022 08:28:22 +0200
Message-Id: <20221018062849.3420573-2-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index cd9b544376..997313fce7 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1748,7 +1748,7 @@ Example::
         QTAILQ_INIT(cmds);
 
         qmp_register_command(cmds, "my-command",
-                             qmp_marshal_my_command, QCO_NO_OPTIONS);
+                             qmp_marshal_my_command, 0, 0);
     }
     [Uninteresting stuff omitted...]
 
-- 
2.37.2


