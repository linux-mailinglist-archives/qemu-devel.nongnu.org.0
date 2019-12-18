Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812A12476F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:58:26 +0100 (CET)
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYuH-0005wJ-Az
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:58:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY40-0007Uy-IZ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3z-0003y0-9M
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36648)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3z-0003td-0j
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z3so2026703wru.3
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5YkySL2mKW7ugobt1wcSialbS2GyDoRr4H4ExH3cV0=;
 b=p3htYOC7NtF5niJ8rlL3I7KmzXXkvtsi4svvUyVMgQCIDxCCTTMnny27SuDI9vPu5O
 AMcmJ4dEbXk6GEy7LXrimjykMnkaHHwNO92oKq9qzBPU5JsL/Zgd9HoVqL82Ln8hkbvO
 gKSg9Tu1N9NQivThAvcuL7gHF9xMQ7D4JhS1hBY1ZDpvcVRaDM++/QB9qmk+cF82AxZU
 C6ZQAJeSRke+YzsIzGR511AmS0I1ZEur8NzX1zXUnOeOgykqwzFYjiT2Vw2Cp3tZ8i+l
 hhMDuhSzhEwBx2OKRnpxFiLBFZiwLrSQkEo8B0JFrxCf4rGMR0w1z8+dw/KDkJ5ohzxz
 uTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x5YkySL2mKW7ugobt1wcSialbS2GyDoRr4H4ExH3cV0=;
 b=s/6tsGZ4SEXDAjwEHicDgE6UJ8nwzoQIQYTQSHEdq0e6YV+5FQkr8cDU25UwQle4DE
 N+jxEilRwQsO60cOwQcpewePijHRM8F2FEinv145DDA0Z8iIuYnwNcUObscHrvn7bMle
 AQ17ZIc0w110xPtz/fOnN5XFjhU3rCJgsUVF55hmdstPZToaXRYBRpevPWrdcejqgNSi
 rJnf3Y116irD46GsfNuOpUuKL48eQ7b1KkHkGjfD0XPyz7gJZv1yRbJMncWu2+10niLp
 xzZuJrrUtOmPAkXYmjZOciGtC8HAmsqm5xGkmkIPpWa53wtk8cjc0o6/r6jaWFw+JLi3
 16yA==
X-Gm-Message-State: APjAAAXHGyLyXNw3LluPejPPSb0e3oc0on8lxHq+U96vSVj2jEZkuaYp
 VyjdI38kqXlo+ZtDeL2dnravVVoS
X-Google-Smtp-Source: APXvYqyOHAPfHbUFPSYtK01Q3q/sbNgPqxi/I5tFkMB80eNkau7fv7oyVR/DQH4J1bXE8TsnqeRRpg==
X-Received: by 2002:adf:f98c:: with SMTP id f12mr2374977wrr.138.1576670661771; 
 Wed, 18 Dec 2019 04:04:21 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 79/87] hw/pci-host/i440fx: Use size_t to iterate over
 ARRAY_SIZE()
Date: Wed, 18 Dec 2019 13:02:45 +0100
Message-Id: <1576670573-48048-80-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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

We don't enforce the -Wsign-conversion CPPFLAG, but it doesn't hurt
to avoid this warning:

  warning: implicit conversion changes signedness: 'int' to 'size_t' (aka 'unsigned long') [-Wsign-conversion]

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20191209095002.32194-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci-host/i440fx.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index fbdc563..0cc80b2 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -419,12 +419,11 @@ out:
 static void igd_pt_i440fx_realize(PCIDevice *pci_dev, Error **errp)
 {
     uint32_t val = 0;
-    int i, num;
+    size_t i;
     int pos, len;
     Error *local_err = NULL;
 
-    num = ARRAY_SIZE(igd_host_bridge_infos);
-    for (i = 0; i < num; i++) {
+    for (i = 0; i < ARRAY_SIZE(igd_host_bridge_infos); i++) {
         pos = igd_host_bridge_infos[i].offset;
         len = igd_host_bridge_infos[i].len;
         host_pci_config_read(pos, len, &val, &local_err);
-- 
1.8.3.1



