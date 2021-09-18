Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E6410583
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:37:31 +0200 (CEST)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWmo-0006fP-8W
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhT-0008Uc-DP
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhO-0003eS-7r
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so17435010wrg.5
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=q3G+od+yz7iSO+EBAcPqU0Bi7hsQQQYLj0ua/sHQ67crBT7DxVK9MjDOrcKoRSyHe3
 US7x8zYS3Maq9K2mjeb/VdowLkWfQ1ONnc8y/LpAluRx5iho3vhxAXw7j39JoBMVosLK
 b/P7IyrTLCa2/yIV1OVZ9FV6muCtwCapjcbUmrUvMq9sV+Ctw+26QnM6l406o/l6wkZU
 yMPzftCEZKhRbo3+KBNwh7MzsS/9lQHdQHKnKNcZpIVosh12gTtVhYmq18Y7lO68sUO0
 yJhKX2s6LuK3Sdr81QSaX7XuL6JWG/AE6NlWnEC5QfiQFjM2iHU7X+vtS6yO2q/oUM1U
 YwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VMxPJY6t4uoMf/I961hE4R2GzgtcCFDrssDoN4r5NzQ=;
 b=lbT+XxXUuh2xNMdmBDcaJpjTLWSeiG8Pwi1/HWYYa7hPwadkvzS8oLMuD9waEsYbTV
 0yYQKd3qBcyUAIzerSDorWRcF5Nilg+Hm67KhHbC2GMEGBO9dN9TYrkq/KFNpd9e0a86
 fBU5ahXPWGj3s5Fw84LGN/y1u4px4CgV4hOpLc9H2zudqFZyBpkimvHDy3Z+ULE4S6Ts
 CDyRChTrv9ifKKIt22HGznSn3d7KKsiQyoFcdEG/hnyfm4wIuZy86b6BIA36NNEj8rTx
 Ydxf+IhyDvKirZpsoBs+jy3Tf6j8IlfDRKc0wHDokh3hs/EKgO8S8mfRcFlaIKWoHOdz
 SNDg==
X-Gm-Message-State: AOAM530HonJMfLGSnW0pHMk9nuY+eZg+0LXfL007oL3/tJftD6LENnHP
 2TtpDtN1+tbRB8256m8A4+3msW87pv4=
X-Google-Smtp-Source: ABdhPJywTtw8ol7uVZxuSBH09gpL/+Qdm37XsvuFvm1+p+OUGI1xg5LsT3FXurJ+7fKdgLJ8bATxZg==
X-Received: by 2002:a5d:5258:: with SMTP id k24mr17188869wrc.390.1631957512973; 
 Sat, 18 Sep 2021 02:31:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j14sm9233858wrp.21.2021.09.18.02.31.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 02:31:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] hexagon: use env keyword argument to pass PYTHONPATH
Date: Sat, 18 Sep 2021 11:31:40 +0200
Message-Id: <20210918093140.5797-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918093140.5797-1-pbonzini@redhat.com>
References: <20210918093140.5797-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is new in meson 0.57 and allows getting rid of the "env" wrapper.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/hexagon/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 6fd9360b74..c6d858ffb2 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -156,7 +156,8 @@ dectree_generated = custom_target(
     'dectree_generated.h.inc',
     output: 'dectree_generated.h.inc',
     depends: [iset_py],
-    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],
+    env: {'PYTHONPATH': meson.current_build_dir()},
+    command: [python, files('dectree.py'), '@OUTPUT@'],
 )
 hexagon_ss.add(dectree_generated)
 
-- 
2.31.1


