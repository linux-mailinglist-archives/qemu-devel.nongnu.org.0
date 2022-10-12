Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6435FC893
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:41:39 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidrW-00055c-U7
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oidoC-0006eV-4g
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oido8-0001E4-30
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665589086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YIvDcrxlins/ENDK7DqxpRIFOz5Xmkq25RXSfjK+BAE=;
 b=G7cH0zh5ecyGnNs26ZJnf9Ig4gDuP8zCr+WAMsYA8EQUPXHr0tMMPGLT7r5mSWXgvK4U0I
 okZ1DUGXyZVyQY4RM5p4SWHr2YNahuy7YtdYYLFu56eKBfLEqAbrbW4I8/eeGDj4POtoT/
 Ei8PqrDCFUlqnnucVa8YvMQMqmzBS0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-F72bLJF0OvWMG-4MG7odYg-1; Wed, 12 Oct 2022 11:38:03 -0400
X-MC-Unique: F72bLJF0OvWMG-4MG7odYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EFA6804186;
 Wed, 12 Oct 2022 15:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E534EA53;
 Wed, 12 Oct 2022 15:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7612C21E693E; Wed, 12 Oct 2022 17:38:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, david@redhat.com
Subject: [PATCH 4/4] qerror: QERR_PERMISSION_DENIED is no longer used, drop
Date: Wed, 12 Oct 2022 17:38:01 +0200
Message-Id: <20221012153801.2604340-5-armbru@redhat.com>
In-Reply-To: <20221012153801.2604340-1-armbru@redhat.com>
References: <20221012153801.2604340-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
---
 include/qapi/qmp/qerror.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 596fce0c54..87ca83b155 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -50,9 +50,6 @@
 #define QERR_MISSING_PARAMETER \
     "Parameter '%s' is missing"
 
-#define QERR_PERMISSION_DENIED \
-    "Insufficient permission to perform this operation"
-
 #define QERR_PROPERTY_VALUE_BAD \
     "Property '%s.%s' doesn't take value '%s'"
 
-- 
2.37.2


