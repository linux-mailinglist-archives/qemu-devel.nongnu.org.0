Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C94A66E5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:18:13 +0100 (CET)
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0XU-0000cN-9i
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEuos-00025Q-LD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:11:47 -0500
Received: from [2a00:1450:4864:20::635] (port=43864
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nEuop-00013R-5b
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:11:44 -0500
Received: by mail-ej1-x635.google.com with SMTP id d10so55205449eje.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qKAPQ925A3iagi2u2oRvWVOBWJHKtoWqMar3gEwKfkY=;
 b=egh0xZCeYE+L0yS7BKtY1KcZPuuGejrP7to+3cA1R8FM5ukdxKdzQyMK6EAZW0HZFM
 MhG3qNEzYOwRJEVBnauyWCpZ8Ik7Sqfzk57Zzwfdx/g/Lu4QteYHEGMVLSzZEhxF31Bs
 HkL2m9/emY2l8sDwh0PVfwiglBej1SRLbRtNnkLP0X+f0cPxr2WjFEUorqJzAzKOgimy
 iQIvXLk1vmZeiKYtPtbzj/kGKLBA1TL+gdqUKBBHkJNwRhRbl6TFbwOHhePSaUjLvuY6
 kyKNeN6B8+9JMI3RPHPrWdxAXl79BZVYZRogm+m6HSztUDj+2PydCti7TcMZSkOOelZd
 lg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qKAPQ925A3iagi2u2oRvWVOBWJHKtoWqMar3gEwKfkY=;
 b=J06eV9GlENO5pzjSlmLGFN3c8n4vTV10EmatgML3sQfu2egCEZ2Y4OZoLEpuMKcqFW
 7ktbyXb0fmYUCu+UCRGfvZZhhSuf1mGo7q3C816ryhY4VZCYrPn+094vPd/ObovoMuKp
 9LuuoMMetYG6BUozVSxX2/a0xoxmB9SqHNR+rMLL5pcOeQJpByPGLK+lZbHba+lDJH9B
 QaO4xVHeCfNP7N7Giro442t/H+S+sZXU6xD/GVCHEEs9SpjcWaxOzhkFDPD33aMPg0fo
 kBCrpBgATDPPfBGFs9COFvtxT2m0CqwChzTL/SVNAAL8Zql9mjG0zE0XuSVkqWz/Dn+M
 SZbw==
X-Gm-Message-State: AOAM533FOoTVdR7HlYJLh0ozLvNLufvNLkvvJw4DMci/I4Hs5P8vH3j5
 XiOk+mOaMEsMgT01p53sZ9i74g==
X-Google-Smtp-Source: ABdhPJzU23U5vpaEEkCCRfe8aX+Rhz/e0f6Fd1ygbTfLOTvIxok2Kt6zDGAI0LV4IObH9HuyagAWDw==
X-Received: by 2002:a17:907:1c02:: with SMTP id
 nc2mr22109723ejc.661.1643728297753; 
 Tue, 01 Feb 2022 07:11:37 -0800 (PST)
Received: from jwang-Latitude-5491.fkb.profitbricks.net
 (200116b845f5be00b5688dd60ec5628d.dip.versatel-1u1.de.
 [2001:16b8:45f5:be00:b568:8dd6:ec5:628d])
 by smtp.gmail.com with ESMTPSA id m22sm13444793ejn.194.2022.02.01.07.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:11:37 -0800 (PST)
From: Jack Wang <jinpu.wang@ionos.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/2] migration/rdma: set the REUSEADDR option for destination
Date: Tue,  1 Feb 2022 16:11:36 +0100
Message-Id: <20220201151136.52157-2-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201151136.52157-1-jinpu.wang@ionos.com>
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::635;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 01 Feb 2022 13:49:42 -0500
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

This allow address could be reused to avoid rdma_bind_addr error
out.

Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 migration/rdma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index 2e223170d06d..b498ef013c77 100644
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


