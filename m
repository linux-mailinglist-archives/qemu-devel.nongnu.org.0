Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7B4AD557
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:11:19 +0100 (CET)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNSw-0002K5-KC
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nHMIq-0005tY-I4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:56:49 -0500
Received: from [2a00:1450:4864:20::62b] (port=47055
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nHMIo-0007ay-TA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:56:48 -0500
Received: by mail-ej1-x62b.google.com with SMTP id o12so50138657eju.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cbc6DdGx6xJXUW32g24p9jSaFymq97peiTQgn/RSNKk=;
 b=jLX/k9U5hV7Opo+1FYEt82adqivzjbIGzh2dwc31uPx0lbiYcIliQvi4DD+2/G59NZ
 BgPI8fqHhnFSjsu/iEOjuEECwRnWlNadBKAH4DE848JcQ/IwNU9vVKPgyH7zUrkcjW4f
 fgk/wQucNAdmiYRElOHRsVg77FA4U3Ggd2Yle7IQ9+qJHNQ8kb1Ofb4MnuKYpKyTPCpA
 QcvoOCfXVGdx1/T5RvzXFUJrS5xiSSgAdY8D7CQhpCLM3WUeElxmR01+qzk8EjZ7yt4k
 TBVeAQNDAYWxOL36ep5Jsv9UGvAKu0fxPosTWHL5prDDGcmOV/+3nvjE7RnpPk66JQbw
 WVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cbc6DdGx6xJXUW32g24p9jSaFymq97peiTQgn/RSNKk=;
 b=jxeFmHxh2mG4yzKQF2/gT5kjFEeBHcZYVwTxsJ8XbWeWSO866S8jS0wTOiOTZx75Yo
 cxMetGcP4L57NtNEldU17wOzoPMozG/REAdjf1chHg0ujWDULqhvXvXAdClZ+r869d5x
 99zaBAnTRQP+ohthdY/popoE6WhS6oUFaDIQRbBw9ofnmxe329Nl1RLNjcdivKZSl2EQ
 mcf/dZU6hr9/tyyupkFIxb4sXptOIRUxY+1K1M18q5KqCggkTLUO1njnKlXrrS7r9lxz
 F58byWXDjczYo5xgsR1ATZ4eTBwmQpMaMrkz7xJRmfULgVUWks/AQNnHZ/bv7iki7v/p
 M2Dg==
X-Gm-Message-State: AOAM530f3KMWkANSGSecUWdHl6hsN5gv3wF0Trz+VCJ4IiploCYcs9cz
 0pPhFqKBVsOwYJ1hHTPxVrLKWA==
X-Google-Smtp-Source: ABdhPJwwqWy6Bgqv+U0reLebxEVe+dsL8CI2iwhdzGQ1rNRidtNNdIgfaDzgzyTRoXiDqegUxrXZRQ==
X-Received: by 2002:a17:906:6a14:: with SMTP id
 qw20mr3010110ejc.560.1644310601353; 
 Tue, 08 Feb 2022 00:56:41 -0800 (PST)
Received: from jwang-Latitude-5491.fritz.box
 (200116b845a7db00780fd4b17e2aabf1.dip.versatel-1u1.de.
 [2001:16b8:45a7:db00:780f:d4b1:7e2a:abf1])
 by smtp.gmail.com with ESMTPSA id j2sm4497908ejc.223.2022.02.08.00.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:56:40 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v2] migration/rdma: set the REUSEADDR option for destination
Date: Tue,  8 Feb 2022 09:56:40 +0100
Message-Id: <20220208085640.19702-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::62b;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, pankaj.gupta@ionos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We hit following error during testing RDMA transport:
in case of migration error, mgmt daemon pick one migration port,
incoming rdma:[::]:8089: RDMA ERROR: Error: could not rdma_bind_addr

Then try another -incoming rdma:[::]:8103, sometime it worked,
sometimes need another try with other ports number.

Set the REUSEADDR option for destination, This allow address could
be reused to avoid rdma_bind_addr error out.

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
v2: extend commit message as discussed with Pankaj and David
---
 migration/rdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index c7c7a384875b..663e1fbb096d 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
     char ip[40] = "unknown";
     struct rdma_addrinfo *res, *e;
     char port_str[16];
+    int reuse = 1;
 
     for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
         rdma->wr_data[idx].control_len = 0;
@@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
         goto err_dest_init_bind_addr;
     }
 
+    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
+			  &reuse, sizeof reuse);
+    if (ret) {
+        ERROR(errp, "Error: could not set REUSEADDR option");
+        goto err_dest_init_bind_addr;
+    }
     for (e = res; e != NULL; e = e->ai_next) {
         inet_ntop(e->ai_family,
             &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
-- 
2.25.1


