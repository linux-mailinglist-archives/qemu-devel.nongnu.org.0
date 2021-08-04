Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8407E3E037F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:40:23 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBI4E-0006SQ-J4
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI2i-00045U-Jo
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI2e-0002Cq-R9
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+bxiSHimRiYpcXZxGdOcnOJfTSfsz3hlx2jOddl6Pw=;
 b=FfzDXORXlBPQ5pHsM7+jiJz1hGeRLhbYOPQczjVWH71etxgT9JDJ/mMhyBrk4q5pXX8K5/
 eIEQB/Lm9xLKeErUacu+h2DLq6Q1tLQRNuztNhJKqclZPAGrxaNX/XKkc5i+oRujhTEaQG
 2STI7EzYCBjSf54ZSkdySsfQigqE9Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-_SiDGjwhNNa5K4TLLO5HXA-1; Wed, 04 Aug 2021 10:38:42 -0400
X-MC-Unique: _SiDGjwhNNa5K4TLLO5HXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE4F9C73A2;
 Wed,  4 Aug 2021 14:38:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA6466FFF;
 Wed,  4 Aug 2021 14:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3899A1800986; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] plugins: register qemu_plugin_opts using opts_init()
Date: Wed,  4 Aug 2021 16:38:20 +0200
Message-Id: <20210804143826.3402872-2-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Little preparation for building tcg modular.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/plugin.h | 7 -------
 linux-user/main.c     | 2 +-
 plugins/loader.c      | 9 ++++++++-
 softmmu/vl.c          | 1 -
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 9a8438f6836c..57bdcdecdb42 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -37,13 +37,6 @@ struct qemu_plugin_desc;
 typedef QTAILQ_HEAD(, qemu_plugin_desc) QemuPluginList;
 
 #ifdef CONFIG_PLUGIN
-extern QemuOptsList qemu_plugin_opts;
-
-static inline void qemu_plugin_add_opts(void)
-{
-    qemu_add_opts(&qemu_plugin_opts);
-}
-
 void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head);
 int qemu_plugin_load_list(QemuPluginList *head, Error **errp);
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2e..f9d2c6e2de31 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -661,7 +661,7 @@ int main(int argc, char **argv, char **envp)
     cpu_model = NULL;
 
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
+    module_call_init(MODULE_INIT_OPTS);
 
     optind = parse_args(argc, argv);
 
diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d62..71b03721dffc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -53,7 +53,7 @@ struct qemu_plugin_parse_arg {
     struct qemu_plugin_desc *curr;
 };
 
-QemuOptsList qemu_plugin_opts = {
+static QemuOptsList qemu_plugin_opts = {
     .name = "plugin",
     .implied_opt_name = "file",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_plugin_opts.head),
@@ -403,3 +403,10 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
         plugin_reset_destroy(data);
     }
 }
+
+static void plugin_register_config(void)
+{
+    qemu_add_opts(&qemu_plugin_opts);
+}
+opts_init(plugin_register_config);
+module_opts("plugin");
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4dee472c7942..ea87c83db347 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2725,7 +2725,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_global_opts);
     qemu_add_opts(&qemu_mon_opts);
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
-- 
2.31.1


