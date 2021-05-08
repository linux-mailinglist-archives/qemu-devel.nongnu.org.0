Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F8377062
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 09:25:55 +0200 (CEST)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfHLW-0004hq-S7
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 03:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHFB-0007sh-4m
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lfHF9-0003ZD-Ky
 for qemu-devel@nongnu.org; Sat, 08 May 2021 03:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620458359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=6iGXpJlAat9YejBiU18a0vW8Li3Q/OcsQHXXjt3S7ew=;
 b=EakBe3cjFezgyqkX4mRpqCL/rBh8rxBfZduXpmwQy2hSziPjQ/LTG470gPJMwGAhdELzn6
 RvQD65PzddOrhVZKnwA75hY+wzpwizLVVHQpdM44xoVQCKY4o7bqX4Y+cub0oMuB699y7S
 VZFXMQbYm/I1Sl6gW6Ps2AFgSQSWhaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-JdxBlTssNpSG7xcKglPqtw-1; Sat, 08 May 2021 03:19:16 -0400
X-MC-Unique: JdxBlTssNpSG7xcKglPqtw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D11058015DB;
 Sat,  8 May 2021 07:19:15 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5CE5C5FD;
 Sat,  8 May 2021 07:19:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 10/10] tap-bsd: Remove special casing for older OpenBSD releases
Date: Sat,  8 May 2021 15:18:39 +0800
Message-Id: <1620458319-5670-11-git-send-email-jasowang@redhat.com>
In-Reply-To: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
References: <1620458319-5670-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
index 4f64f31..e45a6d1 100644
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


