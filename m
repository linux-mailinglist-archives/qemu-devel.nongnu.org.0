Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2583839B41A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 09:38:34 +0200 (CEST)
Received: from localhost ([::1]:55434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp4PZ-0007KR-2c
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 03:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4Na-0004b8-8G
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lp4NY-0001RK-II
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 03:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622792187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raig29GrIon/2iMwX6+zqb4Odzi24ZdrKDJpidCsAcw=;
 b=ck5rhNynoFn70ECcqIge7ffiGSI6tkTrCi4UeBxPJGBM+R49FhquXr5eJ295I4h6CtTVMJ
 LlY8UJyEmt2W/ZyMSlU7cAHLt3dvSZDVXWQTZqutRXhnfBtoAaefYrNlzuPlB7Y72cizrX
 Ukv4iJJhCB3TBO+28c0rlKCFfpibWqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-HXaPYZH7M2Oae2h5XGwhfA-1; Fri, 04 Jun 2021 03:36:24 -0400
X-MC-Unique: HXaPYZH7M2Oae2h5XGwhfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24DAA8042B4;
 Fri,  4 Jun 2021 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-212.pek2.redhat.com
 [10.72.12.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 867A461008;
 Fri,  4 Jun 2021 07:36:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/7] net/tap: Added TUNSETSTEERINGEBPF code.
Date: Fri,  4 Jun 2021 15:36:11 +0800
Message-Id: <20210604073617.69622-2-jasowang@redhat.com>
In-Reply-To: <20210604073617.69622-1-jasowang@redhat.com>
References: <20210604073617.69622-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Additional code that will be used for eBPF setting steering routine.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-linux.h b/net/tap-linux.h
index 2f36d10..1d06fe0 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -31,6 +31,7 @@
 #define TUNSETQUEUE  _IOW('T', 217, int)
 #define TUNSETVNETLE _IOW('T', 220, int)
 #define TUNSETVNETBE _IOW('T', 222, int)
+#define TUNSETSTEERINGEBPF _IOR('T', 224, int)
 
 #endif
 
-- 
2.7.4


