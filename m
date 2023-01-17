Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A366D9AE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:18:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHi5Q-0004p5-NI; Tue, 17 Jan 2023 04:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5N-0004jv-12
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHi5L-0005gz-C2
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673947010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSVAdIIdNqVo4AA8LPt5BH80KhR02XfHiG/wVwM8/48=;
 b=BF3iLloM3Q9j2HWZticGT5/OdrswaorUQkWVCSOx33E0VuY/Lr/jxltepVucdXj0odSxSr
 C58V9/TFSO2RtOM4GYVE2HyfkQ3lqNrmy+1RZkJlAo1IHTMg5DZ1KFMFnBQ1k76VAo4aGc
 eJMum7HS9BwuCjCnd/LPRZ+b5ix7bNE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-21-7wTJhaAlPF6_4TeqYH4TBA-1; Tue, 17 Jan 2023 04:16:49 -0500
X-MC-Unique: 7wTJhaAlPF6_4TeqYH4TBA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so3494138edc.6
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSVAdIIdNqVo4AA8LPt5BH80KhR02XfHiG/wVwM8/48=;
 b=fxH7H374w9zvLU7+G0d7/wIIe46yOk4qnsWLDilnkY+kK5iXKqI4FS9LZRKYs919if
 dTh3xpWoj9XRtANEcu8hw5ZkhQ87vTId//MfC41sTAJ4X4ojSq3xuWjgBD7+F4W0tBhB
 8iwhWu9uPfQd1fdhL5iWfezMA3e6miQU8brcH4xop2PtHCypOppk1g+uCSDKqMnYfvgs
 PVBexQL0GfCbbGSGvUSnBcxGrQZV9pmHHjug0CzH671kxHaAfYxGihdHO3dfUudMkRFH
 vD1EuAx428m6TuOOwoJ70c2hNOdiRfAfjyHdxe1kL75diFISsTZG0R745x9281ueCsuZ
 BqGQ==
X-Gm-Message-State: AFqh2kpXtkgaJpOZTiY6IwzZdFvlep9M9l44Szza1p9foa2j38TS9BfQ
 nTgl2EpP18u4ZUBpDAANIp5DsdPTRBK3AjcOpsrodJEIIEK0ouMbsVxHkiItnt7+ofH1AiDI4rb
 DmgydFcnilarorsiJmZiAGFpshsRWPKQV+UIc8k+g+hNZ6u+Xe6rWF/uL8HidHcnPYCc=
X-Received: by 2002:a05:6402:d64:b0:498:d121:6e02 with SMTP id
 ec36-20020a0564020d6400b00498d1216e02mr2147988edb.34.1673947008139; 
 Tue, 17 Jan 2023 01:16:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtYkgs7nARCpo0daHwIuRNlUEOX9lEq70vRzPZqI9IYZq9+EiQLKaPBjvWGGlCWU8aaMDcPig==
X-Received: by 2002:a05:6402:d64:b0:498:d121:6e02 with SMTP id
 ec36-20020a0564020d6400b00498d1216e02mr2147961edb.34.1673947007803; 
 Tue, 17 Jan 2023 01:16:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 x22-20020aa7dad6000000b0048789661fa2sm12384037eds.66.2023.01.17.01.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 01:16:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	berrange@redhat.com
Subject: [RFC PATCH 3/4] lcitool: allow overriding package mappings and target
 facts
Date: Tue, 17 Jan 2023 10:16:37 +0100
Message-Id: <20230117091638.50523-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117091638.50523-1-pbonzini@redhat.com>
References: <20230117091638.50523-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

lcitool has generally catered to the Libvirt's needs in terms of
package versions, which are pretty conservative. For example, lcitool
is hardcoding a version of Meson equal to 0.56. QEMU on the other hand
has different needs since some features were added to Meson for the
project's benefit in versions as recent as 0.63.

Until now, QEMU has managed to avoid the problem by shipping its own
version of Meson. However, the next release of QEMU will face a breaking
point in that Meson 0.63 does not work with the 3.6 version of Python
that is provided by CentOS Stream 8 and OpenSUSE LEAP 15.3.

Implement locally the functionality provided by
https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/341, so that
QEMU can override the mappings and target paths that are used for its CI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/lcitool/refresh | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 31a34dce7a33..ca36f3536f53 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -15,7 +15,9 @@
 from contextlib import contextmanager
 from pathlib import Path
 
+import logging
 import sys
+import yaml
 
 if len(sys.argv) != 1:
     print("syntax: %s" % sys.argv[0], file=sys.stderr)
@@ -33,14 +35,25 @@ from lcitool.packages import Packages
 from lcitool.projects import Projects
 from lcitool.targets import BuildTarget, Targets
 from lcitool.formatters import DockerfileFormatter, ShellVariablesFormatter
-from lcitool.util import DataDir
+from lcitool.util import DataDir, merge_dict
+
+
+class MergeLocalFilesDataDir(DataDir):
+    def load_facts(self, resource_path, name):
+        result = {}
+        for file in self.search(resource_path, name + ".yml"):
+            logging.getLogger().debug(f"Loading facts from '{file}'")
+            with open(file, "r") as infile:
+                merge_dict(yaml.safe_load(infile), result)
+        return result
+
 
 PREFIX = ''
 
-DATA_DIR = DataDir(script_dir)
+DATA_DIR = MergeLocalFilesDataDir(script_dir)
 PROJECTS = Projects(DATA_DIR)
-PACKAGES = Packages()
-TARGETS = Targets()
+PACKAGES = Packages(DATA_DIR)
+TARGETS = Targets(DATA_DIR)
 
 
 @contextmanager
-- 
2.38.1


