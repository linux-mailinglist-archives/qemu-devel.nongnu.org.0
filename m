Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE94E4633
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:42:52 +0100 (CET)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjT1-00054y-IQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:42:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPY-0002Sh-Ct; Tue, 22 Mar 2022 14:39:20 -0400
Received: from [2607:f8b0:4864:20::32c] (port=39817
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPW-0006aV-25; Tue, 22 Mar 2022 14:39:16 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso8701719otd.6; 
 Tue, 22 Mar 2022 11:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ZB+NAl/2RAHlVzCkyaNJO8uJxeA8ba7I+7zknXaYBA=;
 b=nJ4HdsEPPF82NbUDTmr/jH2o/k+3jSninw0hFeFyg4ohopES3k7mLH4ahQ81wO/slo
 F1C1iNap3qwUKGCYfB9Cxz3f95cmWBCopRTtcjARkPSEawN+i4tokJh1CmtmQCteTuCT
 i/wBubsYNz8L1ZtZ9PQSC9Skilyt+5twlKmNOoLDxvTyfdYVzEc2wJ7fjRDjwi1Aly/v
 m9+oqV4yMMIx/f/KJ7EHDuShkoAbuP72IYgMI1bLFn/wBPwoYa6JQBz4DngB/+KKTcgI
 cferyXqcuwsmCqZmDiAY8go1r27SZfH3ce3lTRkSB924ndxalm1w6sdw/DybMyIMpu9w
 tqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ZB+NAl/2RAHlVzCkyaNJO8uJxeA8ba7I+7zknXaYBA=;
 b=EQAbZacNMvdS+nLY+Es46Pb2hQLBmAzS9jIoJxqcpBrzXrCzgfjtEs7UIeoSkZ8kkV
 ZsOwmeDWrI72pRWdwx8vKalrbMbFB2w/qHB039KxgeVBYEvpMjyYCu/6UR4ewfEaTH6/
 w+R/K0s7fqEqJCflmYbloGeNo5lOBt9T+kI2LsY4JgfZSUfSgn2H9Ud6Dfokt9aeXHPR
 xCfqCKAurKftZz0eWem2LIID1IT6W9JEyuDX/ip8CnFhzhTKHMyk3SfLxKDC6IaPDB6M
 7TXgcUwoAC4lEu+3quBy2cxipjNf1KDf7yI7MkgwWII+GLAeU6u7ux9Tpu0Uv+iYcQx9
 dnFA==
X-Gm-Message-State: AOAM533TqxgRnpMH6OsxkyDi2+pKHEEaHu+kL7nz7eDHdc7L8SHNzpsp
 QATkz/7Bj4s3zm3FtkHDQSJtv4Ta80I=
X-Google-Smtp-Source: ABdhPJwy4FIL/f5d39UuE7FA6uS5JgBnXIcIGObKG4qj9jY63q0fJp6PXH097Rx3kFprbcixHj0MVA==
X-Received: by 2002:a05:6830:4121:b0:5c9:4d2b:7364 with SMTP id
 w33-20020a056830412100b005c94d2b7364mr11073718ott.366.1647974352681; 
 Tue, 22 Mar 2022 11:39:12 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm9109627otc.3.2022.03.22.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:39:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 4/4] hw/ppc: use qdev to register spapr_nvdimm vmsd
Date: Tue, 22 Mar 2022 15:38:54 -0300
Message-Id: <20220322183854.196063-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322183854.196063-1-danielhb413@gmail.com>
References: <20220322183854.196063-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the code a little more maintainable by using dc->vmsd to register
the vmstate instead of using vmstate_(un)register calls.

'instance_id' was being set to VMSTATE_INSTANCE_ID_ANY so there is no need
for qdev_set_legacy_instance_id() calls.

spapr_nvdimm_unrealize() was removed since it was only being used to
call vmstate_unregister().

Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..973e9d0fbe 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -866,14 +866,6 @@ static void spapr_nvdimm_realize(NVDIMMDevice *dimm, Error **errp)
     if (!is_pmem || pmem_override) {
         s_nvdimm->hcall_flush_required = true;
     }
-
-    vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY,
-                     &vmstate_spapr_nvdimm_states, dimm);
-}
-
-static void spapr_nvdimm_unrealize(NVDIMMDevice *dimm)
-{
-    vmstate_unregister(NULL, &vmstate_spapr_nvdimm_states, dimm);
 }
 
 static Property spapr_nvdimm_properties[] = {
@@ -888,8 +880,9 @@ static void spapr_nvdimm_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
     NVDIMMClass *nvc = NVDIMM_CLASS(oc);
 
+    dc->vmsd = &vmstate_spapr_nvdimm_states;
+
     nvc->realize = spapr_nvdimm_realize;
-    nvc->unrealize = spapr_nvdimm_unrealize;
 
     device_class_set_props(dc, spapr_nvdimm_properties);
 }
-- 
2.35.1


