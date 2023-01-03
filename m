Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB865C9CC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 23:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCqAR-0004RB-6J; Tue, 03 Jan 2023 17:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pCpXf-0003cX-0s; Tue, 03 Jan 2023 17:13:55 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pCpXd-0005sQ-CE; Tue, 03 Jan 2023 17:13:54 -0500
Received: by mail-lj1-x22b.google.com with SMTP id v23so23351040ljj.9;
 Tue, 03 Jan 2023 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4CBsNfZnHtVejQ7fN3O5WRGyxEti+Gcan/bCKkdwSrw=;
 b=JeCsmkyYgqKHJvbYHUvfDygER9mE6qOGXDqjKOzmgg5oyTNgPlPBC6vMWE+vCyALZw
 zMm6+N0prc0wJyoguv0MLsUbdaRAu3sIOl7TCazpLp/XPfp695w80cnJv2bORBg0BlvK
 NxMRsBwDgndvP1NmwYhXTOcDQJVcQfULfanijqIbG0TLdvkFlbwt4dQgwpQXyG8zysNP
 LD0iMjYjoOOstVrNzcrljxGNufJQKyW+075TJ26uIUNfHQvQv97x794jmkNOLw8DtgkN
 NRXHhWQGkAaLPRGwF/uJed51Ieg9ZVb38Lh9wf7Y1BpXofZfTKUp0S8tmaXGmlmtEmUm
 +LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4CBsNfZnHtVejQ7fN3O5WRGyxEti+Gcan/bCKkdwSrw=;
 b=xHqntnBu1SNJtJQVaioM2a2M42dkFozS6oQYeivYLaUIsPmRVLCoHyg332mCB1TmMs
 hRp25uEKpFgMdQqM9GEroDy2jsKAcFJgVxxIntQphbh+i6/1mj5vEkU0XRUhZSrSAyon
 ouI0ZQzL5xdzWHaICpI8vxR6GkQEA7tmY+sJIkjoHFr0BTn63bm1/JHSYY+GNrywvoqB
 cofBnp9fBJjWHlNVt5JEbg4A85dC+OWUjqlAMLiUgfIYEsyk7FNL3hHC81AmAAbW9yA/
 f70rMr7/uyZ5Gefmp9LiiN0a4r3xkQLZ7/l+Jc/jGfPokt8S4368qOA48sHX/x+HB3Eg
 xIrg==
X-Gm-Message-State: AFqh2kprtjpkviSRQqTFxty0rqSufx6ZP+8Y7H4xyNR70xoo/OJICGr3
 /Iv7/iJhWhMeday/ot+xq18=
X-Google-Smtp-Source: AMrXdXuvdCsjt/agD4VPUKkAi+0Cm9Ap0RY29V68UEDbSZjrFKS/hBDNnfn35b47c2sopvOvWIbXPw==
X-Received: by 2002:a2e:910d:0:b0:27f:da83:c50c with SMTP id
 m13-20020a2e910d000000b0027fda83c50cmr4678955ljg.0.1672784030610; 
 Tue, 03 Jan 2023 14:13:50 -0800 (PST)
Received: from Arturss-MBP-2.lan ([87.246.149.32])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a2e3602000000b0027fc03a8547sm2587061lja.37.2023.01.03.14.13.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Jan 2023 14:13:50 -0800 (PST)
From: Arthur Sengileyev <arthur.sengileyev@gmail.com>
To: arthur.sengileyev@gmail.com
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: [PATCH] Windows installer: keep dependency cache
Date: Wed,  4 Jan 2023 00:13:49 +0200
Message-Id: <20230103221349.74160-1-arthur.sengileyev@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=arthur.sengileyev@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 Jan 2023 17:53:39 -0500
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

It should be possible to reuse cache built by previous iteration
processing next executables. Already processed dependencies are
already skipped later based on dll name.

Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
---
 scripts/nsis.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 03ed7608a2..a2e52df556 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -91,12 +91,13 @@ def main():
         print("Searching '%s' for the dependent dlls ..." % search_path)
         dlldir = os.path.join(destdir + prefix, "dll")
         os.mkdir(dlldir)
+        depscache = set()
 
         for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
             # find all dll dependencies
-            deps = set(find_deps(exe, search_path, set()))
+            deps = set(find_deps(exe, search_path, depscache))
             deps.remove(exe)
 
             # copy all dlls to the DLLDIR
-- 
2.39.0


