Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9844302F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:20:29 +0100 (CET)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhueK-0000BT-GS
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhuHS-0002TR-B6
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:56:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhuHQ-0000dc-6W
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:56:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id o14so33343202wra.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hf6F8LWwHbQDD2Jjgb4WPM+UfGS9Me1LA1sRup9TIeU=;
 b=h+2YaQGeCxBM6zqSvvEK8PVN9PjrL1zrsx7mu8TFdKlt1n81kNWos5sGsiLQ5mPkS6
 zXgXyxtgrl9R+4pNmUjzptI0eoMWpK5vI/F5dAD89CBAjdqtUE/QxuwL3GHf8BuR4pEL
 mTVMu0cLNQo41D2rHUeDVUa4953t9FfnX9uCvGW8zBcV2F10FK1sGYlwf+mSw/k6Benp
 ePx7ITNsP1DI2b6WhywTQYE0DYrnTlq4yIc8blN4SDcYmI4aRqgZubjQ2Qwi8i0+ZTHo
 Yqcjai1KFM5J46v9lzRTxXNdjB57k8UT+be871eDEKGjR2xwspIs/lmJI0ZWwM4npzfW
 boNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hf6F8LWwHbQDD2Jjgb4WPM+UfGS9Me1LA1sRup9TIeU=;
 b=ORxwXQWcJCfKc75B2ViPpqAqcbujAtkoq1AuwqfDT8QHmgHzVA4smret4mNhKP+CLB
 LJ6CDZQx+b/dcrqUixmGdiA86Grg/g9ndPVsxHx2uRGGzeU2piVpXE0Uvhf+NbBY1tu/
 ReIqbn6nS+feJYiLeAEJhFa79Nw6k430hLIFtLqgWEoefgFPZuxDJ4rH9ArMbBfVbwKT
 xrYf5g56F3fM7NiUINGxRsDjaU+GiZjmSlLqcPs0wxcejYXKixVQTorWtEx1k/28b32O
 1HESvrPBfVo03SPLQMpkuyccuKMAan32S3DoIU/Gy0BiaLO1ZmNk5GXwc6GxsU6pzp6E
 CBHg==
X-Gm-Message-State: AOAM530qkxVvpetXWuu0BtEauFqMtWPCRRwjc1MUZqK+dspHG6YuJJtf
 r5xa9SLwzG/02GQpHBLyPsvlkRkcU8A=
X-Google-Smtp-Source: ABdhPJzTArADSX3wHV6zXWxRX271FKe2jJCEddQSQFAgwyGCsV4aXgZSlEhUX9mJhloAKiS8EowoUQ==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr36622424wrv.240.1635861406851; 
 Tue, 02 Nov 2021 06:56:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o1sm9863758wrn.63.2021.11.02.06.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:56:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: fix --audio-drv-list help message
Date: Tue,  2 Nov 2021 14:56:45 +0100
Message-Id: <20211102135645.213417-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--audio-drv-list is now establishing which audio drivers to try if -audiodev
is not used; drivers for -audiodev are configured with --enable/--disable
options or possibly --without-default-features.  Adjust the help message
for --audio-drv-list.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4c444e1750..97fee368ee 100755
--- a/configure
+++ b/configure
@@ -1390,7 +1390,7 @@ Advanced options (experts only):
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
-  --audio-drv-list=LIST    set audio drivers list
+  --audio-drv-list=LIST    set audio drivers to try if -audiodev is not used
   --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
   --block-drv-rw-whitelist=L
                            set block driver read-write whitelist
-- 
2.31.1


