Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787C2953D5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 23:06:07 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVLJ8-0005ye-5U
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 17:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAz-0005Zq-2R
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kVLAv-0006gs-9e
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 16:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603313852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEmG+5DMurtuugiP1AkAOY/uZr4pKnlUz7Ec9go+dTg=;
 b=ElyAGYKSzuc5aKlcRRte/BFmfSz2Yei3lvli4xYdcxbK7JJVaO6XGgftoza3hXnmbd5XBs
 Om5yOsoA02x98tubYmE5vWXI3vCqNJQwb8pgDVuHxw5DpZ4V698AU+eCROd+YIgV2kVbaL
 3UqT2IdGGPbm6zqRXy10venU49O4mPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-OrkrzfU3M9GNMWIMwXdP2w-1; Wed, 21 Oct 2020 16:57:30 -0400
X-MC-Unique: OrkrzfU3M9GNMWIMwXdP2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E31186DD23
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 20:57:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7571D6EF6E;
 Wed, 21 Oct 2020 20:57:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/22] vl: preconfig and loadvm are mutually exclusive
Date: Wed, 21 Oct 2020 16:57:08 -0400
Message-Id: <20201021205716.2359430-15-pbonzini@redhat.com>
In-Reply-To: <20201021205716.2359430-1-pbonzini@redhat.com>
References: <20201021205716.2359430-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like -incoming.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f8b1ffb46e..3607cd4357 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -124,6 +124,7 @@ static const char *mem_path;
 static const char *boot_order;
 static const char *boot_once;
 static const char *incoming;
+static const char *loadvm;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -2886,6 +2887,11 @@ static void qemu_validate_options(void)
           }
     }
 
+    if (loadvm && !preconfig_exit_requested) {
+        error_report("'preconfig' and 'loadvm' options are "
+                     "mutually exclusive");
+        exit(EXIT_FAILURE);
+    }
     if (incoming && !preconfig_exit_requested) {
         error_report("'preconfig' and 'incoming' options are "
                      "mutually exclusive");
@@ -3161,7 +3167,6 @@ void qemu_init(int argc, char **argv, char **envp)
     QemuOptsList *olist;
     int optind;
     const char *optarg;
-    const char *loadvm = NULL;
     MachineClass *machine_class;
     const char *vga_model = NULL;
     bool userconfig = true;
-- 
2.26.2



