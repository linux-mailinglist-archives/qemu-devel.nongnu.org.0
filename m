Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0152C050C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:57:52 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khATc-0007cV-Gc
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO5-0000SF-Qq
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO4-000623-2y
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606132322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=3zlGE35tI2Q12+CZkH8qEKiDmM9/O3H1mobcJoSl7VU=;
 b=guKgEbGrXWNXDkfPU/DIkzzBnRrL66r8wBC+1Oiakuzidz+So7KKM/ieoHAKrhzCMLGmlI
 VuXHbZxTl3E2QSO8CsilAMy7Gm70oWhDYW2ZaCCFzPekdichnHqvW7wtVL3N96dSFt5nAi
 Pwl5aHXrLsqTBp9eb15EZ6qmt6sE/MY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-z4WwDO8pPuqJa85PEj2F-Q-1; Mon, 23 Nov 2020 06:52:00 -0500
X-MC-Unique: z4WwDO8pPuqJa85PEj2F-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B08DA5214;
 Mon, 23 Nov 2020 11:51:59 +0000 (UTC)
Received: from thuth.com (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C1F1A4D0;
 Mon, 23 Nov 2020 11:51:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/3] pc-bios: s390x: Ensure Read IPL memory is clean
Date: Mon, 23 Nov 2020 12:51:53 +0100
Message-Id: <20201123115155.232335-2-thuth@redhat.com>
In-Reply-To: <20201123115155.232335-1-thuth@redhat.com>
References: <20201123115155.232335-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

If, for example, we boot off a virtio device and chreipl to a vfio-ccw
device, the space at lowcore will be non-zero. We build a Read IPL CCW
at address zero, but it will have leftover PSW data that will conflict
with the Format-0 CCW being generated:

0x0: 00080000 80010000
       ------ Ccw0.cda
              -- Ccw0.chainData
                -- Reserved bits

The data address will be overwritten with the correct value (0x0), but
the apparent data chain bit will cause subsequent memory to be used as
the target of the data store, which may not be where we expect (0x0).

Clear out this space when we boot from DASD, so that we know it exists
exactly as we expect.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
Reviewed-by: Janosch Frank <frankja@de.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20201120160117.59366-2-farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/dasd-ipl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
index 0fc879bb8e..71cbae2f16 100644
--- a/pc-bios/s390-ccw/dasd-ipl.c
+++ b/pc-bios/s390-ccw/dasd-ipl.c
@@ -100,6 +100,9 @@ static void make_readipl(void)
 {
     Ccw0 *ccwIplRead = (Ccw0 *)0x00;
 
+    /* Clear out any existing data */
+    memset(ccwIplRead, 0, sizeof(Ccw0));
+
     /* Create Read IPL ccw at address 0 */
     ccwIplRead->cmd_code = CCW_CMD_READ_IPL;
     ccwIplRead->cda = 0x00; /* Read into address 0x00 in main memory */
-- 
2.18.4


