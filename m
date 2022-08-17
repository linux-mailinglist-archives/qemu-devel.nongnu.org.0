Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C85977BF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:19:05 +0200 (CEST)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPVI-0005LF-GM
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIz-00033K-C8
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIx-0000HX-R7
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fnm7M7bNyw8gmdF3r4qZkT/IC0P8GJdi7SQtbAXfvhw=;
 b=JrtpTLhUTcvbw0s2KGM0Lv8QRyRA2KAGXtm8cuh9IfA2EZ6yOQ/+TnyMF4U0JoaLjdaFq8
 3GWt4Q64BNFICem+tjhECV1cEjKI121Uu3jh/oJDvFGmsn1iu5m62ezequ50QmyaVDUgor
 cT44dLqWAcUAmWCjhrQhxHqpUBMgTZA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-PgFpZILTNRmbOHSqWsvf9g-1; Wed, 17 Aug 2022 16:06:14 -0400
X-MC-Unique: PgFpZILTNRmbOHSqWsvf9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 a17-20020a05600c349100b003a545125f6eso1539934wmq.4
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=fnm7M7bNyw8gmdF3r4qZkT/IC0P8GJdi7SQtbAXfvhw=;
 b=eiTYlOz4B/+mDTGi1u4Jbtc3brX/NfSUaZk2hTztFlf6fdwfTFujHC7kH+QHiC46dM
 PTgBS+eZBkOHAu6lJXLVBjaHftB2xlmpJzaiHHFH1LxHL95p2pcNcgWtvQGQqsgzzneK
 aYMIyIskG9hXxEvPN3bsDeXExgkH2TjgPyldnp5NUSTLLFpXIR2/+15YYvDHgUBL3Cop
 PBHPSFLT40MTu3sQvSqD5GHhVLWUrgMRGKEpSCyLp1aU6DSzxolvtSnLZmtGopmqNfDP
 ulBLqTPadzvS0yUhGBvS267W48zV3sD1lchhvdgNeyjm4R3ZDrU9dhZPi5Nlt1ObNvMk
 +dmQ==
X-Gm-Message-State: ACgBeo1xYcbAWdBIUuMoy9SgYNFeLBI2HZPOaH3C+5/8Rea4oXIocyoy
 EaSlbnVujaouRe9sHzuviK1KgX7bpdC7DcR95asj46XZJw8IY86IOci6qYOmTRjI9pxg0/Lhfu8
 0mqnLNlN3G9+cVI1JZBegu2sj+r3Twi+E4MOBDHCItJN9F4tpaj6xv3V6Xpys
X-Received: by 2002:a5d:45c1:0:b0:225:2803:e791 with SMTP id
 b1-20020a5d45c1000000b002252803e791mr2091118wrs.539.1660766773281; 
 Wed, 17 Aug 2022 13:06:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6v7dEp8v3+tEzCRIMpcJ7tkwEbDhXZVW3+9H24uDarmI4d7ksQQO7aWCM5yK75mZ0lHOlXEg==
X-Received: by 2002:a5d:45c1:0:b0:225:2803:e791 with SMTP id
 b1-20020a5d45c1000000b002252803e791mr2091106wrs.539.1660766772928; 
 Wed, 17 Aug 2022 13:06:12 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b0021e4edba1e5sm13760483wrt.111.2022.08.17.13.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:12 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 06/12] hw/cxl: Fix memory leak in error paths
Message-ID: <20220817200536.350795-7-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Use g_autofree to free the CXLFixedWindow structure if an
error occurs in configuration before we have added to
the list (via g_steal_pointer())

Fix Coverity CID: 1488872

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220808122051.14822-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 483d8eb13f..faa68ef038 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -26,7 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
                                            Error **errp)
 {
-    CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
+    g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
     strList *target;
     int i;
 
@@ -64,7 +64,8 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
         fw->enc_int_gran = 0;
     }
 
-    cxl_state->fixed_windows = g_list_append(cxl_state->fixed_windows, fw);
+    cxl_state->fixed_windows = g_list_append(cxl_state->fixed_windows,
+                                             g_steal_pointer(&fw));
 
     return;
 }
-- 
MST


