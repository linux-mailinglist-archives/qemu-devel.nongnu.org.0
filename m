Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FFE51DAD4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:41:14 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmz8r-0003nI-AC
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5o-00019M-J8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5m-0005YX-K5
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI6pJkpnXE+0eP5L8nMsRwG1cHPH/7Yp7An6v5/Fu6o=;
 b=Nwj+JdKAsmPcRI/vKpcroYz3FLvTnvyNm3pmxfJGBHvA4D9INvGkG3yZseGo3Z7S4Oa624
 9TUUvauyU0rezmGC6FopGED/gcEV3v624tsjhirx1r10h6i7V1euBdHl9ezrvQ52vE/EL5
 HMYtdHe+Orn0pTyVOS4aOLGmeSKMMx8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-_ovdKQLKMDGR1tISm-cyEQ-1; Fri, 06 May 2022 10:38:00 -0400
X-MC-Unique: _ovdKQLKMDGR1tISm-cyEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BEA13C0D195;
 Fri,  6 May 2022 14:38:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF10E2166B2D;
 Fri,  6 May 2022 14:37:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 3/9] softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
Date: Fri,  6 May 2022 16:37:44 +0200
Message-Id: <20220506143750.559526-4-thuth@redhat.com>
In-Reply-To: <20220506143750.559526-1-thuth@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'xenfb' parameter for the '-vga' command line option is currently
always enabled unconditionally (since the xenfb is not a proper QOM
device that could be tested via its class name). That means it also
shows up if Xen is not enabled at all, e.g. like this:

 $ ./qemu-system-sparc -vga help
 none                 no graphic card
 xenfb                Xen paravirtualized framebuffer
 tcx                  TCX framebuffer (default)
 cg3                  CG3 framebuffer

Let's avoid this situation by fencing the parameter with the
CONFIG_XEN_BACKEND switch.

Message-Id: <20220427123316.329312-1-thuth@redhat.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index c2919579fd..ad886fb878 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -934,10 +934,12 @@ static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] = {
         .name = "CG3 framebuffer",
         .class_names = { "cgthree" },
     },
+#ifdef CONFIG_XEN_BACKEND
     [VGA_XENFB] = {
         .opt_name = "xenfb",
         .name = "Xen paravirtualized framebuffer",
     },
+#endif
 };
 
 static bool vga_interface_available(VGAInterfaceType t)
-- 
2.27.0


