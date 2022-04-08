Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0F4F9B6E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:14:36 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsBv-0001cQ-JO
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0F-0001Kl-CK
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:31 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0C-0005CV-7e
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:31 -0400
Received: by mail-lf1-x12e.google.com with SMTP id h14so10984618lfl.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3RBxIOwgZcyAShhG7noZhYSNlbV6FHterTNyISA8k8A=;
 b=O6H5l41nl1DH64UT7hO/flsiUzjiXw4itGgirKeenGtxUAuseyoOnlt93attJfbInn
 meKdC2qdshFTMMx+IsjBuSEd91/fupI/FLXAjjGC/ZPx636m/s70zPaYgHRmmnUd4mQX
 2orvCSV+jB5PyNu1lULdVbd8q5/6ww+T8c1yluhPMw3/mbw+9tDQlehmwxCzbqLGYVCH
 zH3ajr+i2QWW8UTDFs3MWQOkU0T7Hu8HceVMu/OA+TaK7q9eBsXdfabg3WsqLFBduqu4
 OjGznX1ZSbvhPAV2YwW6uhz6mH61WLKZN8vlXc9QXN1IK6HImRkhbczoVUd93gmA8HFA
 tL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3RBxIOwgZcyAShhG7noZhYSNlbV6FHterTNyISA8k8A=;
 b=J4bAr/LRYHfaG9hi+mx6CYKLLcTwVvVzKMrcbFoPgOkyt0zInbxDCB+UpqMt66XMJH
 sHClPMb9x/DiZeKiXQgW90ak9TgBaMGiRo5HdYXfjAeyMK2rsVzgp+5hOh1D2GTk89W7
 yHrN7e9Xdpy940/m8W4ND+IE8jXojY9Ato1/TDfGU9I+zqZJ2yQkj9QM+9DEeuD90+9X
 ZLVJPllQF1ZLUoEMWlyOfGSTU7iGxVdTSHQktJFOIQ86B2q1mle/cEbvjY7jXQYq/7w6
 xY+PzEkVaUuAI/+6htAfmABmI/hUfvdN9kHE6l4Wqyw4Fqxfic0QLB0KKw2ipJeRYWHW
 vbBA==
X-Gm-Message-State: AOAM533acAhT90x6e7dM9PWVxm69T++SHVQ8dJPcWjzr1HJrYXBm/OKk
 JGiN418t+t3cc8Pzb6rnHHCxAg==
X-Google-Smtp-Source: ABdhPJy8wcKWmBjrGlLqalHkW/Du2w9p+bhB3oj9neqMPfvBnPI1mFuM5frAdPjqhCzgccxF7wjS0w==
X-Received: by 2002:a05:6512:3b9e:b0:44a:47c6:eb16 with SMTP id
 g30-20020a0565123b9e00b0044a47c6eb16mr13048787lfv.486.1649437345610; 
 Fri, 08 Apr 2022 10:02:25 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 g36-20020a0565123ba400b0044a2a1ccd99sm2505687lfv.20.2022.04.08.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:02:25 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] python/machine.py: upgrade vm.command() method
Date: Fri,  8 Apr 2022 20:02:13 +0300
Message-Id: <20220408170214.45585-2-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408170214.45585-1-vsementsov@openvz.org>
References: <20220408170214.45585-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, crosa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The method is not popular, we prefer use vm.qmp() and then check
success by hand.. But that's not optimal. To simplify movement to
vm.command() support same interface improvements like in vm.qmp() and
rename to shorter vm.cmd().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 python/qemu/machine/machine.py | 16 ++++++++++++---
 tests/qemu-iotests/256         | 34 ++++++++++++++++----------------
 tests/qemu-iotests/257         | 36 +++++++++++++++++-----------------
 3 files changed, 48 insertions(+), 38 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 07ac5a710b..a3fb840b93 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -648,14 +648,24 @@ def qmp(self, cmd: str,
             self._quit_issued = True
         return ret
 
-    def command(self, cmd: str,
-                conv_keys: bool = True,
-                **args: Any) -> QMPReturnValue:
+    def cmd(self, cmd: str,
+            args_dict: Optional[Dict[str, object]] = None,
+            conv_keys: Optional[bool] = None,
+            **args: Any) -> QMPReturnValue:
         """
         Invoke a QMP command.
         On success return the response dict.
         On failure raise an exception.
         """
+        if args_dict is not None:
+            assert not args
+            assert conv_keys is None
+            args = args_dict
+            conv_keys = False
+
+        if conv_keys is None:
+            conv_keys = True
+
         qmp_args = self._qmp_args(conv_keys, args)
         ret = self._qmp.command(cmd, **qmp_args)
         if cmd == 'quit':
diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
index 13666813bd..fffc8ef055 100755
--- a/tests/qemu-iotests/256
+++ b/tests/qemu-iotests/256
@@ -40,25 +40,25 @@ with iotests.FilePath('img0') as img0_path, \
     def create_target(filepath, name, size):
         basename = os.path.basename(filepath)
         nodename = "file_{}".format(basename)
-        log(vm.command('blockdev-create', job_id='job1',
-                       options={
-                           'driver': 'file',
-                           'filename': filepath,
-                           'size': 0,
-                       }))
+        log(vm.cmd('blockdev-create', job_id='job1',
+                   options={
+                       'driver': 'file',
+                       'filename': filepath,
+                       'size': 0,
+                   }))
         vm.run_job('job1')
-        log(vm.command('blockdev-add', driver='file',
-                       node_name=nodename, filename=filepath))
-        log(vm.command('blockdev-create', job_id='job2',
-                       options={
-                           'driver': iotests.imgfmt,
-                           'file': nodename,
-                           'size': size,
-                       }))
+        log(vm.cmd('blockdev-add', driver='file',
+                   node_name=nodename, filename=filepath))
+        log(vm.cmd('blockdev-create', job_id='job2',
+                   options={
+                       'driver': iotests.imgfmt,
+                       'file': nodename,
+                       'size': size,
+                   }))
         vm.run_job('job2')
-        log(vm.command('blockdev-add', driver=iotests.imgfmt,
-                       node_name=name,
-                       file=nodename))
+        log(vm.cmd('blockdev-add', driver=iotests.imgfmt,
+                   node_name=name,
+                   file=nodename))
 
     log('--- Preparing images & VM ---\n')
     vm.add_object('iothread,id=iothread0')
diff --git a/tests/qemu-iotests/257 b/tests/qemu-iotests/257
index e7e7a2317e..7d3720b8e5 100755
--- a/tests/qemu-iotests/257
+++ b/tests/qemu-iotests/257
@@ -160,26 +160,26 @@ class Drive:
         file_node_name = "file_{}".format(basename)
         vm = self.vm
 
-        log(vm.command('blockdev-create', job_id='bdc-file-job',
-                       options={
-                           'driver': 'file',
-                           'filename': self.path,
-                           'size': 0,
-                       }))
+        log(vm.cmd('blockdev-create', job_id='bdc-file-job',
+                   options={
+                       'driver': 'file',
+                       'filename': self.path,
+                       'size': 0,
+                   }))
         vm.run_job('bdc-file-job')
-        log(vm.command('blockdev-add', driver='file',
-                       node_name=file_node_name, filename=self.path))
-
-        log(vm.command('blockdev-create', job_id='bdc-fmt-job',
-                       options={
-                           'driver': fmt,
-                           'file': file_node_name,
-                           'size': size,
-                       }))
+        log(vm.cmd('blockdev-add', driver='file',
+                   node_name=file_node_name, filename=self.path))
+
+        log(vm.cmd('blockdev-create', job_id='bdc-fmt-job',
+                   options={
+                       'driver': fmt,
+                       'file': file_node_name,
+                       'size': size,
+                   }))
         vm.run_job('bdc-fmt-job')
-        log(vm.command('blockdev-add', driver=fmt,
-                       node_name=name,
-                       file=file_node_name))
+        log(vm.cmd('blockdev-add', driver=fmt,
+                   node_name=name,
+                   file=file_node_name))
         self.fmt = fmt
         self.size = size
         self.node = name
-- 
2.35.1


