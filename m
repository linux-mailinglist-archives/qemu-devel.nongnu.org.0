Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E2398390
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:48:49 +0200 (CEST)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLcO-00030J-PW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQk-0000TC-So
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQi-00040s-RK
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWqovqgDiW4UBfT05TJxDi/XzfjccfjHKaD1bY03wt8=;
 b=KK0wxLPQyYJ18qIGoMNUmNtmI8nR7AaJuYr0qGcMU+JsFge9NyXm783OG8o8rM/6xebeQs
 p8Qom0ht4kSM4Bt0Vd3a4mY4Ido9ej2gGs/jiEG22c4Jv+pVJHGRHWIWMuUdJDxgRxkeC8
 mjybNOcbv4ypPmBe8lWhuRmILQUZ0/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-J3tU8-C1NImoieDeexUa1Q-1; Wed, 02 Jun 2021 03:36:37 -0400
X-MC-Unique: J3tU8-C1NImoieDeexUa1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23D91854E32;
 Wed,  2 Jun 2021 07:36:36 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3B4C5C730;
 Wed,  2 Jun 2021 07:36:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/17] tests/vm: convert centos VM recipe to CentOS 8
Date: Wed,  2 Jun 2021 09:36:02 +0200
Message-Id: <20210602073606.338994-14-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210514120415.1368922-9-berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/centos | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index efe3dbbb36..5c7bc1c1a9 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -26,24 +26,23 @@ class CentosVM(basevm.BaseVM):
         export SRC_ARCHIVE=/dev/vdb;
         sudo chmod a+r $SRC_ARCHIVE;
         tar -xf $SRC_ARCHIVE;
-        make docker-test-block@centos7 {verbose} J={jobs} NETWORK=1;
-        make docker-test-quick@centos7 {verbose} J={jobs} NETWORK=1;
+        make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
+        make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
         make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
     """
 
     def build_image(self, img):
-        cimg = self._download_with_cache("https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
+        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
         img_tmp = img + ".tmp"
-        sys.stderr.write("Extracting the image...\n")
-        subprocess.check_call(["ln", "-f", cimg, img_tmp + ".xz"])
-        subprocess.check_call(["xz", "--keep", "-dvf", img_tmp + ".xz"])
+        subprocess.check_call(["ln", "-f", cimg, img_tmp])
         self.exec_qemu_img("resize", img_tmp, "50G")
         self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
         self.wait_ssh()
         self.ssh_root_check("touch /etc/cloud/cloud-init.disabled")
-        self.ssh_root_check("yum update -y")
-        self.ssh_root_check("yum install -y docker make ninja-build git python3")
-        self.ssh_root_check("systemctl enable docker")
+        self.ssh_root_check("dnf update -y")
+        self.ssh_root_check("dnf install -y dnf-plugins-core")
+        self.ssh_root_check("dnf config-manager --set-enabled powertools")
+        self.ssh_root_check("dnf install -y podman make ninja-build git python3")
         self.ssh_root("poweroff")
         self.wait()
         os.rename(img_tmp, img)
-- 
2.27.0


