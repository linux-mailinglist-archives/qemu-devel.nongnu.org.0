Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C440251473
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 10:40:31 +0200 (CEST)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAUVK-0007LZ-6d
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 04:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOl-0003aj-Nh
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kAUOj-0000bF-8f
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 04:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598344420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MS90DiHxyE9nZj4/9C5qkbvSLIfDfv2FmYcpGhlOBhk=;
 b=Nu6NeaxTqMlKEq/Z9irgKv6Jdhc3Fm6QiKYKFcGxgQ7m9IuvUEVVcg4929SEu5JPt5ltEr
 CGmfZLVDJQ17p7W2NfzvigDSNSALA2jPNW+yeQ6cejyDgj0jdMtKpXdokNn+xbYlMQnKmk
 3Vv2DwiqAKZZ6HLsK8JJ/XYRZiofv3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-I_EyF0igN0yBdK64PTpenQ-1; Tue, 25 Aug 2020 04:33:38 -0400
X-MC-Unique: I_EyF0igN0yBdK64PTpenQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153A9E75C;
 Tue, 25 Aug 2020 08:33:37 +0000 (UTC)
Received: from localhost (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C275D9CA;
 Tue, 25 Aug 2020 08:33:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/34] qcow2: Add offset_to_sc_index()
Date: Tue, 25 Aug 2020 10:32:47 +0200
Message-Id: <20200825083311.1098442-11-mreitz@redhat.com>
In-Reply-To: <20200825083311.1098442-1-mreitz@redhat.com>
References: <20200825083311.1098442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

For a given offset, return the subcluster number within its cluster
(i.e. with 32 subclusters per cluster it returns a number between 0
and 31).

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <56e3e4ac0d827c6a2f5f259106c5ddb7c4ca2653.1594396418.git.berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index eee4c8de9c..2503374677 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -581,6 +581,11 @@ static inline int offset_to_l2_slice_index(BDRVQcow2State *s, int64_t offset)
     return (offset >> s->cluster_bits) & (s->l2_slice_size - 1);
 }
 
+static inline int offset_to_sc_index(BDRVQcow2State *s, int64_t offset)
+{
+    return (offset >> s->subcluster_bits) & (s->subclusters_per_cluster - 1);
+}
+
 static inline int64_t qcow2_vm_state_offset(BDRVQcow2State *s)
 {
     return (int64_t)s->l1_vm_state_index << (s->cluster_bits + s->l2_bits);
-- 
2.26.2


