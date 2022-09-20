Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087315BEF1F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:26:49 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaklT-0002JU-Sm
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzb-00060c-Qh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:07 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzZ-0001wd-HK
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:07 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lh5so7812963ejb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AnscUj/WsXzqq3s+vV4bQPFCFx5NHk6AZxIJISHW2ag=;
 b=Zd7ovdZXxz7IYhYYL7OsBAkGRlplC65dwk6Bwyz8raFopu2w4aK1xukAXtQjWQ9m7Z
 kb3LZJeKxagg3HK9L22koxtaMC2KHrCvZ6jXV9lhnUCeT7/RVrI9z3JRqWn0ua9vbrJW
 QQuzsKyc9es/R2HOSCP3zIgKzMUqBhUSCe3AVnfEhb+y85YWio44iqEJvnzLb8WbUToN
 vatA04IqDSUYd03h/gw6CBamnlbvgnL9Xm3f7FnJ3aVXE03mLjU1pFBpBRi6Co86jpDE
 Q/7jHRqjrckhZTh5I6ajRXbM5tlmjQYbhUMmilBrTkAM7ye2d++ehAhMKG8OErVqm1PI
 fxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AnscUj/WsXzqq3s+vV4bQPFCFx5NHk6AZxIJISHW2ag=;
 b=xT/I2NHMZuKfsEwuYEUXVXM8M7dJEmbZq/tkmSb5F1nUG+yaKzpLCb5RyWqEbQ6csX
 fPHM5YkBdlRu9j+rvZv7RDr14186nGaq6cO+V2xOVw8SrTdWAaRmSB1wVVZb0hMp2JD3
 xAqyuR76XlaxoNqfu8MCGDNXUbijdUh8kvYry6QZtSfHBbxT6ssBs8AGVpm47ojEGXlU
 1yQFL02phgwsm+JOF5SsxfnQWLCLOcCVIp64m9occaQE+OXOvZKL80Y/8PDqw5YXH4hG
 xDDLrFGeZ3qzFKCAABm6DEhUAdhXpc0af6nY1+/jVKQKBACENYsgI6PQn6NLtrvx1+sZ
 DCcw==
X-Gm-Message-State: ACrzQf03YnhM2qPtOKOC/U8F+w+V9vgeJcTOuVMLC8b5VMLwpANFyThz
 L1si21ZF48MQgPsbHEA+06TigA==
X-Google-Smtp-Source: AMsMyM4oFKAhb0a2HcP/gHJZFMLPq9DPpJ/DnLW2bErnZvjm8pPPplMBryR/dg/62UefHTg3+VTxTQ==
X-Received: by 2002:a17:906:8473:b0:77b:efa8:50e4 with SMTP id
 hx19-20020a170906847300b0077befa850e4mr17611222ejc.250.1663694703141; 
 Tue, 20 Sep 2022 10:25:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 rl24-20020a170907217800b0073d7e58b1bcsm138266ejb.157.2022.09.20.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCC121FFD4;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 29/30] tests/docker: remove FROM qemu/ support from docker.py
Date: Tue, 20 Sep 2022 18:15:32 +0100
Message-Id: <20220920171533.1098094-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to migrate from docker.py to building our images directly with
docker/podman. Before we get there we need to make sure we don't
re-introduce our layered builds so bug out if we see FROM qemu/ in a
Dockerfile.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-30-alex.bennee@linaro.org>

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


