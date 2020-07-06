Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B2B215C9A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 19:06:14 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsUZJ-0001ZW-Ib
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 13:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCZ-0004At-6o
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42733
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jsUCW-0003Cl-Lx
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 12:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594053759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQHZPfn7zW64fS+/Bm3Y33pdvQg1VSYTvG5+ESmBIAU=;
 b=TAlyKnbSSLLezYdxHCN2B5Lm+ZD3CyU8bSEWeyXS6ynjwA0I3KuxYTW69W+5V4IMCK9A3m
 l9wOVSFex6+31QYWtCg9DcoiwPtCXC1AWL5jodoyh5IVk0FiD4nyYpfBUHsJZLp28SMvyO
 CaORfVNcQ+r5MAn5moWUk+MZ1nc7w8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-5349RNFhNtq7wfw_ccmw6w-1; Mon, 06 Jul 2020 12:42:31 -0400
X-MC-Unique: 5349RNFhNtq7wfw_ccmw6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A870380183C;
 Mon,  6 Jul 2020 16:42:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51AC05F7D8;
 Mon,  6 Jul 2020 16:42:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/53] softmmu/vl: Remove the check for colons in -accel
 parameters
Date: Mon,  6 Jul 2020 12:41:46 -0400
Message-Id: <20200706164155.24696-45-pbonzini@redhat.com>
In-Reply-To: <20200706164155.24696-1-pbonzini@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The new -accel option does not accept colons in the parameters anymore
(since it does not convert the parameters to -machine accel=... parameters
anymore). Thus we can now remove the check for colons in -accel:

$ qemu-system-x86_64 -accel kvm:tcg
qemu-system-x86_64: -accel kvm:tcg: invalid accelerator kvm:tcg

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20200618074001.13642-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index df32f4c0ae..5d2cea559d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3493,11 +3493,6 @@ void qemu_init(int argc, char **argv, char **envp)
                     g_slist_free(accel_list);
                     exit(0);
                 }
-                if (optarg && strchr(optarg, ':')) {
-                    error_report("Don't use ':' with -accel, "
-                                 "use -M accel=... for now instead");
-                    exit(1);
-                }
                 break;
             case QEMU_OPTION_usb:
                 olist = qemu_find_opts("machine");
-- 
2.26.2



