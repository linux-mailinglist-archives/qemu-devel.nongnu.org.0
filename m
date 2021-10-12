Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB042A9B4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:41:39 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKqQ-0005Sq-9A
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maKYN-0008Fc-TL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:23:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maKYL-0004cY-3z
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id r10so68630092wra.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EyFbqnFWvpswgmaXbrxja+M7euh8/b9gxlszKivEwFY=;
 b=Yo89ibRY4OBnhkQ9jvcmAPUbwYsiT4Cx8maBEYTJw4HNeLaXwkdnPlTtxPNpNzo8wG
 wC4bTZAR2VGIq5t7YTomGUGZwZ+CmsmtnxSlOGrG1lQgYPEfWzdCrft9H6ew6vLAPWRE
 MYlwRaMnDM8QlpTzX52jqTywee3qCLRjRlOdU3/RaxVD0Pyu8BFRvtNLOFeqTl85nUWp
 EJVvYfIiozvAiDLHPS6C6iz+2DxLmuxTIkO8BjILpyLY5hYsllP8km+hh75HDOfbdlSH
 t9uO/eZT2qG9FsiHw2114Hi7W11M1rQLuWo1QvF52tDvOu0hkCW8yltDj25bQ4p9RZqZ
 NVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EyFbqnFWvpswgmaXbrxja+M7euh8/b9gxlszKivEwFY=;
 b=aedo84YMCIcxYokuGkGeSYOJ+2YVvIef15NgNnPOzrQV5KCuJQtmniFhss1Yy3gj8e
 TdifVHEye0FZCrnou5uW2/4ulTJCtxyvEvcaNJ1LzM/536L1GFxCbOA3Jc8kgto1o9PR
 nKS7x4dIAk/XBrRbxMiGzF8fCTZAq8DYY8pYtVg7byTVw+QLNHiRmei9gWL3J/Bes8RT
 yGIRiIYIUcP/3bAkLeRDPnWiTWzrqm/haHruFGv6rXpEs5Caxl6yuRDjkdto+Jy4qUKO
 BR0GtoISDuiwahhf/78H1UHXUixzr66Mc9FpCmKWR6sGcWgG1j22kYY+Bi01jdelrDEg
 1T5g==
X-Gm-Message-State: AOAM530lK451sf9jcp1+CECDx//UtGBkMOijVVUU3zGLkci7mIs4hzxn
 u/cvqa1vfR4I4g1elbRX7qo21d3wS4s=
X-Google-Smtp-Source: ABdhPJwCzmT0FyT9DtO4W5Nug4I6yijSE5jB85mWNiJbVdsvvTTWMK7sLVHy4h4RYnUgfOA/GjnKUA==
X-Received: by 2002:adf:b304:: with SMTP id j4mr33495513wrd.160.1634055774891; 
 Tue, 12 Oct 2021 09:22:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n1sm2952350wmi.30.2021.10.12.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ebpf: really include it only in system emulators
Date: Tue, 12 Oct 2021 18:22:52 +0200
Message-Id: <20211012162252.263933-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF libraries are being included in user emulators, which is useless and
also breaks --static compilation if a shared library for libbpf is
present in the system.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meson.build b/meson.build
index ca7b9d60af..6b7487b725 100644
--- a/meson.build
+++ b/meson.build
@@ -2595,8 +2595,6 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
-
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-- 
2.31.1


