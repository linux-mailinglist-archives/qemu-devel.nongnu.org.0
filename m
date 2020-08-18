Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ADC2487A1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:34:00 +0200 (CEST)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82gZ-0002sH-5a
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Kg-0003yJ-4I
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32849
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82KZ-0007P4-3i
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rVjxkTg9RbS+7Qs+vSeHrLPMSnl5Jl/hmLxwFpFuUI=;
 b=cCf0H8CnTb6BBlY1tncmd7M1nb4BNaejhWz3kGQNVVduOH+LMHpwFyHI64i3e61sX2iGZj
 qVz3xl9OMJ2q3xghMfYAHKK0LNxKokuGkDB1JD8Rfks0Fd82AYiZ4bnt5oThQPnZUbau+4
 FOn3IBJUcvoUdGMSgZsqgZ1QrzUgHPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580--YZg7Bv-OBekWM-LavCTQA-1; Tue, 18 Aug 2020 10:11:09 -0400
X-MC-Unique: -YZg7Bv-OBekWM-LavCTQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFFAF100CAA1
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:11:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F4485C64D;
 Tue, 18 Aug 2020 14:11:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 046/150] meson: add qemu-edid
Date: Tue, 18 Aug 2020 10:08:41 -0400
Message-Id: <20200818141025.21608-47-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile    | 2 --
 configure   | 2 +-
 meson.build | 4 ++++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ec3c0a7371..a768af38eb 100644
--- a/Makefile
+++ b/Makefile
@@ -420,8 +420,6 @@ qemu-nbd$(EXESUF): qemu-nbd.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io
 qemu-io$(EXESUF): qemu-io.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 qemu-storage-daemon$(EXESUF): qemu-storage-daemon.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(chardev-obj-y) $(io-obj-y) $(qom-obj-y) $(storage-daemon-obj-y) $(COMMON_LDADDS)
 
-qemu-edid$(EXESUF): qemu-edid.o hw/display/edid-generate.o $(COMMON_LDADDS)
-
 fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/9p-marshal.o fsdev/9p-iov-marshal.o $(COMMON_LDADDS)
 
 scsi/qemu-pr-helper$(EXESUF): scsi/qemu-pr-helper.o scsi/utils.o $(authz-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
diff --git a/configure b/configure
index 15ac11de9f..f1ce9d7f0c 100755
--- a/configure
+++ b/configure
@@ -6668,7 +6668,7 @@ fi
 
 tools=""
 if test "$want_tools" = "yes" ; then
-  tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) qemu-edid\$(EXESUF) $tools"
+  tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     tools="qemu-nbd\$(EXESUF) qemu-storage-daemon\$(EXESUF) $tools"
   fi
diff --git a/meson.build b/meson.build
index 17a0de91ca..0b465043d7 100644
--- a/meson.build
+++ b/meson.build
@@ -312,6 +312,10 @@ if have_tools
                dependencies: [qemuutil, xkbcommon], install: true)
   endif
 
+  executable('qemu-edid', files('qemu-edid.c', 'hw/display/edid-generate.c'),
+             dependencies: qemuutil,
+             install: true)
+
   if 'CONFIG_VHOST_USER' in config_host
     subdir('contrib/libvhost-user')
     subdir('contrib/vhost-user-blk')
-- 
2.26.2



