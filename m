Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455B3874DB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:13:39 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livnG-0007mi-68
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhL-0007tG-NJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhJ-0005Rx-KC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id y14so7241191wrm.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLkCUVtUulJ2g8D+2QnEZXZOurs4a/57hc6xJ37hdkM=;
 b=UAzAkxueHkNZvp4be7rfU4M1J81KAF0ullEP49AAgibsoS4tbdC6yPmtQcaVoVANx3
 fHV1cT8hecGsYwo64Y75itJjzQT/FOfF5Xvw3vX1kzyty4rrw/vDGeHSEd7AVpoUFuQK
 3+8gtWUlaJfEGX8JynPcsADr96ApeV8YZTtyiXpJcIzHqWI97YrE6L+mQvG3yhqGAwdo
 bmpVRbagl7Ec1DGna1SFq55O+fOr9wb2MuAOzQRZYnoyicRiI+aA7zskpWbmASrT5SpF
 vlodJFwz6vaAe3SErODqy0LJHgS6vpL28VAxDzU7FoA5WbggEuasrpl2Ud4Fp0MELBUZ
 ORPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLkCUVtUulJ2g8D+2QnEZXZOurs4a/57hc6xJ37hdkM=;
 b=Fye74MptOhrRbLbcnTfyfJFnNZFRrjyjox7hrS7c42VbOXHQcZxypD31GEWcsTV5jm
 YZpiAG8LGyfsULzwyAPksz7SyFnd4QebtHJ2dqGgtu/bYTXiZkdJk2vSQI9nD/8HPZDT
 5jRCe3jUBa8qKpGgsKcnFWpZxm9Fm00nYrz8CIjp43v24luWHhYMtQgXDNGjfWv6eLhT
 RgM2uU6qrgqPK9On0EBz1m5b5JqgdsHhCpCk+7kggK1YNLwthCuc1qPkOhjGDWKY1pc8
 tWMm70J6esvCMH/yMp4IH7is/kBXHuQD/uOIBvr29Fi53OKnQ7PvJdesPxdjwGvWlAxM
 jdCQ==
X-Gm-Message-State: AOAM533e7csE3WRVvDr3HJake2bUwfyVUDUf/02wGfDjUImyKLaia7bh
 L2yjt9llQRKO8oNMvPpP5S6lig==
X-Google-Smtp-Source: ABdhPJyfvoul09JAMghtRiMbs3hD49PZoOMfEmu/SzpVXE+SslKfNsEBfyBWR5Tbht+E2snxGrCpog==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr5526772wrn.335.1621328848122; 
 Tue, 18 May 2021 02:07:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x16sm20442417wrp.6.2021.05.18.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5070C1FF90;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 04/29] tests/docker: add "fetch" sub-command
Date: Tue, 18 May 2021 10:06:55 +0100
Message-Id: <20210518090720.21915-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply wraps up fetching a build from the registry and tagging it
as the local build.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-6-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 7a14058801..4d9bb7c7ed 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -515,6 +515,23 @@ def run(self, args, argv):
 
         return 0
 
+class FetchCommand(SubCommand):
+    """ Fetch a docker image from the registry. Args: <tag> <registry>"""
+    name = "fetch"
+
+    def args(self, parser):
+        parser.add_argument("tag",
+                            help="Local tag for image")
+        parser.add_argument("registry",
+                            help="Docker registry")
+
+    def run(self, args, argv):
+        dkr = Docker()
+        dkr.command(cmd="pull", quiet=args.quiet,
+                    argv=["%s/%s" % (args.registry, args.tag)])
+        dkr.command(cmd="tag", quiet=args.quiet,
+                    argv=["%s/%s" % (args.registry, args.tag), args.tag])
+
 
 class UpdateCommand(SubCommand):
     """ Update a docker image. Args: <tag> <actions>"""
-- 
2.20.1


