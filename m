Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBF6CABE2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:32:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqge-0004f3-I7; Mon, 27 Mar 2023 13:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqgc-0004eg-HV
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqga-0002DR-N2
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679938268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=kLJs/LntwkI3fZ7wZCv1pPKK30p3YvBZrS7+9RPXSG4=;
 b=iraJY2PfoysDuX5y5vGU04adFFEFbY3DDzMaTOpeTG5WfhIe9+QTz9Wu4fCHhk4KyWdbns
 uvpVntOfx4UH3axXQfIocOiCyOISGte6mrkt73Qbcjxj2ggiPY6WLx697EaUBuRn48QP3w
 nNoMd/xJoWK5t/ZkRRFqDyHrPgHVlHQ=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-NWaxOQVSMImWq3ofDz2sAg-1; Mon, 27 Mar 2023 13:31:07 -0400
X-MC-Unique: NWaxOQVSMImWq3ofDz2sAg-1
Received: by mail-oo1-f69.google.com with SMTP id
 z20-20020a4ad594000000b00531ac1a175dso2169363oos.20
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679938266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLJs/LntwkI3fZ7wZCv1pPKK30p3YvBZrS7+9RPXSG4=;
 b=0M2kAcImXzkZQHYUaETnRqvy3IyPqEnkQRD8HDa401dYYpRnTSU7m83J87m2zHra+j
 MBftlvwRi7b+nZk2pwBq62fRUkKbFk5mLmoQhza9bOOBIrw7b0H3yYu8ncw9ZwhSwQCH
 GDtasr6Zebi+j118b1Eue7bNzoC91J27my+kQtyNFotFP7rFWW6vP1w9FaHqGLUHat1Y
 uE78bogPSgg1Tlit/FgMxUR8lJmoQ0PTJrQs/lYASVh8Y7QDAo20J/CM7sBxlVv47ufm
 yBzrdzNYSdSuLrTyA8ALyMwCZ4YjnXCeIF3dN/uXEfbi80PAf749KBq9xKqh4BoHbLZa
 rmXw==
X-Gm-Message-State: AO0yUKVFI7GDIiWIaSWTFZc3jk80JW2VQlz5NjrmxdFwdVrdpsRldLv3
 nPXdM+/nep+Rb7+UoLrwqBeTeNbjA2sagOM8cE9lxsaZI3HM5t0EAqPSiwzyB2WoDwFs5kBH1FR
 o+huIDNM9ZfnFvp6bJVIQmmv4/STZpfHXcTuYattPMrPdeHY44AJEYm5UQf8aRiNyY09+7N4u41
 I=
X-Received: by 2002:a4a:2ccf:0:b0:52b:bab5:eba2 with SMTP id
 o198-20020a4a2ccf000000b0052bbab5eba2mr5530629ooo.0.1679938264529; 
 Mon, 27 Mar 2023 10:31:04 -0700 (PDT)
X-Google-Smtp-Source: AK7set8YeEiZFpb7Xi8M7+r2YNG6tQQdpT0NPDITMb11AJS7NXPYS7Doy8s5vxf+/4caNg0RvdQFGg==
X-Received: by 2002:a4a:2ccf:0:b0:52b:bab5:eba2 with SMTP id
 o198-20020a4a2ccf000000b0052bbab5eba2mr5530607ooo.0.1679938263950; 
 Mon, 27 Mar 2023 10:31:03 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 c192-20020a4a4fc9000000b0053b88b03e24sm5790768oob.18.2023.03.27.10.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:31:03 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V2] tracing: install trace events file only if necessary
Date: Mon, 27 Mar 2023 14:30:58 -0300
Message-Id: <20230327173058.199027-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos Santos <casantos@redhat.com>

It is not useful when configuring with --enable-trace-backends=nop.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Install based on chosen trace backend, not on chosen emulators.
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..3d96b4eea0 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
                                  input: trace_events_files,
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
-                                 install: true,
+                                 install: get_option('trace_backends') != 'nop'
                                  install_dir: qemu_datadir)
 
 if 'ust' in get_option('trace_backends')
-- 
2.31.1


