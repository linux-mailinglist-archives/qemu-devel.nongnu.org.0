Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5926F77D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 23:13:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pugF5-0002kt-7V; Thu, 04 May 2023 17:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mat.krawczuk@gmail.com>)
 id 1pugF1-0002jh-2A
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:11:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mat.krawczuk@gmail.com>)
 id 1pugEy-0002i0-NM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 17:11:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-956eacbe651so193168966b.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683234698; x=1685826698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFaGFCPATK8YjCTjPHgD8yEeaekERF5LQGbPHS0Vjb4=;
 b=qhU1B4DhHaLslL3ggmAsg09huLvKLRzkCJQg7PjF8nNwuLbbfseo1CsD17JfrQAUbt
 70EnZKxTXYuBQQ2OBl+n2bHBLFOfqL3Cz3IrsrbxpyMRBZgBuFu524Gft4D1snxiMa1G
 HRt6m8TVtPCOv/7+zslr9G64i/eGqKA9pxzFvamUm9kODnkjYPmRKgpR1EAcio5LsHKW
 zLElPLN85EThGI/NDaTf50HTdwICtYpACibaBPdOMO6QQ468btiHZ4fkMDGeGfwPtJdC
 6Ko6/wjTY2HefLzJDOa2aSx42X6bJE6GSn9mC3b/i8vxOhajmiqX9kyb4jsShjTVs/SR
 ZSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683234698; x=1685826698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFaGFCPATK8YjCTjPHgD8yEeaekERF5LQGbPHS0Vjb4=;
 b=QQu/nKImVG5SEGsCAStCJuLXR5Z+omdOtCkM84Id68/HbrLdLExWP5gSfdPNWS+4HF
 4Ki5jfWcw8xMOLyzQQ77YB6ccfjV9CTwb2sYDLpNHfPwdPPyYOGSyd39eWqL/7gfKRuT
 Z9VPGE/qryG0Kxw2U0RXv5GRmyFbIIKdCnGplG34HhbOn2X8M/x49XbBCVA/R9W5g36y
 qWynJKPdB9WnFePyZM3MP76UEK0pc/pUNFans40awf0PxQITzRKKaMoDfTy6nmGQk7Z9
 ZjO33JosICy7Rt9SN5rtRU9WuY0PT/kFb3Q7nt32xsRRXG26P5Bbc/1ZLuQNEbHQXeUr
 3dYA==
X-Gm-Message-State: AC+VfDzqq/5lZTyoLX8xlwlxllziWM3kT86fvXw1FYo9+CxTNbqefQgH
 qgkIT+hvxwqs9H+ggTEJgGc=
X-Google-Smtp-Source: ACHHUZ7KsJOGVAtuV+XIKubuCgEwRa72+SO3RVC5XcH9l6kqRwTOLiE1ODbkX2i3BJAhjDTxn3KgAA==
X-Received: by 2002:a17:907:3205:b0:94f:247d:44d2 with SMTP id
 xg5-20020a170907320500b0094f247d44d2mr180477ejb.5.1683234697625; 
 Thu, 04 May 2023 14:11:37 -0700 (PDT)
Received: from localhost.localdomain
 (088156139023.dynamic-2-waw-k-2-3-0.vectranet.pl. [88.156.139.23])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a17090680d400b0094f23480619sm25271ejx.172.2023.05.04.14.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 14:11:37 -0700 (PDT)
From: Mateusz Krawczuk <mat.krawczuk@gmail.com>
To: 
Cc: Mateusz Krawczuk <mat.krawczuk@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] Add information how to fix common build error on Windows
 in symlink-install-tree
Date: Thu,  4 May 2023 23:11:01 +0200
Message-Id: <20230504211101.1386-1-mat.krawczuk@gmail.com>
X-Mailer: git-send-email 2.40.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=mat.krawczuk@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By default, Windows doesn't allow to create soft links for user account and only administrator is allowed to do this. To fix this problem you have to raise your permissions or enable Developer Mode, which available since Windows 10. Additional explanation when build fails will allow developer to fix the problem on his computer faster.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1386
Signed-off-by: Mateusz Krawczuk <mat.krawczuk@gmail.com>

v2:
  Removed unnecessary newlines to be consistent with QEMU coding styles.
Signed-off-by: Mateusz Krawczuk <mat.krawczuk@gmail.com>
---
 scripts/symlink-install-tree.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index 67cb86dd52..62fd609f32 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -7,12 +7,14 @@
 import subprocess
 import sys
 
+
 def destdir_join(d1: str, d2: str) -> str:
     if not d1:
         return d2
     # c:\destdir + c:\prefix must produce c:\destdir\prefix
     return str(PurePath(d1, *PurePath(d2).parts[1:]))
 
+
 introspect = os.environ.get('MESONINTROSPECT')
 out = subprocess.run([*introspect.split(' '), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
@@ -28,5 +30,8 @@ def destdir_join(d1: str, d2: str) -> str:
         os.symlink(source, bundle_dest)
     except BaseException as e:
         if not isinstance(e, OSError) or e.errno != errno.EEXIST:
+            if os.name == 'nt':
+                print('Please enable Developer Mode to support soft link '
+                      'without Administrator permission')
             print(f'error making symbolic link {dest}', file=sys.stderr)
             raise e
-- 
2.40.1


