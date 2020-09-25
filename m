Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FD278EF4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 18:44:45 +0200 (CEST)
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLqpw-0005LT-Q7
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 12:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqVX-0006nS-NC
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:23:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLqVV-0006pl-0J
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 12:23:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id x14so4188404wrl.12
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qY2/0F+KpB2LvKmpEVYN1JeJz0DmkWbUEhi/m2WaAQM=;
 b=Dwo1VRN0HctI0eR9SiDm2YZDriqLyQF2ran5BiImW24LJO041VlhJ1zI+v4cNMgWK7
 RjQGjklZVPSOqt+VCQmUZw5L+ptGJ1tm4x6Vn6oUFILVGzlECBrBDamdm91Sy06rZfXa
 qRLIunzB/WtK7/qrO893ZEAcnk8fyE9/n3MNJisEr8sJyWF8Pwyb2roXKiaT7vyoc44A
 1aei1uKsuCUDy4PvnCf0Tqx8N5kxeOGg7n+xoHdOZmv6sSzoGjKjlf1Dqa9sxIt7LsyL
 pyc9fFxTQNhSp5CvcU9vgvJgdx5uKpDm8j3nQw0Pz8OBLTNmfulbNZVD5xvcWnqc9xJH
 UHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qY2/0F+KpB2LvKmpEVYN1JeJz0DmkWbUEhi/m2WaAQM=;
 b=d9U/RGHcxKvdzvbkKgwR9E0hpvm2P8hgfZmQHy8+b9DU1XMKRmS3Zvk/4GI3AsX1Rs
 3vJCToSJTRZMQIfQ1tjwyVzbRgVoWyDqJcqWVex34o8RjWw5blYRcl7tOmsQ0LwQSPyx
 1uboD/vXpV2cyJn5fqCy87/XMBRyULeiOy7e7EcUejsgleXrcAfEfa9VStJ8CoPOhpVq
 0f3NJemVTWyAx1HXs8j0Em5WcYShUjMnZX5mCan7HtUDv1c7y/GRnFhWQykmgIWnYicM
 nYSEQGm3d07ps5IEdb4WkJ2AVCsElKwv9a/aRBi+5lk8PzYrAN8+KksgGIZT8gYCKNUn
 Tu5Q==
X-Gm-Message-State: AOAM530SV7R0QAy4tfVJpILn8TQBUYR0gBVFSczYEkBbY8pL9pfcWcCp
 i2q0mm0o9dZ4EKlI39Misk38S210nqTnOqvc
X-Google-Smtp-Source: ABdhPJyAnE4IwgMDhnsRUPyvmYxviC0kY/TzRJG97OEH60uNh11++Dx42rfrFocTeYgPA/b/nAzUxw==
X-Received: by 2002:adf:8162:: with SMTP id 89mr5551556wrm.237.1601051014991; 
 Fri, 25 Sep 2020 09:23:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d6sm3565824wrq.67.2020.09.25.09.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 09:23:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/21] meson.build: Make manuals depend on source to Sphinx
 extensions
Date: Fri, 25 Sep 2020 17:23:09 +0100
Message-Id: <20200925162316.21205-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925162316.21205-1-peter.maydell@linaro.org>
References: <20200925162316.21205-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The automatic dependency handling for Sphinx manuals only makes the output
depend on the input documentation files. This means that if you edit
the Python source of an extension then the documentation won't be
rebuilt.

Create a list of all the source files for the extensions and add
it to the dependencies for the manuals. This is similar to how we
handle the qapi_gen_depends list.

Because we don't try to identify which manuals are using which
Sphinx extensions, a change to the source of one extension will
always rebuild the entire manual set, not merely the manuals
which have changed. This is acceptable because we don't change
the extensions all that often.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/meson.build | 1 +
 meson.build      | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/docs/meson.build b/docs/meson.build
index 99da609e813..59fea873b10 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -36,6 +36,7 @@ if build_docs
                 output: [manual + '.stamp'],
                 input: [files('conf.py'), files(manual / 'conf.py')],
                 depfile: manual + '.d',
+                depend_files: sphinx_extn_depends,
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
diff --git a/meson.build b/meson.build
index 6408ad442ea..3c07e75dbd5 100644
--- a/meson.build
+++ b/meson.build
@@ -679,6 +679,14 @@ if get_option('werror')
   SPHINX_ARGS += [ '-W' ]
 endif
 
+sphinx_extn_depends = [ meson.source_root() / 'docs/sphinx/depfile.py',
+                        meson.source_root() / 'docs/sphinx/hxtool.py',
+                        meson.source_root() / 'docs/sphinx/kerneldoc.py',
+                        meson.source_root() / 'docs/sphinx/kernellog.py',
+                        meson.source_root() / 'docs/sphinx/qapidoc.py',
+                        meson.source_root() / 'docs/sphinx/qmp_lexer.py',
+                        qapi_gen_depends ]
+
 # Collect sourcesets.
 
 util_ss = ss.source_set()
-- 
2.20.1


