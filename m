Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3757E147
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:07:46 +0200 (CEST)
Received: from localhost ([::1]:49834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErRZ-0007F1-U4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMb-0008Pj-RK
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMW-0006Fs-JK
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5plUTj3W6URKiDXw4zyraz6gdfc5Jjz2aZBFO0prHIw=;
 b=ajohCkGhPvc1+9ReV/THd7QIfoVhHWyNQf3GR5dKprKVr5oYnWeGJh0kLYFtNKhPzDa4nX
 nE3+zi2JCoO98h/NeWQIJGLV/Cisj71ajmyEeKtbeX9w8FC50VhBUE/BuzEGeSTCKTdHhn
 iMaGTAuoYmBd4cwO7q5XKD1govGmi2w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-YO-C78BdPCCBYzDyR6iX6w-1; Fri, 22 Jul 2022 08:02:28 -0400
X-MC-Unique: YO-C78BdPCCBYzDyR6iX6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74BAF85A584;
 Fri, 22 Jul 2022 12:02:28 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396A11121314;
 Fri, 22 Jul 2022 12:02:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/3] target/i386: display deprecation status in '-cpu help'
Date: Fri, 22 Jul 2022 13:02:22 +0100
Message-Id: <20220722120224.2311982-2-berrange@redhat.com>
In-Reply-To: <20220722120224.2311982-1-berrange@redhat.com>
References: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..70f78340e1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4837,6 +4837,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
+    if (cc->model && cc->model->cpudef->deprecation_note) {
+        g_autofree char *olddesc = desc;
+        desc = g_strdup_printf("%s (deprecated)", olddesc);
+    }
+
     qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
-- 
2.36.1


