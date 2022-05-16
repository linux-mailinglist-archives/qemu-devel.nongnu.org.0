Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD9528B9D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:09:45 +0200 (CEST)
Received: from localhost ([::1]:46992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeE5-0002tZ-0S
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyd-00072p-Df; Mon, 16 May 2022 12:53:57 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:40698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyb-0004jv-Rd; Mon, 16 May 2022 12:53:47 -0400
Received: by mail-oi1-x22a.google.com with SMTP id y63so19303253oia.7;
 Mon, 16 May 2022 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNahl/oMgHdaCwKlQVU9KibBrsxyojlRuwuYCn3qz9I=;
 b=E7F2s1+d0FoGnFv35XkR4sJwh3nIaRJBhdHoDDUYwXcH6zUpzh2A5sqpwAo1ALXgSa
 liRs+jnKN5M3fzCJDDTkFzRdA8xOnR6bTqoiuFexDIidBfUQ6tilb8E0/48nt0yW9YT1
 Q7dQbkPmxEe2RqvruY2bS5lVYYA15o7zNLbF5JKwAlqXjpR/Vj+hAcoejs8T/vwE8JHi
 6cRnGXS1c+t9T7aSMOyctUAtgMpZMhHShJNxtApEcacVkwi6O8LBKpWzBj8x0xvJ8ELX
 EQUSouQPeOyrVZdCLE1Kwm0FLIz+G2GgtGmTdSLCmbRI9S/SySUoscur6eZT7Phyb9vj
 UQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNahl/oMgHdaCwKlQVU9KibBrsxyojlRuwuYCn3qz9I=;
 b=SuePbgSkyI5U3AfwSUzI4pfRHnGaFRpHottwMpGoefEnUbp/AA0pDScJxKYevNrJt4
 nmakOSNBYTmErv3Y+k9CxMsKQRodNdnxNXMyKyX6OXxbQS+wsaeQsvbyRLdRl1WTVLSl
 ERQtSmNIVqZ3XcViaVYkKyoxuOofZtsM985jp+dFn8UVZMEifzb9gQqOk+W4O24COftD
 0CldYsyPeIa2FOA7+pG0Eb0Nnmw2ts1D5gi8uK2Hd8S3FACannu9YrLtCyPyP/Bwm851
 IWcHec2l1DsvKQb/MgV9bfvtGTrXwLKVnC+qbiDKJHd+13/4065M13T5s3vkz8b8iH84
 A/mg==
X-Gm-Message-State: AOAM533UQ0QN1Q/VZce3wZaSKV3jcYHKrlukFKl07T3ZrYd2mIfTbYMX
 u53/JtnoI42uErj4E8gowd/0bstF+8Y=
X-Google-Smtp-Source: ABdhPJxHf/ID9zJ+pYfLdvest/NlfgcIfhgn66rHBCi5s3fJc5K2vKnsCC5hbW7yfqhdbgWtM5vTjg==
X-Received: by 2002:a54:4688:0:b0:325:9a36:ecfe with SMTP id
 k8-20020a544688000000b003259a36ecfemr8937409oic.96.1652720024439; 
 Mon, 16 May 2022 09:53:44 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 5/5] avocado/virtio-gpu.py: use tags=machine:pc
Date: Mon, 16 May 2022 13:53:21 -0300
Message-Id: <20220516165321.872394-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516165321.872394-1-danielhb413@gmail.com>
References: <20220516165321.872394-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Using tags=machine:pc will do two things: it will avoid the need to
passing '-machine pc' via self.vm.add_args() and it will set the
self.machine attribute of the parent QEMUSystemTest class (via its
setUp() method).

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/avocado/virtio-gpu.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py
index 2a249a3a2c..a88f43d312 100644
--- a/tests/avocado/virtio-gpu.py
+++ b/tests/avocado/virtio-gpu.py
@@ -59,6 +59,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
     def test_virtio_vga_virgl(self):
         """
         :avocado: tags=device:virtio-vga-gl
+        :avocado: tags=machine:pc
         """
         # FIXME: should check presence of virtio, virgl etc
         self.require_accelerator('kvm')
@@ -68,7 +69,7 @@ def test_virtio_vga_virgl(self):
 
         self.vm.set_console()
         self.vm.add_args("-m", "2G")
-        self.vm.add_args("-machine", "pc,accel=kvm")
+        self.vm.add_args("-machine", "accel=kvm")
         self.vm.add_args("-device", "virtio-vga-gl")
         self.vm.add_args("-display", "egl-headless")
         self.vm.add_args(
@@ -94,6 +95,7 @@ def test_virtio_vga_virgl(self):
     def test_vhost_user_vga_virgl(self):
         """
         :avocado: tags=device:vhost-user-vga
+        :avocado: tags=machine:pc
         """
         # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
         self.require_accelerator('kvm')
@@ -131,7 +133,7 @@ def test_vhost_user_vga_virgl(self):
         self.vm.set_console()
         self.vm.add_args("-m", "2G")
         self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
-        self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
+        self.vm.add_args("-machine", "memory-backend=mem,accel=kvm")
         self.vm.add_args("-chardev", "socket,id=vug,fd=%d" % qemu_sock.fileno())
         self.vm.add_args("-device", "vhost-user-vga,chardev=vug")
         self.vm.add_args("-display", "egl-headless")
-- 
2.32.0


