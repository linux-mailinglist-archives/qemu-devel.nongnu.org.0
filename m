Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61010392654
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:26:36 +0200 (CEST)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7bP-0004oO-Ev
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7Zl-0002kh-Fp
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lm7Zj-00064z-VX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622089491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=HPynzdeO8BdRoN5xpoq7ZjQTmKMhksHSADXDDdIjYWc=;
 b=Ey1ZGUN15b5ZxMC8hMiF9OnK4TGhUX76rhhTL5kuxTs4PyxaetTrngIFcakV/9hDEFxVbK
 HryqcaoFvgB8EJJ1Ht72lspXnezbrJ8PlmAmif/NGZ2Mks7eNtqXrhtQC2tO/2mGQiziHN
 rSH6K9y3zzYYqDwm/07t3Pan5QaABTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-hMoX4lxvOIioguvrOCeunQ-1; Thu, 27 May 2021 00:24:49 -0400
X-MC-Unique: hMoX4lxvOIioguvrOCeunQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A290800D55;
 Thu, 27 May 2021 04:24:48 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF4DA5D6D3;
 Thu, 27 May 2021 04:24:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 3/3] tap-bsd: Remove special casing for older OpenBSD
 releases
Date: Thu, 27 May 2021 12:24:38 +0800
Message-Id: <1622089478-5426-4-git-send-email-jasowang@redhat.com>
In-Reply-To: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

OpenBSD added support for tap(4) 10 releases ago.

Remove the special casing for older releases.

Signed-off-by: Brad Smith <brad@comstyle.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap-bsd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/net/tap-bsd.c b/net/tap-bsd.c
index 77aaf67..59dfcdf 100644
--- a/net/tap-bsd.c
+++ b/net/tap-bsd.c
@@ -35,10 +35,6 @@
 #include <net/if_tap.h>
 #endif
 
-#if defined(__OpenBSD__)
-#include <sys/param.h>
-#endif
-
 #ifndef __FreeBSD__
 int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
              int vnet_hdr_required, int mq_required, Error **errp)
@@ -59,11 +55,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
         if (*ifname) {
             snprintf(dname, sizeof dname, "/dev/%s", ifname);
         } else {
-#if defined(__OpenBSD__) && OpenBSD < 201605
-            snprintf(dname, sizeof dname, "/dev/tun%d", i);
-#else
             snprintf(dname, sizeof dname, "/dev/tap%d", i);
-#endif
         }
         TFR(fd = open(dname, O_RDWR));
         if (fd >= 0) {
-- 
2.7.4


