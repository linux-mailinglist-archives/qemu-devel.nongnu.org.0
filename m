Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C3341E05
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:21:31 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNF4E-0005g5-Ls
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNF3A-00053U-Jm
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:20:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNF37-0000N6-Ng
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616160019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NzjtkE1FzuUSjBCPe0v0+tFClDyz7YJmD7iZimq/nmM=;
 b=L0fIpnQb9OrPonH4115cnAaQhW8j+JWnVPNQ5pTogiiHwwhdyyDfp/+1UeHcnqQ0NmaoKB
 MIbHBGg2oKZy0BrL3NTL2UYhdkNr0ReHk5qNyPNjIgCqVz7hcFtoriV51jcqwTDuw43CMw
 ZfHWpU/xNeOrSdoVw6Avvrlp3LTaITM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Vvvb0I_SMKqFINyz6BL-QQ-1; Fri, 19 Mar 2021 09:20:17 -0400
X-MC-Unique: Vvvb0I_SMKqFINyz6BL-QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC1C581746A;
 Fri, 19 Mar 2021 13:20:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 242F150C0D;
 Fri, 19 Mar 2021 13:20:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9D0B411386A7; Fri, 19 Mar 2021 14:20:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: Avoid deprecated misuse of -drive if=sd
Date: Fri, 19 Mar 2021 14:20:08 +0100
Message-Id: <20210319132008.1830950-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: lvivier@redhat.com, thuth@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 uses -drive=sd where it
should use -drive if=none instead.  This prints a deprecation warning:

    $ ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-generic-fuzz-sdhci-v3 -runs=1 -seed=1
    [ASan warnings snipped...]
--> i386: -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive: warning: bogus if=sd is deprecated, use if=none
    INFO: Seed: 1
    [More normal output snipped...]

Support for this usage will be gone soon.  Adjust the test.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 8b8c7ac553..004c701915 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -182,7 +182,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "sdhci-v3",
         .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
         "-device sd-card,drive=mydrive "
-        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
+        "-drive if=none,index=0,file=null-co://,format=raw,id=mydrive -nographic",
         .objects = "sd*"
     },{
         .name = "ehci",
-- 
2.26.3


