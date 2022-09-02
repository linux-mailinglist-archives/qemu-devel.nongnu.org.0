Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BAC5AB71E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:04:56 +0200 (CEST)
Received: from localhost ([::1]:46890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUA6B-0003n9-0k
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9th-00030r-6O
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tf-0003TB-JG
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9W31JmD1LZcjfbxYGvHaZMHAksP7jc39bLIZRa149U=;
 b=S9yOjVJiPynNNZfpne31ITb2UM/srTn9QOWVDvVjXsJA+K01WqeGmyTcGIhA1km+58BPPV
 DGlnYtn7vyXLuakdnCpZVhbQtK8yzKDQWjZWUYMiLkN4DezXuNGt9b2MeD0IQdHvYqtkwN
 g2lE8wwzYEuZjrTwklFXcuh4pCiPsgg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-lwN56gsLM76gWWuk-GmxGA-1; Fri, 02 Sep 2022 12:51:55 -0400
X-MC-Unique: lwN56gsLM76gWWuk-GmxGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B49E29324BD;
 Fri,  2 Sep 2022 16:51:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A9B92026D64;
 Fri,  2 Sep 2022 16:51:51 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 7/8] meson-build: Enable CONFIG_REPLICATION only when
 replication is set
Date: Fri,  2 Sep 2022 18:51:25 +0200
Message-Id: <20220902165126.1482-8-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 20fddbd707..cab0474d0c 100644
--- a/meson.build
+++ b/meson.build
@@ -1878,7 +1878,7 @@ config_host_data.set('CONFIG_DEBUG_STACK_USAGE', get_option('debug_stack_usage')
 config_host_data.set('CONFIG_GPROF', get_option('gprof'))
 config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
 config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
-config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').allowed())
+config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
-- 
2.37.2


