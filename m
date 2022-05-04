Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED294519DE6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:24:12 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmD76-00058g-1I
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBp8-0000Nm-DM
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBp3-0006Ex-3k
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8JNzGiaNDNHWs6xvMxyw01tzjQZKmtGczraMqhx/hI=;
 b=B+SObmLyRD7Str301o4xVmnMMx1hAND7tMXsF+S95tvir1NOkHq44eOtAZprwLJKpXRwmo
 r/ap/LCPsjHNXGOXoXRNTHoA7fNKusnpu3xPdId5ba0YyOu0Pp8/BMPepck3z7/Vihy7u+
 rBRKKzxF5Q2O/F4Cn6lASkrbcUkunEg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-z93h8aoKPyK3xkL3y294lA-1; Wed, 04 May 2022 06:01:19 -0400
X-MC-Unique: z93h8aoKPyK3xkL3y294lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D92A1D3236C;
 Wed,  4 May 2022 10:01:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D5FE403D18D;
 Wed,  4 May 2022 10:01:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Deason <adeason@sinenomine.net>
Subject: [PULL 3/7] qga/commands-posix: Fix listing ifaces for Solaris
Date: Wed,  4 May 2022 14:00:57 +0400
Message-Id: <20220504100101.564747-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Andrew Deason <adeason@sinenomine.net>

The code for guest-network-get-interfaces needs a couple of small
adjustments for Solaris:

- The results from SIOCGIFHWADDR are documented as being in ifr_addr,
  not ifr_hwaddr (ifr_hwaddr doesn't exist on Solaris).

- The implementation of guest_get_network_stats is Linux-specific, so
  hide it under #ifdef CONFIG_LINUX. On non-Linux, we just won't
  provide network interface stats.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Message-Id: <20220426195526.7699-4-adeason@sinenomine.net>
---
 qga/commands-posix.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index febb2ef0ffd6..c1e994f3e6ab 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2767,6 +2767,7 @@ guest_find_interface(GuestNetworkInterfaceList *head,
 static int guest_get_network_stats(const char *name,
                        GuestNetworkInterfaceStat *stats)
 {
+#ifdef CONFIG_LINUX
     int name_len;
     char const *devinfo = "/proc/net/dev";
     FILE *fp;
@@ -2822,6 +2823,7 @@ static int guest_get_network_stats(const char *name,
     fclose(fp);
     g_free(line);
     g_debug("/proc/net/dev: Interface '%s' not found", name);
+#endif /* CONFIG_LINUX */
     return -1;
 }
 
@@ -2887,8 +2889,11 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
                 }
 
             } else {
+#ifdef CONFIG_SOLARIS
+                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
+#else
                 mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-
+#endif
                 info->hardware_address =
                     g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                     (int) mac_addr[0], (int) mac_addr[1],
-- 
2.36.0.44.g0f828332d5ac


