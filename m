Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366281D058C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 05:37:26 +0200 (CEST)
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYiCy-0003Hm-OI
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 23:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYiC2-0002pS-0m
 for qemu-devel@nongnu.org; Tue, 12 May 2020 23:36:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:64763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <masahiroy@kernel.org>)
 id 1jYiBz-00020l-ER
 for qemu-devel@nongnu.org; Tue, 12 May 2020 23:36:25 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net
 [126.90.202.47]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 04D3a6S6018406;
 Wed, 13 May 2020 12:36:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 04D3a6S6018406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589340967;
 bh=j4uc1riadPUjuc9/QpuOHISaJFSi13VNasOMYnlaTEM=;
 h=From:To:Cc:Subject:Date:From;
 b=rEUOCd1uyY+f8eRsjznaAlu4/8pbNtfH5TiPc0vCiSbmeLivHZ0ebytRTIA1tFRSk
 dD/w7NnArYYqvqhHslSO7/zsPCKihlC3e3oHPzD4nJSRMJMocwsNl3Vrhw++b44Xgg
 TdEzG2QOLs9s1M75NvOGdcKfvjrwxyhkYRN7aM5wrOO+GIU7NGES4S0VBLNqme7AoY
 HZXm3WSpClb9iX0UMzV/p8ceK00eHpm7LWnZlEziyvK7qA9klBBdBXclbSyOCGt/+m
 9b6Uu2G9OHIogntQlZOItEx+YBvehTRKWaa5W1nd2RbjnXvoGUvS2fGj3adUrgivZc
 ljMg7k89VzmXQ==
X-Nifty-SrcIP: [126.90.202.47]
From: Masahiro Yamada <masahiroy@kernel.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH] qom/container: remove .instance_size initializer from
 container_info
Date: Wed, 13 May 2020 12:36:00 +0900
Message-Id: <20200513033600.2709646-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=210.131.2.74;
 envelope-from=masahiroy@kernel.org; helo=conuserg-07.nifty.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 23:36:20
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You can omit .instance_size if it is the same as that of the parent.

    .class_size = sizeof(ObjectClass)

... is omitted here, so removing .instance_size is more consistent.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 qom/container.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qom/container.c b/qom/container.c
index f6ccaf7ea7..4c030d6dda 100644
--- a/qom/container.c
+++ b/qom/container.c
@@ -16,7 +16,6 @@
 
 static const TypeInfo container_info = {
     .name          = "container",
-    .instance_size = sizeof(Object),
     .parent        = TYPE_OBJECT,
 };
 
-- 
2.25.1


