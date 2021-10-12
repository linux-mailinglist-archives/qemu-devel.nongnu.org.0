Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F942A034
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 10:45:30 +0200 (CEST)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maDPd-0003HZ-JZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 04:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maD7t-0006hN-Lx
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maD7s-0003aW-8s
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 04:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634027227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8sgqNTHw5StkvQlbt304JVdKk67PQT7dU+o85crv/H4=;
 b=aHcWmtnKONVx2Igw5oqbIVloGlwK0hAO584qn9mtzqLGht/4zmLFmELcpzZdfuZzZgGb5O
 rm5BrSqzmEAvOFYhrWqp0+6Uw8+AiZZrEHGku1tNRqsPAzobEq8IYN/PXNilL+GiyA86iU
 l21CxeA23NfFprI6M6JXyT4MwYcSA4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-j4892QjBM1memhWpUD1DKg-1; Tue, 12 Oct 2021 04:27:05 -0400
X-MC-Unique: j4892QjBM1memhWpUD1DKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A191006AA5;
 Tue, 12 Oct 2021 08:27:04 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A50AF1002D67;
 Tue, 12 Oct 2021 08:27:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] block/vpc: Add a sanity check that fixed-size images have the
 right type
Date: Tue, 12 Oct 2021 10:27:02 +0200
Message-Id: <20211012082702.792259-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code in vpc.c uses BDRVVPCState->footer.type in various places
to decide whether the image is a fixed-size (VHD_FIXED) or a dynamic
(VHD_DYNAMIC) image. However, we never check that this field really
contains VHD_FIXED if we detected a fixed size image in vpc_open(),
so a wrong value here could cause quite some trouble during runtime.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/vpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index dc0ad9fcdc..ec55d69360 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -286,7 +286,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
         if (ret < 0) {
             goto fail;
         }
-        if (strncmp(footer->creator, "conectix", 8)) {
+        if (strncmp(footer->creator, "conectix", 8) ||
+            be32_to_cpu(footer->type) != VHD_FIXED) {
             error_setg(errp, "invalid VPC image");
             ret = -EINVAL;
             goto fail;
-- 
2.27.0


