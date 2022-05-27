Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2753682B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:41:49 +0200 (CEST)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugmJ-0007Om-VZ
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard0053@gmail.com>)
 id 1nufIy-0005bj-If; Fri, 27 May 2022 15:07:24 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard0053@gmail.com>)
 id 1nufIx-0003L6-1l; Fri, 27 May 2022 15:07:24 -0400
Received: by mail-pl1-f179.google.com with SMTP id d22so4886098plr.9;
 Fri, 27 May 2022 12:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=deDD27VQcQrtt/6UAU4Aq+aDAYDaZ54pjGxgw6Ul7/g=;
 b=s2W+ZdAZ8/0foPqr2CHcP5sI/wwKwgIhuBAkG3rKTe0wkdyxtEVTtjmPbK6Qf8Y0ng
 FEbzQoQKdF4J1vJMs7Iet8e/SPESq/3g1Rpkz8L4thBQMVZE4wJdnWl4esovVlxMIG4F
 +03RVBO1R+l27n0vkgbdZWEas+9N1C2GEPW6IIRiZQ0LG1vBpyNX9JDVgo9jt2kh5JYF
 ZaQHuEajSmIo02H7ZB8ZAgYfkXuzl5wbfUt/M/r8Z+hEgUmK+iMvCjddqED+hTELvfYo
 6NTZbe4153HrHD7v6j/plJOnGsOgiahKul0XBytQE43K5x2ilIikV7f026AjTd3QV17d
 Z+Ig==
X-Gm-Message-State: AOAM533cmdVRA3ef63Bn4gzWAstZZgFjDRhh95bT+jWwKYfofEAmSzbI
 gVV3aoZBmEgJfhV1kXDutQJjaW42uU3goQ==
X-Google-Smtp-Source: ABdhPJzA/DwVcvpBDR/FsOWKChelI0ugTggRAqpQhiyfUVRom8cng/dY5fHb+bGDmA7IEvwxGMfKWA==
X-Received: by 2002:a17:90b:3a8b:b0:1e0:548:1490 with SMTP id
 om11-20020a17090b3a8b00b001e005481490mr10042319pjb.144.1653678440558; 
 Fri, 27 May 2022 12:07:20 -0700 (PDT)
Received: from localhost ([2401:7400:c809:3970:df01:d762:2b01:af8a])
 by smtp.gmail.com with ESMTPSA id
 u9-20020aa78489000000b0050dc76281a4sm3823537pfn.126.2022.05.27.12.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 12:07:19 -0700 (PDT)
From: Haochen Tong <i@hexchain.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Haochen Tong <i@hexchain.org>
Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
Date: Sat, 28 May 2022 03:06:58 +0800
Message-Id: <20220527190658.169439-1-i@hexchain.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.179;
 envelope-from=richard0053@gmail.com; helo=mail-pl1-f179.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 May 2022 16:38:27 -0400
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

bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
Replace with the equivalent bpf_program__set_type call to avoid a
deprecation warning.

Signed-off-by: Haochen Tong <i@hexchain.org>
---
 ebpf/ebpf_rss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 118c68da83..cee658c158 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -49,7 +49,7 @@ bool ebpf_rss_load(struct EBPFRSSContext *ctx)
         goto error;
     }
 
-    bpf_program__set_socket_filter(rss_bpf_ctx->progs.tun_rss_steering_prog);
+    bpf_program__set_type(rss_bpf_ctx->progs.tun_rss_steering_prog, BPF_PROG_TYPE_SOCKET_FILTER);
 
     if (rss_bpf__load(rss_bpf_ctx)) {
         trace_ebpf_error("eBPF RSS", "can not load RSS program");
-- 
2.36.1


