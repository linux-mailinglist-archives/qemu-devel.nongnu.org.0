Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87E314359
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:58:45 +0100 (CET)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FUT-0002kd-19
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCw-0003rk-9y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCs-0006O2-9U
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:22 -0500
Received: by mail-wr1-x429.google.com with SMTP id h12so2108013wrw.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ul/UnO7x1nzadqmN8qgUQpaE/S1LbDrvvhHbR/jK1VA=;
 b=cBkj8bGxqYantsBx7y9YbDoU0e/ZA/Jr1rLYAUNmYJzl3+MQZt7/LP2Oh8b3fpG23+
 PxKPUHFUGwIFL+jhWIVAL6IUT/2tG8lB93O9y/UvjXdtrtEI2c4bTj7iIBNqxaWD9mZo
 DMDt6d0cIIPeAJcakYqVxkHYeDhpd+ORHG7+1JiXYu+zN+5oQtg9S7vFjGYfQ0SU8V1Q
 qQiIxO8L07njuoIjeD/bwp4gaYrFo8ahuHTGGygRj3Rm+8z24oTSkYFaTRzlrezaxsRu
 xn6ydJIjwznyPZVv4Q3YM5T1j6dApCgXPj+naRtGUgBCZw5FxtMqi11/iawasRW4OstL
 425Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ul/UnO7x1nzadqmN8qgUQpaE/S1LbDrvvhHbR/jK1VA=;
 b=N1Hc6QFyoReNx1W5LymnHCyx7TTX0NMeKC9qXiqUqmIJNLbhMB6NoBbDNIsEjpWjDQ
 z9xo/+qCQ9m4mVfekvE4JYBhxC+VoRDALPPho0tQ1BFyFLusTPG9FtYWeRL5KqUcEFVe
 Alg1USrfku371D9Iglxm5T7eNl9k+CM5ZzASNRzUAsGucqq5OfMbSDLzAiNPxwiFKWzt
 +G0QHU7JNrjFLBnOAZfUPKgBVvZixQL2+dMbTsxFsZQZA+gplb/kvxhxkxRNmHpTJi+i
 8LJlzmm2OkEww2XLQ2Tkh/Tnv7LvULCqkqoD0g9wPtjEM47VQB4Cu089Yrjk16SjLuud
 eSww==
X-Gm-Message-State: AOAM5303nZGu/wLgeigMK6BGk2OGYib5CAO0s7HNSHxwsTkzIAscjlAA
 HMCvXuFUmaFeYjuz7y2FsJmC20sRG3mveQ==
X-Google-Smtp-Source: ABdhPJzJvOYKlCzhbED0+0xCQO+IWjaOn8ECbaLSidWBbs3SdG+5ConG7NUW6LOhBlDvgp5pALMLDw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr20522152wrq.136.1612808655347; 
 Mon, 08 Feb 2021 10:24:15 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/46] imx7-ccm: add digprog mmio write method
Date: Mon,  8 Feb 2021 19:23:29 +0100
Message-Id: <20210208182331.58897-45-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Li Qiang <liq3ea@gmail.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add digprog mmio write method to avoid assert failure during
initialisation.

Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Message-Id: <20200811114133.672647-9-ppandit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/imx7_ccm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index 02fc1ae8d0..075159e497 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -131,8 +131,16 @@ static const struct MemoryRegionOps imx7_set_clr_tog_ops = {
     },
 };
 
+static void imx7_digprog_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "Guest write to read-only ANALOG_DIGPROG register\n");
+}
+
 static const struct MemoryRegionOps imx7_digprog_ops = {
     .read = imx7_set_clr_tog_read,
+    .write = imx7_digprog_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .impl = {
         .min_access_size = 4,
-- 
2.29.2



