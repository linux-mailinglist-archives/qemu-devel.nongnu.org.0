Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB5486A16
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 19:44:34 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5XkX-0004vJ-9B
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 13:44:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35zTXYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n5XdY-00035E-33
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:37:25 -0500
Received: from [2607:f8b0:4864:20::34a] (port=35783
 helo=mail-ot1-x34a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35zTXYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n5XdS-0006pP-Bg
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 13:37:15 -0500
Received: by mail-ot1-x34a.google.com with SMTP id
 100-20020a9d08ed000000b0058f1b3acf6eso893705otf.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 10:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=/AzMEpoNYNeU2/S2JWMtbuGiTrA3Gy9xclxq8W0oQxI=;
 b=j08v8kFVCQbaUoIPsTlORQb9USXA3Hd11arpBTh/AoBqlNNXFmT404QmTpiBA38xIX
 jNKTXd4NvIfM+l9V24rP0bM2DUjcpwsz2DXVcQl+z0iegMZX+STyIydgRwFIRR//9445
 dqlEEw0gjq38ljvr2X2p2NDScU7FXXWGOSWKBlbevfYHMxaKG+Afjj8acOgkpbtn0sO/
 K2iJetJcfRXuyOn3aGtpOGzI4UV7VKWoCkaWOwWkyR/u6CR8S0mizxk1qI4Pn0CPcTg4
 61VBW2jHVGXwcrAiNp3QRfWs/hMKcGrGSUcsWCl9pzHVqga2XkW/Gx1WJcXqeW0OaFui
 A4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=/AzMEpoNYNeU2/S2JWMtbuGiTrA3Gy9xclxq8W0oQxI=;
 b=gQUIkQb50uLGDv5VLESoTe6rIYe/dkKvSQe2irmI5vIKjpyTLBR5CkB6mIHMuubj55
 quWGops7WTppi0WTTs9NkAacCnoDHkfBfRhLzFPkveZT8kXKl9kk/iu2FNcYlIkA9PWx
 xuv/YdNb9919nefJSkbV6Bpn+bAvM8yqkK+ynzeUHbSlu1ekMx4MeTttqnIzKneKnAd1
 +9kXLp9NiYAfPJ5KbkqPMXY4PMensOhLvzS6oui12SUa6hYb/+drZakpwUfhT6LqjgZ9
 csg9EPQVz1O1SCHstYJlcBNXHGb6Dub1hNNB27aruVFqxOtmlJJPWYG8I7MKjeWNke9d
 8mrg==
X-Gm-Message-State: AOAM533Y2GiOAdv7TiDOuPp4FDwCJuGJnO0WIydnD+dTcH00lic6VBmQ
 V2FeTOLFn7J5o3RFw+sX/RQlvZoOsqIF
X-Google-Smtp-Source: ABdhPJxTZuLyroftuZnhOrDuwqNumT9dtIvqkB2Ztipj7FIYg5JvoWjiM+eYBtBoC2zumUfaCuLwIWZnwACF
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9986:338a:477f:1df7])
 (user=venture job=sendgmr) by 2002:a25:b082:: with SMTP id
 f2mr72471898ybj.316.1641493735203; Thu, 06 Jan 2022 10:28:55 -0800 (PST)
Date: Thu,  6 Jan 2022 10:28:51 -0800
Message-Id: <20220106182851.3583896-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] net: Fix uninitialized data usage
From: Patrick Venture <venture@google.com>
To: jasowang@redhat.com
Cc: qemu-devel@nongnu.org, Peter Foley <pefoley@google.com>,
 Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::34a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::34a;
 envelope-from=35zTXYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com;
 helo=mail-ot1-x34a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Signed-off-by: Peter Foley <pefoley@google.com>
---
 net/tap-linux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap-linux.c b/net/tap-linux.c
index 9584769740..5e70b93037 100644
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
2.34.1.448.ga2b2bfdf31-goog


