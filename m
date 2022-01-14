Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8D848EB2F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:04:47 +0100 (CET)
Received: from localhost ([::1]:36350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NC9-0007jc-Et
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:04:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0Y-00031N-Cu
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0W-0000L1-SG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hg4GavXcIyyKHZ3LcdHXTMWCD+n4iUVopHqlBHCdcO0=;
 b=NVUvJMrOcqdEd/Tr2/MxL1dP/TIPZBu0PrVznyRkvj/jJEfQWDAL0pEyoPzGh6pEmWtRYd
 yE2dSbVj6lV7h92kojoTk8lQsu6rwg1voMLJ9dpveUOdhh9yW7+80ncNwSW6vXHZapxAEc
 AwwO3f0AVHlbH1BScaUV16lYvTJCrys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-YGwMZhbAOEO3zLur3Kxjgw-1; Fri, 14 Jan 2022 08:52:41 -0500
X-MC-Unique: YGwMZhbAOEO3zLur3Kxjgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AF481EE62;
 Fri, 14 Jan 2022 13:52:40 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FC75105B20E;
 Fri, 14 Jan 2022 13:52:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/16] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
Date: Fri, 14 Jan 2022 14:52:17 +0100
Message-Id: <20220114135226.185407-8-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When building QEMU with --disable-vhost-user and using introspection,
query-qmp-schema lists vhost-user-blk even though it's not actually
available:

  { "execute": "query-qmp-schema" }
  {
      "return": [
          ...
          {
              "name": "312",
              "members": [
                  {
                      "name": "nbd"
                  },
                  {
                      "name": "vhost-user-blk"
                  }
              ],
              "meta-type": "enum",
              "values": [
                  "nbd",
                  "vhost-user-blk"
              ]
          },

Restrict vhost-user-blk in BlockExportType when
CONFIG_VHOST_USER_BLK_SERVER is disabled, so it
doesn't end listed by query-qmp-schema.

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220107105420.395011-4-f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-export.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index c1b92ce1c1..f9ce79a974 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -277,7 +277,8 @@
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
-  'data': [ 'nbd', 'vhost-user-blk',
+  'data': [ 'nbd',
+            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
@@ -319,7 +320,8 @@
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd',
-      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
+      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
+                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
       'fuse': { 'type': 'BlockExportOptionsFuse',
                 'if': 'CONFIG_FUSE' }
    } }
-- 
2.31.1


