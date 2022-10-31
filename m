Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B511861378E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZ3-0000G9-MR; Mon, 31 Oct 2022 09:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYd-0007uI-Ru
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYT-0001EA-OG
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so3329535wmp.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpyUaigpt9+MJRHvWG2J+xsZxMgYgcY076qEes67kmM=;
 b=jLW7Ao/JPXVrKJveO1x/QivvYR254WVvOl6Y8INAzmLeUbU3fKOXmocG0VEaTxjDVC
 sBdvXnkhhXpexte2MkGUIM8+rcU8HQtxCh+35TGjm7xNaUuWYKmJeV13f0dd9sZzLENC
 knMZ9tTUx5PNau0figkj50PHHebvAuUtITqymKoCpoBCR4AvcM3AfJng6w6dADx3gTrQ
 ktl4CCnC+EHksYaFoxi9T9prw0LQ3l9weHerCKlBsYdtwd/Fwi+D32TOkNNVhOIK1fgL
 q/+rA1J7nPi1MYlcZDbQI6nRVXDigvYCMEnottFHcexVcsY5YPMK5PSiCVZPaOA2PEwH
 KdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpyUaigpt9+MJRHvWG2J+xsZxMgYgcY076qEes67kmM=;
 b=y1xsf9Vc81qIGFpgQZOzowgVtqKboC9D4NSUe/rtUS5cuCjnZNvOMyWr4gt6gxt5KH
 nGUzlmZkPXDqkPENTeKQYFW7bCaPP7A2prReAXbmEvA+cAWo5TPIMQCV1cMu3N3ToUHd
 96t37GS95X8ohAYPkP+6I7WkDmuaZNOLuXac7ZBS4knIMdWnaR7Re2IYFlELsBAuoyz/
 p1Cp/vzl3NdJ0dPzUHbbYBX3sj+/YJRvYg4D78EeAlyHYCaOTshVrOISH9CWfDPz0OYk
 qO7Us4VuKyGdvOT9iXRV2iL7vxcsBSWHzOHi3NVT3GX3k7VDlxq4bp5dNtMuQWFXHESG
 RO+g==
X-Gm-Message-State: ACrzQf2fOviUw6PjvMBpMpjE+7x9Fm9q/72ErFXQFlXxJrbAHtIEFcCX
 0uoIEyuAYgcNyUokcgTgI4Wm2rGa8QlgbA==
X-Google-Smtp-Source: AMsMyM7hK8YmBbtjZ+ZdTfnzGnFg+F+tPGY6NRFXCCDjzfsI91KuDoSnoZJnbam/gj0kuBrcldm6tQ==
X-Received: by 2002:a05:600c:3b1a:b0:3c7:132f:eb7f with SMTP id
 m26-20020a05600c3b1a00b003c7132feb7fmr17957906wms.49.1667221815844; 
 Mon, 31 Oct 2022 06:10:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a5d6a8c000000b002364c77bcacsm7099549wru.38.2022.10.31.06.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FB041FFBE;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 06/31] configure: don't enable cross compilers unless in
 target_list
Date: Mon, 31 Oct 2022 13:09:45 +0000
Message-Id: <20221031131010.682984-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This avoids the unfortunate effect of always builds the pc-bios blobs
for targets the user isn't interested in.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221027183637.2772968-5-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 81561be7c1..dd6f58dcde 100755
--- a/configure
+++ b/configure
@@ -1877,6 +1877,15 @@ probe_target_compiler() {
   container_cross_ranlib=
   container_cross_strip=
 
+  # We shall skip configuring the target compiler if the user didn't
+  # bother enabling an appropriate guest. This avoids building
+  # extraneous firmware images and tests.
+  if test "${target_list#*$1}" != "$1"; then
+      break;
+  else
+      return 1
+  fi
+
   target_arch=${1%%-*}
   case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
-- 
2.34.1


