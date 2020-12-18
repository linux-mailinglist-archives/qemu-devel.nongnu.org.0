Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EB2DDF82
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 09:29:34 +0100 (CET)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqB8n-0002J0-1V
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 03:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6c-00014x-NX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6a-0008KN-6W
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608280034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROuMHwbUdhw4LrucuZXk9fuW6QuysLD2t+RNNY73A/A=;
 b=NhcvfXN/NCMcIPEhEjdX0LbpmctqWQhA7o3+bniVBAiiThxzeNhr0ee0M5KzTNWU+H/KKG
 WyWDeKgAG1uT8Rv+9ynwyNWkb2HEzkss4QkqjrL3WNtcc0jJ3fue0xrqrR50P0IF4LcXJI
 AnB+qvfPLgD8lnwaOzNHEBdNnVeN7AU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-300AIZlvMOeOnn_iba31Iw-1; Fri, 18 Dec 2020 03:27:11 -0500
X-MC-Unique: 300AIZlvMOeOnn_iba31Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 228AD8049C9;
 Fri, 18 Dec 2020 08:27:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A711B10013C0;
 Fri, 18 Dec 2020 08:27:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/14] bsd-user: Silence warnings about missing fallthrough
 statement
Date: Fri, 18 Dec 2020 09:27:02 +0100
Message-Id: <20201218082704.2014294-2-thuth@redhat.com>
In-Reply-To: <20201218082704.2014294-1-thuth@redhat.com>
References: <20201218082704.2014294-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When compiling with -Werror=implicit-fallthrough, the compiler complains
about a missing fallthrough annotation in this file. Looking at the code,
the fallthrough is indeed wanted here, so let's add a proper comment.

Message-Id: <20201217154138.1547274-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 bsd-user/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0a918e8f74..9c700c6234 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -512,6 +512,7 @@ void cpu_loop(CPUSPARCState *env)
         case 0x141:
             if (bsd_type != target_freebsd)
                 goto badtrap;
+            /* fallthrough */
         case 0x100:
 #endif
             syscall_nr = env->gregs[1];
-- 
2.27.0


