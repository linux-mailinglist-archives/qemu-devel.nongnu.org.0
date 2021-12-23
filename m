Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980947E2A8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:54:05 +0100 (CET)
Received: from localhost ([::1]:41406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Mfc-00075Z-2H
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:54:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdJ-0004HP-Co
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:41 -0500
Received: from [2a00:1450:4864:20::42e] (port=34742
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n0MdG-0008ON-Ps
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:51:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s1so11008160wrg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vV2h+B5IOnbHlbjwkV4mqWwGFqqRbWIHymfX5TQVsM=;
 b=W+R0kRf/JcsD3Oj8G+3A6TN58Iq91ZyOm4T9t6FnB18Q1q8HK19PLcweyBPcIgZrsg
 NJ9XsYpojH87DWK0eZSih3JtDgk55O6xB5Zeofl0ekkjnPnsbDDhZmoFbEE67NHZ3GBH
 ZsSqs+a8TRkVNsmD92fiFexe4jT+eDvcLsD8blNRza+BxmmTgxaB3hEPC1bo614MQE//
 qcad59/C9Suz5D+044UlxIXitIZHfPs99SHDjHRjduxNZdmk1eqJ3OWA6yqOvH4Qb9te
 gID6JDm/ICaqfPmIsMRmWVsFGWoy+YBduzjG9sqSM5ocndI0jAErWUJWQjcVikKAVERi
 P8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1vV2h+B5IOnbHlbjwkV4mqWwGFqqRbWIHymfX5TQVsM=;
 b=BAn20hY9yd682n9wkw3XKjbLhAJGL0xvmfyTs9mgvK1vxhMTBQ16cnUluF3NciMj1t
 /st881CJ/hIIbQCCriGmF8UL12iav8EayR5HJPY4RPlRragBiGFYqu4CwogNsTwEwhUg
 8VJyyzyVsS+O46/O63D/BA1ZcklFoVWU3nb7edC25LwHM3x6xHYeahUbQU3hknyLOuA7
 XHHk462ixRODQ5i5tdLH3t3uJiZFOsgYSlaWfvn1F/t9Fe5ywUaCjaCQcBkw6zsbISP/
 K+X7vOCUF+PIC4Dhsz+lhpq7XS+sNdHWJ+EY/xShGnA53lO23hQEmCDoXeWL3f+9TeaT
 tlNg==
X-Gm-Message-State: AOAM532o6t6QXFnaQB4NehHEY8K6PAcf8Ycvrp/Yb8UbsruTHVn3Eam/
 gIii/O22cLpPem9IU3v5bEvOyeCxlso=
X-Google-Smtp-Source: ABdhPJxlitIAyseRiJUoO/AgGdQGiSRCdBecGV3RyFpz7byb3s3E21z4yimiWkUJatzvM47J3wvm8A==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr1582907wrs.604.1640260297255; 
 Thu, 23 Dec 2021 03:51:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o2sm4537106wru.109.2021.12.23.03.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:51:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] meson: reuse common_user_inc when building files
 specific to user-mode emulators
Date: Thu, 23 Dec 2021 12:51:21 +0100
Message-Id: <20211223115134.579235-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115134.579235-1-pbonzini@redhat.com>
References: <20211223115134.579235-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f45ecf31bd..b0af02b805 100644
--- a/meson.build
+++ b/meson.build
@@ -2897,6 +2897,7 @@ foreach target : target_dirs
   else
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
+    target_inc += common_user_inc
     qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
@@ -2905,7 +2906,6 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



