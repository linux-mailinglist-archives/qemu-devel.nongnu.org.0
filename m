Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78563385B1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:18:40 +0100 (CET)
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKb8B-0001v4-UH
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6M-0008Sq-6N
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6K-0005hb-JH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615529804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=zW9hyJYHJ9pE8jgpFjlmvcLUuE9o200mHrxveLpfK2o=;
 b=OmIMKN40ayNPYV8AyVWxadaVHgTxpkJTs6bI6KXsUtFRxElmwFSIK80mW13m2Nu1rBKk+X
 1LkVbCB/ikYyOSWM6HFGJ/OXitE9Brmdj3IravizFBHmZ7Ed+81kWsurCrfRQnk1Dma8Hr
 yMXV0dbWCG6vI76ez5GleKK4ToT6j8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-oOL-oKYgOOCO9rTpnrFiJA-1; Fri, 12 Mar 2021 01:16:40 -0500
X-MC-Unique: oOL-oKYgOOCO9rTpnrFiJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD3918397A0;
 Fri, 12 Mar 2021 06:16:39 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A22C1101F501;
 Fri, 12 Mar 2021 06:16:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 04/16] net: unbreak well-form id check for "-nic"
Date: Fri, 12 Mar 2021 14:16:14 +0800
Message-Id: <1615529786-30763-5-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The auto genreated id for "-nic" has "_" prefix which can't satisfy
the well-formed id check that is introduced by
871579b9834aca517dc2d4941691a1d2082db6f2 ("net: validate that ids are
well formed"). Fix this by simply removing the "__" prefix.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index d36729f..254b42f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1479,7 +1479,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     /* Create an ID if the user did not specify one */
     nd_id = g_strdup(qemu_opts_id(opts));
     if (!nd_id) {
-        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
+        nd_id = g_strdup_printf("org.qemu.nic%i", idx);
         qemu_opts_set_id(opts, nd_id);
     }
 
-- 
2.7.4


