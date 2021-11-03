Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F85444492
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:21:35 +0100 (CET)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI50-0003FI-4G
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpS-0003dw-DM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpF-0000zA-VZ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2065439wmb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hf6F8LWwHbQDD2Jjgb4WPM+UfGS9Me1LA1sRup9TIeU=;
 b=aqM65JexbnK5Wej+E5u6PFyc3u+pJ+gXabm8XwEeiBowyWC5K0iZN7qHGi3Bpl9YHZ
 Ejgu0YGgmzKY5PufqmAKUnDyyv4XBs39LML99A52gBkJPS+IjDUi0jQQaiWUh+TdbyPx
 eBkKPpYdagVKmZtJXrI97HuBWLp8K+XmAAkLkpPH3sF9JtROH0bJDLNMMkhtDHAvoWcC
 o3PKE7Z3SUErQHToEFinw5JnQ7TTXCOW4qslODjtdf+dS+DxWaeAg3YHTHQixVcOBbc6
 +P5Y6O13nk8l6pOQEcfqyqRMqqTrwLNUqfh842exH94j7VfVy1zDhHg7z9FAugmz97na
 9baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hf6F8LWwHbQDD2Jjgb4WPM+UfGS9Me1LA1sRup9TIeU=;
 b=Ss46BYvkQ4pn3tJS1b3EOcvB9SW22E+Taygt+2kMPVM/NXhrpo9Sry87COEAXupkAo
 RNzGrPwwSYdFgHpmM2fNx+9MXDnhwxylzU+D5gRMKwjkIG1nJ7zX03KtluRW7al21Zas
 4hQEWRZeT7ukaVB/lsmf48jztWT0p2OR3rklHTZNwcR18W5v5SOsf+X4WctkNlTQdCXc
 5WoS9mPLrzIdJY5kkjJHK0b/Z8CJoYSv8AY47sKnQ9RetDNOLibRYJg2NRkGLRhST6fA
 jylki139+T2jy4mOoRm8wAN67qCk8vzLLKvM3hDJpGaSZDpJL1npiG4S5iBu1kDEGeQ3
 hlUA==
X-Gm-Message-State: AOAM530S2OTM7qAnHXrmnx8YdCDtRRk41MLw8iXmUbvclYEBEFCKtk5/
 haslaj5/RYtEyWTvi7zlw5drXGLKXHU=
X-Google-Smtp-Source: ABdhPJy1EWa7KQNuugi8vV7vv5CM/c2QCXc2/bRmPFkKGhhT8gTzr8IVVN9FRqYz5NSU3ST+pqQEBQ==
X-Received: by 2002:a1c:48e:: with SMTP id 136mr16112444wme.21.1635951914447; 
 Wed, 03 Nov 2021 08:05:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] configure: fix --audio-drv-list help message
Date: Wed,  3 Nov 2021 16:04:42 +0100
Message-Id: <20211103150442.387121-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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


