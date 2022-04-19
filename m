Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B256506473
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:29:46 +0200 (CEST)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghMv-0000q9-Ay
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglv-00019z-4W
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:36 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggls-0004QG-Kp
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id m14so20920516wrb.6
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MsfA/9glINbwkIjZMRchO6BQDlKZM5vNXBQVpYPOsoc=;
 b=KWvVAUMl+cDewc0Tw7y6SwbZeqMmTUzwFhh5k8NgGhc2lf8RPfqSkexiNLgo73+/lr
 IsoNYI/EUL/2cayNrTx70D5ivkUTqXUqCFjKu+c5WeK/XejdMkfSyk02+aIPIfzxEbIF
 +H8ppapBtT1YWxoAS/Y9yVgaqnwRqQLx/hND5JnRhl7lmbP7n1A9uammOTTZzkNt9Aj8
 Cx0GrPo7ZjJilQYwQ8FIFbCwwZcDGufX/Sc5XCSuqZ/TGq5B4ABcrBxmXTDRPkc6NSVv
 s+f6ONDo0bnwqh3NeMW3j0/mogQpM6BjVt33X3ZRlwuWw4tGEn75+r0xjAjifqewIWDx
 6bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MsfA/9glINbwkIjZMRchO6BQDlKZM5vNXBQVpYPOsoc=;
 b=ZJ4/3xA9D1FcQxx2AEL6Z9KapA9rn+kIHCxD2aAWHHaQTV40+LF0L8NT8n/MKoxZpV
 C7gyerHpUxT+XHPK/vbiGHF7XVAYVJVjGxJoo9fBBZqWtWkGXF7sE08LwEuOSQMvRWBQ
 8TpXeEcxJr3ynws4kYE5/zSBSlrhoSM07C4DT03+gfEnNqJfDvrEhu2+kvWFhWMowL64
 Y1Wk1pzlGRkIzKOskiJvxLi6UknbFOmAw48WuQY7gMfnwWK0oBjM/6ihFoQjYzaATBUO
 uE8hTtE1J6AaXliG7EqZjb/vcvKsXxqrL/6TF71lSM/IbYOVU9Bk0saopJQIUl24jP0g
 VtVw==
X-Gm-Message-State: AOAM5328Oxu4xQqdWNyMXo7D+f15yAtYj0+dSu6HmE45WDvh+fwe28qi
 u0vW0/vxlwgZKoIFpcTLFPyMq55NodS8jA==
X-Google-Smtp-Source: ABdhPJxn7S9BhvmcZmePes8qAUbQvCsqokoZ/EbozI2Xnk08uZj9DKPVZ7NZA5D7ETuz6QU2h7kolw==
X-Received: by 2002:a5d:66d0:0:b0:207:a53f:5c2d with SMTP id
 k16-20020a5d66d0000000b00207a53f5c2dmr10347509wrw.440.1650347487038; 
 Mon, 18 Apr 2022 22:51:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/53] include: move TFR to osdep.h
Date: Tue, 19 Apr 2022 07:50:37 +0200
Message-Id: <20220419055109.142788-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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

The macro requires EINTR, which has its header included in osdep.h.

(Not sure what TFR stands for, perhaps "Test For Retry". Rename it ?)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-17-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu-common.h | 2 --
 include/qemu/osdep.h  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index f9b3f85b81..db8b03be51 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -10,8 +10,6 @@
 #ifndef QEMU_COMMON_H
 #define QEMU_COMMON_H
 
-#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
-
 /* Copyright string for -version arguments, About dialogs, etc */
 #define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
     "Fabrice Bellard and the QEMU Project developers"
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 240b48707e..489a5d1aad 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -226,6 +226,8 @@ extern "C" {
 #define ESHUTDOWN 4099
 #endif
 
+#define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
+
 /* time_t may be either 32 or 64 bits depending on the host OS, and
  * can be either signed or unsigned, so we can't just hardcode a
  * specific maximum value. This is not a C preprocessor constant,
-- 
2.35.1



