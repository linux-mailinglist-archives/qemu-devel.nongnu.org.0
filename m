Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D86BED7B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 16:57:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdCQ7-0002lX-VZ; Fri, 17 Mar 2023 11:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ4-0002ki-RG
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pdCQ3-0007nN-3I
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 11:55:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id d13so5660538pjh.0
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679068501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Yi3XUo5Vyf7hVJ/JS7sYht8qm15aoRnWJkMV/b7vTc=;
 b=lYoiECYsPP4RrlccSMV7O/YZ539XKgDMJwqThJttWV86Y52qxWIsoRY6/FAMruz7sX
 RPxIa+/8+N320KzecHUWO17pjWzjYCOKgs7jRW/6hDdxYqYryYmurYMvSkNOIRXD0nkD
 7Y9NNw/nXoIypDJipltZ8v6z91vDYbsUgjc0J+YGqcnLpoIg/vqczbepMdXk5ovWH3+D
 swXQRXIH3dLPYqTPJNrXrJze0yyoS3bty92uXmMAcUFHsr3ITlrbq5IXUgGUZF9xxEMB
 I8/KV55piuM6Ms6SFQ6g37sIjP5l9VNs7Z0NwYQIEz3dnhEnZER1xb2NZccIyHWKb667
 7ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679068501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Yi3XUo5Vyf7hVJ/JS7sYht8qm15aoRnWJkMV/b7vTc=;
 b=4o0QLSnOo+j3v6ESwz4XcmOP0M0aspUxcl5wN1eTwwIhABcGPmYaGzz7hkChUa7DFc
 4jCosZarRQJE/O023MB5AfnuP9+Et3SVN/ttbNzG+Q3ik8BeiszBnPhhzjzG83XC5BxX
 iQkW8Aam6g/RHBPKLdYeKGWtW3baU9aUqqNMHIGVx8s5T3OMQPt+T58YlUabiOZnLjIj
 nP0DXoHp0nQym3Sk3YtEWQdfB17Xx8m6wVTqKa36RCpZUsFpgxdFJTjjIx4KZHhPlYsp
 NChtccCIZNlkdHmvep7fUxZizdnq7e7JYXgT6Yk/Bt3hrGYjXhJOMEeHKGillEYFes0S
 XeRA==
X-Gm-Message-State: AO0yUKUf7H0LH2nGPT51rV01WfnC3//TIXMzhGkCFW2wHqXSFWGY78JM
 0qx8zcnpPDvJrbd6w61JaKG3adwwZC1+tH5T+tU=
X-Google-Smtp-Source: AK7set/H+cPpTtSr0g6EWykbFzbdvIiG4P97gXyIPAbJLo9GOeXqPU3GbdfzGQYUff8zWLdjMPJ95A==
X-Received: by 2002:a05:6a20:3b98:b0:d4:298b:8b8e with SMTP id
 b24-20020a056a203b9800b000d4298b8b8emr7697097pzh.33.1679068501311; 
 Fri, 17 Mar 2023 08:55:01 -0700 (PDT)
Received: from stoup.. (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 s5-20020a656445000000b004fb3e5681cesm1668986pgv.20.2023.03.17.08.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:55:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/9] linux-user: Rename max_reserved_va in main
Date: Fri, 17 Mar 2023 08:54:48 -0700
Message-Id: <20230317155455.341843-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317155455.341843-1-richard.henderson@linaro.org>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename to local_max_rva, to avoid a conflict with the next patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 39d9bd4d7a..165fcb653e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -680,7 +680,7 @@ int main(int argc, char **argv, char **envp)
     int i;
     int ret;
     int execfd;
-    unsigned long max_reserved_va;
+    unsigned long local_max_rva;
     bool preserve_argv0;
 
     error_init(argv[0]);
@@ -791,7 +791,7 @@ int main(int argc, char **argv, char **envp)
      * still try it, if directed by the command-line option, but
      * not by default.
      */
-    max_reserved_va = MAX_RESERVED_VA(cpu);
+    local_max_rva = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
         if (reserved_va % qemu_host_page_size) {
             char *s = size_to_str(qemu_host_page_size);
@@ -799,7 +799,7 @@ int main(int argc, char **argv, char **envp)
             g_free(s);
             exit(EXIT_FAILURE);
         }
-        if (max_reserved_va && reserved_va > max_reserved_va) {
+        if (local_max_rva && reserved_va > local_max_rva) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
         }
@@ -808,7 +808,7 @@ int main(int argc, char **argv, char **envp)
          * reserved_va must be aligned with the host page size
          * as it is used with mmap()
          */
-        reserved_va = max_reserved_va & qemu_host_page_mask;
+        reserved_va = local_max_rva & qemu_host_page_mask;
     }
 
     {
-- 
2.34.1


