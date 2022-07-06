Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B64567CD7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 05:52:29 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8w5U-0003fQ-Up
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 23:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0c-0007Eg-6p
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8w0a-0002dO-NK
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 23:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657079244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fftXIwR07UHjXrAaMyTCQ2mMhpdTiRDERprdXGWGFfc=;
 b=cA3NLbMZFepjQCurbH0Hdg6fNVINLsdwXZPEJ59CKmXHy33fRal2V+MoMfiwe0ixvRker0
 31EoE72izWIhJ4CCQULHA89gDl6ZnfIfyrnLPBuPKGtTeMzp5UaUqL82e+SDzRZHZL9Do0
 nDbeQ5BZG1LrWkL0GTwFShCc15dJYJk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-ag7L0m1LMzeel-Uw1HTglA-1; Tue, 05 Jul 2022 23:47:20 -0400
X-MC-Unique: ag7L0m1LMzeel-Uw1HTglA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 487983C02198;
 Wed,  6 Jul 2022 03:47:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-233.pek2.redhat.com
 [10.72.12.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFEB91415108;
 Wed,  6 Jul 2022 03:47:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Haochen Tong <i@hexchain.org>, Zhang Chen <chen.zhang@intel.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 2/2] ebpf: replace deprecated bpf_program__set_socket_filter
Date: Wed,  6 Jul 2022 11:47:06 +0800
Message-Id: <20220706034706.36620-3-jasowang@redhat.com>
In-Reply-To: <20220706034706.36620-1-jasowang@redhat.com>
References: <20220706034706.36620-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Haochen Tong <i@hexchain.org>

bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
Replace with the equivalent bpf_program__set_type call to avoid a
deprecation warning.

Signed-off-by: Haochen Tong <i@hexchain.org>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 ebpf/ebpf_rss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 118c68d..cee658c 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -49,7 +49,7 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
         goto error;
     }
 
-    bpf_program__set_socket_filter(rss_bpf_ctx->progs.tun_rss_steering_prog);
+    bpf_program__set_type(rss_bpf_ctx->progs.tun_rss_steering_prog, BPF_PROG_TYPE_SOCKET_FILTER);
 
     if (rss_bpf__load(rss_bpf_ctx)) {
         trace_ebpf_error("eBPF RSS", "can not load RSS program");
-- 
2.7.4


