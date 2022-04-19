Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E914E50641C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:02:29 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggwX-0001RC-1O
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggll-00014D-0k
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglf-0004Mx-7x
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id e21so20910477wrc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8n7YayO6LjazF33AzTer7fETugLn5e3eb7rT2O0tPOk=;
 b=EdJwcLwxoUCobNmf8bWK3jnDdBIe2idRq3Ll1H8HyrUJGkSLlEPxy0EeMRf0ZZ1a+B
 3L+bJhMx3aIzaGBM83/hd27AmwcOWmkQqvazYBLo9CvEnp3x8wpszPU7B0sOKV70vsU3
 oZCMows528jTtmrEc0d+cJDhSZV3Q+2CvhRgQyItpARoCqGMU/w/4JoZ3rIYoGGTRxHi
 rvUwxBSW573Ny0RvA8UiDWBpJ9Fi2Z8PHS3OmXKsdeMClvDHpHOTcBo4pMJgnRDVmgIW
 TVU/jJUg6wHN3shWPIUbRuB5w8wiI6+c0fmzxMspFIeOd0uQSaAO0shE1WEPOw1CqQgo
 tTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8n7YayO6LjazF33AzTer7fETugLn5e3eb7rT2O0tPOk=;
 b=W0pCLPD+q4wiSHXkx2EFhgZLxFhG7BBue/CU7xTD6TJn7bFSVQXw5m9h4/0nPxZFKG
 hZiPahnKNfS7K4PsVa0RICAMBzAhsQb7JvU7TSe9ZSAnKOD9oGSNhVmDlR5IS76BTvsd
 U6ltKq0gNAXPxsKxgNTQ9ba9cfUpHTK+KRKvGBOIWxAoK7RB7eS4ofdFX9NcSclkexI/
 XgmtCNlnYwhJDxGUp1HDmXa2MvRYSCTK2VYWuwcDmilM7VM5QxC2jyrMkyqRpbhlU4Ck
 tHW+7iO0VD6c+NqYxZWuJwNcgmIEvFLLzDFClISsBYFyrwUXyhLu6Ixh+QjhQ9ywALLt
 +fuw==
X-Gm-Message-State: AOAM530+6joaDJoMx8PSofIOuv3mxx9fk9J1Di8OlQQ5Qhgjy+d1KCLp
 TY9LYNYoRNpbUs9QTUJycR+YsVPmuay6BQ==
X-Google-Smtp-Source: ABdhPJy3tEsc4eCvWdLMJwCyCqSK7NPfxkzQMvkNUtaqdyLgVonyRNZ1Gq0xBCO/QWK7QSZJqIrJ9w==
X-Received: by 2002:a05:6000:1002:b0:207:a28a:c86a with SMTP id
 a2-20020a056000100200b00207a28ac86amr10349321wrx.361.1650347473844; 
 Mon, 18 Apr 2022 22:51:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/53] qga: replace qemu_gettimeofday() with g_get_real_time()
Date: Tue, 19 Apr 2022 07:50:19 +0200
Message-Id: <20220419055109.142788-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GLib g_get_real_time() is an alternative to gettimeofday() which allows
to simplify our code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220307070401.171986-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/commands-posix.c | 14 --------------
 qga/commands-win32.c | 19 -------------------
 qga/commands.c       |  5 +++++
 3 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68e..1e7b4656ed 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -136,20 +136,6 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
     /* succeeded */
 }
 
-int64_t qmp_guest_get_time(Error **errp)
-{
-   int ret;
-   qemu_timeval tq;
-
-   ret = qemu_gettimeofday(&tq);
-   if (ret < 0) {
-       error_setg_errno(errp, errno, "Failed to get time");
-       return -1;
-   }
-
-   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
-}
-
 void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 {
     int ret;
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3c428213db..15b451f0a4 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1751,25 +1751,6 @@ static int64_t filetime_to_ns(const FILETIME *tf)
             - W32_FT_OFFSET) * 100;
 }
 
-int64_t qmp_guest_get_time(Error **errp)
-{
-    SYSTEMTIME ts = {0};
-    FILETIME tf;
-
-    GetSystemTime(&ts);
-    if (ts.wYear < 1601 || ts.wYear > 30827) {
-        error_setg(errp, "Failed to get time");
-        return -1;
-    }
-
-    if (!SystemTimeToFileTime(&ts, &tf)) {
-        error_setg(errp, "Failed to convert system time: %d", (int)GetLastError());
-        return -1;
-    }
-
-    return filetime_to_ns(&tf);
-}
-
 void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 {
     Error *local_err = NULL;
diff --git a/qga/commands.c b/qga/commands.c
index 72e6022207..4e9ce25b2e 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -585,3 +585,8 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
 
     return read_data;
 }
+
+int64_t qmp_guest_get_time(Error **errp)
+{
+    return g_get_real_time() * 1000;
+}
-- 
2.35.1



