Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C474F6EBCFD
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:26:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCo-0002v9-Il; Sun, 23 Apr 2023 00:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCY-0002hj-SJ
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCW-0000qO-UV
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:50 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso2821667b3a.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223587; x=1684815587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouDUtwID91yHmnTbW9yyY4mwCko9ygccl6n6SqLS0Po=;
 b=kBPaDXyDGzo0VpKPyEBW5znFW4TupA3AkAQeEe+PbEzPmxl/GeLHjz7JV9HX/f1mWv
 mEvd6G1FNoZBoOrzzqjFwz197XNj6YUx9cCcSyDQi9ttngkSlsZ0CrKHhT87WCBfzZAJ
 GfL9Re+gfIh9EFcJtjjayOUphVdeh/Q86o3Gp+dIy+ApqePpMcBDh9PO3oQB/eApPNga
 +GTmolVMmKF+9URj9x17XkNJMxQOQ+ogGzJUL5HAJx8hV3RKwmyIR2jUyi4HrhDfVpRE
 Kt6IC07SA/aogroGyPINR2Qb8Ik3eXO5oJIOQ5ASpN9GDU4uuEtp4ZKymeJvfJg8jF3T
 pwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223587; x=1684815587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ouDUtwID91yHmnTbW9yyY4mwCko9ygccl6n6SqLS0Po=;
 b=Q5JADmUlB4Q32aefEF8k4MTE7VbH8K/K4KL+t7LqXpllZmtq1JTL22p4K/jV96OdfM
 j1UQi1Ozk8Gr/nkj5xJyctGU64yLXxnt7R6Y/Y0NyxI4HTtyw7ExOdSn716GWFZQEzCd
 nT7eWo/OElCGIBzQXNe/ddrV7nwlmga6AOsSbreOLDz0V/krhBMqaIocHOz08cbWJjr0
 G9rI9Q1Fq6fIRIfAjnfDZA+HelfXNXKlfdP8wsQrVdZdfXRGlEQti4179W6zPDJif2Bb
 KS8axfYZEJL0i7lM0Sl6kVYnzPZGDBL6J1ZgAgnTpO9n0Phb6fcGualJcCENj9sIVvxs
 y73w==
X-Gm-Message-State: AAQBX9dVBOgKeYt4nih4aOvo1Ix81KsNBJsskSApzu4JTIExEHc/ZHWN
 ql2f/hC120KfP1c0PfrjJsRXaw==
X-Google-Smtp-Source: AKy350ZMB5pSkB0VqMditaOzd7PHst9JNTk6CBHThZl13bkGMEGpdq+mRbTaMz4/VKis1av6Jwb29w==
X-Received: by 2002:a17:903:1c5:b0:1a6:b496:4053 with SMTP id
 e5-20020a17090301c500b001a6b4964053mr13028684plh.59.1682223587592; 
 Sat, 22 Apr 2023 21:19:47 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:47 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 19/47] igb: Always log status after building rx metadata
Date: Sun, 23 Apr 2023 13:18:05 +0900
Message-Id: <20230423041833.5302-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Without this change, the status flags may not be traced e.g. if checksum
offloading is disabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/igb_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1b69775fd6..167e1f949d 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1303,9 +1303,8 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_l4_cso_disabled();
     }
 
-    trace_e1000e_rx_metadata_status_flags(*status_flags);
-
 func_exit:
+    trace_e1000e_rx_metadata_status_flags(*status_flags);
     *status_flags = cpu_to_le32(*status_flags);
 }
 
-- 
2.40.0


