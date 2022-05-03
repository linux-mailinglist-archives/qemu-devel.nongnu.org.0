Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97985518D69
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:46:27 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyTa-0003fR-Dv
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyQ2-0007CC-0P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nlyQ0-0007Rc-74
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651606747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYn3+jJ+jiRWrcOHN4jNOe+9F9+2seeGa7tfiaxp2Qs=;
 b=cClFqVI6IzS6IA589CvQb3D5k0b9gKCGYtuszYL5ZbUel3mOWR1T67wwDwTdSBza522Y4X
 zmySwo1JlFZosQACXt4AzzzVbFYZtmRxi/WtfsQgoWP9sUa08IXeodGbEuP9tvoqMUOOq3
 7TwElnI21e9c672mhBqqDETf9W/nfTQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-M1tXB4btO6uRKfk8gnsjig-1; Tue, 03 May 2022 11:05:40 -0400
X-MC-Unique: M1tXB4btO6uRKfk8gnsjig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD5302992619;
 Tue,  3 May 2022 14:55:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A46F40D2820;
 Tue,  3 May 2022 14:55:54 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 3/4] block: Print protocol-specific information
Date: Tue,  3 May 2022 16:55:28 +0200
Message-Id: <20220503145529.37070-4-hreitz@redhat.com>
In-Reply-To: <20220503145529.37070-1-hreitz@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Make bdrv_image_info_dump() print protocol-specific information.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qapi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/qapi.c b/block/qapi.c
index 293983cf82..169ea08f70 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -921,4 +921,9 @@ void bdrv_image_info_dump(ImageInfo *info)
         bdrv_image_info_specific_dump(info->format_specific,
                                       "Format specific information:\n");
     }
+
+    if (info->has_protocol_specific) {
+        bdrv_image_info_specific_dump(info->protocol_specific,
+                                      "Protocol specific information:\n");
+    }
 }
-- 
2.35.1


