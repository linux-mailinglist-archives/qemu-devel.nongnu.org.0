Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18664B40A4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:12:48 +0100 (CET)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSjH-0000Gf-Ri
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:12:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXd-0006PJ-Bb
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXZ-00009t-SS
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X5GAbeGove+Hlvc9LCxnF1xG66xcz91B8MxnptOPyYY=;
 b=IGBADzxFjg6GP2a2mdA85ViUjTGiLbCA5xCLsWgWQ/sxxRKydsJiSN9NGmlZy7J/GshHgx
 Gr5CQOlTa+a7WmwZhVRU0NBZ/SRkadX4xQb7jFramzsZ+V8FoCWkf3UhhgwPriXC60NwY0
 3orUS+wVR7UhkJNIauR2Z/BsaIY7/RI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-GwMfxJBUMGe1EmT8fy5Ivw-1; Sun, 13 Feb 2022 23:00:38 -0500
X-MC-Unique: GwMfxJBUMGe1EmT8fy5Ivw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63512F26;
 Mon, 14 Feb 2022 04:00:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58C83610A6;
 Mon, 14 Feb 2022 04:00:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 3/8] net: Fix uninitialized data usage
Date: Mon, 14 Feb 2022 11:59:52 +0800
Message-Id: <20220214035957.71339-4-jasowang@redhat.com>
In-Reply-To: <20220214035957.71339-1-jasowang@redhat.com>
References: <20220214035957.71339-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Cc: Patrick Venture <venture@google.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Peter Foley <pefoley@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Foley <pefoley@google.com>

e.g.
1109 15:16:20.151506 Uninitialized bytes in ioctl_common_pre at offset 0 inside [0x7ffc516af9b8, 4)
 1109 15:16:20.151659 ==588974==WARNING: MemorySanitizer: use-of-uninitialized-value
 1109 15:16:20.312923     #0 0x5639b88acb21 in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c:183:9
 1109 15:16:20.312952     #1 0x5639b88afd66 in net_tap_fd_init third_party/qemu/net/tap.c:409:9
 1109 15:16:20.312954     #2 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
 1109 15:16:20.312956     #3 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
 1109 15:16:20.312957     #4 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
 1109 15:16:20.312958     #5 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
 1109 15:16:20.312960     #6 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
 1109 15:16:20.312961     #7 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
 1109 15:16:20.312962     #8 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
 1109 15:16:20.312964     #9 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
 1109 15:16:20.312965     #10 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
 1109 15:16:20.312967     #11 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
 1109 15:16:20.312968     #12 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
 1109 15:16:20.312969     #13 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
 1109 15:16:20.312970
 1109 15:16:20.312975   Uninitialized value was stored to memory at
 1109 15:16:20.313393     #0 0x5639b88acbee in tap_probe_vnet_hdr_len third_party/qemu/net/tap-linux.c
 1109 15:16:20.313396     #1 0x5639b88afd66 in net_tap_fd_init third_party/qemu/net/tap.c:409:9
 1109 15:16:20.313398     #2 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
 1109 15:16:20.313399     #3 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
 1109 15:16:20.313400     #4 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
 1109 15:16:20.313401     #5 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
 1109 15:16:20.313403     #6 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
 1109 15:16:20.313404     #7 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
 1109 15:16:20.313405     #8 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
 1109 15:16:20.313407     #9 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
 1109 15:16:20.313408     #10 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
 1109 15:16:20.313409     #11 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
 1109 15:16:20.313410     #12 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
 1109 15:16:20.313412     #13 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
 1109 15:16:20.313413
 1109 15:16:20.313417   Uninitialized value was stored to memory at
 1109 15:16:20.313791     #0 0x5639b88affbd in net_tap_fd_init third_party/qemu/net/tap.c:400:26
 1109 15:16:20.313826     #1 0x5639b88b2d1b in net_init_tap_one third_party/qemu/net/tap.c:681:19
 1109 15:16:20.313829     #2 0x5639b88b16a8 in net_init_tap third_party/qemu/net/tap.c:912:13
 1109 15:16:20.313831     #3 0x5639b8890175 in net_client_init1 third_party/qemu/net/net.c:1110:9
 1109 15:16:20.313836     #4 0x5639b888f912 in net_client_init third_party/qemu/net/net.c:1208:15
 1109 15:16:20.313838     #5 0x5639b8894aa5 in net_param_nic third_party/qemu/net/net.c:1588:11
 1109 15:16:20.313839     #6 0x5639b900cd18 in qemu_opts_foreach third_party/qemu/util/qemu-option.c:1135:14
 1109 15:16:20.313841     #7 0x5639b889393c in net_init_clients third_party/qemu/net/net.c:1612:9
 1109 15:16:20.313843     #8 0x5639b717aaf3 in qemu_create_late_backends third_party/qemu/softmmu/vl.c:1962:5
 1109 15:16:20.313844     #9 0x5639b717aaf3 in qemu_init third_party/qemu/softmmu/vl.c:3694:5
 1109 15:16:20.313845     #10 0x5639b71083b8 in main third_party/qemu/softmmu/main.c:49:5
 1109 15:16:20.313846     #11 0x7f464de1d8d2 in __libc_start_main (/usr/grte/v5/lib64/libc.so.6+0x628d2)
 1109 15:16:20.313847     #12 0x5639b6bbd389 in _start /usr/grte/v5/debug-src/src/csu/../sysdeps/x86_64/start.S:120
 1109 15:16:20.313849
 1109 15:16:20.313851   Uninitialized value was created by an allocation of 'ifr' in the stack frame of function 'tap_probe_vnet_hdr'
 1109 15:16:20.313855     #0 0x5639b88ac680 in tap_probe_vnet_hdr third_party/qemu/net/tap-linux.c:151
 1109 15:16:20.313856
 1109 15:16:20.313878 SUMMARY: MemorySanitizer: use-of-uninitialized-value third_party/qemu/net/tap-linux.c:183:9 in tap_probe_vnet_hdr_len

Fixes: dc69004c7d8 ("net: move tap_probe_vnet_hdr() to tap-linux.c")
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Foley <pefoley@google.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/tap-linux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-linux.c b/net/tap-linux.c
index 9584769..5e70b93 100644
--- a/net/tap-linux.c
+++ b/net/tap-linux.c
@@ -150,6 +150,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
 int tap_probe_vnet_hdr(int fd, Error **errp)
 {
     struct ifreq ifr;
+    memset(&ifr, 0, sizeof(ifr));
 
     if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
         /* TUNGETIFF is available since kernel v2.6.27 */
-- 
2.7.4


