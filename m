Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722148241A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:05:52 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HbT-00019g-5M
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKz-0006Zx-GM
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKx-0000mB-Rr
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Brj1G/fUhqiziIlPAK7440LnFkqvsAAYMyPJBvFCKgI=;
 b=gZtErJpTOvBmSSG7x/l7xSPX+lT4EVVC7wRXtmAsJ8vK/gJfohC+fulXoG8IlOAcUbYF7p
 8W5WgxY1D3JscAS3amBLhwziICj9YE0sk1GapB5Bg0rTqGjcRCD0kSZPml4BDjqL/MPg69
 u6JT7jVg4hsloyyTVZ85uyvIsmPFJOI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-A4O3B-krNw-KQmP2rlnqTw-1; Fri, 31 Dec 2021 07:48:45 -0500
X-MC-Unique: A4O3B-krNw-KQmP2rlnqTw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so7526607wra.19
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Brj1G/fUhqiziIlPAK7440LnFkqvsAAYMyPJBvFCKgI=;
 b=AtnuxC89CadzOMu/sKD4/E7jL2kPeaw5dNMSkeHtOybMvQUBfLXK5UEwYhd446NTzK
 24s44gOvAowB9UIsL2i7qrvluhRMxuI1XVv934Lh3D2dctDlt/JEcVELN191eLmZgO42
 2no+sDwUwhdCcmio3stsgdT3p+qAWFlOxFyf/MnWhU3KlB3dGBODbvMJ6JJ4Y5O/Ve/4
 o7rc3L8Ipu5pQE5a8oHIj0NBgNpaPs76QLq2jB4v85Kxtp4ogaq4w8no8Ooh9gH0fyK/
 CVTJUDGmZWTF+K+jO+w+FOo6h78zqiDCfg2LrxalWJyCLKfgmZU4bBRWCJo42YKxseCO
 0WTg==
X-Gm-Message-State: AOAM533NMwKInRuP7naHF6j5aeaIabYvd/fNol6mjWH5lUvvIckt9zwI
 St5Ml6xSzXGCC7+rxbT7Sp5WFkZSNjHVjuK99uXqYsCbAyBitGRCRqwPO6gc7/yDRF6vR+8SO96
 G/mOAF4ZGCXfVhTwZW1unKuguaUTzWk5v8flyFjfIpONMC3G5PrEUrdWXlzsxDdWp
X-Received: by 2002:a1c:e909:: with SMTP id q9mr29066568wmc.184.1640954924077; 
 Fri, 31 Dec 2021 04:48:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy90nhSNQRqRCtDsglq5R4j8vlK7YYBdk+5cfY1o18jPVz+ZSFniMUeYEu5f0EA3d07dHlgYw==
X-Received: by 2002:a1c:e909:: with SMTP id q9mr29066551wmc.184.1640954923785; 
 Fri, 31 Dec 2021 04:48:43 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y13sm30613911wrd.89.2021.12.31.04.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/20] tests/unit/test-smp-parse: Constify some pointer/struct
Date: Fri, 31 Dec 2021 13:47:45 +0100
Message-Id: <20211231124754.1005747-12-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
Message-Id: <20211216132015.815493-8-philmd@redhat.com>
---
 tests/unit/test-smp-parse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 395929b66cf..0f98c9509ee 100644
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
2.33.1


