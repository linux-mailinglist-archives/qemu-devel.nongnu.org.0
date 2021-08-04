Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9143E00AE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:59:52 +0200 (CEST)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFYt-0004l6-LR
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFVQ-0005Ub-TH
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:56:16 -0400
Received: from mail-bn7nam10on2086.outbound.protection.outlook.com
 ([40.107.92.86]:58849 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFVP-0002Vc-0a
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:56:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrAP20NS6GdYQ59klwzu5YEbpdZN2bqDRgZ8LMBAKhC9VwbwvH4lj4kyo7QiCwyR8yDXjQDBGCCYO2qzEvpT/TglVLvOqkki+kH+c+3cc9g1TYZRqCT6rZXJtSiKRM4WLi9MIClLo/vTRNzNnKKN0xXhTGj2Mfyn8LCpMSKuQNDZSIYzcXpAPzx6FeVf8qCxj3WS8c5B7Fm7/7pMBoPxFL9RIVt8UIgwivy6PnqzytXx08ma8RZbFH3Og3gEGwmiOi/q8U++3eUEGMvPNoSI30lJkMAy2TGxHA9fsjGfPcI6356uRyf3mS/4HQNcYqlMr2NqTh62/tExxyDZ5IiJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWzb+h5UrK/mMQI+JkYKO0hDHrK6UaYweN+VHSPu6u8=;
 b=MRlmSzzDsHPvHSOjR3PXau55t77qmrGUofwm4l1TLorSDCZRJVuqrC+/nEklyZ8PstqDU+pQEpsnx0A3y+vbkDZRxvxXGfCoz8isMNf0+p/pKWVf6FkSXNi+5BihHNsrl53HTzpiWUQUVU7mX4pLJlvod4vL39fwf4wlp0nIbdrhopjhBnbWsy4IWMbSz0hDkinPOmBZMhp7XsUQ1udlcTrSNJvk2XCjEjDT0OfcbNRp26GmRZpwQtNFy3+4MMVCH8agcsvMCBZ7twPt2gcLJ/kDnUsRIpENcZgt50BZYnCqU38kNtj8VTLjiHXfol9jerTCd/UhXMyy9kYkJbk+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWzb+h5UrK/mMQI+JkYKO0hDHrK6UaYweN+VHSPu6u8=;
 b=1Hll1O4WbKlh2lLfxtUV563nsfDf4oGZfHVc951rO3o81NVLLhyEsKpvN8iwRfaDI0BOF2LQnhe/wiP795tE3RMyFLLovUFnFQgRNx58D8H9mm5oeFqWr4rPGqGBDyF+h/CG8DfOyvQS0pAWpJyh620MFw8kZryTw+Suf3V66oc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:56:13 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:56:13 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 05/14] target/i386: sev: provide callback to setup outgoing
 context
Date: Wed,  4 Aug 2021 11:56:01 +0000
Message-Id: <7521883afc073960728f6f0837dac9be1641dcb6.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::31) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Wed, 4 Aug 2021 11:56:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eca93c4-4cc9-4558-b932-08d9573edb1c
X-MS-TrafficTypeDiagnostic: SA0PR12MB4413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB441322A9267C5736443765068EF19@SA0PR12MB4413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ge0QT1JSKGqb1O+Pk50wxjYlc2l0LAE+y39PgYW+qbYfNRxthZZPMOiasdMG5dudTdNnSDqybkarSsCBVdWcmWYOMvBFG21bnvtSGgizSmHEi8Oc7CLcfCHlUzCLS2TEic/bp8EWR4peBPFyT10InPBGk5qC9W4NylxmcDVs/xeSL4vBOgjepy3BS9euswePc+JGdZuSgYMEm+dTogSzLJYwc4RkMsi6nHiSvlfFcJJ998X+BGOwauVqE50upsVb0elr029WycgtIWQ6wuQopu3zuQaS+3AheJANEd/znG76fUM7ncGKG9ONx26LUXG86SaQFqJI1rqaiSQNQlFntzqrxupLvFBYLIt8qp80e5c9QrGCPAH6tUjbFMiTIC6o7oyv46zWCTsA9QwaHikzJ6Bt+GqKCfyXDnWayUU4+ed/VjGERT5wQdxmMQg4Z1STJg5Q7zvfYlvGpJrggtMgWhdA5JDWptk2S62l0N4GR/38kSFXvuLiWrMqKivrFiBpf+G8pTj3jAAUOUonePeGFjc6xvIo9kY1+7rxx/ec83PdmErJEvXPDrVN5MBwqC9Iniu3Xlq60UMWWBqvxuTgC8Nq+BysWpHdZCEh15z1AA+H8gip195BLZ3hIXshzp/Ga0p8WjcezQHDF/7DeVBvfriYRmMLdsNtvQRDZgvJRhguF/U7kC1tIZPa5WmXKP8nQlyWOwFQ8P7o6WXAT73f8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(36756003)(38350700002)(2906002)(6486002)(8676002)(38100700002)(86362001)(5660300002)(478600001)(52116002)(7696005)(316002)(66946007)(2616005)(4326008)(186003)(6666004)(6916009)(26005)(66476007)(8936002)(66556008)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGiOl/7pb8ySIAvpLVaK5F/y0X54KQjX2kQgi7+UgmwkcxlFnCZw8L2cW8X5?=
 =?us-ascii?Q?C2iTZ4wHN2NMWfMM1vn7qp6srTaUVddHYLmB3rceNvIEtqPJK69NEzDzTNa0?=
 =?us-ascii?Q?lh2fuXL5jEPMDh8Av5ScBlzEKh/UcEgE6kOcmm6WwEswYpsr1HOe9Ef3FNGW?=
 =?us-ascii?Q?VUXr3RMNp6irYbF7F31Qe6eHEu5VZTG8kRcIqWEbzrAI6V0ukRecCkpuQbXL?=
 =?us-ascii?Q?iWL51iIlxHK1UMj1f1Gu1HQqvTLM123E1MhZ1YLrBWWtmOYLmkLesXz2TlPg?=
 =?us-ascii?Q?iXBstMvwZPFwc6y/qZcGIVQw/xwpvho2t9Zpl+h9OljFlcOmlL2abjeEY0tB?=
 =?us-ascii?Q?W6yzI9b1wXfNh3qwKQ43Rf32GgWX61Q+qphcHN4OW4m7I/zNbV0bCVaTJw+2?=
 =?us-ascii?Q?bntWffxovkMLRgBQg5lARKfVBhI/NAQ4tSLuW5ScwJTaICCPuwcOBl0Q8tRI?=
 =?us-ascii?Q?TIj/ARayTlESDwhzcYJ6HDPPwDp2k4Izb3fNu8tW3PSaLFoG8A/qsHElVnwr?=
 =?us-ascii?Q?0lJR4YWgxEjPKNXD67DA4E23nutTlG9wlKjKP6GjQV03I/+imnXN0qF+FlDO?=
 =?us-ascii?Q?8WK7aMhrR+tpxCBjtiBN73rxV6W261vbcOEOyWY1kE1lMBsC7yEdi1XsByKL?=
 =?us-ascii?Q?hRHnMGlZe69zBq8OXND/q0g4WUUsOos8MYKqIJRzk9mhgPhTB/3p1jBkiPGP?=
 =?us-ascii?Q?/Nw4iJhys9xNPf3LA4DZAaxMynEL8aE8CY/6XX7nv/KP/MLgx9iIdjIXAaC9?=
 =?us-ascii?Q?+5WXvtqzzy0fthFMhAahDKzkAtM7A85gk1xKkGwBoJjf+87ur447/IrEjGMP?=
 =?us-ascii?Q?Aw7c1/CH/gdWww1tmuN/gpd5K/O3b3V29Dw0N6mS1yNRY1+TBLLzrEoleU9F?=
 =?us-ascii?Q?FenvAOHzoDaygRLI9/oitGxIqSS1fNt2T5LtpaLQNJNTCNvOvGaXxMdvyPvA?=
 =?us-ascii?Q?MNOPM0Vg3/iBDZSB316UWmq5NxdcijXBdtl9Ue6rlL69NL+v8eNNYEyxwVzw?=
 =?us-ascii?Q?s7qvMgjz2pW1BTSwhcVMsKPXUxQWRnlJ90CLIs7yo/6J2E5RraJtZYeMVRCN?=
 =?us-ascii?Q?LFq2P/EK06+mzW4mVqisUjXHql0CIox8mIoQ7SJOHrnXLnkqyJvG3x5jwJAs?=
 =?us-ascii?Q?OLEBnXEthk6c5Xe0u5Y+00RbmSnbjoFpkTefXwhOyPe8UJr2yVrqChOCYQ6Y?=
 =?us-ascii?Q?OTPtmLGdIrpOGaN85AM0pojgIZQ6mTrWZQbf9BuZhBcyGqXckuY5Dsz3eVPg?=
 =?us-ascii?Q?2phQlE+SOHakltqqhs/OR1e6aNiv0mKMMQUxRVFVsOLfQtNfdj1iKtWMy9oh?=
 =?us-ascii?Q?LLeW79/lMXlKdHp6cP48JlSz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eca93c4-4cc9-4558-b932-08d9573edb1c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:56:12.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v5ajkZKZQDfwpwlIhGgZ12sQY6BXnLqI3bUQ68FQ+a6kbExxsUevuA1YOiJuxFriw6YZwP3Mq9dv2arZSHn4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413
Received-SPF: softfail client-ip=40.107.92.86;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The user provides the target machine's Platform Diffie-Hellman key (PDH)
and certificate chain before starting the SEV guest migration. Cache the
certificate chain as we need them while creating the outgoing context.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h |  2 ++
 target/i386/sev.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 94d821d737..64fc88d3c5 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -14,11 +14,13 @@
 #ifndef QEMU_SEV_H
 #define QEMU_SEV_H
 
+#include <qapi/qapi-types-migration.h>
 #include "sysemu/kvm.h"
 
 bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
+int sev_save_setup(MigrationParameters *p);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6..5e7c87764c 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -24,6 +24,7 @@
 #include "qemu/module.h"
 #include "qemu/uuid.h"
 #include "sysemu/kvm.h"
+#include "sysemu/sev.h"
 #include "sev_i386.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
@@ -68,6 +69,12 @@ struct SevGuestState {
     int sev_fd;
     SevState state;
     gchar *measurement;
+    guchar *remote_pdh;
+    size_t remote_pdh_len;
+    guchar *remote_plat_cert;
+    size_t remote_plat_cert_len;
+    guchar *amd_cert;
+    size_t amd_cert_len;
 
     uint32_t reset_cs;
     uint32_t reset_ip;
@@ -116,6 +123,12 @@ static const char *const sev_fw_errlist[] = {
 
 #define SEV_FW_MAX_ERROR      ARRAY_SIZE(sev_fw_errlist)
 
+#define SEV_FW_BLOB_MAX_SIZE            0x4000          /* 16KB */
+
+static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
+    .save_setup = sev_save_setup,
+};
+
 static int
 sev_ioctl(int fd, int cmd, void *data, int *error)
 {
@@ -772,6 +785,50 @@ sev_vm_state_change(void *opaque, bool running, RunState state)
     }
 }
 
+static inline bool check_blob_length(size_t value)
+{
+    if (value > SEV_FW_BLOB_MAX_SIZE) {
+        error_report("invalid length max=%d got=%ld",
+                     SEV_FW_BLOB_MAX_SIZE, value);
+        return false;
+    }
+
+    return true;
+}
+
+int sev_save_setup(MigrationParameters *p)
+{
+    SevGuestState *s = sev_guest;
+    const char *pdh = p->sev_pdh;
+    const char *plat_cert = p->sev_plat_cert;
+    const char *amd_cert = p->sev_amd_cert;
+
+    s->remote_pdh = g_base64_decode(pdh, &s->remote_pdh_len);
+    if (!check_blob_length(s->remote_pdh_len)) {
+        goto error;
+    }
+
+    s->remote_plat_cert = g_base64_decode(plat_cert,
+                                          &s->remote_plat_cert_len);
+    if (!check_blob_length(s->remote_plat_cert_len)) {
+        goto error;
+    }
+
+    s->amd_cert = g_base64_decode(amd_cert, &s->amd_cert_len);
+    if (!check_blob_length(s->amd_cert_len)) {
+        goto error;
+    }
+
+    return 0;
+
+error:
+    g_free(s->remote_pdh);
+    g_free(s->remote_plat_cert);
+    g_free(s->amd_cert);
+
+    return 1;
+}
+
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     SevGuestState *sev
@@ -781,6 +838,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     uint32_t ebx;
     uint32_t host_cbitpos;
     struct sev_user_data_status status = {};
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(cgs));
 
     if (!sev) {
         return 0;
@@ -870,6 +929,8 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
 
+    cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
+
     cgs->ready = true;
 
     return 0;
-- 
2.17.1


