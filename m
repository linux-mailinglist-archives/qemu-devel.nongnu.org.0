Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD8641B001
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:27:37 +0200 (CEST)
Received: from localhost ([::1]:48680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD8y-0004fl-HD
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaM-0006gs-De
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaL-0001Yf-01
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:50 -0400
Received: by mail-ed1-x535.google.com with SMTP id v18so47488346edc.11
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hagtKSKeymEdKzgkRVDA/CGvBVgxGAcG0lg165ITsKM=;
 b=Ebb3lRNs/9hMdZ171UUJt0/7ti+KPSwu4BSU7jxoyK3gDV19UBqeqRKBe8AiZzpRjY
 gzwYRzxq1P/L6uWYmDL2K/rye7cRAq1E4gmNXnvJTuuVLr5sEG6FvXX3cns517eFTJfp
 RsXONxsgcibDpxZV+IJgPRbms3DXNuUSvJYgksuSWolKh3eIFgegdXLL9B5M+UZTP18Z
 kSUytmiyKjuWZ1xo/UEEWz6RYZZ3CXsbvV02pm8x60eqS0BepwZPerM3pxR63SpUTKXC
 0HcttW9+gaWmncXZZoxOfiAkBig7zJjyTvLSAbxNC7tFgP4AW4/mejXJxjV941RPb+G6
 cnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hagtKSKeymEdKzgkRVDA/CGvBVgxGAcG0lg165ITsKM=;
 b=49b+iigKaJ6g1lm4Aukjf3aqkUIWKU67mJBBfc20UP+kmEUGQm/krzUH422BhOFZIF
 RCs1SDrKRbf2eedztIY5WQg0FvGfBLlSGRgWWKCZLR1hOqwnr0a3IOOuQepeDYpzfrRb
 hXOij4iatVwHhlgp65CBO/O/LoxI0hJrjfZn8hkCwrTfkaH1B+ccaN9/FrNM/usWSW7D
 LGJTmuB3lCnmuoaelmI6DBNxKxF4f60CUMipufTjB8lpi9HrxG/cnf/tBJcdRq/P9YDa
 aisG9Hf13/c3kCGpoC3DU/tmcwHh9sI2lf04JNeX5QVUP2x4cihM+yAmm3B/YIpD1tJC
 9Dfg==
X-Gm-Message-State: AOAM532bBe4UUDWedacgEx/bE5izEnaq64isy5fBIDNfihwEg6GM/Mnm
 XUALJovv9wo1Wqk2cCT8DhR2tKyEV5Q=
X-Google-Smtp-Source: ABdhPJxZUkupMtW8Rkb9JD0v+E83fqNzeMX2OTGElwz8dTIsHdn5PAu/NVbn++yKK47cOhK3NrKV4A==
X-Received: by 2002:a17:907:960f:: with SMTP id
 gb15mr1742004ejc.460.1632833501069; 
 Tue, 28 Sep 2021 05:51:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] target/i386: Fix memory leak in sev_read_file_base64()
Date: Tue, 28 Sep 2021 14:51:12 +0200
Message-Id: <20210928125116.183620-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In sev_read_file_base64() we call g_file_get_contents(), which
allocates memory for the file contents.  We then base64-decode the
contents (which allocates another buffer for the decoded data), but
forgot to free the memory for the original file data.

Use g_autofree to ensure that the file data is freed.

Fixes: Coverity CID 1459997
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210820165650.2839-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0b2c8f594a..fa7210473a 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -565,7 +565,7 @@ static int
 sev_read_file_base64(const char *filename, guchar **data, gsize *len)
 {
     gsize sz;
-    gchar *base64;
+    g_autofree gchar *base64 = NULL;
     GError *error = NULL;
 
     if (!g_file_get_contents(filename, &base64, &sz, &error)) {
-- 
2.31.1



