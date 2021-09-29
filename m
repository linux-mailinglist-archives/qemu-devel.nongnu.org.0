Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EF41C606
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:49:09 +0200 (CEST)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZxL-0007Ig-FO
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVZkP-0001q3-UN
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:35:46 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVZkN-0000UB-Qw
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:35:45 -0400
Received: by mail-lf1-x136.google.com with SMTP id x27so10803285lfa.9
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8/80LLA40D6XijWgijm2B4nvX6XM8H2wrzejxbGRlY=;
 b=jn44YTyR3s1hQLX6xzRcKVONsHGjpWn6SRI6AAqMxeH3mLPBJD40JpHSH0O4NFnMd1
 fNLFJ5mH7w2CavBa+P7Rpj6LXVVl9spMfqGkMLUXLX5nRyGrmQ2AOH4jmh5FOoUIe5mD
 f5qJuSwvHnlOmWzWtZVWVirLdUX1nluGOQanFG8XCEfnR9xDkN96jKi702QY+OMwCcne
 H6D0CpC9x61z+GpilwAzKsdC7zqZ6LF5QYHsqZPWHyUL0CfgePlerevwia1ZIwcrqT+8
 XfoDhG4lhNaPpel7iej5gH6lvmK/Uf80tRdij5197W4AU3t8duaBppVvnZ9OFn0jDQCe
 WBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d8/80LLA40D6XijWgijm2B4nvX6XM8H2wrzejxbGRlY=;
 b=yQyv6l0ZSwkdZCqkkhsoV+WHrP2CAiVcPkuM7iumDJQPNCWWveW8SyUT8a6nuCGtwI
 3jIEeWvBrSicoAaPngk+wOUVqLeE25StJAKswEs6WLodD8yy9vMWstBrp5F8Pxnt/yaK
 RctC0FPx+5z11zOZ6MDK6LCpxCz8/CdvirNmxM4HsUt9tLHHgyFyeyBkwhZBVzjV+Tqs
 S5n3/kz+51aoGT8bVOLU63I3XsCts7MxNrLpgJsk5rGucwYkf9EhHaWJgUcMp43fHH8u
 U62GunKMSxMV7Hr3jAZOReeqEG2Nmb44Paz6Ja63NEbULof04ThgvQbMdxgYZH1LnSI9
 46ag==
X-Gm-Message-State: AOAM532OF9R7xBpkYANU6DcdnFXpTxDYLgyoLasEfxiZTjKS99rEBf6B
 IzYpV0JTWA2fG7/k2XZJPcfGd0IiMhENanV1
X-Google-Smtp-Source: ABdhPJybWnSUCo+jUt9Ty0M69585WvoN3IG5Bx4Lxm/OLHYTcMo4Rbr5wAqgb2xGHTc+SoIqT8XYGQ==
X-Received: by 2002:a2e:958a:: with SMTP id w10mr5906262ljh.13.1632922540792; 
 Wed, 29 Sep 2021 06:35:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b15sm247378lfp.221.2021.09.29.06.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:35:40 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] plugin: add qemu_plugin_insn_symbol to qemu-plugins.symbols
Date: Wed, 29 Sep 2021 15:35:35 +0200
Message-Id: <20210929133535.2950068-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give the plugins access to the qemu_plugin_insn_symbol helper.
Note that this symbols is today already used by cache.c, which can not
be loaded without it.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 plugins/qemu-plugins.symbols | 1 +
 1 file changed, 1 insertion(+)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 67b309ea2a..6a0261f061 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -6,6 +6,7 @@
   qemu_plugin_insn_disas;
   qemu_plugin_insn_haddr;
   qemu_plugin_insn_size;
+  qemu_plugin_insn_symbol;
   qemu_plugin_insn_vaddr;
   qemu_plugin_mem_is_big_endian;
   qemu_plugin_mem_is_sign_extended;
-- 
2.25.1


