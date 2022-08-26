Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199B5A2DD8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:51:10 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdU5-000179-Ai
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdA0-0005m0-E0
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9y-0003kR-Hc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id u5so2561541wrt.11
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=epD8AeJuQxlkK8M7FZiMaAhpodp12ymd+jM82mrZ628=;
 b=e398UV0hFdDyVwyLX1Hdki1s3lh8GJthCbOUZVYlnU5GzzQczj04147K3enQlbCpSZ
 tQ7rvE3e5gh+lrWIuXGSHdvTVatQE8pZEN3K3QPNKRWHxsBL2Cdt5k3A7W0IoMrU7h2X
 PrVM3xQvTStb8++rxdm4IcacED7+cv+Ye3rkp4E8A4yBpyocI875hyat3296C1ivque4
 JlwjnZxorPQ9YEwznWk6dOMj8ok1MoKskKU72s2Yxzphwwq30nNSUtLbGIMxQ8NOmoli
 uUqNkC15tW6vKxJKM7q6VGvR+XCWLjuFc7rHiFt5JbtdeyYonPjpEbJjy8C/a1ymln40
 3r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=epD8AeJuQxlkK8M7FZiMaAhpodp12ymd+jM82mrZ628=;
 b=fvR1Yao3WCkD5cX3JoRUOQP0aMwz0p7QsgR+z+8WasOLD9EvaU4akqN2yh2JmPFQL4
 5RhX9J4v7574okh0hvYvCXMJWcRpPxrlmmvB53WoRg9CNnuh6vFIu/tJDaNrBDppyMjs
 OoDirpaGpfN2BRCLNcuW0E+aGb1viY14CHeHreYYHf5EdW1k3A934x1+wlEfk76KPaoX
 LoJMo2dHu70hD6lGi4ly8/NWIsFQV3wT44YUboMiyPEzgA1qMkBbipfBtUoSjpQbYl2k
 PY74mNdj6ybVqJH0+UcWcvDIBzOcj4bPzs5i3IPDSQ1JotC4RU5AXfdV2dXkduqaQD3f
 RtpQ==
X-Gm-Message-State: ACgBeo2UTSlr6oWA+hpBaO/YFxiNyEYEd4vgpPIhOZOpn0X+IPrcTwfl
 qrr2YTnak0HPWUVtYj5kqGmM7Q==
X-Google-Smtp-Source: AA6agR4PaF4V70lKcoLEgbxbxv0aUp7eEA/dK1DiIzDFvdlPOwpqOgW6zsZlckiXCZptJZWVau28CA==
X-Received: by 2002:a05:6000:2a4:b0:225:2fbb:6843 with SMTP id
 l4-20020a05600002a400b002252fbb6843mr411367wry.71.1661535021118; 
 Fri, 26 Aug 2022 10:30:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a5d46c2000000b002253d162491sm277201wrs.52.2022.08.26.10.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2FFA1FFCD;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 23/25] tests/docker: remove FROM qemu/ support from
 docker.py
Date: Fri, 26 Aug 2022 18:21:26 +0100
Message-Id: <20220826172128.353798-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
2.30.2


