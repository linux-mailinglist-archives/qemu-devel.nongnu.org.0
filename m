Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5034507D6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:05:32 +0100 (CET)
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdY3-0007vs-MA
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:05:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSh-00083C-FP
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSf-00008L-67
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cgRYAqM41Px2LriKtMbCkqWrzppnp4Wtl8WLrPbt8g=;
 b=ELVEEsGBdZJNFe0Z3pDomqG7jffBYS/zMOvVStCaB+wGlAj8qLkCgiTTgbWkEBv80MAvGY
 4LqrVDdj6e8UMoPZIZtNrjxvYFXypegYRuIFEhzbzooKzCpGFFGxpz3HjigD9PYdMKk/TZ
 CrjmiOgOtblTnJj5L7eecV1XtJvJ9l4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Qs1YxomnM32JJjUXCoPezA-1; Mon, 15 Nov 2021 09:59:47 -0500
X-MC-Unique: Qs1YxomnM32JJjUXCoPezA-1
Received: by mail-wr1-f70.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so3659205wrh.14
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1cgRYAqM41Px2LriKtMbCkqWrzppnp4Wtl8WLrPbt8g=;
 b=pXfCw84r7U2HoA3Ewfcdewgs5hdvAQUCmyfrCgxuneytWXLkGLGixH1Cy5X88s6HZC
 w2lOzp7Gwh8U/rQb6WH+OxV2S7yyxpiVa6vMGQ6Ee3KmWD2/+l6RApMPUH7yAEWDBos8
 pZyMWACis+X5I9caOZF74BQMGLpD8ZgoBwSHL2FJC/42w9j5x0Vr8/zHHvkKfxvojj/N
 saZ8v0vyF5zl73u+YGJ/0mhldoplfVlPwEe1xlSJl+cOgPD6PAaern6XXC0lYqGufVx+
 jGVMaht5UXuXJkjmf/6JZtNXIMEfgqVX+r2K+VaH9/6hKZK3yiqKjHH31/h/wOIKRyDz
 qOVg==
X-Gm-Message-State: AOAM531MiQQpkJHH4VrWtZGkXm8x0UmD22Nd2p9iD43srf5KoNRBPduq
 flGgMH9cgZT3X51kTaraaak/8gs+oQCNoQY5SczkCqFnF7PlHfA5s9BaI97hvXoi8ohwlUz6ouz
 5BJsPCCY9PiHenQWnVRkm5QmdOoO23LFYqUG2QeaRpPaFWTvLsc23O/lK/0AFf9xW
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr45141877wmb.191.1636988386264; 
 Mon, 15 Nov 2021 06:59:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMNNqFIDTgepRxco8S6Zh8Jux7IOmBRfYU39T36RKkzsyRIdT1//measUpR5efmESqGx+hwg==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr45141838wmb.191.1636988386025; 
 Mon, 15 Nov 2021 06:59:46 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j40sm16105149wms.16.2021.11.15.06.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 10/11] tests/unit/test-smp-parse: Constify some
 pointer/struct
Date: Mon, 15 Nov 2021 15:58:59 +0100
Message-Id: <20211115145900.2531865-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115145900.2531865-1-philmd@redhat.com>
References: <20211115145900.2531865-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declare structures const when we don't need to modify
them at runtime.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 2f3bcf198a5..8f47a2e65f6 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -83,7 +83,7 @@ typedef struct SMPTestData {
  * then test the automatic calculation algorithm of the missing
  * values in the parser.
  */
-static struct SMPTestData data_generic_valid[] = {
+static const struct SMPTestData data_generic_valid[] = {
     {
         /* config: no configuration provided
          * expect: cpus=1,sockets=1,cores=1,threads=1,maxcpus=1 */
@@ -285,7 +285,7 @@ static struct SMPTestData data_generic_valid[] = {
     },
 };
 
-static struct SMPTestData data_generic_invalid[] = {
+static const struct SMPTestData data_generic_invalid[] = {
     {
         /* config: -smp 2,dies=2 */
         .config = SMP_CONFIG_WITH_DIES(T, 2, F, 0, T, 2, F, 0, F, 0, F, 0),
@@ -319,7 +319,7 @@ static struct SMPTestData data_generic_invalid[] = {
     },
 };
 
-static struct SMPTestData data_with_dies_invalid[] = {
+static const struct SMPTestData data_with_dies_invalid[] = {
     {
         /* config: -smp 16,sockets=2,dies=2,cores=4,threads=2,maxcpus=16 */
         .config = SMP_CONFIG_WITH_DIES(T, 16, T, 2, T, 2, T, 4, T, 2, T, 16),
@@ -356,7 +356,7 @@ static char *smp_config_to_string(SMPConfiguration *config)
         config->has_maxcpus ? "true" : "false", config->maxcpus);
 }
 
-static char *cpu_topology_to_string(CpuTopology *topo)
+static char *cpu_topology_to_string(const CpuTopology *topo)
 {
     return g_strdup_printf(
         "(CpuTopology) {\n"
@@ -372,7 +372,7 @@ static char *cpu_topology_to_string(CpuTopology *topo)
 }
 
 static void check_parse(MachineState *ms, SMPConfiguration *config,
-                        CpuTopology *expect_topo, const char *expect_err,
+                        const CpuTopology *expect_topo, const char *expect_err,
                         bool is_valid)
 {
     g_autofree char *config_str = smp_config_to_string(config);
@@ -466,7 +466,7 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
 }
 
 /* The parsed results of the unsupported parameters should be 1 */
-static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
+static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
 {
     if (!mc->smp_props.dies_supported) {
         data->expect_prefer_sockets.dies = 1;
-- 
2.31.1


