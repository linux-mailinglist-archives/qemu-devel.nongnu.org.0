Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2B2862E1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 17:59:32 +0200 (CEST)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQBql-0003Lq-Hg
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 11:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQBnz-0001gG-FP
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 11:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kQBnv-0000K6-GJ
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 11:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602086194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04mH/EQN2FMbm79HfXdBhiaZTkRTdOPvt3HTGNa6fxc=;
 b=ZF5KlYXLjLO5fuvNZzQ+4qHfCcewfDdL8Ehs+GJ64BmUpk3VyM76Msy0a8/gSQaVpJEz9m
 RjGnXNAE/REtOS/WRHAcbwF3kBaZbi8W8vN7UDQSQ2ojQqPW2OuOeB2gG3ClVmIr8RE3ph
 NrKIoGMmJEsmTBk/xhsmNv+As2gaB/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-63M_jL9JPUCbFvNkv8ngWw-1; Wed, 07 Oct 2020 11:56:33 -0400
X-MC-Unique: 63M_jL9JPUCbFvNkv8ngWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E4C108E1A1;
 Wed,  7 Oct 2020 15:56:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-50.ams2.redhat.com
 [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8138D10021AA;
 Wed,  7 Oct 2020 15:56:30 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, zhengchuan@huawei.com,
 stefanha@redhat.com, peterx@redhat.com
Subject: [PULL 10/10] migration/dirtyrate: present dirty rate only when
 querying the rate has completed
Date: Wed,  7 Oct 2020 16:56:00 +0100
Message-Id: <20201007155600.337316-11-dgilbert@redhat.com>
In-Reply-To: <20201007155600.337316-1-dgilbert@redhat.com>
References: <20201007155600.337316-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chuan Zheng <zhengchuan@huawei.com>

Make dirty_rate field optional, present dirty rate only when querying
the rate has completed.
The qmp results is shown as follow:
@unstarted:
{"return":{"status":"unstarted","start-time":0,"calc-time":0},"id":"libvirt-12"}
@measuring:
{"return":{"status":"measuring","start-time":102931,"calc-time":1},"id":"libvirt-85"}
@measured:
{"return":{"status":"measured","dirty-rate":4,"start-time":150146,"calc-time":1},"id":"libvirt-15"}

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <1601350938-128320-3-git-send-email-zhengchuan@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/dirtyrate.c | 3 +--
 qapi/migration.json   | 8 +++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 40e41e793e..ab9e1301f6 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -69,9 +69,8 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
     struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
 
     if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
+        info->has_dirty_rate = true;
         info->dirty_rate = dirty_rate;
-    } else {
-        info->dirty_rate = -1;
     }
 
     info->status = CalculatingState;
diff --git a/qapi/migration.json b/qapi/migration.json
index 7f5e6fd681..974021a5c8 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1743,10 +1743,8 @@
 #
 # Information about current dirty page rate of vm.
 #
-# @dirty-rate: @dirtyrate describing the dirty page rate of vm
-#              in units of MB/s.
-#              If this field returns '-1', it means querying has not
-#              yet started or completed.
+# @dirty-rate: an estimate of the dirty page rate of the VM in units of
+#              MB/s, present only when estimating the rate has completed.
 #
 # @status: status containing dirtyrate query status includes
 #          'unstarted' or 'measuring' or 'measured'
@@ -1759,7 +1757,7 @@
 #
 ##
 { 'struct': 'DirtyRateInfo',
-  'data': {'dirty-rate': 'int64',
+  'data': {'*dirty-rate': 'int64',
            'status': 'DirtyRateStatus',
            'start-time': 'int64',
            'calc-time': 'int64'} }
-- 
2.28.0


