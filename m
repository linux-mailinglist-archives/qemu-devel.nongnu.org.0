Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F572F118B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:35:06 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvTV-0004Ir-JW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvQd-00024X-Qq
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1kyvQY-0006kY-Ja
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610364721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=vkyynJjgaTFyNhQ8kiTv/cdtlQ7wy4Pps2zJPjXPrRc=;
 b=clS5dHmgro/VCwOBNobZN3M+ZRV1xXG1GjtTqeIjiNVlzl6QYRvUSKH4AZ1TRVVYfGrrB3
 P+Uv/pUmPiwFGHbM9yGdHgcDNTgIi+4GrrWnML1IPloZVwqGse7bkwRby7shWOXPrvbGIz
 ypmuEoLmTBXoHE4155Ut8LoD1kCuk04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Xp2seipdNVCtl8IIdDSm3A-1; Mon, 11 Jan 2021 06:30:42 -0500
X-MC-Unique: Xp2seipdNVCtl8IIdDSm3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2248049C2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:40 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22911972B
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:30:39 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [RHEL7 qemu-kvm PATCH 1/3] Fix net.c warning on GCC 11
Date: Mon, 11 Jan 2021 12:30:35 +0100
Message-Id: <25f6c760c09c2238ad9bdaab97e4ae13bf5af339.1610364304.git.mrezanin@redhat.com>
In-Reply-To: <cover.1610364304.git.mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

When building qemu with GCC 11, compiling eth.c file produce following warning:

   warning: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Warray-bounds]

This caused by retyping from ip6_ext_hdr to ip6_ext_hdr_routing that has more
attributes.

As this usage is expected, suppress the warning temporarily through the function
using this retyping.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 net/eth.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/eth.c b/net/eth.c
index 1e0821c5f8..b9bdd0435c 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -405,6 +405,8 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                         struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Warray-bounds"
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
     if ((rthdr->rtype == 2) &&
@@ -426,6 +428,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     }
 
     return false;
+#pragma GCC diagnostic pop
 }
 
 static bool
-- 
2.18.4


