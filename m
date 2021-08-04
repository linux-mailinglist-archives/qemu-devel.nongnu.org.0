Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2943E00AB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 13:59:31 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFYX-0003Rc-Vq
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 07:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWb-0000eV-96
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:29 -0400
Received: from mail-dm6nam10on2060.outbound.protection.outlook.com
 ([40.107.93.60]:13249 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWZ-0002wB-0K
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAyqvijwYU/bliZCCqC2nnyuBpltuzWx6wTG7LI9ZKGgctM8Napw1dHUIZeDpukRgIgdafqAbcdUzLY9lhb5Wu1Ygp0tVi9fZGXVTFnJmpVL0WXot4g8YKqd9YMAZ9G4awWYLwfGd5eroHxvHBkaDtPEijASwcWbf6meN6JdiiNkParfoONpYHc20ypg8Dpq4FLgIFP/+Eait8+pU+vem7VtjrQEGdQWtrm0b/7Csct49a67LIevn2h4qArAgFW2CPs+67ZfnS5p6m/0HsgOCFhkqRkdnN02hDUaTVf9Oj+NRwhLNvqrrhg2dBMxqXF1SKjid9eXFu01O/fglO0iVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi4qn0S1RFoNRfhGi9z8DVODTZoHmTp8KpSpF7oPNLk=;
 b=KZurtxWVGMsjcj3Yr/JJeMnnCiahc7H9FheinPLGP2j2zSg21fgUvd0ujxlcKLdVyqsQltmZzrn1qj1tmQw02T1MqtHSbjdjkM1KqOI1qVmvaq2HeWgPhpyEaSaijyDAU+K+6jr5lmkOd1xnAgSU6RiTTfDvlCqtYzK6Vj1kJorRHdHR91yt02o+y9Up1XVXZ9qzeFx1zvmZgSZgxrUfxA+Fd1nyw1tRdPiX0pQICyAHSyCvmdARxad29F43i/tSGpDYb3lNga7jl5FgVQ0Zq/J5tRDsMc1R8nuiIIsrjDo0EBtlnazGG5iZXHLRtwVG4f5VdKrhoqByt0+CA5mEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi4qn0S1RFoNRfhGi9z8DVODTZoHmTp8KpSpF7oPNLk=;
 b=uBs7oaigooyp06XBzC+a2j3ocxtlF8JXrD+yOwXg6KvFuz00BHECHzfy8OJv6sTJUCpYX/wx2XHTMS2WJEh2IKuCyxOVoEFASkUg+h/KCB5Xr3q8eV9S/4Kjx49yCr3oTukrGqrK/SCG3Q5qdHOzGYWcX4CnhY2VoxLrMRRNkhM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 11:57:21 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:57:21 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 08/14] target/i386: sev: add support to load incoming
 encrypted page
Date: Wed,  4 Aug 2021 11:57:10 +0000
Message-Id: <e86e5dccb0450be3d4c02b1263d5183add153b1f.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:806:d3::23) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA0PR11CA0018.namprd11.prod.outlook.com (2603:10b6:806:d3::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 11:57:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c99adf0f-a265-4645-b87e-08d9573f0433
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542E01C6E20F807B73980DE8EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ybxzwcccssDLtYwpAifWMxmHyITVXha0D9Er2If8ulU4EdreH9VSnOZ4ZuBJjpmuzCCc9RArjGVldRNtDAqu/fFsY4VJFqlGh+HVIU5gYvkbLo/daqiwjjihiZmFigm4jYW1S/qhu7aX9OE+e0jFceL2ZEwWNsXDQwE9V9/zo+IJnJSDWiTVPDTGGz/kxYHLm5KjqovxEJFM5ia2iIa7ElSq9SXa41uJ5szy1su6SjaDhop9DEzQJjcSsLqvGJv4oBpzxzHY4qQKWxJe/6r+Ig7hoJ4G6H570/0qjc4XkBo1T/CecaCZZVA/nhQ0AEiIIKl9IbBeVWYYZ3+wimbrngzkZmomLsnLY++xHXyxc0zS6CRYjV7R5t5Xam0iW5jEApUVwQrAnf9Mxg2mAAErViy/HlVvuk5EJtegkeUVYfQOyAzK0IrmuIp1lzYRhdry1fUr+YiXJ4AGiSyWSIKfZ52u8O5ClPgnOmpaGZ03uQ8xHe1ypplMAC7s+KP27nGO+VPC/jX3afpCjVG8TtDmkwJOXXflCmDIwAox3Z/NkDWl6p1WqhEY3h3LnfRGzPFOKSMQoIrbF2wlarRje6rNd9uJevetvHMxJThuJGR0Uxdi5somFYlQUTKCNe5F/f0mtA5ARpEsIZ8ULC+ZxJebwp/Tz8IgcWPDXWahtaJ64ygo8Ks0Ob0ENPRXDR/WvCWbrFn2s51a+KB1saE3Pkcdrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WPlYSXCRFu4Lx0xz/QH19ZkiZ3bz5kvrrCrEuIfntv8lhWIzr3xtd7iMxsgI?=
 =?us-ascii?Q?zV0G85QoAZf50iUTCqD2jf8YB2pbcA4qJYYKxAn4oJa8blTcLyen/dtV4HSs?=
 =?us-ascii?Q?HDbpkd9CNz2iy2ImFkr2u5aaa/woJEwBVo2g480Q9vWxTgkVmopHVmPQYXPh?=
 =?us-ascii?Q?rypPXOF3Szy5TayGERdmEZ1GW7Rj3rtAsDuyTCATrdy1dZavgqLO3sB1MOSP?=
 =?us-ascii?Q?MChEYxDQ7tTkOn9NrW4Yrek5E0OnHGzqxswQ+FH+RC5s3Pe45YilOYjY8gbM?=
 =?us-ascii?Q?Zx8iFWW+JjHSfxuonIqJAcOlPt03MCBjQWjaFg4fw0ygKnYy+MBedytJ17hy?=
 =?us-ascii?Q?CK1RHrdrFpN3d40ok0EU3OrYq6rll3wxXYudOAoDUHaaWxtrX3azQQiA1FUA?=
 =?us-ascii?Q?931+f5MRjGyh4Q+olhNaMHZmIlodq7mD9XNSdhJTGovIkI6fHU/H3nRRtoYf?=
 =?us-ascii?Q?lFoXSbVWKUiAj1VKn2ZqWzpGMftSfsgDm0ziuRfHA+0bGsY9aul3setB+e6+?=
 =?us-ascii?Q?XoViUQ5KwIkJd6zjHf7AsaK+kcaNGngZL+/VcFbvKn37gkraD6rJIY9vDW1C?=
 =?us-ascii?Q?VFsX2JlVMFIynxupc/vKTNHg46Beuuk6xKylfW4Wy8dm4a2PrkGZnMh26eod?=
 =?us-ascii?Q?9zEFia/uKxyA9/If2x0zVQ9PgbPMv+OnpunqGSPiZMFrQ9kb3RXmAxiz4ERd?=
 =?us-ascii?Q?sveLej1IDw6MRL6yCWxlaBVSIhqON1AZzXDRVsoxbrxuIoJ/8QmrZsoIeBvH?=
 =?us-ascii?Q?rVtr2bvr9/5w/TlCFKBFpohflRIteoRESLYi8x8skMzBWOVRkoQleEadU57n?=
 =?us-ascii?Q?5P5DEZqUtaZawx7HEr6a95qQ3+K7sh5x0QML186jR9fUR4/XV7ADSbVM2TA7?=
 =?us-ascii?Q?q1qSwuMA3lBRSboPGLv+69YVXm3YNWxQkxA+KYhLBScROw81f+t2DFow6t1Q?=
 =?us-ascii?Q?iTNbCqfi9grH6pvYhbhVcb/9/h7vdYzhWhhf79BFtICvH2cKLVKiFkqRrk/j?=
 =?us-ascii?Q?v3wOyjL65aSrLp9gFEv+2pR24RA1E4jrz16Ogqu3UWd9zswWN7rspv30Sp9i?=
 =?us-ascii?Q?kCiW6LbMuPYGckgCtspBI721+ub+mrZJXJWbmdLZNFc+l9bMnQhbkxZezacl?=
 =?us-ascii?Q?lYtlXC5ylDd+Cp4jqSl82CFGHBeSadoXnB/EizHWXXT8KsnDa4T4lN0l4eHX?=
 =?us-ascii?Q?gg1P1trkVwvdc39XHifHiP1s5TGR445DNWAug8fBBhRhHnyLiQ/uK5onIgRX?=
 =?us-ascii?Q?csmWHtPQOJ+nRqODtxcSg+mPOWtqDYW3srqCPI3BHmAs2dAmBEk5AomFgHSY?=
 =?us-ascii?Q?msjAt0v1pZs+/YNwh40KWEBc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99adf0f-a265-4645-b87e-08d9573f0433
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:57:21.6209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzv0KeU3YQ7uFWM5QXDsZfvqYjvMRsW4VgSsSa9h5Ve9ZuwO3or4Aw0psd/3zGfycnOMIxldh6csffKBXyG3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.93.60;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

The sev_load_incoming_page() provide the implementation to read the
incoming guest private pages from the socket and load it into the guest
memory. The routines uses the RECEIVE_START command to create the
incoming encryption context on the first call then uses the
RECEIEVE_UPDATE_DATA command to load the encrypted pages into the guest
memory. After migration is completed, we issue the RECEIVE_FINISH command
to transition the SEV guest to the runnable state so that it can be
executed.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h     |   1 +
 target/i386/sev.c        | 137 ++++++++++++++++++++++++++++++++++++++-
 target/i386/trace-events |   3 +
 3 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index aa6b91a53e..faa02bdd3d 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -23,6 +23,7 @@ int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
 int sev_save_setup(MigrationParameters *p);
 int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
                            uint32_t size, uint64_t *bytes_sent);
+int sev_load_incoming_page(QEMUFile *f, uint8_t *ptr);
 int sev_inject_launch_secret(const char *hdr, const char *secret,
                              uint64_t gpa, Error **errp);
 
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 411bd657e8..1901c9ade4 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -132,6 +132,7 @@ static const char *const sev_fw_errlist[] = {
 static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
     .save_setup = sev_save_setup,
     .save_outgoing_page = sev_save_outgoing_page,
+    .load_incoming_page = sev_load_incoming_page,
 };
 
 static int
@@ -778,13 +779,33 @@ sev_launch_finish(SevGuestState *sev)
     }
 }
 
+static int
+sev_receive_finish(SevGuestState *s)
+{
+    int error, ret = 1;
+
+    trace_kvm_sev_receive_finish();
+    ret = sev_ioctl(s->sev_fd, KVM_SEV_RECEIVE_FINISH, 0, &error);
+    if (ret) {
+        error_report("%s: RECEIVE_FINISH ret=%d fw_error=%d '%s'",
+                     __func__, ret, error, fw_error_to_str(error));
+        goto err;
+    }
+
+    sev_set_guest_state(s, SEV_STATE_RUNNING);
+err:
+    return ret;
+}
+
 static void
 sev_vm_state_change(void *opaque, bool running, RunState state)
 {
     SevGuestState *sev = opaque;
 
     if (running) {
-        if (!sev_check_state(sev, SEV_STATE_RUNNING)) {
+        if (sev_check_state(sev, SEV_STATE_RECEIVE_UPDATE)) {
+            sev_receive_finish(sev);
+        } else if (!sev_check_state(sev, SEV_STATE_RUNNING)) {
             sev_launch_finish(sev);
         }
     }
@@ -1364,6 +1385,120 @@ int sev_save_outgoing_page(QEMUFile *f, uint8_t *ptr,
     return sev_send_update_data(s, f, ptr, sz, bytes_sent);
 }
 
+static int
+sev_receive_start(SevGuestState *sev, QEMUFile *f)
+{
+    int ret = 1;
+    int fw_error;
+    struct kvm_sev_receive_start start = { };
+    gchar *session = NULL, *pdh_cert = NULL;
+
+    /* get SEV guest handle */
+    start.handle = object_property_get_int(OBJECT(sev), "handle",
+                                           &error_abort);
+
+    /* get the source policy */
+    start.policy = qemu_get_be32(f);
+
+    /* get source PDH key */
+    start.pdh_len = qemu_get_be32(f);
+    if (!check_blob_length(start.pdh_len)) {
+        return 1;
+    }
+
+    pdh_cert = g_new(gchar, start.pdh_len);
+    qemu_get_buffer(f, (uint8_t *)pdh_cert, start.pdh_len);
+    start.pdh_uaddr = (uintptr_t)pdh_cert;
+
+    /* get source session data */
+    start.session_len = qemu_get_be32(f);
+    if (!check_blob_length(start.session_len)) {
+        return 1;
+    }
+    session = g_new(gchar, start.session_len);
+    qemu_get_buffer(f, (uint8_t *)session, start.session_len);
+    start.session_uaddr = (uintptr_t)session;
+
+    trace_kvm_sev_receive_start(start.policy, session, pdh_cert);
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_RECEIVE_START,
+                    &start, &fw_error);
+    if (ret < 0) {
+        error_report("Error RECEIVE_START ret=%d fw_error=%d '%s'",
+                      ret, fw_error, fw_error_to_str(fw_error));
+        goto err;
+    }
+
+    object_property_set_int(OBJECT(sev), "handle", start.handle, &error_abort);
+    sev_set_guest_state(sev, SEV_STATE_RECEIVE_UPDATE);
+err:
+    g_free(session);
+    g_free(pdh_cert);
+
+    return ret;
+}
+
+static int sev_receive_update_data(QEMUFile *f, uint8_t *ptr)
+{
+    int ret = 1, fw_error = 0;
+    gchar *hdr = NULL, *trans = NULL;
+    struct kvm_sev_receive_update_data update = {};
+
+    /* get packet header */
+    update.hdr_len = qemu_get_be32(f);
+    if (!check_blob_length(update.hdr_len)) {
+        return 1;
+    }
+
+    hdr = g_new(gchar, update.hdr_len);
+    qemu_get_buffer(f, (uint8_t *)hdr, update.hdr_len);
+    update.hdr_uaddr = (uintptr_t)hdr;
+
+    /* get transport buffer */
+    update.trans_len = qemu_get_be32(f);
+    if (!check_blob_length(update.trans_len)) {
+        goto err;
+    }
+
+    trans = g_new(gchar, update.trans_len);
+    update.trans_uaddr = (uintptr_t)trans;
+    qemu_get_buffer(f, (uint8_t *)update.trans_uaddr, update.trans_len);
+
+    update.guest_uaddr = (uintptr_t) ptr;
+    update.guest_len = update.trans_len;
+
+    trace_kvm_sev_receive_update_data(trans, ptr, update.guest_len,
+            hdr, update.hdr_len);
+
+    ret = sev_ioctl(sev_guest->sev_fd, KVM_SEV_RECEIVE_UPDATE_DATA,
+                    &update, &fw_error);
+    if (ret) {
+        error_report("Error RECEIVE_UPDATE_DATA ret=%d fw_error=%d '%s'",
+                     ret, fw_error, fw_error_to_str(fw_error));
+        goto err;
+    }
+err:
+    g_free(trans);
+    g_free(hdr);
+    return ret;
+}
+
+int sev_load_incoming_page(QEMUFile *f, uint8_t *ptr)
+{
+    SevGuestState *s = sev_guest;
+
+    /*
+     * If this is first buffer and SEV is not in recieiving state then
+     * use RECEIVE_START command to create a encryption context.
+     */
+    if (!sev_check_state(s, SEV_STATE_RECEIVE_UPDATE) &&
+        sev_receive_start(s, f)) {
+        return 1;
+    }
+
+    return sev_receive_update_data(f, ptr);
+}
+
 static void
 sev_register_types(void)
 {
diff --git a/target/i386/trace-events b/target/i386/trace-events
index e8d4aec125..475de65ad4 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -14,3 +14,6 @@ kvm_sev_attestation_report(const char *mnonce, const char *data) "mnonce %s data
 kvm_sev_send_start(uint64_t pdh, int l1, uint64_t plat, int l2, uint64_t amd, int l3) "pdh 0x%" PRIx64 " len %d plat 0x%" PRIx64 " len %d amd 0x%" PRIx64 " len %d"
 kvm_sev_send_update_data(void *src, void *dst, int len) "guest %p trans %p len %d"
 kvm_sev_send_finish(void) ""
+kvm_sev_receive_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
+kvm_sev_receive_update_data(void *src, void *dst, int len, void *hdr, int hdr_len) "guest %p trans %p len %d hdr %p hdr_len %d"
+kvm_sev_receive_finish(void) ""
-- 
2.17.1


