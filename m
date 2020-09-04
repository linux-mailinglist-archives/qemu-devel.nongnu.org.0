Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A125CFFA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:51:32 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2l9-0000ac-LW
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hZ-0002dB-Dq; Thu, 03 Sep 2020 23:47:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hU-0004ux-M2; Thu, 03 Sep 2020 23:47:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsq19Pfz9sVq; Fri,  4 Sep 2020 13:47:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191247;
 bh=x72XkQdCKwl+nzDKBcPHb5FwlHCdlLNuP3qoPMFwXdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jEeTZevWfLWBxC2MzJQkPwFtW0OET3L4NvtIKOlOU06QG6pDzJsbL1FaEBe+gmTRL
 ekamfmoQAh0HWubs73OHX8NTr+qPaHurKPYD3+keH6VUH/HMewhdnZXpFw8MocIfwc
 eXxo9STyhdb+7+hI8HA33k9eMewyVcawPqgXombU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 12/30] ppc/spapr_nvdimm: use g_autofree in
 spapr_nvdimm_validate_opts()
Date: Fri,  4 Sep 2020 13:47:01 +1000
Message-Id: <20200904034719.673626-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Since we're using the string just once, just use g_autofree and
avoid leaking it without calling g_free().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200825215749.213536-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_nvdimm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 81410aa63f..9a20a65640 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -33,7 +33,7 @@
 void spapr_nvdimm_validate_opts(NVDIMMDevice *nvdimm, uint64_t size,
                                 Error **errp)
 {
-    char *uuidstr = NULL;
+    g_autofree char *uuidstr = NULL;
     QemuUUID uuid;
     int ret;
 
@@ -54,7 +54,6 @@ void spapr_nvdimm_validate_opts(NVDIMMDevice *nvdimm, uint64_t size,
                                       &error_abort);
     ret = qemu_uuid_parse(uuidstr, &uuid);
     g_assert(!ret);
-    g_free(uuidstr);
 
     if (qemu_uuid_is_null(&uuid)) {
         error_setg(errp, "NVDIMM device requires the uuid to be set");
-- 
2.26.2


