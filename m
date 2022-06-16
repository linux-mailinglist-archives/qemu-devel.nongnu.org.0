Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1754DD03
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:37:18 +0200 (CEST)
Received: from localhost ([::1]:54716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1l09-0004dR-GX
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1ktd-0000dj-OD
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1ktb-0002Vo-5Q
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=PhyIlph23n62a89wp2WOspmC3wrX8BPze4BkS6riBHcJ6gHL3y4NjqmMQPs6CcTSsGc3MP
 Tr1PTGC4Ng7doIMwdNYkJ0IPJEGnccaLy8OD/fLK8OUPrXLevgYUzGWUOKMmLRbPIshKY7
 VNgdkv5E5dWRvbmMCh3d3jznC9DJb5w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-nc5YOafaNO-7osM3B5r9iQ-1; Thu, 16 Jun 2022 04:30:28 -0400
X-MC-Unique: nc5YOafaNO-7osM3B5r9iQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x15-20020a05640226cf00b004318eab9feaso759044edd.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=n984FO9CRETu68Hp5QmQaoj2ZHNFtvbXOabl9MZ7Lm+0Mgk5ZMJ1bOYmFqLFczFqP9
 ChKCXKuNOFYD6f5ceDAMb0kQ4f9bvQGbDM1fDgR7BSP6OrMNr88r/hnZWTCS/kPD1FWR
 P2e9RUC3AW8G4a3hm7wdgHfXyj1e0f8SkSlNAqsLKbhBb3G+YKt+xRJqUNvPL9jsHOG+
 vBNeT/AHCS4aWJPjn0hcCEAiIluTR8TwHDAJ2MKH8rED2c5Ue5TdkhU1vl0qfaAhnM5n
 0vlr7VkrVowNH2ghIfAJdVZqqu2AEUV1fIX8OvAAPcakujG8quinfB+Lefs3/3HjMdOU
 ZvbQ==
X-Gm-Message-State: AJIora/CsMFkRCEMV2jKxb7dfCopWV7ZwpZAhGkDa+MH1JP/IidQjJcr
 JuqZKCVfarNpQ9o+0maycmUDCRVvf4PEkMDzaToC4kbhX7wZy7ZxisQ3BvZYrW02qGHvqr131i5
 ypaFu8t2TXNnPFxguPolbqpOpxPDzW9Ai3MAoazOz8ccA7arCT+fHbtUXKA9wfAX0zto=
X-Received: by 2002:a17:907:94c3:b0:711:8b08:e7e with SMTP id
 dn3-20020a17090794c300b007118b080e7emr3463236ejc.451.1655368227227; 
 Thu, 16 Jun 2022 01:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twECO9dEVVizW6fNFd3PEd0+5tHXPBpGrbfuA9MaemNWa0jwdTc5+9QMf+eV0FNqx86mXeSA==
X-Received: by 2002:a17:907:94c3:b0:711:8b08:e7e with SMTP id
 dn3-20020a17090794c300b007118b080e7emr3463216ejc.451.1655368226845; 
 Thu, 16 Jun 2022 01:30:26 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 v18-20020a170906293200b006fece722508sm471239ejd.135.2022.06.16.01.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:30:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	akihiko.odaki@gmail.com
Subject: [PATCH] tests/vm: do not specify -bios option
Date: Thu, 16 Jun 2022 10:30:25 +0200
Message-Id: <20220616083025.116902-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

When running from the build tree, the executable is able to find
the BIOS on its own; when running from the source tree, a firmware
blob should already be installed and there is no guarantee that
the one in the source tree works with the QEMU that is being used for
the installation.

Just remove the -bios option, since it is unnecessary and in fact
there are other x86 VM tests that do not bother specifying it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/fedora  | 1 -
 tests/vm/freebsd | 1 -
 tests/vm/netbsd  | 1 -
 tests/vm/openbsd | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tests/vm/fedora b/tests/vm/fedora
index 92b78d6e2c..12eca919a0 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 805db759d6..cd1fabde52 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda..aa883ec23c 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-cdrom", iso
         ])
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 13c8254214..6f1b6f5b98 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
-- 
2.36.1


