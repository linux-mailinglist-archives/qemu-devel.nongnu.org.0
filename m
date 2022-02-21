Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87154BDA66
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:55:16 +0100 (CET)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMA5r-00040e-Ba
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:55:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nMA4F-0002Qc-0n
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:53:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nMA4A-0007VH-0i
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645455201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OLBCHkNGMn5V9ppIB6wgotWjN4gwVqa9IIsZXfRno88=;
 b=WHiqyzjvf6xWMQ/HgqtEl/g/0puaCe1EcIJDJgsG61+0jDZHr58Wcwra837LlBAiC+ECD6
 6J0ihrIiigBcjjRpX7hreRHFgvbRCalE4qM7K2cfhQ4hSoD6ycn1wxDMELjzggwhcWTTjl
 1sy/BiNa9W0y/1jRLedV4RuUvc2fBC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-ibJ4oj-tM-67ytYBBLe-_Q-1; Mon, 21 Feb 2022 09:53:20 -0500
X-MC-Unique: ibJ4oj-tM-67ytYBBLe-_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9721091DA0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:53:19 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F02D27DE57;
 Mon, 21 Feb 2022 14:53:17 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] i386: Add Icelake-Server-v6 CPU model with 5-level EPT
 support
Date: Mon, 21 Feb 2022 15:53:15 +0100
Message-Id: <20220221145316.576138-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows 11 with WSL2 enabled (Hyper-V) fails to boot with Icelake-Server
{-v5} CPU model but boots well with '-cpu host'. Apparently, it expects
5-level paging and 5-level EPT support to come in pair but QEMU's
Icelake-Server CPU model lacks the later. Introduce 'Icelake-Server-v6'
CPU model with 'vmx-page-walk-5' enabled by default.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e6368004c..6e25d1333971 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3505,6 +3505,14 @@ static const X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 },
             },
+            {
+                .version = 6,
+                .note = "5-level EPT",
+                .props = (PropValue[]) {
+                    { "vmx-page-walk-5", "on" },
+                    { /* end of list */ }
+                },
+            },
             { /* end of list */ }
         }
     },
-- 
2.35.1


