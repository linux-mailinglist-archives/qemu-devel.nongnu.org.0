Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DC3979E3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 20:16:38 +0200 (CEST)
Received: from localhost ([::1]:56294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8wP-0007pH-6I
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 14:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qN-0001ui-GH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lo8qL-0005Z7-QG
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 14:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622571021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qgKA1qVKIUY9RsaKnKk+R88Xea2tiVqPTmJYKjufpGg=;
 b=CEEVaa4mhFt7HEU6lZFb1EYA/okdhjvRUXURg3TcKRzqV9ov9ikQd1nUx2Y3MgBRjuRFTX
 32fChA/YMubWLSfkNSr8hZy+WoCqUVl6Dq84CP7yocHWzlS+FcrcVGfh3Af4Pkvgiq/a3s
 sDwZASsXBBSPZb+wSIBrCkHJ3NDqY/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-hlY8KXMSN2KWSOnRz_QI1Q-1; Tue, 01 Jun 2021 14:10:19 -0400
X-MC-Unique: hlY8KXMSN2KWSOnRz_QI1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 817D91009460;
 Tue,  1 Jun 2021 18:10:18 +0000 (UTC)
Received: from localhost (ovpn-112-239.rdu2.redhat.com [10.10.112.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C21B60CC5;
 Tue,  1 Jun 2021 18:10:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/24] target/i386/cpu: Constify X86CPUDefinition
Date: Tue,  1 Jun 2021 14:09:54 -0400
Message-Id: <20210601181014.2568861-5-ehabkost@redhat.com>
In-Reply-To: <20210601181014.2568861-1-ehabkost@redhat.com>
References: <20210601181014.2568861-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210503173524.833052-3-philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 065d40fd3e0..ff92d924ad9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1589,7 +1589,7 @@ typedef struct X86CPUDefinition {
 /* Reference to a specific CPU model version */
 struct X86CPUModel {
     /* Base CPU definition */
-    X86CPUDefinition *cpudef;
+    const X86CPUDefinition *cpudef;
     /* CPU model version */
     X86CPUVersion version;
     const char *note;
@@ -1601,14 +1601,15 @@ struct X86CPUModel {
 };
 
 /* Get full model name for CPU version */
-static char *x86_cpu_versioned_model_name(X86CPUDefinition *cpudef,
+static char *x86_cpu_versioned_model_name(const X86CPUDefinition *cpudef,
                                           X86CPUVersion version)
 {
     assert(version > 0);
     return g_strdup_printf("%s-v%d", cpudef->name, (int)version);
 }
 
-static const X86CPUVersionDefinition *x86_cpu_def_get_versions(X86CPUDefinition *def)
+static const X86CPUVersionDefinition *
+x86_cpu_def_get_versions(const X86CPUDefinition *def)
 {
     /* When X86CPUDefinition::versions is NULL, we register only v1 */
     static const X86CPUVersionDefinition default_version_list[] = {
@@ -1797,7 +1798,7 @@ static const CPUCaches epyc_milan_cache_info = {
  *  PT in VMX operation
  */
 
-static X86CPUDefinition builtin_x86_defs[] = {
+static const X86CPUDefinition builtin_x86_defs[] = {
     {
         .name = "qemu64",
         .level = 0xd,
@@ -5061,7 +5062,7 @@ static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
  */
 static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
 {
-    X86CPUDefinition *def = model->cpudef;
+    const X86CPUDefinition *def = model->cpudef;
     CPUX86State *env = &cpu->env;
     FeatureWord w;
 
@@ -5148,7 +5149,7 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
     type_register(&ti);
 }
 
-static void x86_register_cpudef_types(X86CPUDefinition *def)
+static void x86_register_cpudef_types(const X86CPUDefinition *def)
 {
     X86CPUModel *m;
     const X86CPUVersionDefinition *vdef;
-- 
2.30.2


