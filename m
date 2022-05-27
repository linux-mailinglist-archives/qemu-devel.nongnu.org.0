Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531F5364D9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:44:39 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc8k-0001yx-4A
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0f-0000OH-40
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:17 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0c-0002QU-Gq
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:16 -0400
Received: by mail-ed1-x532.google.com with SMTP id d22so5900088edj.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVTj4s4nQhvuHFNWOpLeu5pMTeWOPsbZt0UjVh8Cyfs=;
 b=mA8pH83hUqzk8dozAMYhRtf6rmE2/FaLQow4RJFRFYKYQp01ta7PBA7XYHGO8kO05y
 JiMecffgaNdWodm3AS6UFO8J7o53eZlyBsOSX7gWG6nz3bSv3E+mSh9ei+Nmh9nn14L7
 l2ToiOAb8D6mKprOkhDpiBDnlBvmhTHamTZRv9g3vA7HJgyIcR0Nm4e+BXFF053JY/G3
 TAyZGFaTzeYGJJnA6Kn44tJMIvlRFD9PP1hh39sKagu7fbWfXuUrvLK2KbkNYUDq/F3S
 +w8NH4zm8fnJjgn9b+Bhbu/GX3Y4VcQulnPifN2Ja1zpT3kESErzNN/dFYqdyeCute6H
 sIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVTj4s4nQhvuHFNWOpLeu5pMTeWOPsbZt0UjVh8Cyfs=;
 b=JjHdrEt3cAgV3+d7GATVONFSPyghQ2XMrpns1Z7qXKYUl7lRM5xmattaYSyJ98Wgb9
 VM9cu4Bv1IhR6lvKZtw18COmmiNvxlLFfj8BfKXfwE2Yzz/8XOt4ZGLCI7ZiHclX0yGV
 EBtrUsqdPU0OvIr5jrtAf/NcTvTVlgx+AUF35mRHSnyKQN6pdc3WkpKj7w+8crMvYuup
 UpYtnMJp0wLwRBsz67FySIWInPjtJnwDUez8CzShWNgDHg6pmdTtX0TolOmUK68dyJ8y
 3zZoEWikvSjVJkLq2kFKIb2OKXCYNOXY7+xvspcmrY6NnLNz/aG+SXmlDkcz+4yMsGmE
 EpIA==
X-Gm-Message-State: AOAM531kQZ6M7ArStBcQVoNGKxEeWid0M2ncAgkVH7oW/j9AsGQk4AFJ
 U+cYwNKImSs8hpvyZq8Wo1A1gD3ADsM3iA==
X-Google-Smtp-Source: ABdhPJyVAFJ/ml9Pv6CCxYVH2dEQZaZudPduq48+Nh2RtHR1GlqL+Kgh417I9dCOZFr/OCZaPWaU9g==
X-Received: by 2002:a05:6402:350e:b0:42b:47d9:88ec with SMTP id
 b14-20020a056402350e00b0042b47d988ecmr31920287edd.407.1653665772581; 
 Fri, 27 May 2022 08:36:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a50ab51000000b0042bcb9379b7sm2268240edc.13.2022.05.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B67C1FFBC;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 04/33] meson.build: fix summary display of test compilers
Date: Fri, 27 May 2022 16:35:34 +0100
Message-Id: <20220527153603.887929-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recent refactoring of configure.sh dropped a number of variables
we relied on for printing out information. Make it simpler.

Fixes: eebf199c09 (tests/tcg: invoke Makefile.target directly from QEMU's makefile)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index df7c34b076..b622f37a34 100644
--- a/meson.build
+++ b/meson.build
@@ -3732,12 +3732,8 @@ foreach target: target_dirs
     config_cross_tcg = keyval.load(tcg_mak)
     target = config_cross_tcg['TARGET_NAME']
     compiler = ''
-    if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
-      summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
-                                          ' via ' + config_cross_tcg['DOCKER_IMAGE']}
-    elif 'CROSS_CC_GUEST' in config_cross_tcg
-      summary_info += {target + ' tests'
-                                : config_cross_tcg['CROSS_CC_GUEST'] }
+    if 'CC' in config_cross_tcg
+      summary_info += {target + ' tests': config_cross_tcg['CC']}
     endif
    endif
 endforeach
-- 
2.30.2


