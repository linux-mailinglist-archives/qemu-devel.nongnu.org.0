Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222534BB2BD
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 07:57:50 +0100 (CET)
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKxDA-0004tX-O9
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 01:57:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nKx8F-0003fE-58
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 01:52:43 -0500
Received: from [2a00:1450:4864:20::535] (port=36839
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nKx8B-0004gm-3L
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 01:52:42 -0500
Received: by mail-ed1-x535.google.com with SMTP id cm8so4130555edb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 22:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q4b8+cVjcRileKxrSlELVlgdaMDz31UhUctSWRv9rA=;
 b=Fur8FUnQhZSRz9xdbUwg8kNJXTuS6Pfmz6gpNjVFAytYHwILBERdpm0z3WydlSQJvV
 ZXqXW16blB60yPUsVq/OB/otWhvHU3Kf4pQO+5xiskC3DmB4OUW7k3b1S1aSZuL+meFe
 aaMQmf2Y4ITWcxKy7oRlaxri3MN/vWvPfALeD+vcKcSL7clZf0wuM0oRhgzVkDDeLlLC
 cqVEjAGrDGkxOdXO9meW0ScAsrdsz0FQ6LKGJBguGEgaaTgiEBFNvdvhal0FsCrGT77T
 oZU3OrGMZwrVJ5MbXYJImk4+irk6rR5GwdfJ1P1e7d2rkhOndYXkcZ15JkMeo5nFR88+
 fHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q4b8+cVjcRileKxrSlELVlgdaMDz31UhUctSWRv9rA=;
 b=P06jJqSLqER26hIe7cuYYnB58av+QVLBWdD+HJM7z3bK+NXMFBdc1gSnOR5xUsd6cm
 XgFh/5i58MjE3l5UcpdrYi55tWa8k7iGa3GWJqlQPBt2hk4jpNmcAkVoeXnlxUt9a+do
 DzQqCygUtps9lB6B7ab4SnnhX9B5d450o9ECMhdu3xKq4+3Qk4ik5TqQSHbGyu9zUyTI
 wlCSRx1ZbT8FYcsZZCkSICdx24h/I0p0jnee4pcqSi0HwAndOX2tqqYhE+gInWXfDaeG
 D2O/v/Y/TO66HZJr747EFAcJtQXaAln/9Nt+9czwlrSxJykfPnVjWkI10VA3/GuDqwiO
 Rr4Q==
X-Gm-Message-State: AOAM533KH0TavjHS4Bcpxy0zCTvICIfDLOWo9HHkyE9ZLD/Xdko6AS1k
 ck8Vg0+KvAm8hhDuH7kK3DJZpw==
X-Google-Smtp-Source: ABdhPJw4SBRlOTGLyvaMGKKjdaBl8fKV8UZdYqQvDRzqCvWMYN5h+qSFTeSmIc7WtC7H4JsWV/b2tw==
X-Received: by 2002:a05:6402:13c2:b0:410:8140:3178 with SMTP id
 a2-20020a05640213c200b0041081403178mr6507440edx.299.1645167155976; 
 Thu, 17 Feb 2022 22:52:35 -0800 (PST)
Received: from jwang-Latitude-5491.fritz.box
 (200116b845b0f800acc0184cb7906b69.dip.versatel-1u1.de.
 [2001:16b8:45b0:f800:acc0:184c:b790:6b69])
 by smtp.gmail.com with ESMTPSA id q5sm1888442ejc.115.2022.02.17.22.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 22:52:35 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v3] migration/rdma: set the REUSEADDR option for destination
Date: Fri, 18 Feb 2022 07:52:34 +0100
Message-Id: <20220218065234.7630-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::535;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---
v3: add reviewed-by tags from David and Pankaj.
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


