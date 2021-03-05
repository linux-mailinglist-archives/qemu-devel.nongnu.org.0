Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F032EFA6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:06:57 +0100 (CET)
Received: from localhost ([::1]:58316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICye-0008K1-DM
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnr-0004B2-I3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lICnn-0003Qp-Mw
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:55:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614959743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PkcxQQ27I+X6bzp8WA4kdRMdHBJ6WypDXMQPEb0lOE=;
 b=ITdTaGSgbIrcEySQ1MugsLvT5V2vbg5C2YgA1x2MhF9CprTHkM7e17c7TYYAlGnv07YDO1
 BCFxcEVCKzMWI8eaarW09zDxub1Egeour9r5P2G11dZeuOtXoi/rqJzr53He+hkFlvjVzP
 YDpvTeCBXlfQBFkKWg/60bmOILwKzi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-SlYpOIiEOfaohvm-bFly8A-1; Fri, 05 Mar 2021 10:55:38 -0500
X-MC-Unique: SlYpOIiEOfaohvm-bFly8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5B0EC1A5;
 Fri,  5 Mar 2021 15:55:37 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D3D16A046;
 Fri,  5 Mar 2021 15:55:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/8] css: SCHIB measurement block origin must be aligned
Date: Fri,  5 Mar 2021 16:55:15 +0100
Message-Id: <20210305155517.1604547-7-cohuck@redhat.com>
In-Reply-To: <20210305155517.1604547-1-cohuck@redhat.com>
References: <20210305155517.1604547-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Pierre Morel <pmorel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pierre Morel <pmorel@linux.ibm.com>

The Measurement Block Origin inside the SCHIB is used when
Measurement Block format 1 is in used and must be aligned
on 64 bytes otherwise an operand exception is recognized
when issuing the Modify Sub CHannel (MSCH) instruction.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1613741973-3711-2-git-send-email-pmorel@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/ioinst.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index a412926d2780..1ee11522e150 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -121,6 +121,12 @@ static int ioinst_schib_valid(SCHIB *schib)
     if (be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_XMWME) {
         return 0;
     }
+    /* for MB format 1 bits 26-31 of word 11 must be 0 */
+    /* MBA uses words 10 and 11, it means align on 2**6 */
+    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
+        (be64_to_cpu(schib->mba) & 0x03fUL)) {
+        return 0;
+    }
     return 1;
 }
 
-- 
2.26.2


