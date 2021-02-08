Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC29314334
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:51:32 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FNT-0000ig-9b
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCe-0003Zm-RS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006Ho-8f
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so18442791wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sl3y6bEhy3bScnbFrCsAd6nm60IxHuqvmVxfBJKGBIE=;
 b=RnD0zYZqssg1O9axMaFJoIDNB6kzWqyPjodUVNsF+eASstNIYddySTYNicSQpJY5e4
 jZ2kygl86LI5IpSABESK1TOy32xQ+tdzb5gveSUmg+oNKOt7/s7UleDXnsxPSY6zW4GB
 k0ioYAlqpQfz4N4m2QjIFrq2Ff2KXcjdG2+rzsOMn+zmT0KjuTfAZdoHGF2QJTlYLcSj
 Hq5tb4vhqQyFBl6A8LiDARhdtY3p0iCQKkCoL8fWx8DVfnj5SueHT4t//9rNfK4rtXXA
 bUENMUul1Tb77jilbZgOxNI/LrR599WeHkkmICPA3i9ICUAk9w4O0cWDuTxN1w4QrNDD
 a6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sl3y6bEhy3bScnbFrCsAd6nm60IxHuqvmVxfBJKGBIE=;
 b=YplxJDz3Yf1Jo5bgCSbPN6kFhDtvk3VHbJjkIL1jSivrHqegpBFnuJtlowNEgO/iAD
 a9QgvUf/99BKjW+lB2E0Fye2z5dW0nsD5RGcXnL+yQ7hzLDKFS/jo7RwuA1XllCi1+j9
 rvzv+mBBgFA+0tl4VKzyX+P9t/ESWn3/D09ZV+qHOvIOZAzk6sK986zg/5GpYi1v2YuQ
 7tFFqJjqeXBxSxupij+HlZi79OPa6krIp9mHmu2K8pOVi0TsJMZuERTl62/zXeIsdWq1
 wWOS69hmw7luP0ko0TrB+u6neykBrS80wSERXHQWMUzeGDSmOO00vefcVZ4HUV3zsSMw
 ZK4A==
X-Gm-Message-State: AOAM530QBOQUYp1BU6IFi95vFRh+9CNNuaaBQTmEO4dzTqM0YL5mPWsJ
 vxYvqMkC+xjXAWbyLCfXwSjK8bmxrROOQQ==
X-Google-Smtp-Source: ABdhPJzwe0+mU32Gz5EDwHzIzSpWI/Aruepkal82kVm9+4fwtJmO2/hvahdCOxC7PV9f/AoqhocP9A==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr8408532wrl.233.1612808642032; 
 Mon, 08 Feb 2021 10:24:02 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/46] qapi/meson: Restrict UI module to system emulation and
 tools
Date: Mon,  8 Feb 2021 19:23:16 +0100
Message-Id: <20210208182331.58897-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-13-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 7aca8d5048..0652569bc4 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -43,7 +43,6 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
-  'ui',
   'yank',
 ]
 if have_system
@@ -57,6 +56,11 @@ if have_system
     'tpm',
   ]
 endif
+if have_system or have_tools
+  qapi_all_modules += [
+    'ui',
+  ]
+endif
 
 qapi_storage_daemon_modules = [
   'block-core',
-- 
2.29.2



