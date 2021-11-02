Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931224430B9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:45:57 +0100 (CET)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhv2y-0004MN-PQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhuga-0006af-Fh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mhugX-000399-PW
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635862965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxPGQDvnz7wLbeXSF54pf2XeNqKU0g81EeWn83j5DxQ=;
 b=fSTeD7U1cobBFVRHFHIpww2EPdhrAkBGAj7uGpOf0f5HPlLb4C1iOJpt7cUAuHW6Opaszj
 TFFQafab+nDXulrr18TSJah//5SBWpGix9fY7Covb+Oe7RKI+utpVEf3oPBcxmVGe/Nggc
 14pPBlCELYkgHT1w04eVY4toqXcAJ40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-h6OqSs70Pgm13H-hGbQ7rw-1; Tue, 02 Nov 2021 10:22:44 -0400
X-MC-Unique: h6OqSs70Pgm13H-hGbQ7rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E847E876ECA;
 Tue,  2 Nov 2021 14:22:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 900B95D705;
 Tue,  2 Nov 2021 14:22:42 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/4] block/vpc: Add a sanity check that fixed-size images have
 the right type
Date: Tue,  2 Nov 2021 15:22:19 +0100
Message-Id: <20211102142219.697650-5-hreitz@redhat.com>
In-Reply-To: <20211102142219.697650-1-hreitz@redhat.com>
References: <20211102142219.697650-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The code in vpc.c uses BDRVVPCState->footer.type in various places
to decide whether the image is a fixed-size (VHD_FIXED) or a dynamic
(VHD_DYNAMIC) image. However, we never check that this field really
contains VHD_FIXED if we detected a fixed size image in vpc_open(),
so a wrong value here could cause quite some trouble during runtime.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211012082702.792259-1-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/vpc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index 1b4c7333af..297a26262a 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -276,7 +276,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
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
2.31.1


