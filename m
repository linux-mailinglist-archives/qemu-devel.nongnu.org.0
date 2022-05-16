Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C352936D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:13:17 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqixo-00057y-Mh
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhku-0003jV-Du
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkt-00077v-11
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0GTH59JWKOeRS7zqFMCuFUwNlALdgVyHqFli+h6OjD8=;
 b=greGScmkHdZaeh/U3oLsc8Jgj4eoDy2m6aJPX1XdT1qphgCIS9ZT+V1Lr8zK/ibn9FdrtA
 IDwtpnlcVXrXUwwJiPSXY77Dwh1j6/L7d32dyvf21oNXkyqbpX8Jdr+zPmHtrP89GHdTSu
 Ef7b3hynAEznNDKTUqMn09bS+AdUBvE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-d1gBLSsVNZCvK-GwPE0OXg-1; Mon, 16 May 2022 16:55:49 -0400
X-MC-Unique: d1gBLSsVNZCvK-GwPE0OXg-1
Received: by mail-ej1-f71.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6354566ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0GTH59JWKOeRS7zqFMCuFUwNlALdgVyHqFli+h6OjD8=;
 b=jI0hCqdiZ4YWDtHSeFVLaQ6MwMcLtGy38KvIj8oq0B/8WDO4JE6ioRH4EkrWRG/OaF
 dZ2vdvt2kS7YCRfiwSGUAkHehun9B45aCdle9MB6NBa1NzIz87T7DvEYs8LoLjY5l+k9
 g6s4gOc3SM8QoAFs+8a5/Z8dicVtqn5CfXtICgaRqNRAUU9uRtqEeYmTY4cu2PPmkn2C
 skrYJ4aWJriF67/qCOFzmRiT4aiOR2eYLiv3s1GcX9VxZA1DisM7nbFBlygpCknR11JV
 Cez5P8hJX1aXHCE84yU4MEYZUIpjno1Ccr62Mv6cz7gV6NgyTS4unfr4Wf1nHfOtibJo
 saiQ==
X-Gm-Message-State: AOAM530XKoXNudrd1B1Im9mNuDlaI1Y45DfYiFQOBUxnWjcklq9GJhgt
 PfCjYoySOH9cN7gNieFLB6tkIEGmChKDxtNQPBsRi1lfJ55GF+5bfrEl2yvp9JDu9rumzDAnE/P
 CuCekMhIuGzTeIEOttsug2TQTj/5nWk3nA5y3SdQfzUsnrcKCmwn1anrOAqvm
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr17225709ejc.184.1652734547840; 
 Mon, 16 May 2022 13:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBBAMNY6EeOvg/iX7gDfq2pxJZQtkacmLL600AjHr11SkMyxEozmRekYmq5Sr7rzDgR3G5gg==
X-Received: by 2002:a17:907:6e1d:b0:6f4:60e6:9fa6 with SMTP id
 sd29-20020a1709076e1d00b006f460e69fa6mr17225692ejc.184.1652734547626; 
 Mon, 16 May 2022 13:55:47 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 el3-20020a056402360300b0042aba7ed532sm1127621edb.41.2022.05.16.13.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:47 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v2 81/86] vhost-vdpa: fix improper cleanup in
 net_init_vhost_vdpa
Message-ID: <20220516204913.542894-82-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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

From: Si-Wei Liu <si-wei.liu@oracle.com>

... such that no memory leaks on dangling net clients in case of
error.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-4-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1e9fe47c03..df1e69ee72 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
 err:
     if (i) {
-        qemu_del_net_client(ncs[0]);
+        for (i--; i >= 0; i--) {
+            qemu_del_net_client(ncs[i]);
+        }
     }
     qemu_close(vdpa_device_fd);
 
-- 
MST


