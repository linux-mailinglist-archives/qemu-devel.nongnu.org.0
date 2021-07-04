Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1533BAE57
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:39:33 +0200 (CEST)
Received: from localhost ([::1]:59016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m071g-0004ZR-Lw
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070M-0001vF-0r
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070K-0006PC-Ke
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m18so19262908wrv.2
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2EMDwBpcsIhGIfw+t8mJgctVziY8HatqnjFSuCOg6o=;
 b=rqjWe3Cmzb+7R9fK2CvpxsA1bQwRpnvp2FZRAFwOs7IBBHBscAhyDBTHRjyDYJo8nu
 UBF0Zitw/477v/EC5mLBwvtb5Y6fg4ltt12AfrWAiJSgaVw+f6Wpvx1vW5YEuuUCv67C
 qxqBFgYDOUj6Kh/IEsLg3SbSTCaUlMYsWUDW1HlWRwiwhQJaHOaBbzYmfm8dNhi5G72K
 EXgCnyqGghOXYqmY+8C35bgEdsDZ82QoC1kJkP/ajO/AGv7oYfyx7/4tYOmx33eGlwI2
 4e+B8XemV3hrddGI4zBwmpDon8JmwqaBPGzcL5WafbakZZdrBrGuzFfzMcsEl45pZk05
 88sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U2EMDwBpcsIhGIfw+t8mJgctVziY8HatqnjFSuCOg6o=;
 b=XBmQIvgjt4YxxqaF911c3Zx9Rlu0DWJ5mzW/eWBa8ttGwUwWGzUxzOL+UOUteF+DoF
 zPMt7jVnF2VLh+z6JfTze30YO9pdMed3QbVXW3u9iahmtEwSJushnhg3Khm5QF6jJlJl
 rtRQWl/+kSufQlW3n1loAPM4xnF1bgQLj7QpWwyD7by8ar0kcVBEh5lk6rj1lTQKXG4F
 2AyVv5//Ek/TDm60GOFEDVi5U3EUbsf7DCmQf9nzQ1575NZfk+FxQYXp2xQrFVRbCofG
 L/eUpnVHS0NfQRM3EnF/6jXWVCGZ5c1Uhqivn/dJr02JNOsuaV/IO3F9Wtd5tWJ9FVk0
 sdLA==
X-Gm-Message-State: AOAM531a98rOE48yvmnq/l722+pDakHeVr0K3EvJ33a0ozaYWfJoJJj8
 QadvP7ZWG/fcP4vu1CAH0S6FlBvgolc=
X-Google-Smtp-Source: ABdhPJxAMrWikCwqldtX2j3JXFL2nk9Za69JoTKPcfF7cqWWiRZZJZG1OBpSxIOjpwAzhd0sTCe3Dg==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr888345wrt.113.1625423887190; 
 Sun, 04 Jul 2021 11:38:07 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z25sm5134426wmi.48.2021.07.04.11.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] linux-user/hppa: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
Date: Sun,  4 Jul 2021 20:37:45 +0200
Message-Id: <20210704183755.655002-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/hppa/target_syscall.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index f34e05edb57..97a095656d8 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -27,6 +27,8 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
 
+#undef  TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef  TARGET_ENOMSG
 #define TARGET_ENOMSG          35
 #undef  TARGET_EIDRM
-- 
2.31.1


