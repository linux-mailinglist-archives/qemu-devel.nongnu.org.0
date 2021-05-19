Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8140389202
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:52:41 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNYv-0007w5-18
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljNUt-0004ZY-4Y
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:48:31 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljNUr-0002zB-LT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:48:30 -0400
Received: by mail-ej1-x631.google.com with SMTP id p24so19125066ejb.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lu05aXLx5xb3o16kzJl0sLU8XBVd2ZPC2Sw3dfs2kds=;
 b=klDc0eksZZH5tL3Tn4AVfjuGk7cn/k346gQqJeLG6Rwgfz8jBxQefCI3HyLtNJEJwB
 oyKJvh+fboTnR3itN9s6wxYZIbMgJ6Bl2jbjc7Fcp+s8JcvkpXZSfR30wcop0NRsbL0J
 6YL0ia+VZtDu/IQVtkC8fKTn2dkYfAO8Bf0Q1EbGPwcyAXad3PRbGIq4Z1PcavJ66f6t
 sWcqXX12GN2fZcM4UGcWE1YTt9CQ034q0rm0K4tk9LtlfmorEG35R/Rm0OPhDcUP3b+S
 5bRXbKlua8VT+f3NwcCr2MKE0Iy5A3vTteWFYeK7//KVdx4iEFsToggtI6tmBN88Lh7/
 UgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lu05aXLx5xb3o16kzJl0sLU8XBVd2ZPC2Sw3dfs2kds=;
 b=of7onQ0WuILgWw1E/uqCKigxEr35/1DT9Nfc2rSnKvBHTcO7/hSeyWjfUsV1OrrsJf
 9cQF4dz93EJSnuTseNz8NW3nOWGkeoiwuu40YbJtu3gyxx9BT2MDWuJW6+vXE+o1Fvpd
 H8e0xJtvYeeDcOWpYp+TwWw1fAVQv4DHwDZP4ivdoKouxbjpt4CYCR4Tuxe/WWCbpJgN
 jyB4jBslxytDpTTiHEPOF447Z+dIggt1FlteOhVbJP8N9FHYE3yGzg50cJoGB36rcZPs
 X2L+xKP8iJC0KfF2JfBcc+/wsvRhHIt18cT+2oOJOTsn68s36JyCnjnhLKhdiWPVQzLr
 Xm9Q==
X-Gm-Message-State: AOAM532Ro7B/Zz+lOscinorLzD66bggnekyvsMoPa+xJJ7EjL6FWPoDm
 jBxZeoBCQ3GasE1nvKP3td86VT1BUkvcNQ==
X-Google-Smtp-Source: ABdhPJx+PIiGkw6tLp/gPPNrH1FXI4ubkiuRgg97JUOk6SNgHv7T/ulPgpD6eXX0jvZKZg8zid62zQ==
X-Received: by 2002:a17:906:46cc:: with SMTP id
 k12mr12823028ejs.505.1621435707766; 
 Wed, 19 May 2021 07:48:27 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 p7sm8128346edw.43.2021.05.19.07.48.27 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:48:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove STRIP from config-host.mak
Date: Wed, 19 May 2021 16:48:26 +0200
Message-Id: <20210519144826.154957-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The path to strip(1) is passed in config-meson.cross and is not needed
in config-host.mak anymore, so remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 4a69f12f3a..6ab681642a 100755
--- a/configure
+++ b/configure
@@ -5503,9 +5503,6 @@ echo "ARCH=$ARCH" >> $config_host_mak
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
-if test "$strip_opt" = "yes" ; then
-  echo "STRIP=${strip}" >> $config_host_mak
-fi
 if test "$bigendian" = "yes" ; then
   echo "HOST_WORDS_BIGENDIAN=y" >> $config_host_mak
 fi
-- 
2.31.1


