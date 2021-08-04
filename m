Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DA3E00C0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:02:12 +0200 (CEST)
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFb9-0008Il-3C
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFW9-0007ji-Gj
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:01 -0400
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com
 ([40.107.93.52]:54433 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFW6-0002lW-Oc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbJidx8oYeqaw0BHCOSj6I5Alj4HSqUcOGmnRR7n7LuTYUCLa5OI1WlGKqgx/01jMHAvujtWam2Fg+u7XUZY21zYL6TSdEm+Cl471YQHPypv0AMARPN+J7xK+RkU5gDiSvdUrq1Pjfe8741g5L8qqw1jxl602ZQP/n+CXJt0ECnSBHwI3HZoMBhzUXYIJ6aS1rrDmcNf66mGEH1I/hUvKjTsQz7YWljsUNCUcmI0Gh56zZM15aFdieMMfsDzOkJQ/oj2zSRF2SBWh2AqohX1/3SGHDwr/qWfl+v4bQTawYCVsBysKMTJOmUM2uexT8nQ9cB6ro5tVZi3fSufkIcRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMRxtKOe886+8WHm5aBKQbBiUL49N7e4/8Vv+zZp4tc=;
 b=MzmqS+SDH6Cd5ZR6ktzow6WASePGSkU9owbvKjD7nCxIXGYhzp7HNaHfbz37CbC1DaFfvgHc4RUp3jhPLaJ1/gR8CC1lMi/yyysIUbRs44GBkv0E1NPu559Oc1EF7SLFPoaEs+nJ9PAurWw3kkyZjZSk9nABt7e3Vp+wFv9z29oJcuKIQY+bJ1j6IcBtkp5l7S8M8AkMDefA2otzdJlGx2pYFW3s21Bhs6r9muY5s2MqLfJM9ILoSBOM1oArrB6v28L7Ia+RlbYNe7+m8p1098BypwUDDhK0fUUv7Kwb6xT2I0z6zMDpIYCvkIrziYsiXZVlhC21/13i2q+qNkWQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMRxtKOe886+8WHm5aBKQbBiUL49N7e4/8Vv+zZp4tc=;
 b=JjN2ZheBShs9W376rbEENSQGFzV9nvzbibZwBW53itQeg4GWVGHUDRkuKARF0PB1m4yOVZcV87mdIsWuwUAN529H7kBStyy/1eYGNZ2aD/1+J6IRvZKEeNq/MtI1wRyv5iTbwCHo+7YpwoNGMTbrGSS3aceEwDJVL834qnG/1tc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:56:56 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:56:56 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 07/14] target/i386: sev: add support to encrypt the
 outgoing page
Date: Wed,  4 Aug 2021 11:56:44 +0000
Message-Id: <5187c6f86bd3e253be565f3773f85e92879c5391.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0018.namprd07.prod.outlook.com
 (2603:10b6:803:28::28) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN4PR0701CA0018.namprd07.prod.outlook.com (2603:10b6:803:28::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Wed, 4 Aug 2021 11:56:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c9a5285-9a86-4bd0-03d9-08d9573ef500
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB441390FCAA74A62673646C368EF19@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:214;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bj0lHDpJFhojrJxqmngggqYmt2lpzMcvf7rwBg43ydP+sBbDmaPQZeWZpNuzYLQof+RsJfH/v+1+bor9sGQXYbd/8nk3TANmRk5nAhpPACOAOFSQOSrZQqZyyQqHcI+g750scYEEmMMVJBQPydqvAScELsrlBC6Q73QglcknZjfp6gXqYMNVKKX+oWhESkbQTdcnHwaUQubOrJFhWYvhtK2ovVVxlJgn4nQPs2yljRARmgLXWPm0G/TS7v88diCrl3ox1kVNoD6X5seuhyJfAop1xTzDFAn7tGkrj2TFjll5q1v19egrSOT2dF6ZlpicG5KAhCqGUeB2MKHA8CpLXibTO71HU6liUEQHR/FNB/g1ReZCOq9PtA+dRDKIInm9pbRGtR0V4h125h6z2b4EVdu6AIs4ColAXrQ4YLcWxez5EB6G+MBEuiPZDau3UJ99pTk9Qi7jLg6s8dRQ/AZC8IDraPLAGYZY/tCLIQxsziGonBc78HOZhHliGRR7L5nd/5+WMdUOdaFfS0in1EyVAvTnn4hSRDVnHg7r8+NjIoZw6zbnLV3cI+3SDXX1/GakqkPvIo74emT1YMYoaZ4qu0S+91szEo1/Ugc/je3Pj3P8kfrnGhQOO2ium9gxXnJNvv17MyjJ+K3dbTfomDB7rYDABw28T0rSomoOmmsM+jc8PUgbfIaGv9xFTchBEIpjiXhAtGWGiuh83A26DeXvwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(36756003)(38350700002)(2906002)(6486002)(8676002)(38100700002)(86362001)(5660300002)(478600001)(52116002)(7696005)(316002)(83380400001)(66946007)(2616005)(4326008)(186003)(6666004)(6916009)(26005)(66476007)(8936002)(66556008)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CUriFtIP8eY0cF8AqJuj38UlDiRhMAbn++EBWfs1TRpyzLZiI/txXj1xMiFM?=
 =?us-ascii?Q?NyxITH9cX6sdFzSssKbwnC8k6BKzXPYGW9btSLuMh6nnNo/clAvL3nV36v70?=
 =?us-ascii?Q?0ZiMPTZXwVQsbjavWEgIHkIuamCzgPe7jeEMvZ0VTNo71y4iqAOFPJvnl55u?=
 =?us-ascii?Q?OLtnP3yYIa2fvO5bgwOXdZH4K32MFH5poi+A5tuesC/B+48COMEYNS8xUVEa?=
 =?us-ascii?Q?1x9Pf40v6RN5ihwn8oITfQl8s1gEkQP2Eptj6BQphsNLMGM/L2OwY3+LUj32?=
 =?us-ascii?Q?DiWtd49+b463nwl2tPzTP6TGaNm1IjahverPqR+ZkauSF8VLPGmhP+eGpSzq?=
 =?us-ascii?Q?cKOzikgZF/tWDic0tbBD0L5et+tzUBE4ZaB4HC4gN1oSo8nHtmwMC01fZ1sd?=
 =?us-ascii?Q?AAgUMH8ZxqrJMNUg9DOUWyLSBUmQBXnr5yoZHaPQdAzb2vm5rg+wwYFgJzdm?=
 =?us-ascii?Q?wasLyHBoDUL5y0Y0YZA8adb9wNlLQLI0YHzJSvZvmOcKO7zOzQ339ahn5oOB?=
 =?us-ascii?Q?aFOT+MjD5JjgW7HfNUO+oFqLhs3lgs6CR0SjKUydBdX/fRli5W4f6GhC2Y4W?=
 =?us-ascii?Q?Ypc3vyRrtlavC0ddVr7xIwmmDiWQg6Sm9ODrs3EKhc3OECJ+LJ2b/s8EhnSs?=
 =?us-ascii?Q?GMSJyba6eDFLIG+g/Fp3vxM8wwajrVmFgiKw8ALFk+XTMDhxT397tnYNHHjt?=
 =?us-ascii?Q?CGnMZMHic+t0QqERoZIEK4dQ1oEcihvyJaxsk+PDx294yRrj/GTZ+bPtI9bG?=
 =?us-ascii?Q?3pVA6VnPnIMsxqWIxdUVNjTSC6v5dRY56y+ej2m2Zy8kRL3Npvls8VAfypBA?=
 =?us-ascii?Q?JEEimBVIxtYDAZgl7aiW6Nd2Fyjb0CRMw6MoYquoXI2uMLhMWBdzIET2YuTf?=
 =?us-ascii?Q?/Wy81vcrUA0w0rvaMt6nyxyXY2a1zmwWKSQDBKz8nZod94qw3Re0fyp8Zr63?=
 =?us-ascii?Q?K2WnYVPxd2VD/5dVUtTezCrj/BwW3Itueo6CV3E8kR5xRsfbHt7dfe3fkOLX?=
 =?us-ascii?Q?U52b3OvPuOuBSgQNiqISOqZZDQnyMmk6JNQZR0mp344Mj42JZMs499spTBFL?=
 =?us-ascii?Q?vqLJRbpDWUFN5M7Duejgbw0OkU7vvodOYE4i6IiWzSTBhxGXqYZTe/+LE65L?=
 =?us-ascii?Q?XB7zrwTsvBDdB1zw0YcK64M6kb0T+LgbD0CMlh6cOT3wllgxSrwypmkwvqb2?=
 =?us-ascii?Q?hgunXYjfK9MlX3lvG5m17hDvfc2lw+rzP9vShF4v2IbG5idTFFJ4ccmOx8w8?=
 =?us-ascii?Q?Ns8kuszVbVAmAGxGjL9qU6Q6pCn4kZNI15nAp+eZwdBolAmm6mpktrW9uEJi?=
 =?us-ascii?Q?mDPtjDEyuN8cXPJsim15lIKQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9a5285-9a86-4bd0-03d9-08d9573ef500
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:56:56.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCOj0QhitaTphLn91w0my0yFdXPUfr59FdvpS2CNUYzuD7g61Sfw1w5sLIHplM/3oJonJUF1Bn1h+5LYEycVBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
Received-SPF: softfail client-ip=40.107.93.52;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

The sev_save_outgoing_page() provide the implementation to encrypt the
guest private pages during the transit. The routines uses the SEND_START
command to create the outgoing encryption context on the first call then
uses the SEND_UPDATE_DATA command to encrypt the data before writing it
to the socket. While encrypting the data SEND_UPDATE_DATA produces some
metadata (e.g MAC, IV). The metadata is also sent to the target machine.
After migration is completed, we issue the SEND_FINISH command to transition
the SEV guest state from sending to unrunnable state.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h     |   2 +
 target/i386/sev.c        | 221 +++++++++++++++++++++++++++++++++++++++
 target/i386/trace-events |   3 +
 3 files changed, 226 insertions(+)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 64fc88d3c5..aa6b91a53e 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -21,6 +21,8 @@ bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_save_setup(MigrationParameters *p);
+int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
+                           uint32_t size, uint64_t *bytes_sent);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 10038d3880..411bd657e8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -30,6 +30,8 @@
 #include "sysemu/runstate.h"
 #include "trace.h"
 #include "migration/blocker.h"
+#include "migration/qemu-file.h"
+#include "migration/misc.h"
 #include "qom/object.h"
 #include "monitor/monitor.h"
 #include "exec/confidential-guest-support.h"
@@ -75,6 +77,8 @@ struct SevGuestState {
     size_t remote_plat_cert_len;
     guchar *amd_cert;
     size_t amd_cert_len;
+    gchar *send_packet_hdr;
+    size_t send_packet_hdr_len;
 
     uint32_t reset_cs;
     uint32_t reset_ip;
@@ -127,6 +131,7 @@ static const char *const sev_fw_errlist[] = {
 
 static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
     .save_setup = sev_save_setup,
+    .save_outgoing_page = sev_save_outgoing_page,
 };
 
 static int
@@ -829,6 +834,40 @@ error:
     return 1;
 }
 
+static void
+sev_send_finish(void)
+{
+    int ret, error;
+
+    trace_kvm_sev_send_finish();
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_FINISH, 0, &error);
+    if (ret) {
+        error_report("%s: SEND_FINISH ret=%d fw_error=%d '%s'",
+                     __func__, ret, error, fw_error_to_str(error));
+    }
+
+    g_free(sev_guest->send_packet_hdr);
+    sev_set_guest_state(sev_guest, SEV_STATE_RUNNING);
+}
+
+static void
+sev_migration_state_notifier(Notifier *notifier, void *data)
+{
+    MigrationState *s = data;
+
+    if (migration_has_finished(s) ||
+        migration_in_postcopy_after_devices(s) ||
+        migration_has_failed(s)) {
+        if (sev_check_state(sev_guest, SEV_STATE_SEND_UPDATE)) {
+            sev_send_finish();
+        }
+    }
+}
+
+static Notifier sev_migration_state_notify = {
+    .notify = sev_migration_state_notifier,
+};
+
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     SevGuestState *sev
@@ -933,6 +972,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     ram_block_notifier_add(&sev_ram_notifier);
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
+    add_migration_state_change_notifier(&sev_migration_state_notify);
 
     cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
 
@@ -1143,6 +1183,187 @@ int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size)
     return 0;
 }
 
+static int
+sev_get_send_session_length(void)
+{
+    int ret, fw_err = 0;
+    struct kvm_sev_send_start start = {};
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_START, &start, &fw_err);
+    if (fw_err != SEV_RET_INVALID_LEN) {
+        ret = -1;
+        error_report("%s: failed to get session length ret=%d fw_error=%d '%s'",
+                     __func__, ret, fw_err, fw_error_to_str(fw_err));
+        goto err;
+    }
+
+    ret = start.session_len;
+err:
+    return ret;
+}
+
+static int
+sev_send_start(SevGuestState *s, QEMUFile *f, uint64_t *bytes_sent)
+{
+    gsize pdh_len = 0, plat_cert_len;
+    int session_len, ret, fw_error;
+    struct kvm_sev_send_start start = { };
+    guchar *pdh = NULL, *plat_cert = NULL, *session = NULL;
+    Error *local_err = NULL;
+
+    if (!s->remote_pdh || !s->remote_plat_cert || !s->amd_cert_len) {
+        error_report("%s: missing remote PDH or PLAT_CERT", __func__);
+        return 1;
+    }
+
+   start.pdh_cert_uaddr = (uintptr_t) s->remote_pdh;
+   start.pdh_cert_len = s->remote_pdh_len;
+
+   start.plat_certs_uaddr = (uintptr_t)s->remote_plat_cert;
+   start.plat_certs_len = s->remote_plat_cert_len;
+
+   start.amd_certs_uaddr = (uintptr_t)s->amd_cert;
+   start.amd_certs_len = s->amd_cert_len;
+
+    /* get the session length */
+   session_len = sev_get_send_session_length();
+   if (session_len < 0) {
+       ret = 1;
+       goto err;
+   }
+
+   session = g_new0(guchar, session_len);
+   start.session_uaddr = (unsigned long)session;
+   start.session_len = session_len;
+
+   /* Get our PDH certificate */
+   ret = sev_get_pdh_info(s->sev_fd, &pdh, &pdh_len,
+                          &plat_cert, &plat_cert_len, &local_err);
+   if (ret) {
+       error_report("Failed to get our PDH cert");
+       goto err;
+   }
+
+   trace_kvm_sev_send_start(start.pdh_cert_uaddr, start.pdh_cert_len,
+                            start.plat_certs_uaddr, start.plat_certs_len,
+                            start.amd_certs_uaddr, start.amd_certs_len);
+
+   ret = sev_ioctl(s->sev_fd, KVM_SEV_SEND_START, &start, &fw_error);
+   if (ret < 0) {
+       error_report("%s: SEND_START ret=%d fw_error=%d '%s'",
+               __func__, ret, fw_error, fw_error_to_str(fw_error));
+       goto err;
+   }
+
+   qemu_put_be32(f, start.policy);
+   qemu_put_be32(f, pdh_len);
+   qemu_put_buffer(f, (uint8_t *)pdh, pdh_len);
+   qemu_put_be32(f, start.session_len);
+   qemu_put_buffer(f, (uint8_t *)start.session_uaddr, start.session_len);
+   *bytes_sent = 12 + pdh_len + start.session_len;
+
+   sev_set_guest_state(s, SEV_STATE_SEND_UPDATE);
+
+err:
+   g_free(pdh);
+   g_free(plat_cert);
+   return ret;
+}
+
+static int
+sev_send_get_packet_len(int *fw_err)
+{
+    int ret;
+    struct kvm_sev_send_update_data update = {};
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_SEND_UPDATE_DATA,
+                    &update, fw_err);
+    if (*fw_err != SEV_RET_INVALID_LEN) {
+        ret = -1;
+        error_report("%s: failed to get session length ret=%d fw_error=%d '%s'",
+                    __func__, ret, *fw_err, fw_error_to_str(*fw_err));
+        goto err;
+    }
+
+    ret = update.hdr_len;
+
+err:
+    return ret;
+}
+
+static int
+sev_send_update_data(SevGuestState *s, QEMUFile *f, uint8_t *ptr, uint32_t size,
+                     uint64_t *bytes_sent)
+{
+    int ret, fw_error;
+    guchar *trans;
+    struct kvm_sev_send_update_data update = { };
+
+    /*
+     * If this is first call then query the packet header bytes and allocate
+     * the packet buffer.
+     */
+    if (!s->send_packet_hdr) {
+        s->send_packet_hdr_len = sev_send_get_packet_len(&fw_error);
+        if (s->send_packet_hdr_len < 1) {
+            error_report("%s: SEND_UPDATE fw_error=%d '%s'",
+                         __func__, fw_error, fw_error_to_str(fw_error));
+            return 1;
+        }
+
+        s->send_packet_hdr = g_new(gchar, s->send_packet_hdr_len);
+    }
+
+    /* allocate transport buffer */
+    trans = g_new(guchar, size);
+
+    update.hdr_uaddr = (uintptr_t)s->send_packet_hdr;
+    update.hdr_len = s->send_packet_hdr_len;
+    update.guest_uaddr = (uintptr_t)ptr;
+    update.guest_len = size;
+    update.trans_uaddr = (uintptr_t)trans;
+    update.trans_len = size;
+
+    trace_kvm_sev_send_update_data(ptr, trans, size);
+
+    ret = sev_ioctl(s->sev_fd, KVM_SEV_SEND_UPDATE_DATA, &update, &fw_error);
+    if (ret) {
+        error_report("%s: SEND_UPDATE_DATA ret=%d fw_error=%d '%s'",
+                     __func__, ret, fw_error, fw_error_to_str(fw_error));
+        goto err;
+    }
+
+    qemu_put_be32(f, update.hdr_len);
+    qemu_put_buffer(f, (uint8_t *)update.hdr_uaddr, update.hdr_len);
+    *bytes_sent = 4 + update.hdr_len;
+
+    qemu_put_be32(f, update.trans_len);
+    qemu_put_buffer(f, (uint8_t *)update.trans_uaddr, update.trans_len);
+    *bytes_sent += (4 + update.trans_len);
+
+err:
+    g_free(trans);
+    return ret;
+}
+
+int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
+                           uint32_t sz, uint64_t *bytes_sent)
+{
+    SevGuestState *s = sev_guest;
+
+    /*
+     * If this is a first buffer then create outgoing encryption context
+     * and write our PDH, policy and session data.
+     */
+    if (!sev_check_state(s, SEV_STATE_SEND_UPDATE) &&
+        sev_send_start(s, f, bytes_sent)) {
+        error_report("Failed to create outgoing context");
+        return 1;
+    }
+
+    return sev_send_update_data(s, f, ptr, sz, bytes_sent);
+}
+
 static void
 sev_register_types(void)
 {
diff --git a/target/i386/trace-events b/target/i386/trace-events
index 2cd8726eeb..e8d4aec125 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -11,3 +11,6 @@ kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
 kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data %s"
+kvm_sev_send_start(uint64_t pdh, int l1, uint64_t plat, int l2, uint64_t amd, int l3) "pdh 0x%" PRIx64 " len %d plat 0x%" PRIx64 " len %d amd 0x%" PRIx64 " len %d"
+kvm_sev_send_update_data(void *src, void *dst, int len) "guest %p trans %p len %d"
+kvm_sev_send_finish(void) ""
-- 
2.17.1


