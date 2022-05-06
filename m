Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A117551D91B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:27:57 +0200 (CEST)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmxzw-0006MK-HR
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmxxU-0004oV-HW
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:25:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:56328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmxxR-0001Xs-Am
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:25:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651843520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZ+mtQ/yxeOqRCkBzqGUVFxvyihd4uT2Lefl+rkpUx0=;
 b=HxcySoe2pWG11ApT3HbNs3etAQ/XrvgSwB3V1b9a2oMJCBsW6Z9MKdb4CaXRifP9jD7dsX
 G8Nt0E1v2IK8YA0IghgBwh+V6+GyC466vuYPXG8rfFwLEQrTGvtwYOboCjOXvuGZgoS4sT
 wc0FUsBEFmvQbWxeH0ejlP3t6tex6Ms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-h4xLOiqOOd2ZSOpOoc294Q-1; Fri, 06 May 2022 09:25:19 -0400
X-MC-Unique: h4xLOiqOOd2ZSOpOoc294Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6F5A2999B50;
 Fri,  6 May 2022 13:25:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84DDC403156;
 Fri,  6 May 2022 13:25:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Cc: stefanb@linux.vnet.ibm.com,
	cohuck@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v5 1/2] sysemu: tpm: Add a stub function for TPM_IS_CRB
Date: Fri,  6 May 2022 15:25:09 +0200
Message-Id: <20220506132510.1847942-2-eric.auger@redhat.com>
In-Reply-To: <20220506132510.1847942-1-eric.auger@redhat.com>
References: <20220506132510.1847942-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.74; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In a subsequent patch, VFIO will need to recognize if
a memory region owner is a TPM CRB device. Hence VFIO
needs to use TPM_IS_CRB() even if CONFIG_TPM is unset. So
let's add a stub function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
---
 include/sysemu/tpm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 68b2206463c..fb40e30ff60 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -80,6 +80,12 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
 #define tpm_init()  (0)
 #define tpm_cleanup()
 
+/* needed for an alignment check in non-tpm code */
+static inline Object *TPM_IS_CRB(Object *obj)
+{
+     return NULL;
+}
+
 #endif /* CONFIG_TPM */
 
 #endif /* QEMU_TPM_H */
-- 
2.35.1


