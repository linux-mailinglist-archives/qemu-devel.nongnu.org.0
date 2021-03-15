Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AED33CA1D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:46:47 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwv8-0004dR-28
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwl3-0001x5-V7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwl0-0006Fc-AP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+IDLwTWOrFHz8fuSTd2bsf4O8rILYVfhYt77um4UJ4=;
 b=X5F2H0z16g5dAOErMrTWoC5kYOuic2RYK9s6mCjUthCKo/RivjfzeANLps5VmdEG+LdaMR
 A0V3m0Epfn0vYGnlqXt9QWOSnIwoRxvn7ieAKWlt9PLlo+0ucGN78QfDllbI6Dun2+vHd4
 4ahnb1nA37Llv/D8GJMu2N1Z/UYrBdg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-LzbxacMINwOSOBFKzZzVSQ-1; Mon, 15 Mar 2021 19:36:14 -0400
X-MC-Unique: LzbxacMINwOSOBFKzZzVSQ-1
Received: by mail-wm1-f72.google.com with SMTP id c9so3115890wme.5
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+IDLwTWOrFHz8fuSTd2bsf4O8rILYVfhYt77um4UJ4=;
 b=uKd7OZk5T2R2bBKN6LCBlysT7eyQ4F2gcdOuv1aUowuXgMYkhDGipGRM+SEqjAW7pj
 5//R0X8uA3zOprusfrLhO36fDs3Cn8C7Aj91etbuBcfrx6b63tZ+foq6HLcs5yt1zLlv
 AWPpkuKtW1xMW7SnPKW+O9Oq9zpIqaMLkB4jXGKiqJYDdCfdam7aI+yzpDVLEXRiNoc+
 vhxk/u+VqjwfmT/Dc5eO1zjEQX8sPaHTXnrlQbjCW6SAlTQjy0n3M+TEBsOqgtfFm8D3
 DA7GjGNOgU1DlNh9Sc7J6QqUym39uIJvra+Pq2c6QbNe14MpfXbeDER9g+sciS1psmep
 XGkQ==
X-Gm-Message-State: AOAM531crkaVxjnZhZ1D80rTkd40Zp2/ZfSuitwdrv5NR3KT/TZ7JeJE
 IUpUHhgmoWz78HRRY6num3nCY8NccysM2RN+/NdakuumG695rnMJlTgXibPc3h79eeNwaKFm4TC
 t/3ycvGWVCXHFU5oaeGyPBuA5w6XXqLAjSs3dcnOGkzLQA5UgKOe4U1+Xn/Qx/3q3
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr1838985wro.314.1615851372843; 
 Mon, 15 Mar 2021 16:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdsqJkBc2sxoI8zyAR+y0KLKr+nMCjhEnfrrYgZkqhSPgmL5nJ1o5acctA5DilsoUjWbSF1w==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr1838968wro.314.1615851372711; 
 Mon, 15 Mar 2021 16:36:12 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm19949823wrq.61.2021.03.15.16.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:36:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] hw/block/pflash_cfi01: Clarify trace events
Date: Tue, 16 Mar 2021 00:35:25 +0100
Message-Id: <20210315233527.2988483-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the 'mode_read_array' event when we set the device in such
mode, and use the 'reset' event in DeviceReset handler.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210310170528.1184868-10-philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 779a62f3b06..c8cecb3ac8b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -663,7 +663,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_reset();
+    trace_pflash_mode_read_array();
     memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
@@ -886,6 +886,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
 {
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
+    trace_pflash_reset();
     /*
      * The command 0x00 is not assigned by the CFI open standard,
      * but QEMU historically uses it for the READ_ARRAY command (0xff).
-- 
2.26.2


