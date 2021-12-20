Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0E47B51F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:25:05 +0100 (CET)
Received: from localhost ([::1]:56882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ9Y-0007WG-Uy
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzK3Z-0004nD-HG
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:54:39 -0500
Received: from smtp-out5.mxroute.com ([216.55.104.248]:11247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzK29-0005Cw-KS
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:54:19 -0500
Received: from localhost (smtp-out.mxroute.com [216.55.99.248])
 by smtp-out.mxroute.com (SMTP-Out) with ESMTP id AC69B3B6E9C8
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:53:29 +0000 (GMT)
X-SPAM-VIRUS-Scanned: MXRoute Outbound Email Gateway Filter Ver 2.1 at
 smtp-out.mxroute.com
X-Spam-Score: 7.393
Received: from smtp-out.mxroute.com ([216.55.99.248])
 by localhost (smtp-out.mxroute.com [216.55.99.248]) (smtp-out, port 10024)
 with ESMTP id 48jpKaK9Xs4x for <qemu-devel@nongnu.org>;
 Mon, 20 Dec 2021 08:53:29 +0000 (GMT)
Received: from zmta1 (unknown [45.76.239.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out.mxroute.com (SMTP-Out) with ESMTPS id 3DB6F3B6E904
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 08:53:28 +0000 (GMT)
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by zmta1 (ZoneMTA) with ESMTPSA id 17dd704d6fe000b7bf.001
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 20 Dec 2021 08:45:58 +0000
X-Zone-Loop: 04498ce9bc87f2f9d6db869ab699df11120a4b318ce1
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXDZ/4QUgZHhTUBNVdLxcKrEhauuU2b2lGidxz98PWo=; b=s+poSY6yXS9INpJKWkoRwhZuYD
 sLoj+pgJnAaNE2Xk4Ytb3CvQhwISwwIvCe/HRn0FRDGPBgxkgvuaD7a2QEol065OiHL/r4mBD2zhj
 wuKQ1+IdUuzFFyVB8nwKqjs08SXkTM5dd/fSSaqUaljkM22RGr7/V4ZoNq34h3d3k9Hv6MLGP4i6O
 OW6XKVhtfEmQUUNMYNmGF9w7wshR+RhZDfkeT2WEUYGtRS2Vxc9p93asq8A8FK0Uct/g8g9HpgXW+
 5PHDP4CRZDW+QpAMxsIs+X2E/n9qAmSZGjyX8Co6CJYwF7qcoKDlqVMORGIb7E/gJzNUurU310giT
 Cuc/SxSw==;
From: MkfsSion <mkfssion@mkfssion.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: Add opts to device opts list when using JSON syntax for
 -device
Date: Mon, 20 Dec 2021 16:45:44 +0800
Message-Id: <20211220084544.54902-1-mkfssion@mkfssion.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=5, required=15, tests=[ARC_NA=0,
 MID_CONTAINS_FROM=1, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, TO_DN_SOME=0,
 R_MISSING_CHARSET=2.5, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, MIME_TRACE=0,
 BROKEN_CONTENT_TYPE=1.5, NEURAL_SPAM=0]
Received-SPF: pass client-ip=216.55.104.248;
 envelope-from=mkfssion@mkfssion.com; helo=smtp-out5.mxroute.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Dec 2021 16:21:21 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, MkfsSion <mkfssion@mkfssion.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using JSON syntax for -device, -set option can not find device
specified in JSON by id field. The following commandline is an example:

$ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined

The patch adds device opts to device opts list when a device opts get
parsed.

Signed-off-by: MkfsSion <mkfssion@mkfssion.com>
---
 softmmu/vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 620a1f1367..0dd5acbc1a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3400,6 +3400,8 @@ void qemu_init(int argc, char **argv, char **envp)
                     loc_save(&opt->loc);
                     assert(opt->opts != NULL);
                     QTAILQ_INSERT_TAIL(&device_opts, opt, next);
+                    qemu_opts_from_qdict(qemu_find_opts_err("device", &error_fatal),
+                                         opt->opts, &error_fatal);
                 } else {
                     if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
                                                  optarg, true)) {
-- 
2.34.1


