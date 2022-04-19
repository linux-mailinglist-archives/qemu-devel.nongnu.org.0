Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE8506458
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:22:26 +0200 (CEST)
Received: from localhost ([::1]:40444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghFp-0002fj-89
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggln-00017p-Lu
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglk-0004Nu-Oh
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:23 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b19so20892854wrh.11
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EDEwZcar5ORv8ksYrfaNq2fJBsxyVQXuyRjJVQkoz+k=;
 b=guKZU4fq1ncPJZjVVeOeUoMXnLWBHUslw8v1M+cs/MXVwo7O0kUW7TXsMKxlFMWM6Y
 6WuQ8Vbdv3iZZSmhRPNiu2WOOp2KdQPc8R1nXS5b00N7aMJPwsgNZGWr7YsxxKPpuf3P
 R0BxADgG/gBdizhsrPONx+G/yX8SPF7NpcQxTyS8WRMoCw0979h9oq5fja9XrF3p5i/2
 iEhiRYKFGJohbrc7LIpdf8K0BiwAfDDj7HzLpRo97WQzFydhFT7tMA09qDzaBFXYZfyd
 sgvmEJJroNA0/SUszobfZjNTpKCVQcqAJIbfNnHh7h/8pXaJY02/PqESHpz7CFJHGsFr
 0l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EDEwZcar5ORv8ksYrfaNq2fJBsxyVQXuyRjJVQkoz+k=;
 b=V0uK91bqa+nGEtUUMacYCyoNdRuLmEYOEYDoRyRSA6yRv6czbxTXVecNaiF5y1eL8i
 CuyLrk34sTYUXmwTkGVFODvOm8uit2QSmg8WR7eOjZ+fXcCMl8KM9zgUEpPRjA5FeOLv
 sFdSlcbHfSMYZtx/I/ZT8ogViuNudpZdXDU4oh7eXAYtzpiJb1sIR1SknnrJkTaBZtPH
 jAMmgGB+Wf/ycvm4C/ND8Fs9QWKMeNXrXccqqRiO0vmdZoqkBo/e/n403pysYWyDQ4db
 1ppjWbsP4IckBqTwZub/ENZex/67yjowQtXdvC0lo4uRzcQzyPRo48L7g2KXKUc0fQ9J
 pY5w==
X-Gm-Message-State: AOAM531sCFbA7Oi6H8vcxeJio8qmu4ix/D9JnW6BBQ4+uDytEBSBxpC/
 yMn/hQSOT9JqekhY0Q2PhKZ5cDFxOhuOSA==
X-Google-Smtp-Source: ABdhPJzA5HfS0YHOhf3ESBm1Jx1GwQ3vhrKE1mI/RnJIeU1+Clmh+1kJVBwDpkJnI/6GpcxeJyGHGg==
X-Received: by 2002:a05:6000:2c8:b0:20a:9587:76c1 with SMTP id
 o8-20020a05600002c800b0020a958776c1mr6204902wry.335.1650347476950; 
 Mon, 18 Apr 2022 22:51:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/53] meson: add util dependency for oslib-posix on freebsd
Date: Tue, 19 Apr 2022 07:50:23 +0200
Message-Id: <20220419055109.142788-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

kinfo_getproc() requires it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/util/meson.build b/util/meson.build
index f6ee74ad0c..bb0b010662 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -11,7 +11,11 @@ util_ss.add(when: linux_io_uring, if_true: files('fdmon-io_uring.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('compatfd.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('event_notifier-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('mmap-alloc.c'))
-util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
+freebsd_dep = []
+if targetos == 'freebsd'
+  freebsd_dep = util
+endif
+util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'), freebsd_dep])
 util_ss.add(when: 'CONFIG_POSIX', if_true: [files('qemu-openpty.c'), util])
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('qemu-thread-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('memfd.c'))
-- 
2.35.1



