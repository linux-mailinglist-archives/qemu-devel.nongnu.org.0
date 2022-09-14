Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEBC5B8D41
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:40:57 +0200 (CEST)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVRY-0001AP-6v
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0001Nn-Gi
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtv-0003qY-Pi
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id bo13so9952707wrb.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iVi2M5JVgPxoYJPoTzeenSW9Sp6hbVA3bl4+rpNzI1c=;
 b=mz4/OrEyjjt81DvzpbXnvsmvzRDJMYN+zISwQzHWgC+aGUFecFmQUxVml82gfV9Er1
 EjeOJ07u24INePXJpNa7F0d3fZ8s2tLyyqZEAoyhWId/3aJJM/kt5WdYaOp5vB/PdGYO
 ovyD6sPOHMPJwNOAoVssO+ZtjlxmRJuApXPoZny8kBljvwCCEYOAs1bJ+SG6jKHsC1To
 iqcqc0rxE8e6kY4cUTK3Zimvesu2FKpR9bJekAS36Ev0Q1NCjJPOYWGi/a2RmoExndMZ
 YVEhPs0S168B1Rp4V/a9lOYsM01F5Y1TgOkGnLnJq9TWYFDEaMMG/VLFj7+ys95BKiXZ
 iyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iVi2M5JVgPxoYJPoTzeenSW9Sp6hbVA3bl4+rpNzI1c=;
 b=MovQRaKVlHfm3CrSW2IYSYlG5Pche800e1xfl9cNkxcgFmdj6i81i9ek6tBFs+fM4m
 6OM8aqIyMtfYHjO58rNoJY2oTGLeUdfvWPeKHME+wy7BT8BYAff01i8rIZLuimEyspTj
 VrRClEqyYB7S6x+ktcEP0geBi8GBg3G0MKFuaSTWB/Fqfhy09OBKtb0oE8luK6vU7mdu
 L/j5PfEpmtgs6t3ovtUukVMlzHUK/91yahhw4s4fBvdSPyI9GhFrn+EeMmvcwsdda/Jo
 vKpoQfOb/Kmpfb/WGslesFfKEcWti8LNED1GnRnQfnhurqEOG+5K0B+c8CGgEYFvw39K
 LtsA==
X-Gm-Message-State: ACgBeo0Z525QoKBAXbykkhQMzX1usezJJVG/6Qz57HxIFmka9Jna56Ip
 qmBPwvr7mstogzAtTKtUxhUiLA==
X-Google-Smtp-Source: AA6agR5qUO5NVe9emfl8cqm9wyHQ+Y72OuQkeYOyRWHTNc+OneSnaQ5xkbevkSFjTgdTWVKwgcHcNA==
X-Received: by 2002:a5d:4284:0:b0:22a:291e:fa8f with SMTP id
 k4-20020a5d4284000000b0022a291efa8fmr20378360wrq.553.1663171570204; 
 Wed, 14 Sep 2022 09:06:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003b477532e66sm6817566wms.2.2022.09.14.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B7211FFD3;
 Wed, 14 Sep 2022 16:59:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 29/30] tests/docker: remove FROM qemu/ support from
 docker.py
Date: Wed, 14 Sep 2022 16:59:49 +0100
Message-Id: <20220914155950.804707-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to migrate from docker.py to building our images directly with
docker/podman. Before we get there we need to make sure we don't
re-introduce our layered builds so bug out if we see FROM qemu/ in a
Dockerfile.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-24-alex.bennee@linaro.org>
---
 tests/docker/docker.py | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d0af2861b8..3a1ed7cb18 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -205,22 +205,17 @@ def _read_qemu_dockerfile(img_name):
     return _read_dockerfile(df)
 
 
-def _dockerfile_preprocess(df):
-    out = ""
+def _dockerfile_verify_flat(df):
+    "Verify we do not include other qemu/ layers"
     for l in df.splitlines():
         if len(l.strip()) == 0 or l.startswith("#"):
             continue
         from_pref = "FROM qemu/"
         if l.startswith(from_pref):
-            # TODO: Alternatively we could replace this line with "FROM $ID"
-            # where $ID is the image's hex id obtained with
-            #    $ docker images $IMAGE --format="{{.Id}}"
-            # but unfortunately that's not supported by RHEL 7.
-            inlining = _read_qemu_dockerfile(l[len(from_pref):])
-            out += _dockerfile_preprocess(inlining)
-            continue
-        out += l + "\n"
-    return out
+            print("We no longer support multiple QEMU layers.")
+            print("Dockerfiles should be flat, ideally created by lcitool")
+            return False
+    return True
 
 
 class Docker(object):
@@ -309,23 +304,10 @@ def build_image(self, tag, docker_dir, dockerfile,
         if argv is None:
             argv = []
 
-        # pre-calculate the docker checksum before any
-        # substitutions we make for caching
-        checksum = _text_checksum(_dockerfile_preprocess(dockerfile))
+        if not _dockerfile_verify_flat(dockerfile):
+            return -1
 
-        if registry is not None:
-            sources = re.findall("FROM qemu\/(.*)", dockerfile)
-            # Fetch any cache layers we can, may fail
-            for s in sources:
-                pull_args = ["pull", "%s/qemu/%s" % (registry, s)]
-                if self._do(pull_args, quiet=quiet) != 0:
-                    registry = None
-                    break
-            # Make substitutions
-            if registry is not None:
-                dockerfile = dockerfile.replace("FROM qemu/",
-                                                "FROM %s/qemu/" %
-                                                (registry))
+        checksum = _text_checksum(dockerfile)
 
         tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
                                              encoding='utf-8',
@@ -371,7 +353,7 @@ def image_matches_dockerfile(self, tag, dockerfile):
             checksum = self.get_image_dockerfile_checksum(tag)
         except Exception:
             return False
-        return checksum == _text_checksum(_dockerfile_preprocess(dockerfile))
+        return checksum == _text_checksum(dockerfile)
 
     def run(self, cmd, keep, quiet, as_user=False):
         label = uuid.uuid4().hex
-- 
2.34.1


